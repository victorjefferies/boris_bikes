As a system maintainer,
So that I can plan the distribution of bikes,
I want a docking station to have a default capacity of 20 bikes.

In irb
load './lib/docking_station.rb'
station = DockingStation.new
20.times { station.dock_bike Bike.new }
station.dock_bike Bike.new
--> error

As a system maintainer,
So that busy areas can be served more effectively,
I want to be able to specify a larger capacity when necessary.

in irb
	load './lib/docking_station.rb'
	station = DockingStation.new(20)
	station.capacity == 20

As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I'd like to report a bike as broken when I return it.

in irb
	load './lib/docking_station.rb'
	bike = Bike.new
	bike.report_broken
	bike.working? == false

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations not to release broken bikes.

in irb
	load './lib/docking_station.rb'
	bike = Bike.new
	bike.report_broken
	station = DockingStation.new
	station.dock_bike(bike)
	station.release_bike
	--> throws error

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations to accept returning bikes (broken or not).

in irb
	load './lib/docking_station.rb'
	bike = Bike.new
	bike.report_broken
	station = DockingStation.new
	station.dock_bike(bike)
	station.bikes.include?(bike)