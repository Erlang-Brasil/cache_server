-module(cache_server_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
	init_mnesia(),
	cache_server_sup:start_link().

stop(_State) ->
	ok.

init_mnesia() ->
	case mnesia:system_info(is_running) of
		yes -> ok;
		no ->
			case mnesia:system_info(tables) of
				[] -> mnesia:create_schema([node()]);
				_ -> ok
			end,
			mnesia:start()
	end.
