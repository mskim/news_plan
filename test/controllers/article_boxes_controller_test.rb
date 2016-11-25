require 'test_helper'

class ArticleBoxesControllerTest < ActionController::TestCase
  setup do
    @article_box = article_boxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:article_boxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article_box" do
    assert_difference('ArticleBox.count') do
      post :create, article_box: { grid_frame: @article_box.grid_frame, section_template_id: @article_box.section_template_id }
    end

    assert_redirected_to article_box_path(assigns(:article_box))
  end

  test "should show article_box" do
    get :show, id: @article_box
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @article_box
    assert_response :success
  end

  test "should update article_box" do
    patch :update, id: @article_box, article_box: { grid_frame: @article_box.grid_frame, section_template_id: @article_box.section_template_id }
    assert_redirected_to article_box_path(assigns(:article_box))
  end

  test "should destroy article_box" do
    assert_difference('ArticleBox.count', -1) do
      delete :destroy, id: @article_box
    end

    assert_redirected_to article_boxes_path
  end
end
