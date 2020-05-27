class ImageValidator < ActiveModel::Validator
  def validate(record)
    if valid_image_url?(record.url) == false
      record.errors[:base] << 'Invalid image URL'
      false
    end
    true
  end

  def valid_image_url?(image_url)
    if image_url.nil? || image_url.length.zero?
      false
    else
      image_response(image_url).content_type.starts_with?('image')
    end
  end

  def image_response(url)
    response = {}
    uri = URI(url)
    Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new uri
      response = http.request request
    end
    response
  end
end
