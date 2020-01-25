class CoursesController < ApplicationController
  def index
    query = sql
    query += sort_by_start_time if params[:sort]

    @courses = Course.find_by_sql(query)
  end

  def show
    @course = Course.find(params[:id])
    @groups = @course.groups.eager_load(:students)
  end

  private

  def sql
    <<~SQL
      SELECT
      courses.id AS id,
      courses.name AS name,
      MIN(start_time) AS earliest_start_time,
      COUNT(groups_students.student_id) AS students_count
      FROM groups
      LEFT JOIN courses ON course_id = courses.id
      LEFT JOIN groups_students ON groups_students.group_id = groups.id
      GROUP BY courses.id
    SQL
  end

  def sort_by_start_time
    <<~SQL
      ORDER BY earliest_start_time ASC
    SQL
  end
end
