require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  def setup    
    @link = links(:one)
  end

  test "link invalid without original" do
    link = Link.new
    assert link.invalid?, "Original is not being validated"
  end

  test "link valid with all param" do
    assert @link.valid?, "Link is not valid"
  end

  test "no original url gives an error message" do
    @link.original = nil
    @link.valid?
    assert_match /can't be blank/, @link.errors[:original].join
  end

  test "invalid url gives an error message" do
    @link.original = "invalidurl"
    @link.valid?
    assert_match /Invalid URI/, @link.errors[:original].join
  end

  test "generate Hashid from id" do
    link = Link.new(original: 'https://google.com')
    HashidsI.expects(:encode).returns("AAA")
    link.save
    assert_equal "AAA", link.tinyfied, "Generating invalid hashid"
  end

  test "can generate tiny_url" do
    assert_equal "#{Rails.application.config.appHost}/#{@link.tinyfied}", @link.getTinyUrl
  end

  test "can generte tiny_info_url" do
    assert_equal "#{Rails.application.config.appHost}/#{@link.tinyfied}/info", @link.getTinyUrlInfo
  end
end
