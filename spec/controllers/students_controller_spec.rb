require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  describe '#create' do
    before do
      @physics_course = FactoryBot.create(:course, name: 'Physic')
      @astronomy_course = FactoryBot.create(:course, name: 'Astronomy')
      @physics_group1 = FactoryBot.create(:group, start_time: '2020-01-25 00:09:29', course_id: @physics_course.id)
      @physics_group2 = FactoryBot.create(:group, start_time: '2020-01-26 00:09:29', course_id: @physics_course.id)
      @astronomy_group = FactoryBot.create(:group, start_time: '2020-01-27 00:09:29', course_id: @astronomy_course.id)

      @params = {
        email: 'newton@gmail.com',
        group_id: @physics_group1.id
      }

      @params2 = {
        email: 'newton@gmail.com',
        group_id: @astronomy_group.id
      }

      @incorrect_params = {
        email: 'newton@gmailcom',
        group_id: @physics_group1.id
      }

      @duplicate_params = {
        email: 'newton@gmail.com',
        group_id: @physics_group2.id
      }
    end

    it 'creates student by params' do
      post :create, params: @params

      expect(Student.count).to eq 1
      expect(Student.first.email).to eq 'newton@gmail.com'
    end

    it 'checks all references after create' do
      post :create, params: @params

      expect(@physics_course.students.count).to eq 1
      expect(@physics_course.students.first.email).to eq 'newton@gmail.com'

      expect(@physics_group1.students.count).to eq 1
      expect(@physics_group1.students.first.email).to eq 'newton@gmail.com'
    end

    it 'doesnt create student with incorrect params' do
      post :create, params: @incorrect_params

      expect(Student.count).to eq 0
    end

    it 'doesnt create student if student already present' do
      post :create, params: @params

      expect(Student.count).to eq 1

      post :create, params: @params2

      expect(Student.count).to eq 1
    end

    it 'doesnt enroll student if hes already enrolled in course' do
      post :create, params: @params

      expect(Student.count).to eq 1

      post :create, params: @duplicate_params

      expect(Student.count).to eq 1
      expect(@physics_group1.students.first.email).to eq 'newton@gmail.com'
      expect(@physics_group2.students.count).to eq 0
    end
  end
end
