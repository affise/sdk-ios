import Foundation
import WebKit

internal class WebBridgeManager: NSObject, WKScriptMessageHandler {
    
    private let WEB_BRIDGE_JAVASCRIPT_INTERFACE_NAME = "AffiseBridge"
    private let WEB_BRIDGE_LOG = "AffiseLog"
    
    private let storeEventUseCase: StoreEventUseCase
    
    init(storeEventUseCase: StoreEventUseCase) {
        self.storeEventUseCase = storeEventUseCase
    }
    
    /**
     * Configuration
     */
    private var webView: WKWebView?
    
    /**
     * Register [webView] to WebBridgeManager
     */
    func registerWebView(webView: WKWebView) {
        //Save webView
        self.webView = webView
        webView.configuration.userContentController.add(self, name: WEB_BRIDGE_JAVASCRIPT_INTERFACE_NAME)
        webView.configuration.userContentController.add(self, name: WEB_BRIDGE_LOG)
        do {
            guard let path = getAssetPath(name: "affise", ext: "js") else {
                return
            }
            let contents = try String(contentsOfFile: path)
            let script = WKUserScript(source: contents,
                                      injectionTime: .atDocumentStart,
                                      forMainFrameOnly: false)
            webView.configuration.userContentController.addUserScript(script)
        } catch {
            // contents could not be loaded
        }
    }
    
    /**
     * Unregister [webView] on WebBridgeManager
     */
    func unregisterWebView() {
        //Remove JavascriptInterface on webView
        webView?.configuration.userContentController.removeScriptMessageHandler(forName: WEB_BRIDGE_JAVASCRIPT_INTERFACE_NAME)
        webView?.configuration.userContentController.removeScriptMessageHandler(forName: WEB_BRIDGE_LOG)
        
        //Remove webView
        webView = nil
    }
    
    /**
     * Send [event] from webView
     */
    func userContentController(
        _ userContentController: WKUserContentController,
        didReceive message: WKScriptMessage
    ) {
        switch message.name {
        case WEB_BRIDGE_JAVASCRIPT_INTERFACE_NAME:
            guard let event = message.body as? String else { return }
            //Store event
            storeEventUseCase.storeWebEvent(event: event)
            
        case WEB_BRIDGE_LOG:
            guard let data = message.body as? [String: Any?] else { return }
            debugPrint(data)
            
        default:
            break
        }
    }
    
    private func getAssetPath(name: String, ext: String) -> String? {
        let bundle = Bundle(for: type(of: self))
        
        if let path = bundle.path(forResource: name, ofType: ext) {
            return path
        }
        
        if let path = getSpmBundle()?.path(forResource: name, ofType: ext) {
            return path
        }
        
        return nil
    }
    
    private func getSpmBundle() -> Bundle? {
        let bundleName = "Affise_AffiseAttributionLib.bundle"
        let resourceURLs = [
            Bundle.main.resourceURL,
            Bundle.main.bundleURL,
            Bundle(for: type(of: self)).resourceURL
        ]
        
        for url in resourceURLs {
            let bundlePath = url?.appendingPathComponent(bundleName)
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        return nil
    }
}
