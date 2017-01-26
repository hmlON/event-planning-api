class AddAttachmentsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :attachments, :json
  end
end
