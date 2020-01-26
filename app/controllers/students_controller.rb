class StudentsController < ApplicationController
  def create
    @student = Student.find_or_create_by(email: student_params[:email])
    @group = Group.find(student_params[:group_id])
    @course = @group.course

    if @student.persisted? && !student_already_enrolled?
      @student.groups << @group

      redirect_to course_path(@course.id), notice: 'Успешно записаны!'
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to course_path(@course.id), alert: 'Не удалось записаться!'
    end
  end

  private

  def student_params
    params.permit(:email, :group_id)
  end

  def student_already_enrolled?
    @course.students.include?(@student)
  end
end
