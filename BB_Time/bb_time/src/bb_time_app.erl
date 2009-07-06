-module(bb_time_app).

-behaviour(application).
-export([start/2,stop/1]).


%% @spec start(_Type, _StartArgs) -> ServerRet
%% @doc application start callback for bb_time.
start(_Type, _StartArgs) ->
    bb_time_deps:ensure(),
    bb_time_sup:start_link().

%% @spec stop(_State) -> ServerRet
%% @doc application stop callback for bb_time.
stop(_State) ->
    ok.
