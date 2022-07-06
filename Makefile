HUGO_BIN=hugo
HUGO_SERVER_BIND_ADDRESS="0.0.0.0"
HUGO_SERVER_BASE_URL="http://chris-mbp.local"
HUGO_SERVER_PORT=1313

.PHONY: serve

serve:
	$(HUGO_BIN) server --disableFastRender --buildDrafts --bind "$(HUGO_SERVER_BIND_ADDRESS)" --baseURL "$(HUGO_SERVER_BASE_URL)" --port "$(HUGO_SERVER_PORT)"
