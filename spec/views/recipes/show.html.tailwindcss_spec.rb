require 'rails_helper'

RSpec.describe 'recipes/show', type: :view do
  before(:each) do
    assign(:recipe, Recipe.create!(
                      name: 'Name',
                      preparation_time: '9.99',
                      cooking_time: '9.99',
                      description: 'MyText',
                      public: false
                    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end
