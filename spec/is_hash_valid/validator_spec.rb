require "spec_helper"
require "./lib/is_hash_valid/validator"

describe IsHashValid::Validator do
  subject { IsHashValid::Validator.new({}, {}) }

  describe "#initialize" do
    it "expects @hash to be set" do
      expect(subject.instance_variable_get(:@hash)).to eq({})
    end

    it "expects @validators to be set" do
      expect(subject.instance_variable_get(:@validators)).to eq({})
    end
  end

  describe "#valid?" do
    it "expects true by default" do
      expect(subject.valid?).to eq(true)
    end
  end

  describe "#errors" do
    it "expects an empty hash by default" do
      expect(subject.errors).to eq({ errors: {} })
    end
  end

  describe "given a hash with a name attribute that may not be empty" do
    describe "when name is empty" do
      subject do
        IsHashValid::Validator.new({ name: "" }, {
          name: {
            not_empty: "Name may not be empty"
          }
        })
      end

      describe "#valid?" do
        it { expect(subject.valid?).to eq(false) }
      end

      describe "#errors" do
        it { expect(subject.errors).to eq({ errors: { name: [ "Name may not be empty" ] } }) }
      end
    end

    describe "when name is not empty" do
      subject do
        IsHashValid::Validator.new({ name: "I'm not empty :D" }, {
          name: {
            not_empty: 'Name may not be empty'
          }
        })
      end

      describe "#valid?" do
        it { expect(subject.valid?).to eq(true) }
      end

      describe "#errors" do
        it { expect(subject.errors).to eq({ errors: { } }) }
      end

    end
  end

  describe "given a subclass with a custom validator" do
    class SubclassWithCustomValidator < IsHashValid::Validator
      def be_royal(value)
        value.scan(/King|Queen/).empty? ? false : true
      end
    end

    describe "when I run 2 validators on name that both fail" do
      subject do
        SubclassWithCustomValidator.new({ name: "" }, {
          name: {
            not_empty: "Name may not be empty",
            be_royal: "Name must be royal"
          }
        })
      end

      describe "#errors" do
        it { expect(subject.errors).to eq({ errors: { name: [ "Name may not be empty", "Name must be royal" ] } }) }
      end

    end
  end
end