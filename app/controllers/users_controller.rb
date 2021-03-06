class UsersController < ApplicationController
    before_action :require_login, only: [:index, :show, :edit, :update, :destroy]
    before_action :check_authorization, only: [:index]
    before_action :set_user, only: [:show, :edit, :update, :delete, :destroy]
    before_action :all_users, only: [:index, :create, :update, :delete, :destroy]
    respond_to :html, :js
    #override default layout by the fixed bootstrap
    layout "fixed"

    # GET /users
    # GET /users.json
    def index
    end

    # GET /users/1
    # GET /users/1.json
    def show
        check_user
    end

    # GET /users/new
    def new
        @user = User.new
    end

    # GET /users/1/edit
    def edit
        if !admin?
            check_user
        end
    end

    # POST /users
    # POST /users.json
    def create
        @user = User.new(user_params)

        if @user.save
            if current_user.nil?
                flash[:notice] = 'Your account was successfully created. You can now login.'
                redirect_to log_in_path
            end
        end
    end

    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
        @user.update(user_params)
    end

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
        @user.destroy
    end

    def delete
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
            @user = User.find(params[:id])
        end

        def all_users
            @users = User.all
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def user_params
            params.require(:user).permit(:username, :email, :password, :password_confirmation, :is_admin, :is_active)
        end

        def account_settings
            @user = current_user
        end

        def check_user
            if current_user != @user
                redirect_to(root_url)
            end
        end
end
