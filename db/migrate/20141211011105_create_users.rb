class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password
      t.string :usertype
      t.boolean :block
      t.boolean :sendEmail
      t.datetime :registerDate
      t.datetime :lastvisitDate
      t.boolean :activation
      t.string :params
      t.datetime :lastResetTime
      t.integer :resetCount

      t.timestamps
    end
  end
end
