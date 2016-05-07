CC = cc
SRC = tb-userspace.c
CCFLAGS = -l pthread -O2 -s
BINDIR = /usr/local/bin
ETCDIR = /etc/tb-userspace

tb-userspace: tb-userspace.c
	$(CC) $^ -o $@ $(CCFLAGS)

install: tb-userspace
	mkdir -p $(BINDIR)
	cp $^ $(BINDIR)
	echo "10 tb" >> /etc/iproute2/rt_tables
	cp tb@.service /etc/systemd/system
	mkdir -p $(ETCDIR)
	cp example.conf $(ETCDIR)

uninstall:
	rm -f $(BINDIR)/tb-userspace
	rm -f $(ETCDIR)/example.conf
	rm -f /etc/systemd/system/tb@.service
	sed -i -e "/^10 tb$$/d" /etc/iproute2/rt_tables

clean:
	rm -f tb-userspace
