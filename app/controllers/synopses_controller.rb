class SynopsesController < UIViewController

  def viewDidLoad
    self.view.backgroundColor = UIColor.whiteColor

    # Search button.
    search_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
                            .setTitle('Search',
                                      forState: UIControlStateNormal)
    search_button.frame = [[120,137],[80,30]]
    search_button.addTarget(self,
                            action:           'search_and_show',
                            forControlEvents: UIControlEventTouchUpInside)
    self.view.addSubview(search_button)

    # Search textfield.
    search_textfield = UITextField.alloc.initWithFrame([[16,99],[288,30]])
    search_textfield.borderStyle = UITextBorderStyleRoundedRect
    search_textfield.placeholder = 'search'
    search_textfield.textColor = UIColor.blackColor
    @search_query = search_textfield
    self.view.addSubview(search_textfield)

    # Synopsis container.
    synopsis_textview = UITextView.alloc.initWithFrame([[16,199],[288,274]])
    synopsis_textview.textColor = UIColor.blackColor
    synopsis_textview.editable = false
    @synopsis_textview = synopsis_textview
  end

  def search_and_show
    BW::HTTP.get("#{AppDelegate.api_root}&title=#{@search_query.text}") do |results|
      reviews_iframe = BW::JSON.parse(results.body)['reviews_widget']
      book_url = Wakizashi::HTML(reviews_iframe).xpath("//a").first['href']

      BW::HTTP.get(book_url) do |synopsis|
        @synopsis_label.text = Wakizashi::HTML(synopsis.body).xpath("//div[@id='description']/span[2]").first.to_s
        self.view.addSubview(@synopsis_label)
      end
    end
  end

end
