module ReviewsHelper
  # rateの星のクラスの名前の変更(クラスには小数点が使えないから)
  def rate_number(review)
    rate = review.rate
    rate_i = rate.to_i
    rate_f = rate - rate_i
    if rate_f == 0.0
      return rate_i
    else
      rate_f = (rate_f * 10).to_i
      return ("#{rate_i}" + "-" + "#{rate_f}")
    end
  end

  def make_arr(review, arg_js_review_id, arg_js_detail)
    movie = review.movie
    arg_js_review_id << review.id
    arg_js_detail["#{review.id}"] = {"movie_en_title" => "#{movie.en_title}",
                              "movie_id" => "#{movie.id}",
                              "movie_jp_title" => "#{movie.jp_title}",
                              "movie_image_url" => "#{movie.image_url}"
                            }
    return arg_js_review_id,arg_js_detail
  end

  def make_arg_for_js(reviews,page)
    arg_js_review_id = Array.new
    arg_js_detail = Hash.new
    if page == "timeline" || page == "reviewed_movies"
      reviews.each do |review|
        make_arr(review, arg_js_review_id, arg_js_detail)
      end
    elsif page == "review_show"
      make_arr(reviews, arg_js_review_id, arg_js_detail)
    end

    return arg_js_detail, arg_js_review_id
  end

end
