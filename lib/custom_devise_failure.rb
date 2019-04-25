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
      flash[:error] = 'You are not Kevin!'
    end
  end
end
