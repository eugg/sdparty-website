class ArticlesController < ApplicationController
  before_action :set_article, except: [:index, :new, :presses, :activities, :issues]

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

  def presses
    unless params[:i].blank?
      @issue = Issue.find(params[:i])
      @issue = nil unless @issue
    end
    if @issue
      @articles = @issue.articles.presses.page params[:page]
    else
      @articles = Article.presses.page params[:page]
    end
    @issues = Article.presses.get_issues
  end

  def activities
    unless params[:i].blank?
      @issue = Issue.find(params[:i])
      @issue = nil unless @issue
    end
    if @issue
      @articles = @issue.articles.activities.page params[:page]
    else
      @articles = Article.activities.page params[:page]
    end
    @issues = Article.activities.get_issues
  end

  def issues
    unless params[:i].blank?
      @issue = Issue.find(params[:i])
      @issue = nil unless @issue
    end
    if @issue
      @articles = @issue.articles.issues.page params[:page]
    else
      @articles = Article.issues.page params[:page]
    end
    @issues = Article.issues.get_issues
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = params[:id] ? Article.find(params[:id]) : Article.new(article_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:user_id, :published, :published_at, 
      :iind, :image, :title, :content, :youtube_url)
  end

  def get_issues(articles)
    issues = []
    articles.to_a.map do |a|
      a.issues.each do |k|
        issues << k unless issues.include? k
      end
    end
    return issues
  end
end
