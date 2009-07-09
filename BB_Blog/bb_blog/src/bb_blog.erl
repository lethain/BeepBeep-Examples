-module(bb_blog).
-export([start/0, stop/0]).

ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.
        
%% @spec start() -> ok
%% @doc Start the bb_blog server.
start() ->
    bb_blog_deps:ensure(),
    ensure_started(crypto),
    application:start(bb_blog).

%% @spec stop() -> ok
%% @doc Stop the bb_blog server.
stop() ->
    Res = application:stop(bb_blog),
    application:stop(crypto),
    Res.
