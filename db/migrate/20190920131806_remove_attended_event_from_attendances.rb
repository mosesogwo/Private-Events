class RemoveAttendedEventFromAttendances < ActiveRecord::Migration[5.2]
  def change
    remove_reference :attendances, :attended_event, foreign_key: true
  end
end
