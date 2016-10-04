class AssessmentSubtypesController < ApplicationController
  before_action :set_assessment_subtype, only: [:show, :edit, :update, :destroy]

  # GET /assessment_subtypes
  # GET /assessment_subtypes.json
  def index
    @assessment_subtypes = AssessmentSubtype.all
  end

  # GET /assessment_subtypes/1
  # GET /assessment_subtypes/1.json
  def show
  end

  # GET /assessment_subtypes/new
  def new
    @assessment_subtype = AssessmentSubtype.new
  end

  # GET /assessment_subtypes/1/edit
  def edit
  end

  # POST /assessment_subtypes
  # POST /assessment_subtypes.json
  def create
    @assessment_subtype = AssessmentSubtype.new(assessment_subtype_params)

    respond_to do |format|
      if @assessment_subtype.save
        format.html { redirect_to @assessment_subtype, notice: 'Assessment subtype was successfully created.' }
        format.json { render :show, status: :created, location: @assessment_subtype }
      else
        format.html { render :new }
        format.json { render json: @assessment_subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assessment_subtypes/1
  # PATCH/PUT /assessment_subtypes/1.json
  def update
    respond_to do |format|
      if @assessment_subtype.update(assessment_subtype_params)
        format.html { redirect_to @assessment_subtype, notice: 'Assessment subtype was successfully updated.' }
        format.json { render :show, status: :ok, location: @assessment_subtype }
      else
        format.html { render :edit }
        format.json { render json: @assessment_subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assessment_subtypes/1
  # DELETE /assessment_subtypes/1.json
  def destroy
    @assessment_subtype.destroy
    respond_to do |format|
      format.html { redirect_to assessment_subtypes_url, notice: 'Assessment subtype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assessment_subtype
      @assessment_subtype = AssessmentSubtype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assessment_subtype_params
      params.require(:assessment_subtype).permit(:name, :description)
    end
end
