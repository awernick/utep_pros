class AddAtwUsersTable < ActiveRecord::Migration
  def change
  	create_table :atw_rseventspro_users do |t|
      t.integer :ide
      t.integer :idu
      t.string :name
      t.string :email
      t.datetime :date
      t.boolean :state
      t.string :verification
      t.integer :SubmissionId
      t.string :gateway
      t.string :ip
      t.string :URL
      t.string :params
      t.decimal :discount
      t.decimal :early_fee
      t.decimal :late_fee
      t.decimal :tax
      t.string :log
      t.string :lang
      t.string :coupon
      t.string :ideal

      t.timestamps
    end
  end
end
