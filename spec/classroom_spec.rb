require_relative '../lib/classroom'

describe Classroom do
  context 'Test for classroom object' do
    let(:classroom) { Classroom.new('Math') }
    before :each do
      @classroom = Classroom.new('CSD21')
    end
    it 'should return the classroom name Math' do
      expect(classroom.label).to eq('Math')
    end
    it 'Checking classroom instance' do
      expect(classroom).to be_an_instance_of(Classroom)
    end
    it 'test if add student' do
      student = double('student')
      allow(student).to receive(:age) { '25' }
      allow(student).to receive(:name) { 'Olla' }
      allow(student).to receive(:classroom=).and_return(Classroom)
      expect(@classroom.add_student(student).students[0].name).to eq('Olla')
    end
  end
end
