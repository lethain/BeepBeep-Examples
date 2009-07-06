-module(primes).
-export([start/0, stop/0]).

ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.
        
%% @spec start() -> ok
%% @doc Start the primes server.
start() ->
    primes_deps:ensure(),
    ensure_started(crypto),
    application:start(primes).

%% @spec stop() -> ok
%% @doc Stop the primes server.
stop() ->
    Res = application:stop(primes),
    application:stop(crypto),
    Res.
