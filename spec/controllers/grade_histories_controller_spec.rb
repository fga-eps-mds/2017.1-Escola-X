require 'rails_helper'
require 'helper_module_spec'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe GradeHistoriesController, type: :controller do
  let(:subject_inputs) { { name_subject:"Filosofia", class_level:"2", teacher_id: teacher.id } }
  let(:subject2_inputs) { { name_subject:"Trigonometria", class_level:"2", teacher_id: teacher2.id } }
  let(:classroom_inputs) { { name_classroom: "3G", shift_classroom: "matutino" } }
  let(:alumn_inputs) { { name: "Michael Cera", phone:"61988885555",
                         address:"Rua Vida Casa 15,Taguatinga",
                         password: "12345678", gender:"M",
                         birth_date:"07/06/1988", registry:"12345",
                         parent_id: parent.id} }

  let(:secretary_inputs) { { employee_cpf: "06057577124", admission_date: "03/01/1996",
                 name: "Jose Apolinario da Silva",
  						   address: "Rua Laranjeiras 456", phone: "60991907175",
  						   gender: "Masculino", birth_date: "02/02/2012",
  						   password: "12345678", permission:"Secretary", registry:"555444"} }

  let(:grade_inputs){{grade_01:5.0,grade_02:5.0,grade_03:6.0,grade_04:8.0,grade_final:7.0}}

  describe "Create history" do
    # before(:each) do
    #   alumn = Alumn.create alumn_inputs
    #   subject = Subject.create subject_inputs
    #   classroom = Classroom.create classroom_inputs
    #   alumn.classroom_id = classroom.id
    #   ClassroomSubject.create(classroom_id: classroom.id, subject_id: subject.id)
    #   grade = Grade.create(alumn_id: alumn.id, subject_id: subject.id, classroom_id: classroom.id)
    #   secretary = Secretary.create secretary_inputs
    # end

    it "assigns a new GradeHistory to @grade_history" do
      alumn = Alumn.create alumn_inputs
      subject = Subject.create subject_inputs
      classroom = Classroom.create classroom_inputs
      alumn.classroom_id = classroom.id
      ClassroomSubject.create(classroom_id: classroom.id, subject_id: subject.id)
      grade = Grade.create(alumn_id: alumn.id, subject_id: subject.id, classroom_id: classroom.id)
      secretary = Secretary.create secretary_inputs
      expect{
        GradeHistoriesController.create(grade, secretary)
      }.to change(GradeHistory, :count).by 1
    end
  end

  describe "Show history" do
    before(:each) do
      login_principal
    end

    it "assigns all grade histories to @grade_histories" do
      alumn = Alumn.create alumn_inputs
      subject = Subject.create subject_inputs
      classroom = Classroom.create classroom_inputs
      alumn.classroom_id = classroom.id
      ClassroomSubject.create(classroom_id: classroom.id, subject_id: subject.id)
      grade = Grade.create(alumn_id: alumn.id, subject_id: subject.id, classroom_id: classroom.id)
      secretary = Secretary.create secretary_inputs
      GradeHistoriesController.create(grade, secretary)
      get :show_history, params:{id: classroom.id, subject_id: subject.id, grade_id: grade.id}
      expect(assigns(:grade_histories)).to match_array(grade.grade_histories)
    end
  end
end
