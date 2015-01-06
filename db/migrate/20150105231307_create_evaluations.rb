class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.string :title
      t.text :description
      t.datetime :eventdate
      t.string :referral
      t.integer :question2_1
      t.integer :question2_2
      t.integer :question2_3
      t.integer :question2_4
      t.integer :question2_5
      t.integer :question2_6
      t.integer :question2_6
      t.integer :question2_7
      t.integer :question3_1
      t.integer :question3_2
      t.integer :question3_3
      t.string :question4
      t.string :question5
      t.string :question6

      t.timestamps
    end
  end
end
