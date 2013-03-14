class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :course_id
      t.integer :student_id

      t.timestamps
    end

    # TODO: add_index :enrollments, :course_id
    # TODO: add_index :enrollments, :student_id
  end
end
