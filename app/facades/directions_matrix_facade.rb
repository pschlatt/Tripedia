class DirectionsMatrixFacade

  def initialize(trip_data)
    @trip_data = trip_data
  end


  def return_trip_details
    service.get_distance_and_duration(@trip_data)
  end


  private

  def service
    @_service ||= DirectionsMatrixService.new()
  end
end
