module UsersHelper

  # ログイン中のユーザーであれば真を返す
  def current_user?(user)
    user == current_user
  end

end
