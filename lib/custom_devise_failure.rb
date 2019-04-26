class CustomDeviseFailure < Devise::FailureApp
  def redirect_url
    root_url
  end

  # You need to override respond to eliminate recall
  def respond
    if http_auth?
      http_auth
    else
      redirect
      flash.discard
      flash[:danger] = 'You are not signed in yet Kevin! 😱'
    end
  end
end
