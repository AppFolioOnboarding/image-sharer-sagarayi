module ImageSharer
  class SaveImagePage < AePageObjects::Document
    path :save_image_new_url

    form_for :save_img_form, locator: '.save-form' do
      element :url_field, locator: '.url-field'
      element :tags_field, locator: '.tags-field'
      element :submit_tag, locator: '.submit-btn'
    end

    element :home_btn, locator: '.home-btn'
  end
end
