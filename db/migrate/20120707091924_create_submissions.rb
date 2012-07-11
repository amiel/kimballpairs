class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :words
      t.text :rationale

      t.timestamps
    end
  end
end
