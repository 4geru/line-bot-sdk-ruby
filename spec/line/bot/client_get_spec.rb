require 'spec_helper'
require 'webmock/rspec'
require 'json'

PROFILE_CONTENT = <<"EOS"
{
  "displayName":"BOT API",
  "userId":"u0047556f2e40dba2456887320ba7c76d",
  "pictureUrl":"http://dl.profile.line.naver.jp/abcdefghijklmn",
  "statusMessage":"Hello, LINE!"
}
EOS

OTHER_PROFILE_CONTENT = <<"EOS"
{
  "userId":"Ufr47556f2e40dba2456887320ba7c76d",
  "displayName":"Brown",
  "pictureUrl":"https://example.com/abcdefghijklmn",
  "statusMessage":"Hello, LINE!"
}
EOS

WebMock.allow_net_connect!

describe Line::Bot::Client do
  before do
  end

  def dummy_config
    {
      channel_token: 'access token',
    }
  end

  def generate_client
    client = Line::Bot::Client.new do |config|
      config.channel_token = dummy_config[:channel_token]
    end

    client
  end

  it 'gets message content' do
    uri_template = Addressable::Template.new Line::Bot::API::DEFAULT_ENDPOINT + '/bot/message/{identifier}/content'
    stub_request(:get, uri_template).to_return { |request| {:body => request.body, :status => 200} }

    client = generate_client

    response = client.get_message_content(1234567)
    expect(response).to be_a(Net::HTTPOK)
  end

  it 'gets profile' do
    uri_template = Addressable::Template.new Line::Bot::API::DEFAULT_ENDPOINT + '/bot/profile/{user_id}'
    stub_request(:get, uri_template).to_return { |request| {:body => PROFILE_CONTENT, :status => 200} }

    client = generate_client

    response = client.get_profile("1234567")

    contact = JSON.parse(response.body)
    expect(contact['userId']).to eq "u0047556f2e40dba2456887320ba7c76d"
    expect(contact['displayName']).to eq "BOT API"
    expect(contact['pictureUrl']).to eq "http://dl.profile.line.naver.jp/abcdefghijklmn"
    expect(contact['statusMessage']).to eq "Hello, LINE!"
  end

  it 'gets other path' do
    uri_template = Addressable::Template.new Line::Bot::API::DEFAULT_ENDPOINT + '/profile'
    stub_request(:get, uri_template).to_return { |request| {:body => OTHER_PROFILE_CONTENT, :status => 200} }

    client = generate_client

    response = client.get('/profile')

    contact = JSON.parse(response.body)
    expect(contact['displayName']).to eq "Brown"
  end
end
