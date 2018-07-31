class PostsController < ApplicationController
    before_action :current_user, only: [:create, :destroy]
    before_action :current_user, only: :destroy
    
    def new 
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id # assign the post to the user who created it.
        respond_to do |f|
            if (@post.save) 
                f.html { redirect_to "", notice: "Post created!" }
            else
                f.html { redirect_to "", notice: "Error: Post Not Saved." }
            end
        end
    end
    
    def destroy
        @post.destroy
        @post.user_id = current_user.id
        flash[:success] = "Post deleted"
        redirect_to request.referrer || root_url
    
    end
    
    private
    def post_params # allows certain data to be passed via form.
        params.require(:post).permit(:user_id, :image, :content, :destroy)
        
    end
    def image 
    end
    
end
