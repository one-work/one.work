module TencentHelper
  extend self

  def client
    return @client if defined? @client
    tencent = Rails.application.credentials.tencent
    cre = TencentCloud::Common::Credential.new(tencent[:id], tencent[:key])
    @client = TencentCloud::Ocr::V20181119::Client.new(cre, 'ap-guangzhou')
  end

  def registration_ocr(url)
    body = client.send_request('VehicleLicenseOCR', ImageUrl: url)
    r = JSON.parse(body)
    r['Response']
  end

  def license_ocr(url)
    body = client.send_request('DriverLicenseOCR', ImageUrl: url)
    r = JSON.parse(body)
    r['Response']
  end

end
