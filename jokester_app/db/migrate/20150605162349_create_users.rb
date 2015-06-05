class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :null => false, :unique => true, :index => true
      t.string :email, :null => false, :unique => true
      t.string :password, :null => false
      t.string :first_name, :null => false
      t.string :last_name, :null => false
    end
  end
end
