class AddOauthAcessTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image, :string
    add_column :users, :oauth_access_token, :string
    add_column :users, :oauth_expires_at, :datetime
  end
end
