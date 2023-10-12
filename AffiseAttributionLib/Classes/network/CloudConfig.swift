public struct CloudConfig {
    
    /**
     * Urls for send data
     */
    static let urls: Array<String> = [
       "https://tracking.affattr.com/postback"
    ]

    public static let headers: [String:String] = [
         "Content-Type" : "application/json; charset=utf-8"
    ]
}
