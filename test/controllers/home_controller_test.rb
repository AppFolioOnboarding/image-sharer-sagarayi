require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get filtered page with one image' do
    post save_image_create_url, params: { url: ['https://i.picsum.photos/id/555/400/400.jpg'],
                                          tags: 'scenic,photo' }

    get home_filter_url, params: { selected_tag: 'scenic' }
    assert_select 'img', 1
  end

  test 'should get filtered page with multiple images' do
    10.times do |i|
      post save_image_create_url, params: { url: ["https://i.picsum.photos/id/#{i}/400/400.jpg"],
                                            tags: 'scenic,photo' }
    end

    get home_filter_url, params: { selected_tag: 'photo' }
    assert_select 'img', 10
  end

  test 'should get no result with non-existing tag' do
    10.times do |i|
      post save_image_create_url, params: { url: ["https://i.picsum.photos/id/#{i}/400/400.jpg"],
                                            tags: 'scenic,photo' }
    end

    get home_filter_url, params: { selected_tag: 'some tag' }
    assert_select 'img', 0
  end

  test 'should get no result with images with no tags' do
    10.times do |i|
      post save_image_create_url, params: { url: ["https://i.picsum.photos/id/#{i}/400/400.jpg"],
                                            tags: '' }
    end

    get home_filter_url, params: { selected_tag: 'scenic' }
    assert_select 'img', 0
  end

  test 'should get correct result with images with mixed tags' do
    10.times do |i|
      post save_image_create_url, params: { url: ["https://i.picsum.photos/id/#{i}/400/400.jpg"],
                                            tags: 'scenic,photo' }
    end

    (11..45).each do |i|
      post save_image_create_url, params: { url: ["https://i.picsum.photos/id/#{i}/400/400.jpg"],
                                            tags: 'different,tag' }
    end

    get home_filter_url, params: { selected_tag: 'scenic' }
    assert_select 'img', 10

    get home_filter_url, params: { selected_tag: 'different' }
    assert_select 'img', 35
  end

  test 'should get no result with no images and tags' do
    get home_filter_url, params: { selected_tag: 'scenic' }
    assert_select 'img', 0
  end
end
