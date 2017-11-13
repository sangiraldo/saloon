class Admin::DashboardsController < Admin::BaseController
  def index
    @users = User.count
  end

  def tags
    @tag_posts = Post.tag_counts
    @tag_products = Product.tag_counts
  end
end
