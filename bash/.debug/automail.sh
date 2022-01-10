#bin/bash
#
# avvio ngrok, sito su con username "coperarte" pw [REDATTO], rsync immediato della cartella documentazione
#
if ! pgrep ngrok > /dev/null
then
	ngrok start coperarte-mic > /dev/null &
#
# prende url sito data da ngrok con curl e manda in pipe su awk che prende substringa con url
# N.B. per questioni di sicurezza viene preso solo sito in HTTPS, salvato in file temporaneo urlngrok, casta su terminale l'url dal file temporaneo
#
	sleep 2.5
	echo "Questo messaggio è stato generato automaticamente dal PC-CHERI (192.168.1.48). Il link permette l'accesso alla cartella documentazione" > /tmp/urlngrok
	curl -s http://127.0.0.1:4040/api/tunnels | awk -F '"name":"coperarte-mic","uri":"/api/tunnels/coperarte-mic","public_url":"|","proto":"https","' '{print $2}' >> "/tmp/urlngrok"
#
# implementazione di mail automatica all'avvio dello script con mutt
#
	mutt -s "URL Cartella Documentazione DG-ERIC" matteo.cheri@beniculturali.it -c maurizio.m.dimonte@gmail.com -c c.macone@coperarte.it -c caterinapaola.venditti@beniculturali.it < /tmp/urlngrok
else
	echo "ngrok è già attivo"
fi
