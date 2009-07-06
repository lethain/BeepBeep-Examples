-module(bb_time).
-export([start/0, stop/0]).

ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.
        
%% @spec start() -> ok
%% @doc Start the bb_time server.
start() ->
    bb_time_deps:ensure(),
    ensure_started(crypto),
    application:start(bb_time).

%% @spec stop() -> ok
%% @doc Stop the bb_time server.
stop() ->
    Res = application:stop(bb_time),
    application:stop(crypto),
    Res.
