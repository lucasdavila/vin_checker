# frozen_string_literal: true

require './vin_decoder'

RSpec.describe VinDecoder do
  let(:vin) { '' }

  describe '.decode' do
    subject { described_class.decode vin }

    context 'when vin is nil' do
      let(:vin) { nil }
      it { is_expected.to be_nil }
    end

    context 'when vin is nil' do
      let(:vin) { nil }
      it { is_expected.to be_nil }
    end

    context 'when vin is invalid' do
      let(:vin) { 'a' }
      it { is_expected.to be_nil }
    end

    context 'with a valid perbilt old model vin' do
      let(:vin) { '1XPTD40X6JD456115' }
      it { is_expected.to eq({ make: 'Peterbilt USA', model_year: 1988 }) }
    end

    context 'with a valid nissan old model vin' do
      let(:vin) { 'JN1DA31D63T505967' }
      it { is_expected.to eq({ make: 'Nissan', model_year: 2003 }) }
    end

    context 'with a valid vw new model vin' do
      let(:vin) { '3VWBK7AJ1CM387806' }
      it { is_expected.to eq({ make: 'Volkswagen Mexico', model_year: 2012 }) }
    end
  end
end
