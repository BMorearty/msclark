class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.belongs_to :teacher

      t.timestamps
    end

    # TODO: add_index :courses, :teacher_id
  end
end
