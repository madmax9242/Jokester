class CreateJokes < ActiveRecord::Migration
  def change
    create_table :jokes do |t|
      t.text :question
      t.text :answer
    end
  end
end
