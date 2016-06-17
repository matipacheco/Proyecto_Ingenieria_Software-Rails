#Instalar la gema net-ping (gem install net-ping)

require 'net/ping'

good_pings 	= 0
total_pings = 0

log = File.new "availability_log4.txt", "w"
log.write("Inicia el test a las #{Time.now}\n \n")

while total_pings < 30
	p = Net::Ping::TCP.new('127.0.0.1', 3000)
  log.write("PING #{total_pings + 1}: ")

	if p.ping?
    log.write("true") 
    good_pings += 1
  else
    log.write("false")
  end

  log.write("           #{Time.now}\n")
  total_pings += 1
  sleep(60)
end

rate = (good_pings.to_f / total_pings) * 100

log.write("\nSe realizaron #{good_pings} pings exitosos")
log.write(", de un total de #{total_pings} intentos.\n")
log.write("Resultado: SISTEMA DISPONIBLE UN #{rate} PORCIENTO DEL TIEMPO")
log.close