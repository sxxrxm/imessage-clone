import Vapor

var env = try Environment.detect()
let app = Application(env)

defer{
    app.shutdown()
}

var clientConnections = Set<WebSocket>()
app.webSocket("chat"){ req, client in
    clientConnections.insert(client)
    print("Connected:", client)
    
    client.onClose.whenComplete{ _ in
        clientConnections.remove(client)
        print("Disconnected:", client)
    }
}


try app.run()

extension WebSocket: Hashable{
    public static func  == (lhs: WebSocket, rhs: WebSocket)-> Bool{
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    public func hash(into hasher: inout Hasher){
        hasher.combine(ObjectIdentifier(self))
    }
}
