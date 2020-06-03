require 'flow_test_helper'

class ImageSharerTest < ActionDispatch::IntegrationTest
  def test_1_to_load_home_page
    index_page = ImageSharer::HomePage.visit
    assert_equal 'Save Image', index_page.save_image_btn.text
    assert_equal 'Show all images', index_page.show_all_image_btn.text
  end

  def test_2_to_load_save_page
    save_page = ImageSharer::SaveImagePage.visit
    assert save_page.url_field.visible?
    assert save_page.submit_tag.visible?
    assert 'Home', save_page.home_btn.text
  end

  def test_3_navigation
    index_page = ImageSharer::HomePage.visit
    assert index_page.save_image

    save_page = ImageSharer::SaveImagePage.visit
    assert save_page.home_page
  end

  def test_4_upload_new_image
    save_page = ImageSharer::SaveImagePage.visit
    save_page.url_field.set('https://i.picsum.photos/id/16/400/400.jpg')
    save_page.node.click_on('Submit')

    index_page = ImageSharer::HomePage.visit
    assert index_page.card_image.visible?
  end

  def test_5_delete_new_image
    save_page = ImageSharer::SaveImagePage.visit
    save_page.url_field.set('https://i.picsum.photos/id/16/400/400.jpg')
    save_page.node.click_on('Submit')

    index_page = ImageSharer::HomePage.visit
    assert index_page.card_image.visible?

    index_page.node.find('.delete-btn').click
    assert_not index_page.card_image.visible?
  end
end
