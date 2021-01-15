require 'rspec'
require_relative 'day12'

RSpec.describe 'day12' do
  let(:input) { File.open('day12_spec.txt').read }

  context 'Part 1' do
    let(:result) { 25 }

    it 'returns proper result' do
      expect(part_1(input)).to eq(result)
    end
  end

  context 'Part 2' do
    let(:result) { 286 }

    it 'returns proper result' do
      expect(part_2(input)).to eq(result)
    end
  end
end
