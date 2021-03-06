require 'rails_helper'

RSpec.feature "Visitor adds a product to their cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can click on add and it will update the cart" do
    # ACT
    visit root_path

    first('article.product').click_link('Add')
    # DEBUG / VERIFY

    sleep 5

    save_screenshot

    expect(page).to have_css 'article.product'
  end

end
