class MiniTypesController < ApplicationController
  before_action :set_mini_type, only: %i[ show edit update destroy ]

  # GET /mini_types or /mini_types.json
  def index
    @mini_types = MiniType.all
  end

  # GET /mini_types/1 or /mini_types/1.json
  def show
  end

  # GET /mini_types/new
  def new
    @mini_type = MiniType.new
  end

  # GET /mini_types/1/edit
  def edit
  end

  # POST /mini_types or /mini_types.json
  def create
    @mini_type = MiniType.new(mini_type_params)

    respond_to do |format|
      if @mini_type.save
        format.html { redirect_to mini_type_url(@mini_type), notice: "Mini type foi criado com sucesso." }
        format.json { render :show, status: :created, location: @mini_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mini_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mini_types/1 or /mini_types/1.json
  def update
    respond_to do |format|
      if @mini_type.update(mini_type_params)
        format.html { redirect_to mini_type_url(@mini_type), notice: "Mini type foi atualizado com sucesso" }
        format.json { render :show, status: :ok, location: @mini_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mini_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mini_types/1 or /mini_types/1.json
  def destroy
    @mini_type.destroy

    respond_to do |format|
      format.html { redirect_to mini_types_url, notice: "Mini tipos excluido com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mini_type
      @mini_type = MiniType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mini_type_params
      params.require(:mini_type).permit(:name, :acromyn)
    end
end
