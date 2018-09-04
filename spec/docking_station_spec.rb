require 'docking_station'
describe DockingStation do
	# it 'responds to release_bike' do
	# 	expect(subject).to respond_to(:release_bike)
	# end
	it { should respond_to(:release_bike) }
	it 'gets a bike and expects bike to be working' do
		expect(subject.release_bike).to be_working
	end

end