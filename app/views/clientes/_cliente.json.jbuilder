json.extract! cliente, :id, :nome, :ultimo_nome, :cpf, :data_nascimento, :endereco, :numero, :cidade, :estado, :complemento, :cep, :password_digest, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
