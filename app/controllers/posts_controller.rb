class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_ownership, only: [:edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @total = Post.all.count
    @notices = Post.where(notice: true).order("updated_at DESC")
    @posts = Post.order("created_at DESC").page params[:page]
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    p_search = params[:search]
    p_all = Post.order("updated_at DESC")
    @notices = Post.where(notice: true).order("updated_at DESC")
    p_id = []
    case p_search[:select]
    when "title"
      p_all.each do |p|
        if p.title.include? p_search[:query]
          p_id.push(p.id)
        end
      end
      @posts = Post.where(id: p_id).order("updated_at DESC").page params[:page]
    when "content"
      p_all.each do |p|
        if p.content.include? p_search[:query]
          p_id.push(p.id)
        end
      end
      @posts = Post.where(id: p_id).order("updated_at DESC").page params[:page]
    when "writer"
      p_all.each do |p|
        if p.user.name.include? p_search[:query]
          p_id.push(p.id)
        end
      end
      #히히히히히히히히히히ㅣ히히히히히히히히히히히히히히히히히히ㅣ히히히히히히힣
      post_array = Post.find(p_id)
      @posts = Post.where(id: post_array.map(&:id)).order("updated_at DESC").page params[:page]
    else
      @posts = Post.none
    end
    @total = @posts.count
    render 'index'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :user, :notice)
    end

    def check_ownership
      @post = Post.find(params[:id])
      redirect_to :back if @post.user.id != current_user.id
    end

      
end
