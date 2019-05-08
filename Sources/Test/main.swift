import Kitura
import LoggerAPI
import HeliumLogger
import Logging

public struct Fruit: Codable {
    public let name: String
    public init(_ name: String) {
        self.name = name
    }
}

func testLogging() {
    Log.error("Error")
    Log.warning("Warning")
    Log.info("Info")
    Log.verbose("Verbose")
    Log.debug("Debug")
    Log.exit("Exit")
    Log.entry("Entry")
}

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

// Option A: Configure a default swift-log logger
//
Log.swiftLogger?.logLevel = .trace

// Option B: Initialize a Swift Logger and attach it to LoggerAPI
//
//var mySwiftLogger = Logging.Logger(label: "com.dj.MyLogger")
//mySwiftLogger.logLevel = .trace
//Log.swiftLogger = mySwiftLogger

// Option C: Configure HeliumLogger
// (if LoggerAPI has a default logger also, you must also set it to nil)
//
Log.logger = HeliumLogger(.entry)
Log.swiftLogger = nil

print("========= LoggerAPI log messages ==========")
testLogging()
//print("\n========= Kitura log messages =========")
//testLoggingWithKitura()

