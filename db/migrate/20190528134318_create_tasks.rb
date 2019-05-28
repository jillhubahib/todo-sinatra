class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string     :name
      t.integer    :user_id
      t.datetime   :completed_at

      t.timestamps null: false
    end

    add_foreign_key :tasks, :users
    add_index :tasks, :name
  end
end
