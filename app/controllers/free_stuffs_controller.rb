class FreeStuffsController < ApplicationController
  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'


    def index
        url = "https://sfbay.craigslist.org/search/zip"
        page = Nokogiri::HTML(open(url))
        count = 0
        class_url = []
        while count < 100 do
          current_url = page.css('ul.rows li.result-row a.result-image.gallery')[count]
          current_url = current_url.to_s
          current_url_array = current_url.split('"')
          class_url.push(current_url_array[1])
          count += 1
        end
        puts "class_url #{class_url.length}"
          # class_url = page.css('ul.rows li.result-row a.result-image.gallery').map { |link| link['href'] }
          each_url ="https://sfbay.craigslist.org"
          @img_array = []
          class_url.each do |new_url|
            temp_url = each_url + new_url
            ad = Nokogiri::HTML(open(temp_url))
            img = ad.css('div.swipe div.swipe-wrap img').to_s
            temp_img = img.split('"')
            @img_array.push(temp_img[1])
          end

        puts "img_array #{@img_array.length}"

    end





end
