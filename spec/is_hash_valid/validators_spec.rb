require "spec_helper"
require "./lib/is_hash_valid/validators"

describe "Validators" do
  subject { class ValidatorsSpec; include IsHashValid::Validators end.new }

  describe "required" do
    describe "given a empty string" do
      it { expect(subject.required("")).to eq(true) }
    end

    describe "given nil" do
      it { expect(subject.required(nil)).to eq(false) }
    end
  end

  describe "not_empty" do
    describe "given a empty string" do
      it { expect(subject.not_empty("")).to eq(false) }
    end

    describe "given a string with a value" do
      it { expect(subject.not_empty("I'm not empty!")).to eq(true) }
    end
  end

  describe "be_string" do
    describe "given a empty string" do
      it { expect(subject.be_string("")).to eq(true) }
    end

    describe "given a integer" do
      it { expect(subject.be_string(2)).to eq(false) }
    end

    describe "given a bool" do
      it { expect(subject.be_string(true)).to eq(false) }
    end
  end
end