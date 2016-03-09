require 'spec_helper'

describe YunTongXun do
  before do
    @ytx = YunTongXun::RestClient.new(
        api: ENV['YTX_API_SERVER'],
        version: '2013-12-26',
        account_sid: ENV['YTX_ACCOUNT_SID'],
        auth_token: ENV['YTX_AUTH_TOKEN']
      )
  end
  it 'has a version number' do
    expect(YunTongXun::VERSION).not_to be nil
  end

  it 'send token' do
    @ytx.config(app_id: ENV['YTX_APP_ID'], template_id: ENV['YTX_TEMPLATE_FOR_TOKEN'])
    response = @ytx.send_sms(to: ENV['YTX_TEST_TO'], data: ['2016', 1])
    expect(JSON.parse(response.body)['statusCode']).to eql '000000'
  end

  it 'send welcome' do
    @ytx.config(app_id: ENV['YTX_APP_ID'], template_id: ENV['YTX_TEMPLATE_FOR_WELCOME'])
    response = @ytx.send_sms(to: ENV['YTX_TEST_TO'], data: [])
    expect(JSON.parse(response.body)['statusCode']).to eql '000000'
  end
end
