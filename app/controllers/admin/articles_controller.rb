class Admin::ArticlesController < Admin::BaseController
  before_action :set_article, except: [:index, :new]

  # GET /articles
  def index
    @q = Article.search(params[:q])
    @articles = @q.result(distinct: true).page(params[:page])
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
        redirect_to admin_article_url(@article), notice: '文章建立成功'
    else
      render :new
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      redirect_to admin_article_url(@article), notice: '文章更新成功'
    else
      render :edit
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    redirect_to admin_articles_url, notice: '文章已刪除'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = params[:id] ? Article.find(params[:id]) : Article.new(article_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:user_id, :published, {:issue_ids => []},
      :published_at, :kind, :image, :title, :content, :youtube_url)
  end
end
