require "test_helper"

class ArtistControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get artist_index_url
    assert_response :success
  end

  test "should get show" do
    get artist_show_url
    assert_response :success
  end

  test "should get edit" do
    get artist_edit_url
    assert_response :success
  end

  test "should get update" do
    get artist_update_url
    assert_response :success
  end

  test "should get destroy" do
    get artist_destroy_url
    assert_response :success
  end
end
