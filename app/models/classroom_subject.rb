class ClassroomSubject < ApplicationRecord
  belongs_to :classroom
  belongs_to :subject
  after_create :update_alumns_grades

  def update_alumns_grades
    self.classroom.alumns.each do |alumn|
      if !Grade.where(alumn_id: alumn.id).where(classroom_id: self.classroom_id).where(subject_id: self.subject_id).exists?
        Grade.create(alumn_id: alumn.id, classroom_id: self.classroom_id, subject_id: self.subject_id)
      end
    end
  end

end
