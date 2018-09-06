 require_relative './bike'

class DockingStation
	attr_reader :bikes 
	attr_accessor :capacity

	DEFAULT_CAPACITY = 20

	def initialize(capacity = DEFAULT_CAPACITY)
		@bikes = []
		@capacity = capacity
	end

	def dock_bike(bike)
		fail 'Docking station full' if full?
		@bikes.push(bike)		
	end

	def release_bike
		raise 'No bikes available' if empty?
		raise 'Sorry, no working bike available' if get_working_bikes == nil		
		@bikes.delete(get_working_bikes)
	end

	private

	def full?
		@bikes.length >= DEFAULT_CAPACITY
	end
  
  	def empty?
  		@bikes.empty?
  	end

  	def get_working_bikes
  		@bikes.each do |bike|
  			return bike if bike.working?
  		end
  		nil
  	end

end