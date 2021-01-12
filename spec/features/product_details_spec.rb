require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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

  scenario "They should navigate to product details" do
    # ACT
    visit root_path
    
    # VERIFY
    page.first('a.btn-default').click
    expect(page).to have_content('Description')

    # DEBUG 
    save_screenshot('productDetails')
  end
end
