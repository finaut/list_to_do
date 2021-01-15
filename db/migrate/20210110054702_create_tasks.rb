class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.boolean :complete, default: false
      t.string :title
      t.references :list, index: true

      t.timestamps
    end
  end
end
