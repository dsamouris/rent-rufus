class AddAddressToDogs < ActiveRecord::Migration[6.1]
  def change
    add_column :dogs, :address, :string
  end
end
