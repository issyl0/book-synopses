class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    controller = SynopsesController.alloc.initWithNibName(nil, bundle:nil)
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(controller)
    @window.makeKeyAndVisible
  end

  def self.api_root
    "https://www.goodreads.com/book/title.json?key=#{ENV['GOODREADS_API_KEY']}"
  end
end
