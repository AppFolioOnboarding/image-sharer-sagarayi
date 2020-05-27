require 'test_helper'

class SaveImageControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get save_image_new_url
    assert_response :success
  end

  test 'should accept valid image url' do
    assert_difference 'Image.count' do
      post save_image_create_url, params: { url: ['https://i.picsum.photos/id/555/200/300.jpg'],
                                            tags: 'scenic,photo' }
    end
  end

  test 'should reject invalid image url' do
    assert_no_difference 'Image.count' do
      post save_image_create_url, params: { url: ['https://www.google.com'], tags: 'scenic,photo' }
    end
  end

  test 'should reject empty image url' do
    assert_no_difference 'Image.count' do
      post save_image_create_url, params: { url: [''], tags: 'scenic,photo' }
    end
  end

  test 'should accept valid image url and some tags' do
    assert_difference 'Image.count' do
      assert_difference 'Tag.count', 2 do
        post save_image_create_url, params: { url: ['https://i.picsum.photos/id/555/200/300.jpg'],
                                              tags: 'scenic,photo' }
      end
    end
    image = Image.last
    assert_equal %w[scenic photo], image.tag_list
  end

  test 'should accept valid image url and no tags' do
    assert_difference 'Image.count' do
      assert_no_difference 'Tag.count' do
        post save_image_create_url, params: { url: ['https://i.picsum.photos/id/555/200/300.jpg'], tags: '' }
      end
    end
    image = Image.last
    assert_equal [], image.tag_list
  end

  test 'should not accept empty image url and tags' do
    assert_no_difference 'Image.count' do
      assert_no_difference 'Tag.count' do
        post save_image_create_url, params: { url: [''], tags: 'empty,tags' }
      end
    end
  end
end
