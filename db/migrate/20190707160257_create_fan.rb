class CreateFan < ActiveRecord::Migration[5.0]
  def change
    create_table :fans do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password
    end
  end
end
