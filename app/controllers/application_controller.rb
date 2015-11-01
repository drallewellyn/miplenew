class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
before_filter :the_latest

  private

  def the_latest
    @posts = Post.all.limit(8).order("created_at desc")
  end


end
