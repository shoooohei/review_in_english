module UserIconsHelper
  def choose_new_or_edit_for_icon
    if current_user.user_icon.present?
      edit_user_icon_path(current_user.id)
    else
      new_user_icon_path
    end
  end
end
