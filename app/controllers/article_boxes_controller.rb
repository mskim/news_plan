class ArticleBoxesController < ApplicationController
  before_action :set_article_box, only: [:show, :edit, :update, :destroy]

  # GET /article_boxes
  # GET /article_boxes.json
  def index
    @article_boxes = ArticleBox.all
  end

  # GET /article_boxes/1
  # GET /article_boxes/1.json
  def show
  end

  # GET /article_boxes/new
  def new
    @article_box = ArticleBox.new
  end

  # GET /article_boxes/1/edit
  def edit
  end

  # POST /article_boxes
  # POST /article_boxes.json
  def create
    @article_box = ArticleBox.new(article_box_params)

    respond_to do |format|
      if @article_box.save
        format.html { redirect_to @article_box, notice: 'Article box was successfully created.' }
        format.json { render :show, status: :created, location: @article_box }
      else
        format.html { render :new }
        format.json { render json: @article_box.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /article_boxes/1
  # PATCH/PUT /article_boxes/1.json
  def update
    respond_to do |format|
      puts "article_box_params:#{article_box_params}"
      puts "article_box_params.class:#{article_box_params.class}"
      if @article_box.update(article_box_params)
        format.html { redirect_to @article_box, notice: 'Article box was successfully updated.' }
        format.json { render :show, status: :ok, location: @article_box }
      else
        format.html { render :edit }
        format.json { render json: @article_box.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /article_boxes/1
  # DELETE /article_boxes/1.json
  def destroy
    @article_box.destroy
    respond_to do |format|
      format.html { redirect_to article_boxes_url, notice: 'Article box was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article_box
      @article_box = ArticleBox.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_box_params
      params.require(:article_box).permit( :section_template_id, grid_frame: [])
    end
end
