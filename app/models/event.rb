class Event < ApplicationRecord
  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  # For FullCalendar JSON
  def start_time_iso
    start_time&.iso8601
  end
  
  def end_time_iso
    end_time&.iso8601
  end
end
