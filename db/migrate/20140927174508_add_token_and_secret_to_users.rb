class AddTokenAndSecretToUsers < ActiveRecord::Migration
  def change
    add_column :users, :token, :string
    add_column :users, :secret, :string
    add_column :users, :image, :string
    add_column :users, :decoy_cd, :integer, default: 0
  end
end
