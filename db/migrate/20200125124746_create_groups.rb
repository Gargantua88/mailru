class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.datetime :start_time, null: false, index: { unique: true }
      t.references :course, foreign_key: true
    end
  end
end
