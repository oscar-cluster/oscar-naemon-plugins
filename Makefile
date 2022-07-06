NAME = oscar-naemon-plugins
VERSION = 1.1
LIB_DIR = /usr/lib64
NAGIOS_PLUGINS_DIR = $(LIB_DIR)/nagios/plugins/

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
