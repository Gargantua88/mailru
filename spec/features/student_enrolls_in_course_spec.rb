require 'rails_helper'

RSpec.feature 'student enrolls in course', type: :feature do
  before do
    @physics_course = FactoryBot.create(:course, name: 'Physic')
    @physics_group = FactoryBot.create(:group, start_time: '2020-01-25 00:09:29', course_id: @physics_course.id)

    @correct_email = 'newton@gmail.com'
    @incorrect_email = 'newton@gmailcom'
  end

  scenario 'success' do
    visit course_path(@physics_course.id)

    expect(page).to have_content('Курс: Physic')
    expect(Student.count).to eq 0

    fill_in :email, with: @correct_email
    click_button 'Записаться'

    expect(Student.count).to eq 1
    expect(page).to have_content('Успешно записаны!')
  end

  scenario 'failure' do
    visit course_path(@physics_course.id)

    fill_in :email, with: @incorrect_email
    click_button 'Записаться'

    expect(Student.count).to eq 0
    expect(page).to have_content('Email is invalid')
    expect(page).to have_content('Не удалось записаться!')
  end
end
