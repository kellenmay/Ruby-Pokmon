class JoinUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :join_users do |t|
      t.belongs_to :user
      t.belongs_to :pokemon
    end
  end
end