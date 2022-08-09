class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.date :date_of_birth
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.integer :role

      t.timestamps
    end
  end
end
