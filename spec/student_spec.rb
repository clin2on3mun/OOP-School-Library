require_relative '../lib/student'

describe Student do
  context 'Test for student object' do
    let(:student) { Student.new(25, 'olla', parent_permission: true) }
    let(:classroom) { Classroom.new('Math') }
    it 'should return the student name olla' do
      expect(student.name).to eq('olla')
    end
    it 'should return the student age 25' do
      expect(student.age).to eql(25)
    end
    it 'should return the student parent_permission: true' do
      expect(student.parent_permission).to eq(true)
    end
    it 'should return the play_hooky' do
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
    it 'adds the student to the classroom' do
      student.classroom = classroom
      expect(classroom.students).to include(student)
    end
  end
end
