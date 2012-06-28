require 'test_helper'

class SimulacaoProdutosControllerTest < ActionController::TestCase
  setup do
    @simulacao_produto = simulacao_produtos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simulacao_produtos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simulacao_produto" do
    assert_difference('SimulacaoProduto.count') do
      post :create, simulacao_produto: { aliquota_icms: @simulacao_produto.aliquota_icms, icms: @simulacao_produto.icms, ip: @simulacao_produto.ip, outros_custos: @simulacao_produto.outros_custos, preco_calculado: @simulacao_produto.preco_calculado, preco_compra: @simulacao_produto.preco_compra, preco_vpsa: @simulacao_produto.preco_vpsa, produto_vpsa_id: @simulacao_produto.produto_vpsa_id, st: @simulacao_produto.st }
    end

    assert_redirected_to simulacao_produto_path(assigns(:simulacao_produto))
  end

  test "should show simulacao_produto" do
    get :show, id: @simulacao_produto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @simulacao_produto
    assert_response :success
  end

  test "should update simulacao_produto" do
    put :update, id: @simulacao_produto, simulacao_produto: { aliquota_icms: @simulacao_produto.aliquota_icms, icms: @simulacao_produto.icms, ip: @simulacao_produto.ip, outros_custos: @simulacao_produto.outros_custos, preco_calculado: @simulacao_produto.preco_calculado, preco_compra: @simulacao_produto.preco_compra, preco_vpsa: @simulacao_produto.preco_vpsa, produto_vpsa_id: @simulacao_produto.produto_vpsa_id, st: @simulacao_produto.st }
    assert_redirected_to simulacao_produto_path(assigns(:simulacao_produto))
  end

  test "should destroy simulacao_produto" do
    assert_difference('SimulacaoProduto.count', -1) do
      delete :destroy, id: @simulacao_produto
    end

    assert_redirected_to simulacao_produtos_path
  end
end
