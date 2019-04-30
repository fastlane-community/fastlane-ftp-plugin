require 'net/ftp'
require 'ruby-progressbar'

module Fastlane
  module Actions
    class FtpAction < Action
      def self.run(params)
        
        if params[:upload]
          FtpAction.open(params, params[:upload][:dest])
          FtpAction.put(params)
        end

        if params[:download]
          FtpAction.get(params)
        end
      end

      def self.open(params, folder)
        ftp = Net::FTP.new
        ftp.connect(params[:host], params[:port])
        ftp.login(params[:username], params[:password])
        ftp.passive = true
        UI.success("Successfully Login to #{params[:host]}:#{params[:port]}")
        parts = folder.split("/")
        growing_path = ""
        parts.each do |part|
          growing_path += "/" + part
          begin
            ftp.chdir(growing_path)
          rescue
            ftp.mkdir(part) unless File.exist?(growing_path)
            retry
          end
        end
        ftp.close()
        UI.success("FTP move in #{growing_path} on #{params[:host]}:#{params[:port]}")
      end

      def self.put(params)
        ftp = Net::FTP.new
        progressbar = ProgressBar.create(:format => '%a |%b>>%i| %p%% %t', :starting_at => 0)
        ftp.connect(params[:host], params[:port])
        ftp.login(params[:username], params[:password])
        ftp.passive = true
        ftp.chdir(params[:upload][:dest])
        filesize = File.size(params[:upload][:src])      
        progressbar.total = filesize
        ftp.putbinaryfile(params[:upload][:src], params[:upload][:src].split("/").last) do |data|
          progressbar.progress += data.size
        end
        ftp.close()
        UI.success("Successfully uploaded #{params[:upload][:src]}")
      end

      def self.get(params)
        ftp = Net::FTP.new
        ftp.passive = true
        ftp.connect(params[:host], params[:port])
        ftp.login(params[:username], params[:password])
        UI.success("Successfully Login to #{params[:host]}:#{params[:port]}")
        ftp.getbinaryfile(params[:download][:src], params[:download][:dest]) do |data|
        end
        ftp.close()
        UI.success("Successfully download #{params[:download][:dest]}")
    end

    #####################################################
    # @!group Documentation
    #####################################################

    def self.description
      "Upload and Download files via FTP"
    end

    def self.details
      # Optional:
      # this is your chance to provide a more detailed description of this action
      "Transfer files via FTP, and create recursively folder for upload action"
    end

    def self.available_options
      [
        FastlaneCore::ConfigItem.new(key: :username,
        short_option: "-u",
        env_name: "FL_FTP_USERNAME",
        description: "Username",
        is_string: true),
        FastlaneCore::ConfigItem.new(key: :password,
        short_option: "-p",
        env_name: "FL_FTP_PASSWORD",
        description: "Password",
        optional: false,
        is_string: true),
        FastlaneCore::ConfigItem.new(key: :host,
        short_option: "-H",
        env_name: "FL_FTP_HOST",
        description: "Hostname",
        is_string: true),
        FastlaneCore::ConfigItem.new(key: :folder,
        short_option: "-f",
        env_name: "FL_FTP_FOLDER",
        description: "repository",
        is_string: true),
        FastlaneCore::ConfigItem.new(key: :upload,
        short_option: "-U",
        env_name: "FL_FTP_UPLOAD",
        description: "Upload",
        optional: true,
        is_string: false,
        type: Hash),
        FastlaneCore::ConfigItem.new(key: :download,
        short_option: "-D",
        env_name: "FL_FTP_DOWNLOAD",
        description: "Download",
        optional: true,
        is_string: false,
        type: Hash),

        FastlaneCore::ConfigItem.new(key: :port,
        short_option: "-P",
        env_name: "FL_FTP_PORT",
        description: "Port",
        optional: true,
        default_value: 21,
        is_string: false,
        type: Integer),
      ]
    end

    def self.output
    end

    def self.return_value
    end

    def self.authors
      ["Allan Vialatte"]
    end

    def self.is_supported?(platform)
      true
    end
  end
end
end
