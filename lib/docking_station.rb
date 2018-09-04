require_relative './bike'

class DockingStation
	attr_reader :bikes
	def initialize
		@bikes = []
	end
	def dock_bike(bike)
		@bikes.push(bike)
	end
	def release_bike
		Bike.new
	end
end
