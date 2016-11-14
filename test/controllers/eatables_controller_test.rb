require 'test_helper'

class EatablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @eatable = eatables(:one)
  end

  test "should get index" do
    get eatables_url
    assert_response :success
  end

  test "should get new" do
    get new_eatable_url
    assert_response :success
  end

  test "should create eatable" do
    assert_difference('Eatable.count') do
      post eatables_url, params: { eatable: {  } }
    end

    assert_redirected_to eatable_url(Eatable.last)
  end

  test "should show eatable" do
    get eatable_url(@eatable)
    assert_response :success
  end

  test "should get edit" do
    get edit_eatable_url(@eatable)
    assert_response :success
  end

  test "should update eatable" do
    patch eatable_url(@eatable), params: { eatable: {  } }
    assert_redirected_to eatable_url(@eatable)
  end

  test "should destroy eatable" do
    assert_difference('Eatable.count', -1) do
      delete eatable_url(@eatable)
    end

    assert_redirected_to eatables_url
  end
end
