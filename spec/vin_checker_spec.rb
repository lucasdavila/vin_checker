# frozen_string_literal: true

require './vin_checker'

RSpec.describe VinChecker do
  let(:vin) { '' }

  describe '.valid?' do
    subject { described_class.valid? vin }

    context 'when vin is nil' do
      let(:vin) { nil }
      it { is_expected.to eq false }
    end

    context 'when vin is invalid' do
      let(:vin) { 'a' }
      it { is_expected.to eq false }
    end

    context 'when vin is valid' do
      let(:vin) { '1XPTD40X6JD456115' }
      it { is_expected.to eq true }
    end
  end

  describe '.valid_suggestion' do
    subject { described_class.valid_suggestion vin }

    context 'when vin is nil' do
      let(:vin) { nil }
      it { is_expected.to be_nil }
    end

    context 'when vin has less than 17 chars' do
      let(:vin) { '1XPTD40X6JD45611' }
      it { is_expected.to be_nil }
    end

    context 'when vin has more than 17 chars' do
      let(:vin) { '1XPTD40X6JD4561158' }
      it { is_expected.to eq '1XPTD40X6JD456115' }
    end

    context 'when vin has lower case char' do
      let(:vin) { '1xPTD40X6JD456115' }
      it { is_expected.to eq '1XPTD40X6JD456115' }
    end

    context 'when vin has a wrong checkdigit' do
      let(:vin) { '1XPTD40X0JD456115' }
      it { is_expected.to eq '1XPTD40X6JD456115' }
    end
  end
end
