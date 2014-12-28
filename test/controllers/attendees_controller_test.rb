require 'test_helper'

class AttendeesControllerTest < ActionController::TestCase
  setup do
    @attendee = attendees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attendees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attendee" do
    assert_difference('Attendee.count') do
      post :create, attendee: { SubmissionId: @attendee.SubmissionId, URL: @attendee.URL, coupon: @attendee.coupon, date: @attendee.date, discount: @attendee.discount, early_fee: @attendee.early_fee, email: @attendee.email, gateway: @attendee.gateway, ide: @attendee.ide, ideal: @attendee.ideal, idu: @attendee.idu, ip: @attendee.ip, lang: @attendee.lang, late_fee: @attendee.late_fee, log: @attendee.log, name: @attendee.name, params: @attendee.params, state: @attendee.state, tax: @attendee.tax, verification: @attendee.verification }
    end

    assert_redirected_to attendee_path(assigns(:attendee))
  end

  test "should show attendee" do
    get :show, id: @attendee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attendee
    assert_response :success
  end

  test "should update attendee" do
    patch :update, id: @attendee, attendee: { SubmissionId: @attendee.SubmissionId, URL: @attendee.URL, coupon: @attendee.coupon, date: @attendee.date, discount: @attendee.discount, early_fee: @attendee.early_fee, email: @attendee.email, gateway: @attendee.gateway, ide: @attendee.ide, ideal: @attendee.ideal, idu: @attendee.idu, ip: @attendee.ip, lang: @attendee.lang, late_fee: @attendee.late_fee, log: @attendee.log, name: @attendee.name, params: @attendee.params, state: @attendee.state, tax: @attendee.tax, verification: @attendee.verification }
    assert_redirected_to attendee_path(assigns(:attendee))
  end

  test "should destroy attendee" do
    assert_difference('Attendee.count', -1) do
      delete :destroy, id: @attendee
    end

    assert_redirected_to attendees_path
  end
end
