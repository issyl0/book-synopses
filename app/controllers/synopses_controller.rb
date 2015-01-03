class SynopsesController < UIViewController

  def viewDidLoad
    self.view.backgroundColor = UIColor.whiteColor

    # Search button.
    search_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
                            .setTitle('Search',
                                      forState: UIControlStateNormal)
    search_button.frame = [[100,100],[100,100]]
    search_button.addTarget(self,
                            action:           'search',
                            forControlEvents: UIControlEventTouchUpInside)
    self.view.addSubview(search_button)

    # Search textfield.
    search_textfield = UITextField.alloc.initWithFrame([[100,60],[100,60]])
    search_textfield.placeholder = 'search'
    search_textfield.textColor = UIColor.blackColor
    @search_query = search_textfield
    self.view.addSubview(search_textfield)
  end

  def search
  end
end
