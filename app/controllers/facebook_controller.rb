class FacebookController < ApplicationController
  def index
    @contacts = FacebookFriend.all
  end
end