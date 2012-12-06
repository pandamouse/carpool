class VehiclesController < ApplicationController

  def index
    @user = current_user
    @vehicles = @user.vehicles.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vehicles }
    end
  end

  def show
    @vehicle = current_user.vehicles.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vehicle }
    end
  end

  def new
    @vehicle = Vehicle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vehicle }
    end
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def create
    @user = current_user
    @vehicle = @user.vehicles.new(params[:vehicle])

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'vehicle was successfully created.' }
        format.json { render json: @vehicle, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    @user = current_user
    @vehicle = @user.vehicles.find(params[:id])

    respond_to do |format|
      if @vehicle.update_attributes(params[:vehicle])
        format.html { redirect_to @vehicle, notice: 'vehicle was successfully created.' }
        format.json { render json: @vehicle, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end

  end

  def retire
    @vehicle = Vehicle.find(params[:id])
    @vehicle.retire

    respond_to do |format|
      format.html { redirect_to user_vehicles_path current_user, notice: 'Your vehicle has been retired.' }
      format.json { head :ok }
    end
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy

    respond_to do |format|
      format.html { redirect_to user_vehicles_path current_user, notice: 'Your vehicle has been deleted.' }
      format.json { head :ok }
    end
  end
end
