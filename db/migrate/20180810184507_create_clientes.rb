class CreateClientes < ActiveRecord::Migration[5.2]
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :ultimo_nome
      t.string :cpf
      t.date :data_nascimento
      t.string :endereco
      t.integer :numero
      t.string :cidade
      t.string :estado
      t.string :complemento
      t.string :cep
      t.string :password_digest

      t.timestamps
    end
  end
end
