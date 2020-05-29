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

  test 'delete image by id' do
    image = Image.new(url: 'https://i.picsum.photos/id/555/200/300.jpg')
    image.save
    assert_equal Image.count, 1
    another_img = Image.find(1)
    another_img.destroy
    assert_equal Image.count, 0
  end
end
