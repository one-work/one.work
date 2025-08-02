class HomeController < ApplicationController

  def index
    @posts = Markdown::Post.default_where(default_params).where(slug: 'README').where.not(layout: nil)
  end

  private
  def check_variant
    request.variant = :phone if request.user_agent =~ /iPad|iPhone|iPod|Android/
  end

end
