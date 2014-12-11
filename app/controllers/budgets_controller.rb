class BudgetsController < ApplicationController
    before_action :require_login, only: [:index, :show, :new, :edit, :create, :update, :delete, :destroy]
    before_action :set_budget, only: [:show, :edit, :update, :delete, :destroy]
    before_action :all_budgets, only: [:index, :create, :update, :delete, :destroy, :test]
    respond_to :html, :js, :json
    #override default layout by the fixed bootstrap
    layout "fixed"

    # GET /load_chart/1
    def load_chart
        @cid = params[:cid]
    end

    # POST /up
    def update_chart
        @mydate = params[:date]
        @chart_type = params[:chart_type]
    end

    # GET /budgets
    # GET /budgets.json
    def index
    end

    # GET /budgets/1
    # GET /budgets/1.json
    def show
        check_user
    end

    # GET /budgets/new
    def new
        @budget = Budget.new
        @categories = Category.all
    end

    # GET /budgets/1/edit
    def edit
        check_user
        @categories = Category.all
    end

    # POST /budgets
    # POST /budgets.json
    def create
        @budget = Budget.new(budget_params)
        @budget.user_id = current_user.id
        @budget.save
    end

    # PATCH/PUT /budgets/1
    # PATCH/PUT /budgets/1.json
    def update
        @categories = Category.all
        @budget.update(budget_params)
    end

    def delete
    end

    # DELETE /budgets/1
    # DELETE /budgets/1.json
    def destroy
        @budget.destroy
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_budget
            @budget = Budget.find(params[:id])
        end

        def all_budgets
            @budgets = current_user.budgets
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def budget_params
            params.require(:budget).permit(:name, :description, :is_expense, :category_id, :amount, :date_of_budget)
        end

        #users can only see their own budget
        def check_user
            if current_user != @budget.user
                redirect_to(root_url)
            end
        end
end
