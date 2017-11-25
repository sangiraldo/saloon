class CreateEstablishments < ActiveRecord::Migration[5.0]
  def change
    create_table :establishments do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :city
      t.string :district
      t.integer :user_id

      t.timestamps
    end
  end
end
