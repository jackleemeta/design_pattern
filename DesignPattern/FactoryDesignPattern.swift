
import Foundation
import UIKit

class Client {
    func product() {
        let haveTabBarHomePageViewModel = TabBarHomePageAndViewModelFactory.productHomePageViewModel() // 生产一个ViewModel
        let haveTabBarHomePage = TabBarHomePageAndViewModelFactory.productHomePage() // 生产一个View
        debugPrint("创建了一个工具栏风格首页的ViewModel = \(haveTabBarHomePageViewModel)")
        debugPrint("创建了一个工具栏风格首页 = \(haveTabBarHomePage)")
    }
}

// MARK: - 抽象工厂 和 具体工厂

/// 抽象工厂
class HomePageFactory {
    
    /// 生产抽象产品 - ViewModel
    class func productHomePageViewModel() -> HomePageViewModel {
        let viewModel = HomePageViewModel()
        return viewModel
    }
    
    /// 生产抽象产品 - View
    class func productHomePage() -> HomePage {
        let vc = NavigationBarHomePage()
        let navigationBar = UINavigationBar()
        vc.view.addSubview(navigationBar)
        return vc
    }
}

/// 具体工厂 - 生产导航栏风格的首页ViewModel & View
class NavigationBarHomePageAndViewModelFactory: HomePageFactory {
    
//    /// 生产具体产品 - PopUpView
//    override class func productPopUpView() -> PopUpView {
//        return NavigationBarHomePagePopUpView()
//    }
    
    /// 生产具体产品 - ViewModel
    override class func productHomePageViewModel() -> HomePageViewModel {
        return NavigationBarHomePageViewModel()
    }
    
    /// 生产具体产品 - View
    override class func productHomePage() -> HomePage {
        let vc = NavigationBarHomePage()
        let navigationBar = UINavigationBar()
        vc.view.addSubview(navigationBar)
        return vc
    }
    
}

/// 具体工厂 - 生产底部工具栏风格的首页ViewModel & View
class TabBarHomePageAndViewModelFactory: HomePageFactory {
    
    /// 生产具体产品 - ViewModel
    override class func productHomePageViewModel() -> HomePageViewModel {
        return TabBarHomePageViewModel()
    }
    
    /// 生产具体产品 - View
    override class func productHomePage() -> HomePage {
        let vc = TabBarHomePage()
        let tabBar = UITabBar()
        vc.view.addSubview(tabBar)
        return vc
    }
    
}

/// 具体工厂 - 生产侧边栏风格的首页ViewModel & View
class SideMenuHomePageAndViewModelFactory: HomePageFactory {
    
    /// 生产具体产品 - ViewModel
    override class func productHomePageViewModel() -> HomePageViewModel {
        return SideMenuHomePageViewModel()
    }
    
    /// 生产具体产品 - View
    override class func productHomePage() -> HomePage {
        let vc = SideMenuHomePage()
        let sideMenu = UIView()
        vc.view.addSubview(sideMenu)
        return vc
    }
}

// MARK: - 产品结构 之 HomePageViewModel

/// HomePage界面对应的ViewModel
class HomePageViewModel {
    var title: String = ""
    var haveBackButton = true
    var itemViewModels = [String]()
}

/// 导航栏风格界面对应的ViewModel
class NavigationBarHomePageViewModel: HomePageViewModel {
    var navigationLeftIconName = "" // 导航栏右侧IconName
    var navigationAlpha = 0.6 // 导航栏不透明度值
}

/// 底部TabBar风格界面对应的ViewModel
class TabBarHomePageViewModel: HomePageViewModel {
    var tabBarTitles = [String]() // TabBar各个按钮的Title
}

/// 底部TabBar风格界面对应的ViewModel
class SideMenuHomePageViewModel: HomePageViewModel {
    var sideMenuItemViewModels = [AnyObject]() // 侧边栏按钮对应的itemViewModel集合
}

// MARK: - 产品结构 之 HomePage

/// 抽象产品
class HomePage: UIViewController {
    var backGroundImage: UIImage? // 基础参数 - 背景图
    var listView = UITableView() // 基础参数 - 主UI（承载主要数据）
}

/// 具体产品 - 导航栏风格首页
class NavigationBarHomePage: HomePage {
    //可以重写listView
}

/// 具体产品 - 工具栏风格首页
class TabBarHomePage: HomePage {
    //可以重写listView
}

/// 具体产品 - 侧边栏风格首页
class SideMenuHomePage: HomePage {
    //可以重写listView
}



