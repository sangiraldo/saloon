class AddImageColumnsToEstablishments < ActiveRecord::Migration[5.0]
  def up
    add_attachment :establishments, :image
  end

  def down
    remove_attachment :establishments, :image
  end
end
