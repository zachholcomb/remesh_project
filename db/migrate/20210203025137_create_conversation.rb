class CreateConversation < ActiveRecord::Migration[6.1]
  def change
    create_table :conversations do |t|
      t.string :title
      t.date :start_date
    end
  end
end
