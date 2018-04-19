module ErrorHandling

  def handle_errors
    message = "Could not save: "
    self.errors.full_messages.each_with_index do |msg, i|
      message += "\n #{i + 1}. #{msg}"
    end
    message += "\n Try Again!"
  end

end
