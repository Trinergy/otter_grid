class GettyImageSearch
  attr_accessor :page, :http_requester
  attr_reader :page_size, :phrase, :uri

  APIKEY = "fxrm3runxkrbv69ge8yj3ueq"
  IMAGE_SEARCH = "https://api.gettyimages.com:443/v3/search/images"

  def initialize(page)
    @page = page
    @page_size = 9
    @phrase = "otter"
    @uri = IMAGE_SEARCH
    @http_requester = HttpRequester::Substitute::NullHttpRequester.new
  end

  def self.call(page)
    instance = build(page)
    instance.()
  end 

  def self.build(page = nil)
    page ||= 1 
    instance = new(page)
    HttpRequester.configure(instance)
    instance
  end

  def call
  # API object will return a JSON object regardless
    http_requester.get(uri, query, headers)
  end

  # Search semantics for HTTParty
  def query
    { "page" => page,
      "page_size" => page_size,
      "phrase" => phrase }
  end

  def headers
    { "Api-Key" => APIKEY }
  end
end
