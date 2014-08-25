class ExpensesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if current_user
      render json: current_user.expenses
    else
      render json: []
    end
  end
  def create
    expense = current_user.expenses.create! params[:expense].permit(:expense_dt, :amount, :description, :comment, :user_id)
    render json: expense
  end

  def update
    expense = current_user.expenses.find(params[:id])
    expense.update_attributes! params[:expense].permit(:expense_dt, :amount, :description, :comment, :user_id)
    render json: expense
  end

  def destroy
    expense = current_user.expenses.find(params[:id])
    expense.destroy
    render json: expense
  end
end
