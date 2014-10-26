class UpdateResolvedonProblems < ActiveRecord::Migration
  def change
    change_column :problems, :resolved, :boolean, default: false, null: false
  end
end
