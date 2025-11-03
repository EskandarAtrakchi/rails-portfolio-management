class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /portfolios 
  def index
    # Get all portfolios belonging to the current user
    @portfolios = current_user.portfolios
  end

  # GET /portfolios/1
  def show
  end

  # GET /portfolios/new
  def new
    # Initialize a new portfolio for the current user
    @portfolio = current_user.portfolios.build
  end

  # GET /portfolios/1/edit
  def edit
  end

  # POST /portfolios
  def create
    @portfolio = current_user.portfolios.build(portfolio_params)

    if @portfolio.save
      redirect_to @portfolio, notice: "Portfolio was successfully created."
    else
      flash.now[:alert] = "Please correct the errors below."
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /portfolios/1
  def update
    if @portfolio.update(portfolio_params)
      redirect_to @portfolio, notice: "Portfolio was successfully updated."
    else
      flash.now[:alert] = "Please correct the errors below."
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /portfolios/1
  def destroy
    @portfolio.destroy!
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: "Portfolio was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    def portfolio_params
      params.require(:portfolio).permit(:asset_name, :symbol, :quantity, :price, :notes)
    end
end
