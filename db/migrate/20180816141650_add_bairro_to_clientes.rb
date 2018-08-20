class AddBairroToClientes < ActiveRecord::Migration[5.2]
  def change
    add_column :clientes, :bairro, :string
  end
end
