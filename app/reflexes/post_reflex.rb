# frozen_string_literal: true

class PostReflex < ApplicationReflex
  before_reflex :build_post, only: %w(update)


  def update
    @post.update(permitted_params)

    # We dont need to refresh the page as its just form data being sent by a single user
    morph :nothing
  end

  protected

  def permitted_params
    params.require(:post).permit!
  end

  def build_post
    @post ||= Post.find(params.require(:id))
  end
end
