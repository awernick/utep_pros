require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { URL: @event.URL, allday: @event.allday, approved: @event.approved, archived: @event.archived, automatically_approve: @event.automatically_approve, comments: @event.comments, completed: @event.completed, created: @event.created, description: @event.description, discounts: @event.discounts, early_fee: @event.early_fee, early_fee_end: @event.early_fee_end, early_fee_type: @event.early_fee_type, email: @event.email, end: @event.end, end_registration: @event.end_registration, featured: @event.featured, form: @event.form, gallery_tags: @event.gallery_tags, icon: @event.icon, late_fee: @event.late_fee, late_fee_start: @event.late_fee_start, late_fee_type: @event.late_fee_type, location: @event.location, max_tickets: @event.max_tickets, max_tickets_amount: @event.max_tickets_amount, metadescription: @event.metadescription, metakeywords: @event.metakeywords, metaname: @event.metaname, name: @event.name, notify_me: @event.notify_me, notify_me_unsubscribe: @event.notify_me_unsubscribe, options: @event.options, overbooking: @event.overbooking, overbooking_amount: @event.overbooking_amount, owner: @event.owner, parent: @event.parent, payments: @event.payments, paypal_email: @event.paypal_email, phone: @event.phone, properties: @event.properties, published: @event.published, recurring: @event.recurring, registration: @event.registration, repeat_end: @event.repeat_end, repeat_interval: @event.repeat_interval, repeat_type: @event.repeat_type, show_registered: @event.show_registered, start: @event.start, start_registration: @event.start_registration, ticket_pdf: @event.ticket_pdf, ticket_pdf_layout: @event.ticket_pdf_layout, unsubscribe_date: @event.unsubscribe_date }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    patch :update, id: @event, event: { URL: @event.URL, allday: @event.allday, approved: @event.approved, archived: @event.archived, automatically_approve: @event.automatically_approve, comments: @event.comments, completed: @event.completed, created: @event.created, description: @event.description, discounts: @event.discounts, early_fee: @event.early_fee, early_fee_end: @event.early_fee_end, early_fee_type: @event.early_fee_type, email: @event.email, end: @event.end, end_registration: @event.end_registration, featured: @event.featured, form: @event.form, gallery_tags: @event.gallery_tags, icon: @event.icon, late_fee: @event.late_fee, late_fee_start: @event.late_fee_start, late_fee_type: @event.late_fee_type, location: @event.location, max_tickets: @event.max_tickets, max_tickets_amount: @event.max_tickets_amount, metadescription: @event.metadescription, metakeywords: @event.metakeywords, metaname: @event.metaname, name: @event.name, notify_me: @event.notify_me, notify_me_unsubscribe: @event.notify_me_unsubscribe, options: @event.options, overbooking: @event.overbooking, overbooking_amount: @event.overbooking_amount, owner: @event.owner, parent: @event.parent, payments: @event.payments, paypal_email: @event.paypal_email, phone: @event.phone, properties: @event.properties, published: @event.published, recurring: @event.recurring, registration: @event.registration, repeat_end: @event.repeat_end, repeat_interval: @event.repeat_interval, repeat_type: @event.repeat_type, show_registered: @event.show_registered, start: @event.start, start_registration: @event.start_registration, ticket_pdf: @event.ticket_pdf, ticket_pdf_layout: @event.ticket_pdf_layout, unsubscribe_date: @event.unsubscribe_date }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
