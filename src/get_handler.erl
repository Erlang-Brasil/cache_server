-module(get_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Req, State) ->
    Path = cowboy_req:path(Req),
    io:format("Recebeu request no path: ~s~n", [Path]),
    {ok, Req, State}.