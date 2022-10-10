
import UIKit
import AVFAudio
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootCoordinator = UITabBarCoordinator()
        let tabBarController = rootCoordinator.startApp(authenticationData: nil)
        
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback, mode: .moviePlayback)
        }
        catch {
            print("error AVplayer")
        }
        
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
        
        
        return true
    }
    
}
