import Foundation

private let EVENT_SUFFIX = "Event"

func toEventName(_ event: NativeEvent) -> String {
    let name = String(describing: type(of: event))
    return String(name.dropLast(EVENT_SUFFIX.count))
}
