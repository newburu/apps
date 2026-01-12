class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    handle_auth "Google"
  end

  def twitter2
    handle_auth "X (Twitter)"
  end

  def failure
    error_type = request.env["omniauth.error.type"]
    error_msg = request.env["omniauth.error"]&.message
    redirect_to root_path, alert: "認証に失敗しました: #{error_type} / #{error_msg}"
  end

  private

  def handle_auth(kind)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: kind
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.#{kind.downcase}_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to root_path, alert: "ログインできませんでした: " + @user.errors.full_messages.join("\n")
    end
  end
end
