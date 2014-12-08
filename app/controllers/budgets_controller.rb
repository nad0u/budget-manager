class BudgetsController < ApplicationController
    before_action :require_login, only: [:index, :show, :new, :edit, :create, :update, :delete, :destroy]
    before_action :set_budget, only: [:show, :edit, :update, :delete, :destroy]
    before_action :all_budgets, only: [:index, :create, :update, :delete, :destroy]
    respond_to :html, :js
    #override default layout by the fixed bootstrap
    layout "fixed"

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

        # respond_to do |format|
        #     if @budget.save
        #         format.html { redirect_to @budget, notice: 'Budget was successfully created.' }
        #         format.json { render :show, status: :created, location: @budget }
        #     else
        #         format.html { render :new }
        #         format.json { render json: @budget.errors, status: :unprocessable_entity }
        #     end
        # end
    end

    # PATCH/PUT /budgets/1
    # PATCH/PUT /budgets/1.json
    def update
        @categories = Category.all
        @budget.update(budget_params)

        # respond_to do |format|
        #     if @budget.update(budget_params)
        #         format.html { redirect_to @budget, notice: 'Budget was successfully updated.' }
        #         format.json { render :show, status: :ok, location: @budget }
        #     else
        #         format.html { render :edit }
        #         format.json { render json: @budget.errors, status: :unprocessable_entity }
        #     end
        # end
    end

    def delete
    end

    # DELETE /budgets/1
    # DELETE /budgets/1.json
    def destroy
        @budget.destroy
        # respond_to do |format|
        #     format.html { redirect_to budgets_url, notice: 'Budget was successfully destroyed.' }
        #     format.json { head :no_content }
        # end
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
                #flash[:error] = "You don't have access to this section."
                redirect_to(root_url)
            end
        end
end
