class PerformanceController < ApplicationController

  def index
  end

  def start
    # 正しく答えた色の組み合わせを保管する配列を初期化
    session[:correct_answered_colors] = []
    redirect_to action: :index, status: :see_other
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
