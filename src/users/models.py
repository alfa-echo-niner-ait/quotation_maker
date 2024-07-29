from src import db
from flask_login import UserMixin


class Users(db.Model, UserMixin):
    __tablename__ = "users"

    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(100), unique=True, nullable=False)
    password = db.Column(db.String(200), nullable=False)
    role = db.Column(db.String(45), nullable=False)

    def __init__(self, username, password) -> None:
        super().__init__()
        self.username = username
        self.password = password
        self.role = "user"

    def get_id(self):
        return self.id


class User_Info(db.Model):
    __tablename__ = "user_info"

    id = db.Column(
        db.Integer, db.ForeignKey("users.id"), primary_key=True, nullable=False
    )
    name = db.Column(db.String(100), nullable=True)
    email = db.Column(db.String(100), nullable=True)
    phone = db.Column(db.String(100), nullable=True)

    def __init__(self, id) -> None:
        super().__init__()
        self.id = id


class Quotes(db.Model):
    __tablename__ = "quotes"

    q_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user_id = db.Column(
        db.Integer, db.ForeignKey("users.id"), primary_key=True, nullable=False
    )
    customer = db.Column(db.String(100), nullable=True)
    project = db.Column(db.String(200), nullable=True)
    currency = db.Column(db.String(20), nullable=True)
    size = db.Column(db.String(200), nullable=True)
    truss = db.Column(db.String(100), nullable=True)
    date = db.Column(db.Date, nullable=True)
    validity = db.Column(db.String(45), nullable=True)

    def __init__(self, user_id) -> None:
        super().__init__()
        self.user_id = user_id

    def __str__(self) -> str:
        return f"#{self.q_id}: Created by User({self.user_id})"


class Quote_Items(db.Model):
    __tablename__ = "quote_items"

    item_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    quote_id = db.Column(
        db.Integer, db.ForeignKey("quotes.q_id"), primary_key=True, nullable=False
    )
    material = db.Column(db.String(300), nullable=True)
    spec = db.Column(db.String(300), nullable=True)
    unit = db.Column(db.String(50), nullable=True)
    qty = db.Column(db.Float, nullable=True)
    unit_price = db.Column(db.Float, nullable=True)
    total_price = db.Column(db.Float, nullable=True)
    note = db.Column(db.String(300), nullable=True)
    ref_img = db.Column(db.String(200), nullable=False)
    

    def __init__(self, quote_id, material, spec, unit, qty, unit_price, total_price, note, ref_img) -> None:
        super().__init__()
        self.quote_id = quote_id
        self.material = material
        self.spec = spec
        self.unit = unit
        self.qty  = qty
        self.unit_price = unit_price
        self.total_price = total_price
        self.note = note
        self.ref_img = ref_img


class Images(db.Model):
    __tablename__ = "images"

    img_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    img_name = db.Column(db.String(100), nullable=False)
    img_url = db.Column(db.String(200), nullable=False)
    img_size_kb = db.Column(db.Float, nullable=False)

    def __init__(self, name, url, size) -> None:
        super().__init__()
        self.img_name = name
        self.img_url = url
        self.img_size_kb = size

