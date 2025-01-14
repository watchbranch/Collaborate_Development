module PerformanceHelper
    def random_sound_id
      rand(1..9)
    end

    def get_ramdom_audio_file
        ramdom_number = random_sound_id
        str = ramdom_number.to_s
        session[:current_answer] = ramdom_number
        Rails.logger.debug "Session current_answer: #{session[:current_answer]}"
        return str + ".mp3"
    end

end
