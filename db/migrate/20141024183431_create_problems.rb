class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.references :user, index: true
      t.references :note, index: true
      t.string :title
      t.text :body
      t.datetime :published_date
      t.boolean :solved, default: false, null: false

      t.timestamps
    end
  end
end
