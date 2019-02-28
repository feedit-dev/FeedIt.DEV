require 'spec_helper'

RSpec.describe 'feeds/index.xml.erb', type: :view do
  let(:feed) { Feed.new }

  it 'renders with required XML spec attributes' do
    assign(:feed, feed)
    render
    expect(response.body).to include('<channel>')
  end
end
