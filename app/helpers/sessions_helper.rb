module SessionsHelper
  
  #引数に渡されたユーザーでログインする
  def log_in(user)
    session[:user_id]=user.id
  end
  
  #現在ログイン中のユーザーを返す（ただし、いる場合のみ）
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end  
  end
  
  #ユーザーがログインしていればtrue, そのほかならfalseを返す
  def logged_in?
    !current_user.nil?
  end
  
  #現在のユーザーをログアウトする
  def log_out
    session.delete(:user_id)
    @current_user= nil
  end
end
