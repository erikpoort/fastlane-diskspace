require 'fastlane/action'
require_relative '../helper/diskspace_helper'

module Fastlane
  module Actions
    class DiskspaceAction < Action
      def self.run(params)
	diskspace = `df -ht /`.split(/\b/)[28].to_f
	
        puts "Diskspace available: #{diskspace}"
	if diskspace > 5
		puts "Carry on, more than 5 gb left"
	else
		puts "Clean up"
	end

      end

      def self.description
        "Sends the available disk size to slack"
      end

      def self.authors
        ["Erik Poort"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "In order to know how much size there still is, send a notification to slack below 1 GB"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "DISKSPACE_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
