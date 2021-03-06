class EventsController < ApplicationController
  before_action :set_event, only: [ :show, :edit, :update, :destroy ]
  before_action :event_planner_user, only: [ :new, :edit ]
  before_action :event_owner_user, only: [ :edit ]

  # GET /events
  # GET /events.json
  def index
    @events = Event.paginate(page: params[:page], per_page: 10).order('starttime DESC')
    respond_to do |format|
      format.html
      format.json
      format.js # add this line for your js template
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        @event.create_activity :create, owner: current_user
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.user_ids.each do |user_id|
      @event.create_activity :cancel, owner: User.find_by_id(@event.owner), recipient: User.find_by_id(user_id)
    end
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def event_planner_user
      redirect_to(dashboard_index_path) unless current_user.event_planner?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through. Added the all_tags parameter
    def event_params
      params.require(:event).permit(:parent, :name, :createdtime, :starttime, :endtime, :description, :location, :URL, :email, :phone, :metaname, :metakeywords, :metadescription, :recurring, :registration, :comments, :icon, :repeat_interval, :repeat_type, :repeat_end, :repeat_also, :start_registration, :end_registration, :unsubscribe_date, :payments, :max_tickets, :max_tickets_amount, :notify_me, :notify_me_unsubscribe, :overbooking, :overbooking_amount, :show_registered, :automatically_approve, :paypal_email, :discounts, :form, :early_fee, :early_fee_type, :early_fee_end, :late_fee, :late_fee_type, :late_fee_start, :options, :archived, :published, :completed, :approved, :ticket_pdf, :ticket_pdf_layout, :properties, :gallery_tags, :allday, :featured, owner_ids: [])
    end

end
