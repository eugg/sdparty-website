class ArticlesController < ApplicationController
  before_action :set_article, except: [:index, :new]

  # GET /articles
  def index
    @articles = Article.all.page params[:page]
  end

  # GET /articles/1
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    if @article.save
        redirect_to @article, notice: '關鍵字建立成功'
    else
      render :new
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      redirect_to @article, notice: '關鍵字更新成功'
    else
      render :edit
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    redirect_to articles_url, notice: '關鍵字已刪除'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = params[:id] ? Article.find(params[:id]) : Article.new(article_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:user_id, :category_id, :published, 
      :published_at, :kind, :image, :title, :content, :youtube_url)
  end
end
