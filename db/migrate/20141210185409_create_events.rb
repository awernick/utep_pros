class CreateEvents < ActiveRecord::Migration
  def change
    create_table :atw_rseventspro_events do |t|
      t.integer :parent
      t.string :name
      t.datetime :createdtime
      t.datetime :starttime
      t.datetime :endtime
      t.string :description
      t.string :location
      t.string :owner
      t.string :URL
      t.string :email
      t.string :phone
      t.string :metaname
      t.string :metakeywords
      t.string :metadescription
      t.boolean :recurring
      t.boolean :repeat_also
      t.boolean :registration
      t.boolean :comments
      t.string :icon
      t.boolean :repeat_interval
      t.integer :repeat_type
      t.datetime :repeat_end
      t.datetime :start_registration
      t.datetime :end_registration
      t.datetime :unsubscribe_date
      t.boolean :payments
      t.integer :max_tickets
      t.integer :max_tickets_amount
      t.boolean :notify_me
      t.boolean :notify_me_unsubscribe
      t.boolean :overbooking
      t.integer :overbooking_amount
      t.boolean :show_registered
      t.boolean :automatically_approve
      t.string :paypal_email
      t.boolean :discounts
      t.boolean :form
      t.boolean :early_fee
      t.integer :early_fee_type
      t.datetime :early_fee_end
      t.datetime :late_fee
      t.integer :late_fee_type
      t.datetime :late_fee_start
      t.string :options
      t.boolean :archived
      t.boolean :published
      t.boolean :completed
      t.boolean :approved
      t.boolean :ticket_pdf
      t.string :ticket_pdf_layout
      t.string :properties
      t.string :gallery_tags
      t.boolean :allday
      t.boolean :featured

      t.timestamps
    end
  end
end
