class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.references :user, index: true
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
