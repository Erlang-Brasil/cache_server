-module(cache_server_http_listen).

-export([start/0]).

start() ->
    Dispatch = cowboy_router:compile([
        {'_', [{"/[...]", cache_server_get_handler, []}]}
    ]),
    {ok, _} = cowboy:start_clear(cache_server_http_listen,
        [{port, 8080}],
        #{env => #{dispatch => Dispatch}}
    ).