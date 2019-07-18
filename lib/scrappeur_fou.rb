require 'rubygems'
require 'nokogiri'
require	'open-uri'
def get_page
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	return page
end	

def scrap_symbole
	page = get_page
	all_symbole = page.xpath('//*[@class="text-left col-symbol"]')
	symbole_array = []
	all_symbole.each {|symbole|
	 symbole_array << symbole.text
} 
	return symbole_array
end

def scrap_price
	page = get_page
	all_price = page.xpath('//*[@class="price"]')
	price_array = []
	all_price.each {|price|
	 price_array << price.text
 }
 	return price_array
end  

def perform
	symbole_array = scrap_symbole
	price_array = scrap_price
	array = []
	symbole_array.each_with_index { |symbole, val|
	 array << {symbole => (price_array)[val]} 
		}
	puts array
	return array
end		
perform


