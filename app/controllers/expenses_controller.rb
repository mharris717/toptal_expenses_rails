class ExpensesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    render json: Expense.all
  end
  def create
    puts params.inspect
    expense = Expense.create! params[:expense].permit(:expense_dt, :amount, :description, :comment, :user_id)
    render json: expense
  end
end
