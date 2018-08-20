class AddEmailToClientes < ActiveRecord::Migration[5.2]
  def change
    add_column :clientes, :email, :string
  end
end
