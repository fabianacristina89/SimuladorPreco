require 'test_helper'

class SimulacaosControllerTest < ActionController::TestCase
  setup do
    @simulacao = simulacaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simulacaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simulacao" do
    assert_difference('Simulacao.count') do
      post :create, simulacao: { base: @simulacao.base, margem_lucro: @simulacao.margem_lucro, total_despesas: @simulacao.total_despesas, total_receitas: @simulacao.total_receitas }
    end

    assert_redirected_to simulacao_path(assigns(:simulacao))
  end

  test "should show simulacao" do
    get :show, id: @simulacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @simulacao
    assert_response :success
  end

  test "should update simulacao" do
    put :update, id: @simulacao, simulacao: { base: @simulacao.base, margem_lucro: @simulacao.margem_lucro, total_despesas: @simulacao.total_despesas, total_receitas: @simulacao.total_receitas }
    assert_redirected_to simulacao_path(assigns(:simulacao))
  end

  test "should destroy simulacao" do
    assert_difference('Simulacao.count', -1) do
      delete :destroy, id: @simulacao
    end

    assert_redirected_to simulacaos_path
  end
end
