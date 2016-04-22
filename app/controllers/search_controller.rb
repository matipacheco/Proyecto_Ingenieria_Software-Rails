class SearchController < ApplicationController
	require "i18n"
  def search
  	@results = {}
=begin
    mechanize = Mechanize.new
    memoria_chilena = mechanize.get('http://www.memoriachilena.cl/602/w3-channel.html')
    form            = memoria_chilena.forms.first
    form['q']       = params[:search][:looking_for]
    memoria_chilena = form.submit
=end
    #mechanize = Mechanize.new
    #dibam     = mechanize.get('http://www.dibam.cl/614/w3-channel.html')
    #form      = dibam.forms.first
    #form['q'] = params[:search][:looking_for]
    #dibam   = form.submit
    
    mechanize   = Mechanize.new
    arpa_url		= 'http://arpa.ucv.cl/dic/'
    arpa 				= mechanize.get(arpa_url)
    form 				= arpa.form('search')
    cultor 			= params[:search][:looking_for]
    form.buscar = cultor
    arpa   			= form.submit

    arpa.links.each do |link|
    	if I18n.transliterate(link.text).downcase.match(cultor).present?
    		@results[link.text] = arpa_url + link.href
    	end
    end
  end
end