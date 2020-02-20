class CreateSlackUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :slack_users do |t|
      t.string :username
      t.integer :points

      t.timestamps
    end
  end
end
