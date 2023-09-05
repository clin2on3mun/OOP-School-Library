class PreserveData
    def create_student_data(person, person_type )
        {
            person_type: person_type,
            id: person.id,
            age: person.age,
            name: person.name,
            parent_permission: person.parent_permission,
        }
    end
    def create_teacher_data(person, person_type)
        {
            person_type: person_type,
            id: person.id,
            age: person.age,
            name: person.name,
            specialization: person.specialization,
        }
    end
end
