class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :problem, index: true
      t.references :user, index: true
      t.string :body
      t.string :responder

      t.timestamps
    end
  end
end
