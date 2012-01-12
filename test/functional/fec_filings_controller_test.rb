require 'test_helper'

class FecFilingsControllerTest < ActionController::TestCase
  setup do
    @fec_filing = fec_filings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fec_filings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fec_filing" do
    assert_difference('FecFiling.count') do
      post :create, :fec_filing => @fec_filing.attributes
    end

    assert_redirected_to fec_filing_path(assigns(:fec_filing))
  end

  test "should show fec_filing" do
    get :show, :id => @fec_filing.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @fec_filing.to_param
    assert_response :success
  end

  test "should update fec_filing" do
    put :update, :id => @fec_filing.to_param, :fec_filing => @fec_filing.attributes
    assert_redirected_to fec_filing_path(assigns(:fec_filing))
  end

  test "should destroy fec_filing" do
    assert_difference('FecFiling.count', -1) do
      delete :destroy, :id => @fec_filing.to_param
    end

    assert_redirected_to fec_filings_path
  end
end
