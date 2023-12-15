import UIKit
import WebKit
import AffiseAttributionLib

class ViewController: UIViewController, WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
    }
    

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var webViewWrapper: UIView!
    @IBOutlet weak var eventsWrapper: UIScrollView!
    
    var webView: WKWebView?
    
    private let listEvents: [Event] = DefaultEventsFactory().createEvents()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            // Always adopt a light interface style.
            overrideUserInterfaceStyle = .light
        }
        
        // Do any additional setup after loading the view.
        
        let buttons = listEvents.enumerated().map { (index, event) -> UIButton in
            let button = UIButton(type: .system)
            if let subscribeEvent = event as? BaseSubscriptionEvent {
                button.setTitle(subscribeEvent.subtype(), for: .normal)
            } else {
                button.setTitle(event.getName(), for: .normal)
            }
            button.frame = CGRect(x: 0, y: 0, width: 0, height: 60)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tag = index
            button.setTitleColor(UIColor.white, for: .normal)
            button.heightAnchor.constraint(equalToConstant: 60).isActive = true
            button.backgroundColor = UIColor(red: 38/255, green: 34/255, blue: 58/255, alpha: 1)
            button.layer.cornerRadius = 10
            button.addTarget(self, action: #selector(pressed), for: .touchUpInside)
            return button
        }

        buttons.forEach {
            stackView.addArrangedSubview($0)
        }
        
        let config = WKWebViewConfiguration()
        webView = WKWebView(frame: CGRect(x: 0, y: 0,
                                          width: eventsWrapper.frame.width,
                                          height: eventsWrapper.bounds.height), configuration: config)
        if let webView = webView,
            let indexURL = Bundle.main.url(forResource: "index", withExtension: "html") {
            
            webView.loadFileURL(indexURL, allowingReadAccessTo: indexURL)
            webViewWrapper.addSubview(webView)
            
            webView.translatesAutoresizingMaskIntoConstraints = false
            webView.topAnchor.constraint(equalTo: webViewWrapper.topAnchor, constant: 0).isActive = true
            webView.leftAnchor.constraint(equalTo: webViewWrapper.leftAnchor, constant: 16).isActive = true
            webView.bottomAnchor.constraint(equalTo: webViewWrapper.bottomAnchor, constant: 0).isActive = true
            webView.rightAnchor.constraint(equalTo: webViewWrapper.rightAnchor, constant: -16).isActive = true
            Affise.registerWebView(webView)
        }
    }
    
    @objc
    func pressed(sender: UIButton!) {
        // Send event
        listEvents[sender.tag].send();
        // or
        // Affise.sendEvent(listEvents[sender.tag])
    }
    
    @IBAction func didValueChangedControl(_ sender: UISegmentedControl) {
            eventsWrapper.isHidden = sender.selectedSegmentIndex != 0
            webViewWrapper.isHidden = sender.selectedSegmentIndex == 0
    }
}

