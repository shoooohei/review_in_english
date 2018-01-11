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
end
