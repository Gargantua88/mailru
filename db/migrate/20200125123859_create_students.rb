class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :email, null: false, index: { unique: true }
    end
  end
end
