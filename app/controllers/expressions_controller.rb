class ExpressionsController < ApplicationController

  def index

  end

  def show
    @expression = Expression.find_by_permalink(params[:id])
  end

  def create
    @expression = Expression.new(params[:expression])
    if @expression.save
      redirect_to permalink_path(@expression)
    else
      redirect_to expressions_path
    end
  end
end
