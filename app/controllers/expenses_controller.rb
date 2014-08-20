class ExpensesController < ApplicationController
  before_filter do
    puts params.inspect
    puts headers.inspect

    puts "Auth Header: #{request.authorization.to_s}"

    true
  end
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
end
