require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'saving valid data' do
    image = Image.new(url: 'https://i.picsum.photos/id/555/200/300.jpg')
    assert image.save
  end

  test 'saving without url' do
    image = Image.new(url: nil)
    assert_not image.save
  end
end
