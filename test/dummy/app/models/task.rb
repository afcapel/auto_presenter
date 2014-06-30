class Task < ActiveRecord::Base
  belongs_to :project

  scope :completed,   -> { where('`tasks`.`completed_at` IS NOT NULL') }
  scope :uncompleted, -> { where('`tasks`.`completed_at` IS NULL') }

  def status
    completed_at.present? ? 'Completed' : 'Uncompleted'
  end
end
