# frozen_string_literal: true

RSpec.describe RailsParseHead do
  context 'RailsParseHead by fetch' do
    let(:rph) { RailsParseHead.fetch('https://github.com') }

    it 'Invalid URL' do
      error = raise_error(HTTP::ConnectionError)
      expect { RailsParseHead.fetch('http://github.c') }.to error
    end

    it 'Invalid schema URL' do
      error = raise_error(HTTP::Request::UnsupportedSchemeError)
      expect { RailsParseHead.fetch('www://github.com') }.to error
    end

    it 'Has a title' do
      title = 'The world’s leading software development platform · GitHub'
      expect(rph.title).to eql(title)
    end

    it 'Has metas' do
      expect(rph.metas).to be_an_instance_of(Array)
      expect(rph.metas.count).to be_positive
    end

    it 'Has links' do
      expect(rph.links).to be_an_instance_of(Array)
      expect(rph.links.count).to be_positive
    end
  end

  context 'RailsParseHead by parse' do
    dirname = File.dirname(__FILE__)

    let(:invalid_file) do
      body = File.open("#{dirname}/files/invalid.html", 'r', &:read)
      RailsParseHead.parse(body)
    end

    let(:valid_file) do
      body = File.open("#{dirname}/files/valid.html", 'r', &:read)
      RailsParseHead.parse(body)
    end

    it 'Has an empty title' do
      expect(invalid_file.title).to eql('')
    end

    it 'Has title' do
      expect(valid_file.title).to eql('Test')
    end

    it 'Has metas' do
      expect(valid_file.metas).to be_an_instance_of(Array)
      expect(valid_file.metas.count).to be_positive
    end

    it 'Has not links' do
      expect(valid_file.links).to be_an_instance_of(Array)
      expect(valid_file.links.count).to be_zero
    end
  end
end
