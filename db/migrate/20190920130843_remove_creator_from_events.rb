class RemoveCreatorFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_reference :events, :creator, foreign_key: true
  end
end
