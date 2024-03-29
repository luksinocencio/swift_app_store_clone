import UIKit

class BaseTabBarVC: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todayVC = self.createTabItem(viewController: TodayVC(), title: "Hoje", image: "icone-hoje")
        let appsVC = self.createTabItem(viewController: AppsVC(), title: "Apps", image: "icone-apps")
        let searchVC = self.createTabItem(viewController: SearchVC(), title: "Busca", image: "icone-busca")
        
        viewControllers = [
            todayVC,
            appsVC,
            searchVC
        ]
        
        selectedIndex = 0
    }
    
    func createTabItem(viewController: UIViewController, title: String, image: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        
        viewController.navigationItem.title = title
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: image)
        viewController.view.backgroundColor = .white
        
        return navController
    }
}
