require "test_helper"

class DonationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_edit
    get :edit
    assert_response :success
  end

  def test_create
    get :create
    assert_response :success
  end

  def test_update
    get :update
    assert_response :success
  end

end
