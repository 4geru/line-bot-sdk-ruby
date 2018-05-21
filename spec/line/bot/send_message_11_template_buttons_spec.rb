require 'spec_helper'
require 'webmock/rspec'
require 'json'

WebMock.allow_net_connect!

describe Line::Bot::Client do

  it 'pushes the template message type buttons' do
    uri_template = Addressable::Template.new Line::Bot::API::DEFAULT_ENDPOINT + '/bot/message/push'
    stub_request(:post, uri_template).to_return { |request| {:body => request.body, :status => 200} }

    client = Line::Bot::Client.new do |config|
      config.channel_token = 'channel_token'
    end

    user_id = 'user_id'
    message = {
      type: 'template',
      altText: 'this is an template message',
      template: {
        type: 'buttons',
        thumbnailImageUrl: 'https://example.com/image.jpg',
        title: 'example',
        text: 'test',
        actions: [
          {
            type: 'message',
            label: '1 label',
            text: '1 text'
          },
          {
            type: 'uri',
            label: '2 label',
            uri: 'tel:08041237177'
          },
          {
            type: 'uri',
            label: '3 label',
            uri: 'http://google.com'
          },
        ]
      }
    }
    response = client.push_message(user_id, message)

    expected = {
      to: user_id,
      messages: [
        message
      ]
    }.to_json
    expect(response.body).to eq(expected)
  end

  it 'replies the template message type buttons' do
    uri_template = Addressable::Template.new Line::Bot::API::DEFAULT_ENDPOINT + '/bot/message/reply'
    stub_request(:post, uri_template).to_return { |request| {:body => request.body, :status => 200} }

    client = Line::Bot::Client.new do |config|
      config.channel_token = 'channel_token'
    end

    reply_token = 'reply_token'
    message = TemplateReply.new(
      'this is a image carousel template',
      ButtonTemplate.new(
        'test',
        [
          MessageAction.new('1 label', '1 text'),
          UriAction.new('2 label', 'tel:08041237177'),
          UriAction.new('3 label', 'http://google.com')
        ],
        {
          thumbnailImageUrl: 'https://example.com/image.jpg',
          title: 'example'
        }
      )
    )
    response = client.reply_message(reply_token, message)

    expected = {
      replyToken: reply_token,
      messages: [
        message.reply
      ]
    }.to_json
    expect(response.body).to eq(expected)
  end

  it 'multicasts the template message type buttons' do
    uri_template = Addressable::Template.new Line::Bot::API::DEFAULT_ENDPOINT + '/bot/message/multicast'
    stub_request(:post, uri_template).to_return { |request| {:body => request.body, :status => 200} }

    client = Line::Bot::Client.new do |config|
      config.channel_token = 'channel_token'
    end

    user_ids = ['user1', 'user2']
    message = TemplateReply.new(
      'this is a image carousel template',
      ButtonTemplate.new(
        'test',
        [
          MessageAction.new('1 label', '1 text'),
          UriAction.new('2 label', 'tel:08041237177'),
          UriAction.new('3 label', 'http://google.com')
        ],
        {
          thumbnailImageUrl: 'https://example.com/image.jpg',
          title: 'example'
        }
      )
    )
    response = client.multicast(user_ids, message)

    expected = {
      to: user_ids,
      messages: [
        message.reply
      ]
    }.to_json
    expect(response.body).to eq(expected)
  end

end
