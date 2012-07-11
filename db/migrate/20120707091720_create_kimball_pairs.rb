class CreateKimballPairs < ActiveRecord::Migration
  def change
    create_table :kimball_pairs do |t|
      t.integer :submission_id
      t.string :words
      t.integer :category_id

      t.timestamps
    end
  end
end
