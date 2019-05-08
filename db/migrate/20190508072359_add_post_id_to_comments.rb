# frozen_string_literal: true

class AddPostIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :post_id, :integer
    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
