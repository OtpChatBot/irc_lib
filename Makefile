ERL ?= erl
APP := irc_lib

all: deps
	@./rebar compile
	
check-deps:
	@./rebar check-deps

deps:
	@./rebar get-deps

clean:
	@./rebar clean

distclean: clean
	@./rebar delete-deps

docs:
	@erl -noshell -run edoc_run application '$(APP)' '"."' '[]'

test:
	@./rebar eunit skip_deps=true && ./rebar ct skip_deps=true
