class CategoriesController < ApplicationController
    before_action :require_login, only: [:index, :show, :new, :edit, :create, :update, :destroy]
    before_action :check_authorization, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    before_action :set_category, only: [:show, :edit, :update, :delete, :destroy]
    before_action :all_categories, only: [:index, :create, :update, :delete, :destroy]
    respond_to :html, :js
    #override default layout by the fixed bootstrap
    layout "fixed"

    # GET /categories
    # GET /categories.json
    def index
    end

    # GET /categories/new
    def new
        @category = Category.new
    end

    # GET /categories/1/edit
    def edit
    end

    # POST /categories
    # POST /categories.json
    def create
        @category = Category.new(category_params)
        @category.save
    end

    # PATCH/PUT /categories/1
    # PATCH/PUT /categories/1.json
    def update
        @category.update(category_params)
    end

    # DELETE /categories/1
    # DELETE /categories/1.json
    def destroy
        @category.destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
        @category = Category.find(params[:id])
    end

    def all_categories
        @categories = Category.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
        params.require(:category).permit(:name, :description)
    end
end
