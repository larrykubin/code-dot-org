require 'test_helper'

class Plc::TasksControllerTest < ActionController::TestCase
  def setup
    @user = create :admin
    sign_in(@user)
    @learning_module = create :plc_learning_module
    @learning_resource_task = create(:plc_learning_resource_task, name: 'task', type: 'Plc::LearningResourceTask', plc_learning_module: @learning_module)
  end

  test 'get index' do
    get :index
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create new tasks of all task types' do
    [
        [Plc::LearningResourceTask, plc_learning_resource_task: {resource_url: 'Some url'}],
        [Plc::ScriptCompletionTask, plc_script_completion_task: {script_id: 1}],
        [Plc::WrittenSubmissionTask, plc_written_submission_task: {assignment_description: 'Description'}]
    ].each do |task_type, task_params|
      task_name = SecureRandom.hex

      assert_creates(Plc::Task) do
        post :create, plc_task: {name: task_name, plc_learning_module_id: @learning_module.id, type: task_type.name}
        new_id = Plc::Task.find_by(name: task_name).id
        patch :update, id: new_id, plc_task: task_params
      end

      assert_equal task_name, task_type.find_by(name: task_name).name
      assert_redirected_to plc_task_path(assigns(:task))
    end
  end

  test 'should show task' do
    get :show, id: @learning_resource_task
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @learning_resource_task
  end

  test 'should update task' do
    assert 'name', @learning_resource_task.name
    patch :update, id: @learning_resource_task, plc_learning_resource_task: {name: 'New name', type: 'Plc::LearningResourceTask', plc_learning_module: @learning_module}
    assert_redirected_to plc_task_path(assigns(:task))
    assert 'New name', @learning_resource_task.name
  end

  test 'should destroy task' do
    assert_difference('Plc::Task.count', -1) do
      delete :destroy, id: @learning_resource_task
    end

    assert_redirected_to plc_tasks_path
  end
end
