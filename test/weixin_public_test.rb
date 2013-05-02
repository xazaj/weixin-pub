# -*- encoding : utf-8 -*-
require File.expand_path(File.join(File.dirname(__FILE__), 'test_helper'))

class WeixinPublicTest < Test::Unit::TestCase
  def setup
    @client = WeixinPublicClient::WeixinPubClient.new('x@gmail.com','password') 
    @fakeId = '12345'#=>user who you want to send a message
    @pic_file = "avatar.jpg" 
  end


  def test_fans
    @client.get_fans.each {|f| p "#{f.fakeId}-#{f.nickName}"}
  end

  def test_send
    puts @client.send_message("hello","1",@fakeId)
  end

  def test_read
    @client.get_messages(@fakeId).each {|m| p "#{m.dateTime} << #{m.content}"} 
  end

  def test_upload
    puts @client.avatar_upload(@pic_file)
  end
end
