class PortfoliosController < ApplicationController
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all

  layout "portfolio"
  def index
      @portfolio_items = Portfolio.order("position ASC")
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end
    render nothing: true
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
    
  end

  def new
    @portfolio_item = Portfolio.new
    3.times {@portfolio_item.technologies.build}

  end


  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save()
        format.html { redirect_to portfolios_path, notice: 'Portfolio created, lala sasa' }
        
      else
        format.html { render :new }
        
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])

  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio updated, lala sasa' }
        
      else
        format.html { render :edit }
        
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    # perfom lookup
    @portfolio_item = Portfolio.find(params[:id])

    #perfom deletion
    @portfolio_item.destroy

    #redirect to portfolio
    respond_to do |format|
      format.html { redirect_to portfolio_url, notice: 'ITEM was successfully destroyed.' }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle, 
                                      :body,
                                      :thumb_image,
                                      :main_image, 
                                      technologies_attributes: [:name])
  end

  def set_portfolio_items
    @portfolio_item = Portfolio.find(params[:id])
  end
end
