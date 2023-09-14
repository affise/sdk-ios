public enum EventName: String {
    case ACHIEVE_LEVEL = "AchieveLevel"
    case ADD_PAYMENT_INFO = "AddPaymentInfo"
    case ADD_TO_CART = "AddToCart"
    case ADD_TO_WISHLIST = "AddToWishlist"
    case CLICK_ADV = "ClickAdv"
    case COMPLETE_REGISTRATION = "CompleteRegistration"
    case COMPLETE_STREAM = "CompleteStream"
    case COMPLETE_TRIAL = "CompleteTrial"
    case COMPLETE_TUTORIAL = "CompleteTutorial"
    case CONTACT = "Contact"
    case CONTENT_ITEMS_VIEW = "ContentItemsView"
    case CUSTOM_ID_01 = "CustomId01"
    case CUSTOM_ID_02 = "CustomId02"
    case CUSTOM_ID_03 = "CustomId03"
    case CUSTOM_ID_04 = "CustomId04"
    case CUSTOM_ID_05 = "CustomId05"
    case CUSTOM_ID_06 = "CustomId06"
    case CUSTOM_ID_07 = "CustomId07"
    case CUSTOM_ID_08 = "CustomId08"
    case CUSTOM_ID_09 = "CustomId09"
    case CUSTOM_ID_10 = "CustomId10"
    case CUSTOMIZE_PRODUCT = "CustomizeProduct"
    case DEEP_LINKED = "DeepLinked"
    case DONATE = "Donate"
    case FIND_LOCATION = "FindLocation"
    case INITIATE_CHECKOUT = "InitiateCheckout"
    case INITIATE_PURCHASE = "InitiatePurchase"
    case INITIATE_STREAM = "InitiateStream"
    case INVITE = "Invite"
    case LAST_ATTRIBUTED_TOUCH = "LastAttributedTouch"
    case LEAD = "Lead"
    case LIST_VIEW = "ListView"
    case LOGIN = "Login"
    case OPENED_FROM_PUSH_NOTIFICATION = "OpenedFromPushNotification"
    case ORDER = "Order"
    case ORDER_CANCEL = "OrderCancel"
    case ORDER_RETURN_REQUEST = "OrderReturnRequest"
    case ORDER_RETURN_REQUEST_CANCEL = "OrderReturnRequestCancel"
    case PURCHASE = "Purchase"
    case RATE = "Rate"
    case RE_ENGAGE = "ReEngage"
    case RESERVE = "Reserve"
    case SALES = "Sales"
    case SCHEDULE = "Schedule"
    case SEARCH = "Search"
    case SHARE = "Share"
    case SPEND_CREDITS = "SpendCredits"
    case START_REGISTRATION = "StartRegistration"
    case START_TRIAL = "StartTrial"
    case START_TUTORIAL = "StartTutorial"
    case SUBMIT_APPLICATION = "SubmitApplication"
    case SUBSCRIBE = "Subscribe"
    case TRAVEL_BOOKING = "TravelBooking"
    case UNLOCK_ACHIEVEMENT = "UnlockAchievement"
    case UNSUBSCRIBE = "Unsubscribe"
    case UPDATE = "Update"
    case VIEW_ADV = "ViewAdv"
    case VIEW_CART = "ViewCart"
    case VIEW_CONTENT = "ViewContent"
    case VIEW_ITEM = "ViewItem"
    case VIEW_ITEMS = "ViewItems"
    case AD_REVENUE = "AdRevenue"
    case ORDER_ITEM_ADDED = "OrderItemAdded"
    case ORDER_ITEM_REMOVE = "OrderItemRemove"
}

extension EventName: CaseIterable {
    public var eventName: String {
        return self.rawValue
    }

    public static func from(_ name: String) -> EventName? {
        return allCases.first { name == $0.eventName }
    }
}
