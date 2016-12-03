require 'test_helper'

class AdTemplatesControllerTest < ActionController::TestCase
  setup do
    @ad_template = ad_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ad_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ad_template" do
    assert_difference('AdTemplate.count') do
      post :create, ad_template: { column_count: @ad_template.column_count, grid_height: @ad_template.grid_height, grid_width: @ad_template.grid_width, name: @ad_template.name }
    end

    assert_redirected_to ad_template_path(assigns(:ad_template))
  end

  test "should show ad_template" do
    get :show, id: @ad_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ad_template
    assert_response :success
  end

  test "should update ad_template" do
    patch :update, id: @ad_template, ad_template: { column_count: @ad_template.column_count, grid_height: @ad_template.grid_height, grid_width: @ad_template.grid_width, name: @ad_template.name }
    assert_redirected_to ad_template_path(assigns(:ad_template))
  end

  test "should destroy ad_template" do
    assert_difference('AdTemplate.count', -1) do
      delete :destroy, id: @ad_template
    end

    assert_redirected_to ad_templates_path
  end
end
