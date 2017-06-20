require 'rails_helper'
require 'helper_module_spec'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe GradesController, type: :controller do
  let(:subject_inputs) { { name_subject:"Filosofia", class_level:"2", teacher_id: teacher.id } }
  let(:subject2_inputs) { { name_subject:"Trigonometria", class_level:"2", teacher_id: teacher2.id } }
  let(:classroom_inputs) { { name_classroom: "3G", shift_classroom: "matutino" } }
  let(:alumn_inputs) { { name: "Michael Cera", phone:"61988885555",
                         address:"Rua Vida Casa 15,Taguatinga",
                         password: "12345678", gender:"M",
                         birth_date:"07/06/1988", registry:"12345",
                         parent_id: parent.id, shift:"matutino"} }

  let(:valid_inputs){{grade_01:5.0,grade_02:5.0,grade_03:6.0,grade_04:8.0, grade_final:7.0}}

  describe "POST create" do
    before(:each) do
      classroom
      login_principal
    end

    it "create grade table" do
      subject = Subject.create! subject_inputs
      classub= ClassroomSubject.create!(classroom_id: @classroom.id, subject_id: subject.id)
      expect{
        alumn2=Alumn.create(name: "Michael Cera", phone:"61988885555",
                               address:"Rua Vida Casa 15,Taguatinga",
                               password: "12345678", gender:"M",
                               birth_date:"07/06/1988", registry:"12345",
                               parent_id: parent.id, shift:"matutino",classroom_id:@classroom.id)
      GradesController.create(alumn2)
    }.to change(Grade, :count).by 1
    end
  end

  describe "GET set_grades" do
    before(:each) do
      classroom
      login_principal
    end

    it "assigns classrom to @classroom, subject to @subject and grades to @grades" do
      subject = Subject.create!(subject_inputs)
      classub = ClassroomSubject.create!(classroom_id: @classroom.id, subject_id: subject.id)
      get :set_grades, params: {id:@classroom.id, subject_id:subject.id }
      expect(assigns(:classroom)).to eq(@classroom)
      expect(assigns(:subject)).to eq(subject)
      expect(assigns(:grades)).to match_array(Grade.where(classroom_id: classroom.id).where(subject_id: subject.id))
    end

    it "renders the set_grades template" do
      subject = Subject.create!(subject_inputs)
      classub = ClassroomSubject.create!(classroom_id: @classroom.id, subject_id: subject.id)
      get :set_grades, params: {id:@classroom.id, subject_id:subject.to_param }
      expect(response).to render_template('set_grades')
    end
  end

  describe "POST post_grades" do
    before(:each) do
      classroom
      alumn
      login_secretary
    end

    it "assigns the requested grade to @grade" do
      subject = Subject.create!(subject_inputs)
      classub = ClassroomSubject.create!(classroom_id: @classroom.id, subject_id: subject.id)
      put :post_grades, params: {id:@classroom.id, subject_id:subject.id, alumn_id: @alumn.id, grade: valid_inputs}
      expect(assigns(:grade)).to eq(Grade.find_by_classroom_id_and_subject_id_and_alumn_id(@classroom.id, subject.id, @alumn.id))
    end

    it "post alumn grade" do
      subject = Subject.create!(subject_inputs)
      classub = ClassroomSubject.create!(classroom_id: @classroom.id, subject_id: subject.id)
      put :post_grades, params: {id:@classroom.id, subject_id:subject.id, alumn_id:@alumn.id,grade:valid_inputs}
    end
  end

  describe "update_alumn" do
    before(:each) do
      classroom
      alumn
      login_principal
    end

    it "updates alumn grades" do
      subject = Subject.create!(subject_inputs)
      classub = ClassroomSubject.create!(classroom_id: @classroom.id, subject_id: subject.id)
      classroom2= Classroom.create(name_classroom: "3H",
                                   shift_classroom: "matutino")
      subject2 = Subject.create!(subject2_inputs)
      classub = ClassroomSubject.create!(classroom_id: classroom2.id, subject_id: subject2.id)
      @alumn.classroom_id = classroom2.id
      expect{
        GradesController.update_alumn(@alumn)
      }.to change(Grade,:count).by 1
    end
  end

end
