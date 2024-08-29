from src import create_app
import src.users
import socket

app = create_app()

if __name__ == "__main__":
    host_ip4 = socket.gethostbyname(socket.gethostname())
    
    # app.run(debug=True)
    app.run(host=str(host_ip4), port=5000, debug=True)