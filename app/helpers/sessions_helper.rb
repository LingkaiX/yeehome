module SessionsHelper   
    # 登入指定的用户
    def log_in(user)
        session[:user_id] = user.id
    end

    # 返回当前登录的用户（如果有的话）
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    # 如果用户已登录，返回 true，否则返回 false
    def logged_in?
        !current_user.nil?
    end
    # 用来验证登陆
    def logged_in_user
        unless logged_in?
            store_location
            flash[:danger] = "Please log in."
            redirect_to login_url
        end
    end
    # 用来验证是否是admin
    def admin_user
        unless current_user.admin?
            flash[:danger] = "You must be admin."
            redirect_to(root_url)
        end
    end
    # 用来验证是否是admin 或当前用户
    def admin_or_current_user
        unless current_user.admin? || current_user?(@user)
            flash[:danger] = "That is not yours."
            redirect_to(root_url)
        end
    end
    # 退出当前用户
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

    # 如果指定用户是当前用户，返回 true
    def current_user?(user)
        user == current_user
    end

    # 重定向到存储的地址或者默认地址
    def redirect_back_or(default)
        redirect_to(session[:forwarding_url] || default)
        session.delete(:forwarding_url)
    end

    # 存储后面需要使用的地址
    def store_location
        session[:forwarding_url] = request.original_url if request.get?
    end
end
