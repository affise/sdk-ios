//
//  CustomId01Event.swift
//  app
//
//  Created by Sergey Korney
//


/**
 * Event CustomId01
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class CustomId01Event : NativeEvent {

    override public func getName() -> String {
        return EventName.CUSTOM_ID_01.eventName
    }
}
