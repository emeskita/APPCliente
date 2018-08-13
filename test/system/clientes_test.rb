require "application_system_test_case"

class ClientesTest < ApplicationSystemTestCase
  setup do
    @cliente = clientes(:one)
  end

  test "visiting the index" do
    visit clientes_url
    assert_selector "h1", text: "Clientes"
  end

  test "creating a Cliente" do
    visit clientes_url
    click_on "New Cliente"

    fill_in "Cep", with: @cliente.cep
    fill_in "Cidade", with: @cliente.cidade
    fill_in "Complemento", with: @cliente.complemento
    fill_in "Cpf", with: @cliente.cpf
    fill_in "Data Nascimento", with: @cliente.data_nascimento
    fill_in "Endereco", with: @cliente.endereco
    fill_in "Estado", with: @cliente.estado
    fill_in "Nome", with: @cliente.nome
    fill_in "Numero", with: @cliente.numero
    fill_in "Password Digest", with: @cliente.password_digest
    fill_in "Ultimo Nome", with: @cliente.ultimo_nome
    click_on "Create Cliente"

    assert_text "Cliente was successfully created"
    click_on "Back"
  end

  test "updating a Cliente" do
    visit clientes_url
    click_on "Edit", match: :first

    fill_in "Cep", with: @cliente.cep
    fill_in "Cidade", with: @cliente.cidade
    fill_in "Complemento", with: @cliente.complemento
    fill_in "Cpf", with: @cliente.cpf
    fill_in "Data Nascimento", with: @cliente.data_nascimento
    fill_in "Endereco", with: @cliente.endereco
    fill_in "Estado", with: @cliente.estado
    fill_in "Nome", with: @cliente.nome
    fill_in "Numero", with: @cliente.numero
    fill_in "Password Digest", with: @cliente.password_digest
    fill_in "Ultimo Nome", with: @cliente.ultimo_nome
    click_on "Update Cliente"

    assert_text "Cliente was successfully updated"
    click_on "Back"
  end

  test "destroying a Cliente" do
    visit clientes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cliente was successfully destroyed"
  end
end
