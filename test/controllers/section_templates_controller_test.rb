require 'test_helper'

class SectionTemplatesControllerTest < ActionController::TestCase
  setup do
    @section_template = section_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:section_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create section_template" do
    assert_difference('SectionTemplate.count') do
      post :create, section_template: { grid_base: @section_template.grid_base, grid_key: @section_template.grid_key, has_heading: @section_template.has_heading }
    end

    assert_redirected_to section_template_path(assigns(:section_template))
  end

  test "should show section_template" do
    get :show, id: @section_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @section_template
    assert_response :success
  end

  test "should update section_template" do
    patch :update, id: @section_template, section_template: { grid_base: @section_template.grid_base, grid_key: @section_template.grid_key, has_heading: @section_template.has_heading }
    assert_redirected_to section_template_path(assigns(:section_template))
  end

  test "should destroy section_template" do
    assert_difference('SectionTemplate.count', -1) do
      delete :destroy, id: @section_template
    end

    assert_redirected_to section_templates_path
  end
end
