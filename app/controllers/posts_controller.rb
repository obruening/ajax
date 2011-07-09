class PostsController < ApplicationController
  # /// 1
  def index
    @posts = Post.all

    respond_to do |format|
      format.json { render :json => @posts }
      format.html # index.html.erb
    end
  end

  # /// 2
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        # /// 3
        format.json { render :json => @post}
      else
        format.html { render :action => "new" }
        # /// 4
        format.json { render :json => @post.errors.to_a, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        # /// 5
        format.json { render :json => @post}
      else
        format.html { render :action => "edit" }
        format.json { render :json => @post.errors.to_a, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      # /// 6
      format.json { render :json => 'ok'.to_json }
    end
  end
end
