class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_dynamic_content

  def get_dynamic_content
    @facebook_url = DynamicContent.get_value(:facebook_url)
    @twitter_url = DynamicContent.get_value(:twitter_url)
    @instagram_url = DynamicContent.get_value(:instagram_url)
    # @youtube_url = DynamicContent.get_value(:youtube_url)
    @site_title = DynamicContent.get_value(:site_title)
    @home_title = Page.get_title(:home)
    @home_content = Page.get_content(:home).html_safe
    @banner_name = DynamicContent.get_value(:banner_name)
    @banner_content = DynamicContent.get_value(:banner_content)
    @contact_name = DynamicContent.get_value(:contact_name)
    @contact_content = DynamicContent.get_value(:contact_content).html_safe
  end
end
