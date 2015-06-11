require 'spec_helper'

RSpec.describe(BrowserifyPipeline::Configuration) do
  let(:configuration) { BrowserifyPipeline::Configuration.new }

  describe 'generate_source_map' do
    it 'allows setting a source map preference' do
      configuration.generate_source_map = true
      expect(configuration.generate_source_map).to be_truthy

      configuration.generate_source_map = false
      expect(configuration.generate_source_map).to be_falsey
    end

    it 'defaults to something falsey' do
      expect(configuration.generate_source_map).to be_falsey
    end
  end

  describe 'transformers' do
    let(:transformer) { BrowserifyPipeline::Transformer::Base.new('name') }

    it 'allows adding a transformer' do
      configuration.add_transformer transformer
      expect(configuration.transformers).to eq [transformer]
    end

    it 'throws an error when passing a non-Transformer::Base subclass instance' do
      expect { configuration.add_transformer Class.new.new }.to raise_error(ArgumentError)
    end

  end

  describe 'node_path' do
    let(:path) { 'path/to/node' }

    it 'allows setting a NODE_PATH' do
      configuration.node_path = path
      expect(configuration.node_path).to eq path
    end

  end
end
