class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :expense_dt, :amount, :description, :comment, :user_id
end
