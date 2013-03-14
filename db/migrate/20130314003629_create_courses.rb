class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.belongs_to :teacher

      t.timestamps
    end

    add_index :courses, :teacher_id
    add_index :courses, :updated_at
  end
end
