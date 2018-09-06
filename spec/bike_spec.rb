require 'bike'

describe Bike do
	it { should respond_to(:working?) }
    
    describe '#report_broken' do
       it {is_expected.to respond_to(:report_broken)}
       it 'is not working when reported as borken' do
       	 subject.report_broken
       	 expect(subject.working?).to eq false
       end
   end
end