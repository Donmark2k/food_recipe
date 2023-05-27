require 'rails_helper'

RSpec.describe 'Food', type: :feature do
  before(:all) do
    @food = Food.create(name: 'Potato', price: 10.0, measurement_unit: 'kg')
  end

  before do
    @user = FactoryBot.create(:user)

    visit 'users/sign_in'

    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password

    click_on 'Log in'
  end

  after(:all) do
    User.destroy_all
    Food.destroy_all
  end

  describe 'index page' do
    it 'shows the foods' do
      visit '/foods'

      expect(page).to have_content('Food')
    end

    it 'shows the details' do
      visit '/foods'

      expect(page).to have_content('Potato')
    end

    it 'shows the foods contents' do
      visit '/foods'

      expect(page).to have_content('10.0')
    end

    it 'shows food measurement_units' do
      visit '/foods'

      expect(page).to have_content('kg')
    end
  end
end
