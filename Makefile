NAME = naemon-plugins-oscar
VERSION = 1.2
LIBDIR := /usr/lib64
NAGIOS_PLUGINS_DIR = $(LIBDIR)/nagios/plugins/
FILES = plugins/check_pbsnode plugins/check_power_supplies plugins/check_slurm_controler

install:
	install -d -m 0755 $(DESTDIR)/$(NAGIOS_PLUGINS_DIR)/
	install    -m 0755 $(FILES) $(DESTDIR)/$(NAGIOS_PLUGINS_DIR)

dist: clean
	@mkdir -p ./$(NAME)-$(VERSION)
	@tar --exclude=$(NAME)-$(VERSION) --exclude=.git -cf - . | tar -C ./$(NAME)-$(VERSION) -xf -
	@tar cjf $(NAME)-$(VERSION).tar.bz2 ./$(NAME)-$(VERSION)
	@rm -rf ./$(NAME)-$(VERSION)
	@echo $(NAME)-$(VERSION).tar.bz2 created

clean:
	@rm -f *~
	@rm -rf ./$(NAME)-$(VERSION)
	@rm -rf ./$(NAME)-$(VERSION).tar.bz2
