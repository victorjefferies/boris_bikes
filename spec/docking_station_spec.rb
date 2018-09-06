require 'docking_station'

describe DockingStation do

	# it 'responds to release_bike' do
	# 	expect(subject).to respond_to(:release_bike)
	# end

	describe 'capacity' do
		it 'user can set capacity value' do
			subject.capacity = 10
			expect(subject.capacity).to eq(10)
		end

		it 'default for capacity is 20' do
			expect(subject.capacity).to eq(20)
		end
	end

	describe '#release_bike' do
		it { is_expected.to respond_to(:release_bike) }
		it 'releases working bike' do
			bike = Bike.new
			subject.dock_bike(bike)
			expect(subject.release_bike).to be_working
		end
		it 'releases existing bike' do
			bike = Bike.new
			subject.dock_bike(bike)
			expect(subject.release_bike).to eq(bike)
		end
		it 'raises an error when there are no bikes available' do
		  expect { subject.release_bike } .to raise_error("No bikes available")
	    end
	    it 'raises an error when no bike is working' do
	    	bike = Bike.new
	    	bike.report_broken
	    	subject.dock_bike(bike)
	    	expect { subject.release_bike } .to raise_error("Sorry, no working bike available")
	    end

	end

	describe '#dock_bike' do

		it { is_expected.to respond_to(:dock_bike) }
		it { is_expected.to respond_to(:dock_bike).with(1).argument }
    	it { is_expected.to respond_to(:bikes) }
    	it 'adds working bike to docking station' do
		  bike = Bike.new
		  subject.dock_bike(bike)
		  expect(subject.bikes).to include bike
    	end
    	it 'adds broken bike to docking station' do
		  bike = Bike.new
		  bike.report_broken
		  subject.dock_bike(bike)
		  expect(subject.bikes).to include bike
    	end
        it 'raises an error when full and user tries to dock_bike' do
        	bike = Bike.new
        	DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike(bike) }
        	expect { subject.dock_bike(bike) } .to raise_error("Docking station full")
        end
	end

	describe '#capacity' do
		it { is_expected.to respond_to(:capacity) }
	end
end