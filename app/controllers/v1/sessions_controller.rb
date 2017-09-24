class V1::SessionsController < ActionController::API
  
  def create

    command = AuthenticateUserByEmail.call(params[:email], params[:password], {kkk: "kkkk"}, 24.hours.from_now)

    if command.success?
      request.headers['Authorization'] = command.result
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end

  end

  def destroy

  end
end
