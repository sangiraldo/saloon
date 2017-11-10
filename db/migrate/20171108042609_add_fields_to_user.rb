class AddFieldsToUser < ActiveRecord::Migration[5.0]

  def up
    add_column :users, :full_name, :string
    add_column :users, :cellphone, :string
    add_column :users, :address, :string
    add_column :users, :gender, :string
    add_column :users, :is_admin, :boolean, default: false
  end

  def down
    remove_column :users, :full_name
    remove_column :users, :cellphone
    remove_column :users, :address
    remove_column :users, :gender
    remove_column :users, :is_admin
  end

end
