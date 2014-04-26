require 'spec_helper'

describe BasicHooks do
  let(:test_class) do
    Class.new do
      include BasicHooks

      after :action, :log_action

      def action
      end
    end
  end

  subject { test_class.new }

  it 'calls the specified method' do
    expect(subject).to receive(:log_action)
    subject.action
  end
end
