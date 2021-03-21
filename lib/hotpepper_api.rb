module HotpepperApi
  DEFAULT_URI = "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?"
  KEY = Rails.application.credentials.hotpepper[:key]

  # 緯度と経度を用いて検索する
  def search_at_location(lat, lng, range, order)
    data = {key: KEY, lat: lat, lng: lng, range: range, order: order}
    res_data = excute_query(data)
    return [] if not_found?(res_data)
    return res_data['results']['shop']
  end
  module_function :search_at_location

  def self.excute_query(data)
    query = data.to_query
    uri = URI(DEFAULT_URI+query)
    http = Net::HTTP.new(uri.host, uri.port)
    req = Net::HTTP::Get.new(uri)
    res = http.request(req)
    res_data = Hash.from_xml(res.body)
    return res_data
  end

  # 検索結果が0件ならtrue
  def self.not_found?(res_data)
    res_data['results']['results_returned'].to_i == 0
  end

end