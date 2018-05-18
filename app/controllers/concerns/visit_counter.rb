module VisitCounter

  private

    def increment_counter
      if session[:counter].nil?
        reset_counter
      end
      session[:counter] += 1
    end

    def reset_counter
      session[:counter] = 0
    end

end
