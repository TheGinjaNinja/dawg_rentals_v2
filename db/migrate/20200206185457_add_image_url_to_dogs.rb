class AddImageUrlToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :img_url, :string
  end
end
