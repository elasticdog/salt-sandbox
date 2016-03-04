domain = example.com

keyfiles = master.pem master.pub master.$(domain).pem master.$(domain).pub minion1.$(domain).pem minion1.$(domain).pub minion2.$(domain).pem minion2.$(domain).pub

all: $(keyfiles)

%.pem:
	openssl genpkey -algorithm RSA -out $@ -pkeyopt rsa_keygen_bits:2048

%.pub: %.pem
	openssl rsa -in $< -pubout -out $@

clean:
	rm -f $(keyfiles)
