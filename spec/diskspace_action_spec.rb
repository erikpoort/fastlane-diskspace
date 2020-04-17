describe Fastlane::Actions::DiskspaceAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The diskspace plugin is working!")

      Fastlane::Actions::DiskspaceAction.run(nil)
    end
  end
end
