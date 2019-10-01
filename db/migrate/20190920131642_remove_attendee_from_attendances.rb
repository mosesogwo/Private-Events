class RemoveAttendeeFromAttendances < ActiveRecord::Migration[5.2]
  def change
    remove_reference :attendances, :attendee, foreign_key: true
  end
end
