class LoansController < ApplicationController
  def new
    @loans = Loan.all
  end
end
