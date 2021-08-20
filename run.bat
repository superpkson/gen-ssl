set OPENSSL_CONF=%cd%\ssl.conf

REM server
openssl req -newkey rsa:4096 -keyform PEM -keyout server.key -x509 -days 3650 -outform PEM -out server.cer

openssl pkcs12 -export -inkey server.key -in server.cer -out server.pfx

REM client

openssl genrsa -out client.key 4096

openssl req -new -key client.key -out client.req

openssl x509 -req -in client.req -CA server.cer -CAkey server.key -set_serial 101 -extensions client -days 365 -outform PEM -out client.cer

openssl pkcs12 -export -inkey client.key -in client.cer -out client.pfx

