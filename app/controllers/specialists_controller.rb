class SpecialistsController < ApplicationController
  before_action :set_specialist, only: %i[ show edit update destroy ]

  # GET /specialists or /specialists.json
  def index
    @specialists = Specialist.all
  end

  # GET /specialists/1 or /specialists/1.json
  def show
    @order_lists = @specialists.find(params[:id]).order_lists
  end

  # GET /specialists/new
  def new
    @specialist = Specialist.new
  end

  # GET /specialists/1/edit
  def edit
  end

  # POST /specialists or /specialists.json
  def create
    @specialist = Specialist.new(specialist_params)

    respond_to do |format|
      if @specialist.save
        format.html { redirect_to specialist_url(@specialist), notice: "Specialist was successfully created." }
        format.json { render :show, status: :created, location: @specialist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @specialist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specialists/1 or /specialists/1.json
  def update
    respond_to do |format|
      if @specialist.update(specialist_params)
        format.html { redirect_to specialist_url(@specialist), notice: "Specialist was successfully updated." }
        format.json { render :show, status: :ok, location: @specialist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @specialist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specialists/1 or /specialists/1.json
  def destroy
    @specialist.destroy

    respond_to do |format|
      format.html { redirect_to specialists_url, notice: "Specialist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specialist
      @specialist = Specialist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def specialist_params
      params.require(:specialist).permit(:name)
    end
end
