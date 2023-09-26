/**
 * Event GDPR
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class GDPREvent : NativeEvent {
    
    public static let EVENT_NAME = "GDPR"
    
    public override func getName() -> String { return GDPREvent.EVENT_NAME }
}
