class PerformanceController < ApplicationController

  def index
  end

  def success

  end

  def fail

  end

  def submit
    # 値の確認だけ必要。金曜日に合流させる予定。
    if params[:value] == session[:current_answer]
      # 値をリセットする
      session[:current_answer] = 0
      redirect_to action: :success
    else
      session[:current_answer] = 0
      redirect_to action: :fail
    end
  end

end
