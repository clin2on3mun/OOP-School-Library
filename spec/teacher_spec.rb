require_relative '../lib/teacher'

describe Teacher do
  context 'Test for teacher Object' do
    let(:teacher) { Teacher.new(34, 'Finance', 'Munana') }
    it 'should return the teacher name Munana' do
      expect(teacher.name).to eq('Munana')
    end
    it 'should return the teacher age 34' do
      expect(teacher.age).to eq(34)
    end
    it 'should return the teacher specialization Finance' do
      expect(teacher.specialization).to eq('Finance')
    end
    it 'should return the teacher can_use_services? true' do
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
