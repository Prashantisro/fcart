class ProductsController < ApplicationController
    before_action :find_product, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!,except:[:index]

    def index
      @products = Product.all.order(created_at: :desc)
      
      #@posts = Post.description
    end
    
    def new 
      @product = Product.new
    end
    
    def create
      @product = Product.new(product_params)

      if @product.save
        redirect_to products_path 
      else
        render "new"
      end
    end

    def show
      @product = Product.find(params[:id])
    end

    def find_product
      @product = Product.find(params[:id])
    end

    def edit
      @product = Product.find(params[:id])
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to products_path
    end

    def update
      @product = Product.find(params[:id])  
      if @product.update(product_params)
        redirect_to products_path
      else
        render 'edit'
      end
    end

   private
    def product_params
      params.require(:product).permit(:name, :price, :description, :photo)
    end
end
