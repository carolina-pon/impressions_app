class AddCategoryIdToImpressions < ActiveRecord::Migration[5.2]
  def up
    add_reference :impressions, :category, null: false, index: true
  end
end
