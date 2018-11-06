class ProductsController < ApplicationController
    def index
        @products = Product.all
        @categories = Category.all
        
    end

    def new
        @product = Product.new

      end
    
      def create
        @product = Product.new(product_params)
        if @product.save
          redirect_to products_path
        else
          render :new
        end
      end
    
      def edit
        @product = Product.find(params[:id])
      end
    
      def update 
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to products_path, notice: "El producto ha sido modificado"
        else
            render :edit
        end    
    end
    
    def destroy
      product = Product.find(params[:id])
      product.destroy
    
      redirect_to products_path, notice: "El producto fue eliminado"
    
    end
    
    
      protected
        def product_params
          params.require(:product).permit(:name, :price, category_ids:[])
        end
    end

