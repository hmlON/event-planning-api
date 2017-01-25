class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.references :sender
      t.references :event
      t.references :recipient
      t.string :email
      t.string :token

      t.timestamps
    end
  end
end
