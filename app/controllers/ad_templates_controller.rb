class AdTemplatesController < ApplicationController
  before_action :set_ad_template, only: [:show, :edit, :update, :destroy]

  # GET /ad_templates
  # GET /ad_templates.json
  def index
    @ad_templates = AdTemplate.all
  end

  # GET /ad_templates/1
  # GET /ad_templates/1.json
  def show
  end

  # GET /ad_templates/new
  def new
    @ad_template = AdTemplate.new
  end

  # GET /ad_templates/1/edit
  def edit
  end

  # POST /ad_templates
  # POST /ad_templates.json
  def create
    @ad_template = AdTemplate.new(ad_template_params)

    respond_to do |format|
      if @ad_template.save
        format.html { redirect_to @ad_template, notice: 'Ad template was successfully created.' }
        format.json { render :show, status: :created, location: @ad_template }
      else
        format.html { render :new }
        format.json { render json: @ad_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ad_templates/1
  # PATCH/PUT /ad_templates/1.json
  def update
    respond_to do |format|
      if @ad_template.update(ad_template_params)
        format.html { redirect_to @ad_template, notice: 'Ad template was successfully updated.' }
        format.json { render :show, status: :ok, location: @ad_template }
      else
        format.html { render :edit }
        format.json { render json: @ad_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ad_templates/1
  # DELETE /ad_templates/1.json
  def destroy
    @ad_template.destroy
    respond_to do |format|
      format.html { redirect_to ad_templates_url, notice: 'Ad template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad_template
      @ad_template = AdTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_template_params
      params.require(:ad_template).permit(:name, :column_count, :grid_width, :grid_height)
    end
end
