//
//  AppDelegate.swift
//  ReadAndDictation
//
//  Created by 江美佳 on 2021/5/25.
//

import UIKit
import Moya
import HandyJSON

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        window?.backgroundColor = .white
        window?.rootViewController = MainTabBarController()
        window?.makeKeyAndVisible()
//        let provider = MoyaProvider<AccountService>()
//        provider.request(.visitorLogin(uuid: "1233333", user_type: "iOS")) { result in
//            switch result {
//            case let .success(response):
//                do{
//                    let data = try response.mapJSON()
//                    print(data)
//                } catch {
//
//                }
//
//                print("succeed")
//                break
//            case let .failure(error):
//                print(error)
//                break
//            }
//        }
        NetworkManager.shared.fetchVistorLoginModel(completionHandler: { result in
            print(result.data.name ?? "")
            print(result.code)
            print(result.data.isBuy)
        })
        return true
    }

    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }

//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

