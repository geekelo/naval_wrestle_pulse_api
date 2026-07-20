  class Api::V1::RegistrationController < ApplicationController
    def create
      user_role_id = User.find_by(name: params[:user][:role])&.id unless params[:user][:role].blank?

      if email_already_exists?
        render json: { error: "Email is already registered with us" }, status: :unprocessable_entity
      else
        user = User.new(user_params)

        if user.save
          render json: { message: "User created successfully" }, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end
    end

    private

    def user_params
      params.require(:user).permit(
        :name,
        :email,
        :password,
        :password_confirmation,
        :role
      )
    end

    def email_already_exists?
      existing_user = User.find_by(email: params[:user][:email])
    end
  end
