import Foundation


public typealias AffiseResult<Success> = Swift.Result<Success, Error>

public typealias AffiseResultCallback<Success> = (AffiseResult<Success>) -> Void