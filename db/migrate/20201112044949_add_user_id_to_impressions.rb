class AddUserIdToImpressions < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM impressions;'
    add_reference :impressions, :user, null: false, index: true
  end

  def down
    remove_reference :impressions, :user, index: true
  end
end
