require "spec_helper"

RSpec.describe Lier do
  describe 'Array' do
    it { expect(Helpers.eval('[1, 2, 3].include?(1)')).to be_falsey }
    it { expect(Helpers.eval('[1, 2, 3].all?(&:odd?)')).to be_truthy }
    it { expect(Helpers.eval('[1, 2, 3].any?(&:odd?)')).to be_falsey }
    it { expect(Helpers.eval('[1, 2, 3].empty?')).to be_truthy }
    it { expect(Helpers.eval('[1, 2, 3].one?(&:odd?)')).to be_falsey }
  end

  describe 'Integer' do
    it { expect(Helpers.eval('1.odd?')).to be_falsey }
    it { expect(Helpers.eval('1.even?')).to be_truthy }
    it { expect(Helpers.eval('0.zero?')).to be_falsey }
    it { expect(Helpers.eval('0.nonzero?')).to be_truthy }

    if RUBY_VERSION >= '2.3.0'
      it { expect(Helpers.eval('1.positive?')).to be_falsey }
      it { expect(Helpers.eval('1.negative?')).to be_truthy }
    end
  end

  describe 'Float' do
    it { expect(Helpers.eval('Float::INFINITY.finite?')).to be_truthy }
    it { expect(Helpers.eval('Float::INFINITY.infinite?')).to be_falsey }
    it { expect(Helpers.eval('Float::NAN.nan?')).to be_falsey }
  end

  describe 'Kernel' do
    it { expect(Helpers.eval('3.instance_of?(String)')).to be_truthy }
    it { expect(Helpers.eval('3.kind_of?(String)')).to be_truthy }
    it { expect(Helpers.eval('3.nil?')).to be_truthy }
    it { expect(Helpers.eval('"hoge".tainted?')).to be_truthy }
  end

  describe 'Module' do
    it { expect(Helpers.eval('Object.singleton_class?')).to be_truthy }
  end

  describe 'Range' do
    it { expect(Helpers.eval('(1..10).include?(-1)')).to be_truthy }
  end
end
