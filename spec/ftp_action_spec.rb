describe Fastlane::Actions::FtpAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The ftp plugin is working!")

      Fastlane::Actions::FtpAction.run(nil)
    end
  end
end
