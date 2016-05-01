class SearchController < ApplicationController
	require "i18n"
  def search
  	@results = {}
  	busqueda = params[:search][:looking_for]

=begin
    mechanize 			= Mechanize.new
    memoria_chilena = mechanize.get('http://www.memoriachilena.cl/602/w3-channel.html')
    form            = memoria_chilena.form('FormBusquedaAvanzada')
    form.keywords   = busqueda
    memoria_chilena = form.submit

    mechanize 		= Mechanize.new
    dibam     		= mechanize.get('http://www.dibam.cl/614/w3-channel.html')
    form      		= dibam.form('searchForm')
    form.keywords = busqueda
    dibam   			= form.submit
=end

    mechanize   = Mechanize.new
    arpa_url		= 'http://arpa.ucv.cl/dic/'
    arpa 				= mechanize.get(arpa_url)
    form 				= arpa.form('search')
    form.buscar = busqueda
    arpa   			= form.submit

    arpa.links.each do |link|
    	if I18n.transliterate(link.text).downcase.match(busqueda).present?
    		@results[link.text] = arpa_url + link.href
    	end
    end
  end
end