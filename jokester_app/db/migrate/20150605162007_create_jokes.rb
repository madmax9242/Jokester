class CreateJokes < ActiveRecord::Migration
  def change
    create_table :jokes do |t|
      t.text :question, :null => false
      t.text :answer, :null => false
    end
  end
end
