class CreateProjectsAndTasks < ActiveRecord::Migration

  def change

    create_table :projects do |t|
      t.string :name
      t.timestamps
    end

    create_table :tasks do |t|
      t.belongs_to :project
      t.string :name
      t.float :budget
      t.datetime :completed_at
      t.timestamps
    end

  end
end
