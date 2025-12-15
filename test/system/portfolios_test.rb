require "application_system_test_case"

class PortfoliosTest < ApplicationSystemTestCase
  setup do
    @portfolio = portfolios(:one)
  end
  # define test for visiting the index
  test "visiting the index" do
    visit portfolios_url
    assert_selector "h1", text: "Portfolios"
  end
  # Create test for portfolio creation, updating, and deletion
  test "should create portfolio" do
    visit portfolios_url
    click_on "New portfolio"

    fill_in "Asset name", with: @portfolio.asset_name
    fill_in "Notes", with: @portfolio.notes
    fill_in "Quantity", with: @portfolio.quantity
    fill_in "Symbol", with: @portfolio.symbol
    fill_in "User", with: @portfolio.user_id
    click_on "Create Portfolio"

    assert_text "Portfolio was successfully created"
    click_on "Back"
  end
  # define test for updating a portfolio
  test "should update Portfolio" do
    visit portfolio_url(@portfolio)
    click_on "Edit this portfolio", match: :first

    fill_in "Asset name", with: @portfolio.asset_name
    fill_in "Notes", with: @portfolio.notes
    fill_in "Quantity", with: @portfolio.quantity
    fill_in "Symbol", with: @portfolio.symbol
    fill_in "User", with: @portfolio.user_id
    click_on "Update Portfolio"

    assert_text "Portfolio was successfully updated"
    click_on "Back"
  end
  # define test for destroying a portfolio
  test "should destroy Portfolio" do
    visit portfolio_url(@portfolio)
    click_on "Destroy this portfolio", match: :first

    assert_text "Portfolio was successfully destroyed"
  end
end
