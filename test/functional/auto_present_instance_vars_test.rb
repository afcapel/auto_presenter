require "test_helper"

class AutoPresentInstanceVarsTest < ActionController::TestCase

  tests ProjectsController

  fixtures :all

  test "finds presenter by class" do
    get :show, id: projects(:invoice_o_matic).id

    assert_kind_of TaskPresenter, assigns(:new_task)
  end

  test "finds presenter by instance variable name" do
    get :show, id: projects(:invoice_o_matic).id

    assert_kind_of Projects::CompletedTasksPresenter, assigns(:completed_tasks)
  end

  test "presents records in an ActiveRecord::Relation" do
    get :show, id: projects(:invoice_o_matic).id

    tasks = assigns(:uncompleted_tasks)

    assert_equal 2, tasks.size

    assert_kind_of AutoPresenter::RelationPresenter, tasks

    tasks.each do |task|
      assert_kind_of TaskPresenter, task
    end
  end
end
