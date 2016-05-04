require "spec_helper"

describe ActivationMailer do
  describe "signup_activation" do
    let(:mail) { ActivationMailer.signup_activation }

    it "renders the headers" do
      mail.subject.should eq("Signup activation")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
