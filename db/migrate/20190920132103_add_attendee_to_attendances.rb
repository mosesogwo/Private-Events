class AddAttendeeToAttendances < ActiveRecord::Migration[5.2]
  def change
    add_reference :attendances, :attendee, foreign_key: true
  end
end
