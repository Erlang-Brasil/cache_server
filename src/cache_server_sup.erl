-module(cache_server_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->

	SupFlags = #{
        strategy => rest_for_one,
        intensity => 10,
        period => 60
    },

	ChildSpecs = [
		#{
			id => cache_server_http_listen,
			start => {cache_server_http_listen, start, []},
			restart => permanent,
			shutdown => infinity,
			type => supervisor,
			modules => [rpc_server_sctp_acceptor_sup]
		},
        #{
            id => cache_handle_supervisor,
            start => {cache_handle_supervisor, start_link, []},
            restart => permanent,
            shutdown => infinity,
            type => supervisor,
            modules => [cache_handle_supervisor]
        }
	],

	{ok, {SupFlags, ChildSpecs}}. 
