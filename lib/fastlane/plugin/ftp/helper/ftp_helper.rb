module Fastlane
  module Helper
    class FtpHelper
      # class methods that you define here become available in your action
      # as `Helper::FtpHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the ftp plugin helper!")
      end
    end
  end
end
