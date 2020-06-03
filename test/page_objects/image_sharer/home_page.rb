module ImageSharer
  class HomePage < AePageObjects::Document
    path '/'

    element :save_image_btn, locator: '.save-img-btn'
    element :show_all_image_btn, locator: '.show-all-img-btn'

    element :delete_img_btn, locator: '.delete-btn'
    element :card_image, locator: '.card-img'

    def save_image
      node.click_on('Save Image')
    end
  end
end
