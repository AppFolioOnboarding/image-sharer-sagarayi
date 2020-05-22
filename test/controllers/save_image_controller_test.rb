require 'test_helper'

class SaveImageControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get save_image_index_url
    assert_response :success
  end

  test 'should accept valid image url' do
    assert_difference 'Image.count' do
      post save_image_create_image_url, params: { url: ['https://i.picsum.photos/id/555/200/300.jpg'] }
    end
  end

  test 'should reject invalid image url' do
    assert_no_difference 'Image.count' do
      post save_image_create_image_url, params: { url: ['https://www.google.com'] }
    end
  end

  test 'should reject empty image url' do
    assert_no_difference 'Image.count' do
      post save_image_create_image_url, params: { url: [''] }
    end
  end
end
