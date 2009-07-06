-module(primes_app).

-behaviour(application).
-export([start/2,stop/1]).


%% @spec start(_Type, _StartArgs) -> ServerRet
%% @doc application start callback for primes.
start(_Type, _StartArgs) ->
    primes_deps:ensure(),
    primes_sup:start_link().

%% @spec stop(_State) -> ServerRet
%% @doc application stop callback for primes.
stop(_State) ->
    ok.
