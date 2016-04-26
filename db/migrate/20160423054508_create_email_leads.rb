class CreateEmailLeads < ActiveRecord::Migration
  def change
    create_table :email_leads do |t|
      t.string :email, null: false
      t.boolean :receive_emails, default: true

      t.timestamps null: false
    end
  end
end
