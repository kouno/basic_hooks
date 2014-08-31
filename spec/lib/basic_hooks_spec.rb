require 'spec_helper'

describe BasicHooks do
  let(:test_class) do
    Class.new do
      include BasicHooks

      watch :action, :log_action, { event: :after }

      def action
        'act!'
      end

      def log_action
        'logged!'
      end
    end
  end

  subject { test_class.new }

  it 'defines a new accessor on the class' do
    expect(test_class).to respond_to(:basic_hooks)
  end

  it 'calls the specified method' do
    expect(subject).to receive(:log_action)
    expect(subject.action).to eq('act!')
  end
end
