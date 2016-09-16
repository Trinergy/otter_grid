class GettyImageImagesFilter
  attr_accessor :json_obj

  def self.call(json_obj)
    instance = build(json_obj)
    instance.()
  end

  def initialize(json_obj)
    @json_obj = json_obj
  end

  def self.build(json_obj)
    new(json_obj)
  end

  def call
    json_obj.map do |image|
      template(image)
    end
  end

  private

  def template(image)
    { :title => image['title'], 
        :uri => image['display_sizes'][0]['uri'] }
  end
end