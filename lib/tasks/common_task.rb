module CommonTask
  def load_rails_environment
    raise 'No config/environment.rb found' unless File.exist?(File.expand_path('config/environment.rb'))

    begin
      require File.expand_path('config/environment.rb')
    rescue StandardError => e
      puts("Failed to initialise ActiveRecord : #{e.message}\n#{e.backtrace}")

      raise "Failed to initialise ActiveRecord : #{e.message}"
    end
  end
end