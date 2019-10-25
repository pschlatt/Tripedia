class GeocodeFacade

  def initialize(location)
    @location = location
  end

  def coordinates
    address = service.addressData(@location)
    address[:geometry][:location]
  end

  private

  def service
    @_service ||= GeocodeService.new
  end

end
