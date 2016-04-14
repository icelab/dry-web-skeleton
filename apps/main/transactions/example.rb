require "main/transactions"

Main::Transactions.define do |t|
  # Define your dry-transaction objects here:
  #
  # t.define "main.transactions.users.sign_up" do
  #   step :persist, with: "main.users.operations.sign_up"
  # end
end
