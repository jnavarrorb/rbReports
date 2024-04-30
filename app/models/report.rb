class Report < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :template, presence: true
  validates :sensor_name, presence: true
  validates :sensor_type, presence: true
  validates :sensor_id, presence: true
end
