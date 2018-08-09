class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  layout "blog"
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]}, site_admin: :all

  # GET /blogs
  # GET /blogs.json
  def index
    if logged_in?(:site_admin)
      @blogs = Blog.recent.page(params[:page]).per(5)

    else
      @blogs = Blog.published.recent.page(params[:page]).per(5)

    end
    @page_title = "Dan | My Blog"
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    if logged_in?(:site_admin) || @blog.published?
      @blog = Blog.includes(:comments).friendly.find(params[:id])
      @comment = Comment.new
      @blog = Blog.friendly.find(params[:id])
      @page_title = @blog.title
    else
      redirect_to blog_path, notice: "Unauthorized"
    end
  end

  # GET /blogs/new
  def new

    @blog = Blog.new

  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    # byebug 
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: "Blog created, lala sasa #{undo_link}" }

      else
        format.html { render :new }  
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)

         #flash[:success] = "Post was updated! #{make_undo_link}"
        # redirect_to blog_path(@blog)


        # undo_link = view_context.link_to("undo", revert_version_path(@product.versions.last), :method => :post)

        format.html { redirect_to @blog, notice: "Post was updated! #{undo_link}" }

        # format.html { redirect_to @blog, notice: 'Blog updated pewa mbili ' }
        
      else
        format.html { render :edit }
        
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed. #{undo_link}"}
      format.json { head :no_content }
    end
  end

  def toggle_status
    if @blog.published? 
     @blog.draft!
   elsif @blog.draft? 
     @blog.published!
   end

   redirect_to blogs_url


 end


 
 # papertrail


  def history
    @blog = Blog.find(params[:id])
    @versions = @blog.try(:versions).order(created_at: :desc) unless
    @blog.blank? || @blog.versions.blank?
  end



def undo
  @blog_version = PaperTrail::Version.find_by_id(params[:id])

  begin
    if @blog_version.reify
      @blog_version.reify.save
    else
        # For undoing the create action
        @blog_version.item.destroy
      end
      flash[:success] = "Undid that!"
    rescue
      flash[:alert] = "Failed undoing the action..."
    ensure
      redirect_to root_path
    end
  end


  private

  def undo_link
    view_context.link_to("undo", revert_version_path(@blog.versions.last), method: :post)
  end

  def make_undo_link
    view_context.link_to 'Undo that plz!', undo_path(@blog.versions.last), method: :post
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def blog_params
    params.require(:blog).permit(:title, :body, :topic_id, :status)
  end
end
