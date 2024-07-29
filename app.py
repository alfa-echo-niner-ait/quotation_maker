from src import create_app
import src.users

app = create_app()

if __name__ == "__main__":
    # app.run(debug=True)
    app.run(host="192.168.0.12", port=5000, debug=True)