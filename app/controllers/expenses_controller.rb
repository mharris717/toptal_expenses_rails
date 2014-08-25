class ExpensesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if current_user
      render json: current_user.expenses
    else
      render json: []
    end
  end
  def index_unauth
    render json: Expense.all
  end
  def create
    u = current_user#  || User.first
    expense = u.expenses.create! params[:expense].permit(:expense_dt, :amount, :description, :comment, :user_id)
    render json: expense
  end

  def update
    expense = Expense.find(params[:id])
    expense.update_attributes! params[:expense].permit(:expense_dt, :amount, :description, :comment, :user_id)
    render json: expense
  end
end
