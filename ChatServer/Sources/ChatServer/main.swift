import Vapor

var env = try Environment.detect()
let app = Application(env)

defer{
    app.shutdown()
}

app.webSocket("chat"){ req, client in
    print("Connected:", client)
}

try app.run()
