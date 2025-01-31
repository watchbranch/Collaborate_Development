module PerformanceHelper
  # 1～9の範囲から過去に正解した値を除外してランダムな値を返す
  def random_sound_id(excluded_answers = [])
    available_answers = (1..9).to_a - excluded_answers
    return nil if available_answers.empty? # すべて正解済みならnilを返す

    available_answers.sample
  end

  # ランダムな音声ファイルを取得する
  def get_random_audio_file
    excluded_answers = session[:correct_answered_colors] || []
    random_number = random_sound_id(excluded_answers)

    if random_number.nil?
      Rails.logger.debug "All sounds have been correctly answered."
      return nil # すべて正解済みならnilを返す
    end

    session[:current_answer] = random_number
    Rails.logger.debug "Session current_answer: #{session[:current_answer]}"
    return "#{random_number}.mp3"
  end

  def is_button_display(number)
    for var in session[:correct_answered_colors] do
      if var == number
        return false
      end
    end

    return true
  end

  def show_result()
    correct_ans = ((session[:user_attempts][0]).to_f / (session[:user_attempts][0] + session[:user_attempts][1]).to_f ).round(2) * 100
    Rails.logger.debug "Session current correct_answered_colors: #{correct_ans}"
    return correct_ans
  end
end
