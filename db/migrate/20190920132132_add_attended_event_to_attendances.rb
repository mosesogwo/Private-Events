class AddAttendedEventToAttendances < ActiveRecord::Migration[5.2]
  def change
    add_reference :attendances, :attended_event, foreign_key: true
  end
end
