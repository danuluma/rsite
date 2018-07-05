class PortfoliosController < ApplicationController
  def index
      @portfolio_items = Portfolio.all
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
      if @portfolio_item.update()
        format.html { redirect_to portfolios_path, notice: 'Portfolio created, lala sasa' }
        
      else
        format.html { render :new }
        
      end
    end
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
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

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle, 
                                      :body, 
                                      technologies_attributes: [:name])
  end
end
