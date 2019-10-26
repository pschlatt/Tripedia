class YelpFacade

  def initialize(location, category)
    @location = location
    @category = category
  end

  def get_attractions
    Attraction.new(grabber.interests(@category))
  end

  private

  def grabber
    YelpService.new(@location)
  end

end
