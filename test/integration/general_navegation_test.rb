require 'test_helper'

class GeneralNavegationTest < ActionDispatch::IntegrationTest
  test "visit root path and verify form" do
    visit root_path
    within "form#new_link" do
      assert has_selector? "input#link_original"
      assert has_selector? "input[type=submit]"
    end
  end

  test "fail to create empty uri" do
    js do
      visit root_path
      fill_in "link[original]", with: ""
      click_button "Tinify!"
      within "div.sweet-alert" do
        assert has_content?("Can't be blank"), "Missing Error Message"
        assert has_content?("Error"), "Missing Error Message"
      end
    end
  end

  test "fail to create invalid uri" do
    js do
      visit root_path
      fill_in "link[original]", with: "saivocom"
      click_button "Tinify!"
      within "div.sweet-alert" do
        assert has_content?("Invalid uri"), "Missing Error Message"
        assert has_content?("Error"), "Missing Error Message"
      end
    end
  end

  test "successfully create tiny link" do
    js do
      visit root_path
      fill_in "link[original]", with: "http://saviolucena.com"
      click_button "Tinify!"
      within ".tinyfied" do
        assert has_selector? "input[type=text]"
      end
    end
  end
end
