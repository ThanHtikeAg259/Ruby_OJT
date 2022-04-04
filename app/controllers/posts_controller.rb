class PostsController < ApplicationController
  before_action :redirect_cancel, only: [:create, :update]
  before_action :authorize, only: [:index, :edit, :new, :create]

  def index
    @posts = Post.find_by_sql("SELECT u1.name AS c_name, u2.name AS u_name, p.* FROM posts p JOIN users u1 ON
       u1.id = p.create_user_id JOIN users u2 ON u2.id = p.updated_user_id;")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def confirm
    @post = Post.new(params.require(:post).permit(:title, :description))
    render :create
  end

  def create
    post = Post.new(params.require(:post).permit(:title, :description))
    post.status = 1
    post.create_user_id = session[:user_id]
    post.updated_user_id = session[:user_id]
    post.save
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
    $post_id = @post.id
  end

  def updateConfirm
    @post = Post.new(post_params)
    render :update
  end


  def update
    post = Post.find($post_id)
    post.updated_user_id = session[:user_id]
    post.update(post_params)
    flash[:notice] = "Post sucessfully edited."
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit(:title, :description, :status)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  def redirect_cancel
    redirect_to root_path if params[:cancel]
  end

  def search
    if params[:search].blank?
      redirect_to root_path and return
    else
      @parameter = params[:search].downcase
      result = Post.all.where("lower(title) OR lower(description) LIKE :search", search: "%#{@parameter}%")
      post_by_sql = Post.find_by_sql("SELECT users.name, posts.* FROM users INNER JOIN 
        posts ON posts.create_user_id = users.id where posts.status = 1")
        binding.break
        if result.title == post_by_sql.title
          redirect_to root_path
        end
      # render :index
    end
  end
  
end
