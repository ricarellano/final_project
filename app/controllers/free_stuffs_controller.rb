class FreeStuffsController < ApplicationController
  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'


    def index
        url = "https://sfbay.craigslist.org/search/zip"
        page = Nokogiri::HTML(open(url))
          class_url = page.css('ul.rows li.result-row a.result-image.gallery').map { |link| link['href'] }

          each_url ="https://sfbay.craigslist.org" + class_url[1]

           ad = Nokogiri::HTML(open(each_url))
            img = ad.css('div.swipe div.swipe-wrap img').map { |i| i['src'] }
          @nokogiri = img
    end
end
