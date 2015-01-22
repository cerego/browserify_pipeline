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

  describe 'transformer' do
    let(:transformer) { BrowserifyPipeline::Transformer::Base.new('name') }

    it 'allows adding a transformer' do
      configuration.transformers << transformer
      expect(configuration.transformers).to eq [transformer]
    end

  end

  describe 'browserify_path' do
    let(:path) { 'path/to/browserify' }
    let(:example_root) { '/data/exampleproject' }

    context 'when executable is found' do
      before { allow(File).to receive(:executable?).and_return(true) }

      it 'allows setting a custom path to browerify' do
        configuration.browserify_path = path
        expect(configuration.browserify_path).to eq path
      end

      it 'Uses the Rails root path to node_module as a default' do
        allow(Rails).to receive(:root).and_return(example_root)
        expect(configuration.browserify_path).to eq "#{example_root}/node_modules/.bin/browserify"
      end
    end

    context 'when executable is not found' do
      before { allow(File).to receive(:executable?).and_return(false) }

      it 'does not allow setting an unexecutable binary' do
        expect { configuration.browserify_path = path }.to raise_error(ArgumentError)
      end
    end

  end

  describe 'node_path' do
    let(:path) { 'path/to/node' }
    let (:rails_asset_paths) { %w[a b c] }

    it 'allows setting a NODE_PATH' do
      configuration.node_path = path
      expect(configuration.node_path).to eq path
    end

    it 'uses the default assets paths from Rails' do
      pending "This object shouldn't depend on being somewhere in the Rails boot process"
      expect(false).to be_truthy
    end
  end
end
