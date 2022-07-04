
import UIKit
import AVFAudio


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootCoordinator = UITabBarCoordinator()
        let tabBarController = rootCoordinator.startApp(authenticationData: nil)
        
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback, mode: .moviePlayback)
        }
        catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }
        // NetworkSetng
        //let appConfiguration = NetworkConfiguration.allCases.randomElement()
        
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
        
        //NetworkService.startNetwork(url: appConfiguration?.rawValue ?? "Error cases!Сheck the data!")
        
        return true
    }
    
}
