class PerformanceController < ApplicationController

  def index
  end

  def success

  end

  def fail

  end

  def submit
    if params[:value].to_i == session[:current_answer]
      # 値をリセットする
      session[:current_answer] = 0
      redirect_to action: :success
    else
      session[:current_answer] = 0
      redirect_to action: :fail
    end
  end

end
