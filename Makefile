all: keys base up

keys:
	$(MAKE) -C keys

base:
	mkdir -p -m 755 base/salt && cp -r salt/* base/salt/

up:
	vagrant up

clean:
	rm -r base
	$(MAKE) -C keys clean

.PHONY: base keys up clean
