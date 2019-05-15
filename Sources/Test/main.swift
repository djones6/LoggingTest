import Kitura
//import LoggerAPI
import Logging

public struct Fruit: Codable {
    public let name: String
    public init(_ name: String) {
        self.name = name
    }
}

//func testLogging() {
//    Log.error("Error")
//    Log.warning("Warning")
//    Log.info("Info")
//    Log.verbose("Verbose")
//    Log.debug("Debug")
//    Log.exit("Exit")
//    Log.entry("Entry")
//}

// Kitura example
func testLoggingWithKitura() {
    let router = Router()

    router.get("/codable") { (id: Int, respondWith: (Fruit?, RequestError?) -> Void) in
        respondWith(Fruit("banana"), nil)
    }

    Kitura.addHTTPServer(onPort: 8080, with: router)
    Kitura.start()
    Kitura.stop()
}

// Configure your application's logger
var mySwiftLogger = Logging.Logger(label: "com.dj.MyLogger")
mySwiftLogger.logLevel = .trace

// Configure via Kitura, rather than LoggerAPI directly
// (avoids the need to depend on / import LoggerAPI)
//Log.swiftLogger = mySwiftLogger
Kitura.logTo(mySwiftLogger)

//print("========= LoggerAPI log messages ==========")
//testLogging()
print("\n========= Kitura log messages =========")
testLoggingWithKitura()
