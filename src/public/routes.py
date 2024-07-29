import os
import secrets
from flask import (
    Blueprint,
    render_template,
    redirect,
    url_for,
    flash,
    current_app,
    jsonify,
    request,
)
from flask_login import current_user, login_user, login_required, logout_user

from src import db
from src.users.models import Users, User_Info, Quotes, Quote_Items, Images

from src.public.forms import (
    LoginForm,
    UpdateAccountForm,
    NewQuoteForm,
    Image_Upload_Form,
)

public = Blueprint("public", __name__)


@public.route("/", methods=["GET", "POST"])
def index():
    if current_user.is_authenticated:
        return redirect(url_for("public.dashboard"))

    form = LoginForm()

    return render_template("public/index.html", form=form)


@public.route("/login", methods=["POST"])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        username = form.username.data
        password = form.password.data
        remember = form.remember.data

        user: Users = Users.query.filter(Users.username == username).first()
        if user and user.password == password:
            login_user(user=user, remember=remember)

            return redirect(url_for("public.dashboard"))

    return redirect(url_for("public.index"))


@public.route("/logout")
def logout():
    logout_user()
    return redirect(url_for("public.index"))


@public.route("/dashboard", methods=["GET", "POST"])
@login_required
def dashboard():
    page_num = request.args.get("page", 1, int)

    form = NewQuoteForm()
    quotes: Quotes = (
        Quotes.query.filter(Quotes.user_id == current_user.id)
        .order_by(Quotes.q_id.desc())
        .paginate(page=page_num, per_page=10)
    )
    return render_template(
        "public/dashboard.html", title="Dashboard", form=form, quotes=quotes
    )


@public.route("/dashboard/all_quotes")
@login_required
def all_quotes():
    page_num = request.args.get("page", 1, int)

    quotes: Quotes = (
        Quotes.query.join(Users, Users.id == Quotes.user_id)
        .add_columns(
            Users.username,
            Quotes.q_id,
            Quotes.customer,
            Quotes.project,
            Quotes.size,
            Quotes.currency,
            Quotes.date,
        )
        .order_by(Quotes.q_id.desc())
        .paginate(page=page_num, per_page=10)
    )

    return render_template(
        "public/all_quotes.html", title="All Quotations", quotes=quotes
    )


@public.route("/dashboard/new_quote", methods=["POST"])
@login_required
def new_quote():
    form = NewQuoteForm()

    if form.validate_on_submit():
        new_quote = Quotes(current_user.id)

        new_quote.customer = form.customer.data
        new_quote.project = form.project.data
        new_quote.currency = form.currency.data
        new_quote.size = form.size.data
        new_quote.truss = form.truss.data
        new_quote.date = form.date.data
        new_quote.validity = form.validity.data

        db.session.add(new_quote)
        db.session.commit()

        print(new_quote)

        return redirect(url_for("public.quote_maker", q_id=new_quote.q_id))
    else:
        flash("Quote making failed! Mandatory field missing!")
        return redirect(url_for("public.dashboard"))


@public.route("/dashboard/quote/<q_id>")
@login_required
def quote_maker(q_id):
    form = NewQuoteForm()
    quote: Quotes = Quotes.query.filter(Quotes.q_id == q_id).first_or_404()
    items: Quote_Items = Quote_Items.query.filter(
        Quote_Items.quote_id == int(q_id)
    ).all()

    form.customer.data = quote.customer
    form.currency.data = quote.currency
    form.project.data = quote.project
    form.size.data = quote.size
    form.date.data = quote.date
    form.validity.data = quote.validity
    form.truss.data = quote.truss

    return render_template(
        "public/edit_quote.html",
        title="Edit Quotation",
        quote=quote,
        items=items,
        form=form,
    )


@public.route("/update_quote_info/<q_id>", methods=["POST"])
@login_required
def update_quote_info(q_id):
    form = NewQuoteForm()

    if form.validate_on_submit():
        quote: Quotes = Quotes.query.filter(Quotes.q_id == int(q_id)).first_or_404()

        quote.customer = form.customer.data
        quote.project = form.project.data
        quote.currency = form.currency.data
        quote.size = form.size.data
        quote.date = form.date.data
        quote.validity = form.validity.data
        quote.truss = form.truss.data

        db.session.commit()

        flash("Information Updated Successfully!", category="success")
        return redirect(url_for("public.quote_maker", q_id=q_id))
    else:
        flash("Failed to Update Information!", category="danger")
        return redirect(url_for("public.quote_maker", q_id=quote.q_id))


@public.route("/dashboard/quote/<q_id>/delete")
@login_required
def delete_quote(q_id):
    quote = Quotes.query.filter(Quotes.q_id == q_id).first_or_404()
    db.session.delete(quote)
    db.session.commit()

    flash("Quote deleted successfully!", category="warning")
    return redirect(url_for("public.dashboard"))


@public.route("/add_quote_item/<q_id>", methods=["POST"])
@login_required
def add_quote_item(q_id):
    material = request.form.get("material")
    spec = request.form.get("spec")
    unit = request.form.get("unit")
    qty = request.form.get("qty")
    unit_price = request.form.get("unit_price")
    total_price = request.form.get("total_price")
    note = request.form.get("note")
    ref_img = request.form.get("imgUri")

    new_item = Quote_Items(
        int(q_id), material, spec, unit, qty, unit_price, total_price, note, ref_img
    )
    db.session.add(new_item)
    db.session.commit()

    response = {"opt": "success", "item_id": new_item.item_id}
    return jsonify(response)


