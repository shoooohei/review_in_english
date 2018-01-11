module MoviesHelper
  #
  def choose_new_or_edit(own_review, movie)
    if own_review == nil
      new_review_path(movie.id)
    elsif own_review.present?
      edit_review_path(own_review.id)
    end
  end



  # def what_title
  #   if action_name == "index"
  #     "Movies"
  #   elsif action_name == "reviewed"
  #     "#{current_user.name}さんがレビューした作品"
  #   end
  # end


end
