class SectionTemplatesController < ApplicationController
  before_action :set_section_template, only: [:show, :edit, :update, :destroy]

  # GET /section_templates
  # GET /section_templates.json
  def index
    @section_templates = SectionTemplate.all
  end

  # GET /section_templates/1
  # GET /section_templates/1.json
  def show
  end

  # GET /section_templates/new
  def new
    @section_template = SectionTemplate.new
  end

  # GET /section_templates/1/edit
  def edit
  end

  # POST /section_templates
  # POST /section_templates.json
  def create
    @section_template = SectionTemplate.new(section_template_params)

    respond_to do |format|
      if @section_template.save
        format.html { redirect_to @section_template, notice: 'Section template was successfully created.' }
        format.json { render :show, status: :created, location: @section_template }
      else
        format.html { render :new }
        format.json { render json: @section_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /section_templates/1
  # PATCH/PUT /section_templates/1.json
  def update
    respond_to do |format|
      if @section_template.update(section_template_params)
        format.html { redirect_to @section_template, notice: 'Section template was successfully updated.' }
        format.json { render :show, status: :ok, location: @section_template }
      else
        format.html { render :edit }
        format.json { render json: @section_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /section_templates/1
  # DELETE /section_templates/1.json
  def destroy
    @section_template.destroy
    respond_to do |format|
      format.html { redirect_to section_templates_url, notice: 'Section template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section_template
      @section_template = SectionTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_template_params
      params.require(:section_template).permit(:grid_base, :grid_key, :has_heading, :box_data)
    end
end
