import ArgumentParser
import Foundation

@main
struct Repeat: ParsableCommand {
    @Argument(help: "The user whose home directory to print.")
    var username: String

    func run() throws {
        if let home = NSHomeDirectoryForUser(username) {
            print(home)
        } else {
            throw ExitCode(-1)
        }
    }
}
