require 'test_helper'

class EvaluationsControllerTest < ActionController::TestCase
  setup do
    @evaluation = evaluations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evaluations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evaluation" do
    assert_difference('Evaluation.count') do
      post :create, evaluation: { description: @evaluation.description, eventdate: @evaluation.eventdate, question2_1: @evaluation.question2_1, question2_2: @evaluation.question2_2, question2_3: @evaluation.question2_3, question2_4: @evaluation.question2_4, question2_5: @evaluation.question2_5, question2_6: @evaluation.question2_6, question2_6: @evaluation.question2_6, question2_7: @evaluation.question2_7, question3_1: @evaluation.question3_1, question3_2: @evaluation.question3_2, question3_3: @evaluation.question3_3, question4: @evaluation.question4, question5: @evaluation.question5, question6: @evaluation.question6, referral: @evaluation.referral, title: @evaluation.title }
    end

    assert_redirected_to evaluation_path(assigns(:evaluation))
  end

  test "should show evaluation" do
    get :show, id: @evaluation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @evaluation
    assert_response :success
  end

  test "should update evaluation" do
    patch :update, id: @evaluation, evaluation: { description: @evaluation.description, eventdate: @evaluation.eventdate, question2_1: @evaluation.question2_1, question2_2: @evaluation.question2_2, question2_3: @evaluation.question2_3, question2_4: @evaluation.question2_4, question2_5: @evaluation.question2_5, question2_6: @evaluation.question2_6, question2_6: @evaluation.question2_6, question2_7: @evaluation.question2_7, question3_1: @evaluation.question3_1, question3_2: @evaluation.question3_2, question3_3: @evaluation.question3_3, question4: @evaluation.question4, question5: @evaluation.question5, question6: @evaluation.question6, referral: @evaluation.referral, title: @evaluation.title }
    assert_redirected_to evaluation_path(assigns(:evaluation))
  end

  test "should destroy evaluation" do
    assert_difference('Evaluation.count', -1) do
      delete :destroy, id: @evaluation
    end

    assert_redirected_to evaluations_path
  end
end
