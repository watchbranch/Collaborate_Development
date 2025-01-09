module PerformanceHelper
    def random_sound_id
      rand(1..9)
    end

    def get_ramdom_audio_file
        ramdom_number = random_sound_id
        str = ramdom_number.to_s
        return str + ".mp3"
    end
end
  