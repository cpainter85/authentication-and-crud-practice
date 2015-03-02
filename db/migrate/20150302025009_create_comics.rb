class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :title
      t.integer :issue_number
      t.timestamps
    end
  end
end
