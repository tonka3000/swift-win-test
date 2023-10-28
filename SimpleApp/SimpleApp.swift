import SwiftWin32
import Foundation

import func WinSDK.MessageBoxW
import let WinSDK.MB_OK
import struct WinSDK.UINT

private extension Label {
  convenience init(frame: Rect, title: String) {
    self.init(frame: frame)
    self.text = title
  }
}

@main
final class SimpleApp: ApplicationDelegate, SceneDelegate {
    var window: Window!

    lazy var label: Label =
        Label(frame: Rect(x: 5.0, y: 12.0, width: 500.0, height: 26.0),
                title: "Hello to SimpleApp Swift app on Windows")

    lazy var labelOS = Label(frame: Rect(x: 5.0, y: 430, width: 300, height: 26), title: "OS: \(Device.current.systemName)")

    lazy var button: Button =
      Button(frame: Rect(x: 5.0, y: 370.0, width: 96.0, height: 32.0),
             primaryAction: Action(title: "Click Me") { act in
                print(act.title)
                MessageBoxW(nil, "You clicked onto the \"\(act.title)\" button".wide,
                    "Hello Title".wide, UINT(MB_OK)
                )
      })

    lazy var button2: Button =
      Button(frame: Rect(x: 105.0, y: 370.0, width: 150.0, height: 32.0),
             primaryAction: Action(title: "Another Button") { act in
                print(act.title)
                MessageBoxW(nil, "You clicked onto the \"\(act.title)\" button".wide,
                    "Hello Title".wide, UINT(MB_OK)
                )
      })

    lazy var textview: TextView =
      TextView(frame: Rect(x: 5.0, y: 50.0, width: 500.0, height: 300.0))

    func scene(_ scene: Scene, willConnectTo session: SceneSession,
               options: Scene.ConnectionOptions) {
        guard let windowScene = scene as? WindowScene else { return }

        let size: Size = Size(width: 600, height: 480)
        windowScene.sizeRestrictions?.minimumSize = size
        windowScene.sizeRestrictions?.maximumSize = size

        self.window = Window(windowScene: windowScene)

        window.rootViewController = ViewController()
        window.rootViewController?.title = "Simple App"

        window.addSubview(self.label)
        window.addSubview(self.button)
        window.addSubview(self.button2)
        window.addSubview(self.textview)
        window.addSubview(self.labelOS)

        window.makeKeyAndVisible()
    }

    func sceneDidBecomeActive(_: Scene) {
    }

    func sceneWillResignActive(_: Scene) {
    }

    func applicationWillTerminate(_: Application) {
  }
}