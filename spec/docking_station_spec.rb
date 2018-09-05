require 'docking_station'

describe DockingStation do

	# it 'responds to release_bike' do
	# 	expect(subject).to respond_to(:release_bike)
	# end
	it { is_expected.to respond_to(:release_bike) }

	it 'releases working bike' do
		expect(subject.release_bike).to be_working
	end

	it { is_expected.to respond_to(:dock_bike) }
	it { is_expected.to respond_to(:dock_bike).with(1).argument }
    it { is_expected.to respond_to(:bike) }
    it 'adds bike to docking station' do
	  bike = Bike.new
	  subject.dock_bike(bike)
	  expect(subject.bike).to eq bike
	end

end