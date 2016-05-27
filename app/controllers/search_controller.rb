class SearchController < ApplicationController
	require "i18n"
  def search
  	@scraper_results = {}
    @results = []
  	busqueda = params[:search][:looking_for]

=begin
    mechanize 			= Mechanize.new
    memoria_chilena = mechanize.get('http://www.memoriachilena.cl/602/w3-channel.html')
    form            = memoria_chilena.form('FormBusquedaAvanzada')
    form.keywords   = busqueda
    memoria_chilena = form.submit
=end

    mechanize       = Mechanize.new
    bncatalogo      = mechanize.get('http://www.bncatalogo.cl/F?func=find-b-0&local_base=BNC')
    form            = bncatalogo.form('form1')
    form.request    = busqueda
    bncatalogo      = form.submit

    bncatalogo.links.each do |link|
      if link.text == "Autor"
        @scraper_results["Resultados en bncatalogo por Autor"] = link.href
      end
      if link.text == "Título"
        @scraper_results["Resultados en bncatalogo por Título"] = link.href
      end
    end    


    mechanize   = Mechanize.new
    arpa_url		= 'http://arpa.ucv.cl/dic/'
    arpa 				= mechanize.get(arpa_url)
    form 				= arpa.form('search')
    form.buscar = busqueda
    arpa   			= form.submit

    arpa.links.each do |link|
    	if I18n.transliterate(link.text).downcase.match(busqueda).present?
    		@scraper_results[link.text] = arpa_url + link.href
    	end
    end

    VisitorContribution.all.each do |contribution|
      if I18n.transliterate(contribution.search_term).downcase.match(busqueda).present?
        @results.append([contribution.search_term, contribution.description, contribution.user.get_name])
      end
    end
  end
end