class ExpensesController < ApplicationController
  def index
    render json: Expense.all
  end
end
