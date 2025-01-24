class PerformanceController < ApplicationController

  def index
  end

  def start
    # 正しく答えた色の組み合わせを保管する配列を初期化
    session[:correct_answered_colors] = []
    # ユーザの試行回数を記録する配列を作成。0を成功回数、1を失敗回数とする。
    session[:user_attempts] = [0,0]
    redirect_to action: :index, status: :see_other
  end

  def tutorial

  end

  def success

  end

  def fail

  end

  def complete

  end

  def submit
    if params[:value].to_i == session[:current_answer]
      # 正しく答えたら色の組み合わせを追加する。毎回ソートして評価できるようにする。
      session[:correct_answered_colors].push(params[:value].to_i)
      session[:correct_answered_colors] = session[:correct_answered_colors].sort
      # 値をリセットする
      session[:current_answer] = 0
      Rails.logger.debug "Session current correct_answered_colors: #{session[:correct_answered_colors]}"
      session[:user_attempts][0] += 1
      redirect_to action: :success
    else
      session[:current_answer] = 0
      session[:user_attempts][1] += 1
      redirect_to action: :fail
    end
  end

end