@public.route("/edit_quote_item/<item_id>", methods=["POST"])
@login_required
def edit_quote_item(item_id):
    item: Quote_Items = Quote_Items.query.filter(
        Quote_Items.item_id == int(item_id)
    ).first()

    item.material = request.form.get("materialEdit")
    item.spec = request.form.get("specEdit")
    item.unit = request.form.get("unitEdit")
    item.qty = request.form.get("qtyEdit")
    item.unit_price = request.form.get("unit_priceEdit")
    item.total_price = request.form.get("total_priceEdit")
    item.note = request.form.get("noteEdit")
    item.ref_img = request.form.get(f"imgeUriEdit{item_id}")

    db.session.commit()

    response = {
        "opt": "success",
        "item_id": item.item_id,
        "material": item.material,
        "spec": item.spec,
        "unit": item.unit,
        "qty": item.qty,
        "unit_price": item.unit_price,
        "total_price": item.total_price,
        "note": item.note,
        "ref_img": item.ref_img,
    }

    return jsonify(response)


@public.route("/delete_quote_item/<item_id>")
@login_required
def delete_quote_item(item_id):
    item: Quote_Items = Quote_Items.query.filter(
        Quote_Items.item_id == item_id
    ).first_or_404()
    db.session.delete(item)
    db.session.commit()

    flash("Item Removed Successfully!", category="warning")
    return redirect(url_for("public.quote_maker", q_id=item.quote_id))


@public.route("/dashboard/update_account")
@login_required
def update_account():
    form = UpdateAccountForm()

    info: User_Info = User_Info.query.filter(User_Info.id == current_user.id).first()

    form.name.data = info.name
    form.email.data = info.email
    form.phone.data = info.phone

    return render_template(
        "public/update_account.html", title="Update Account Details", form=form
    )


@public.route("/dashboard/update_account_hdlr", methods=["POST"])
@login_required
def update_account_handler():
    form = UpdateAccountForm()
    info: User_Info = User_Info.query.filter(User_Info.id == current_user.id).first()
    if form.validate_on_submit():
        info.name = form.name.data
        info.email = form.email.data
        info.phone = form.phone.data
        db.session.commit()

        if form.new_password.data:
            user: Users = Users.query.filter(Users.id == current_user.id).first()
            if form.current_password.data == user.password:
                user.password = form.new_password.data
                db.session.commit()
            else:
                flash("Current password didn't match!", category="warning")
                return redirect(url_for("public.update_account"))

        flash("Account updated successfully!", category="success")
        return redirect(url_for("public.update_account"))

    flash("Update account failed! Please check your details!", category="danger")
    return redirect(url_for("public.update_account"))


@public.route("/dashboard/gallery")
@login_required
def gallery():
    form = Image_Upload_Form()
    images: Images = Images.query.order_by(Images.img_id.desc()).all()
    return render_template(
        "public/gallery.html", title="Image Gallery", form=form, images=images
    )


@public.route("/dashboard/upload_image", methods=["POST"])
@login_required
def upload_image():
    form = Image_Upload_Form()

    if form.validate_on_submit():
        file_name = form.file_name.data
        file = form.file.data

        _, file_extension = os.path.splitext(file.filename)
        random_hex = secrets.token_hex(10)
        file_path_name = random_hex + file_extension

        file_path = os.path.join(
            current_app.root_path, "static/images/", file_path_name
        )
        file.save(file_path)
        file_size_kb = float(format(os.path.getsize(file_path) / 1024, ".2f"))

        # Add information to database
        new_img = Images(file_name, file_path_name, file_size_kb)

        db.session.add(new_img)
        db.session.commit()

        flash("Image Uploaded Successfully!", category="success")
        return redirect(url_for("public.gallery"))
    else:
        flash("Please select correct image format!", category="danger")
        return redirect(url_for("public.gallery"))


@public.route("/dashboard/remove_img/<id>")
@login_required
def remove_image(id):
    img: Images = Images.query.filter(Images.img_id == id).first()
    # Remove from storage
    os.remove(os.path.join(current_app.root_path, "static/images", img.img_url))
    # Remove DB info
    db.session.delete(img)
    db.session.commit()
    flash("Image Removed Successfully!", category="warning")
    return redirect(url_for("public.gallery"))


@public.route("/img_data", methods=["GET"])
@login_required
def img_data():
    images: Images = Images.query.all()
    results = list()
    for image in images:
        img = {
            "id": image.img_id,
            "name": image.img_name,
            "url": url_for("static", filename=f"images/{image.img_url}"),
        }
        results.append(img)

    return jsonify(results)


@public.route("/quotation/<id>")
def quotation(id):
    quote: Quotes = Quotes.query.filter(Quotes.q_id == int(id)).first_or_404()
    items = Quote_Items.query.filter(Quote_Items.quote_id == quote.q_id).all()
    user: User_Info = User_Info.query.filter(User_Info.id == quote.user_id).first()

    net_amount = 0
    for item in items:
        net_amount = net_amount + item.total_price

    return render_template(
        "public/quotation.html",
        quote=quote,
        items=items,
        user=user,
        net_amount=net_amount,
        title=f"{quote.customer} ({quote.project}) Quotation by {user.name}",
    )


@public.route("/quotation/item/<id>")
def edit_item(id):
    item: Quote_Items = Quote_Items.query.filter(Quote_Items.item_id == int(id)).first()

    return render_template("public/includes/item_edit_form.html", item=item)
