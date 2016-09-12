require 'rails_helper'

RSpec.feature "Visitor can search by zipcode" do
  scenario "they see a list of stations in that area" do
    # As a user
    # When I visit "/"
    visit root_path

    within('#q') do
      fill_in {with: 80203}
      # And I fill in the search form with 80203
      # And I click "Locate"
      click_on "Locate"
    end
    # Then I should be on page "/search" with parameters visible in the url
    expect(current_path).to eq "/search"

    expect(page).to have_content "Electric"
    expect(page).to have_content "Propane"
    expect(page).to have_content "Propane"
    expect(page).to have_content "Name"
    expect(page).to have_content "Address"
    expect(page).to have_content "Fuel Types"
    expect(page).to have_content "Distance"
    expect(page).to have_content "Access Times"
    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    # And the stations should be limited to Electric and Propane
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times


    # stub_omniauth
    # user = User.create(
    #   uid: "1234",
    #   provider: "github",
    #   username: "dtinianow",
    #   name: "David Tinianow",
    #   token: ENV["GITHUB_TOKEN"]
    # )
    # visit root_path
    # click_on "Login"
    # visit user_path(user)
    #
    # within(".navbar") do
    #   expect(page).to have_content("Logout")
    # end
    #
    # within(".username") do
    #   expect(page).to have_content("David")
    # end
    #
    # within(".user-full-name") do
    #   expect(page).to have_content("dtinianow")
    # end
    #
    # within(".github-categories") do
    #   expect(page).to have_content("My Repositories")
    #   expect(page).to have_content("My Organizations")
    #   expect(page).to have_content("Recent Activity of People I Follow")
    #   expect(page).to have_content("My Recent Activity")
    # end
  end
end


# As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search" with parameters visible in the url
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
#
# When I visit "/"
# And I fill in the search form with 80203
# And I enter "5" into an optional "Distance" field
# And I click "Locate"
# Then I should see a list of the 10 closest stations of any type within 5 miles sorted by distance
# And the results should share the same format as above
# And I should see about 6 pagination links at the bottom of the results (As of the writing of this story there are 63 results. Number of links should be RESULTS divided by 10)
#
# When I click the "2" link
# Then I should be on page "/search" with parameters visible in the url including `page=2`
# And I should see the next 10 results following the same format as above
# And I should see a next and back link
#
# When I click the next link
# Then I should be on page "/search" with parameters visible in the url including `page=3`
# And I should see the next 10 results following the same format as above
#
# When I click the back link
# Then I should be on page "/search" with parameters visible in the url including `page=2`
# And I should see the previous 10 results following the same format as above
