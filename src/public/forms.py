from flask_wtf import FlaskForm
from flask_wtf.file import FileField, FileAllowed
from wtforms import StringField, PasswordField, BooleanField, SelectField, DateField, SubmitField
from wtforms.validators import DataRequired, Length
from datetime import date

class LoginForm(FlaskForm):
    username = StringField("Username", validators=[
                           DataRequired(), Length(min=2, max=100)])
    password = PasswordField("Password", validators=[DataRequired()])
    remember = BooleanField("Keep me logged in")

    submit = SubmitField("Login")


class UpdateAccountForm(FlaskForm):
    name = StringField("Name", validators=[
                       DataRequired(), Length(min=2, max=100)])
    email = StringField("Email", validators=[Length(min=2, max=100)])
    phone = StringField("Phone", validators=[Length(min=2, max=100)])
    current_password = PasswordField("Current Password")
    new_password = PasswordField("New Password")

    submit = SubmitField("Update Account")


class NewQuoteForm(FlaskForm):
    customer = StringField("* Customer Name", validators=[
                           DataRequired(), Length(min=2, max=100)])
    project = StringField("* Project Name", validators=[
                           DataRequired(), Length(min=2, max=200)])
    currency = SelectField(
        "* Payment Currency",
        validators=[DataRequired()],
        choices=[("USD", "USD"), ("RMB", "RMB")],
    )
    size = StringField("* Size", validators=[
                           DataRequired(), Length(min=2, max=200)])
    truss = StringField("* Truss Specification", validators=[
                           DataRequired(), Length(min=2, max=200)])
    date = DateField("* Qutotation Date", validators=[DataRequired()], default=date.today)
    validity = StringField("* Valid for", validators=[
                           DataRequired(), Length(min=2, max=200)])

    submit = SubmitField("Create Quote")

class Image_Upload_Form(FlaskForm):
    file_name = StringField("Image Name", validators=[DataRequired()])
    file = FileField(
        "Select Image",
        validators=[
            DataRequired(),
            FileAllowed(
                ["jpg", "JPG", "jpeg", "JPEG", "png", "PNG", "svg", "SVG"], "Image format not supported!"
            ),
        ],
    )
    submit = SubmitField("Upload")
