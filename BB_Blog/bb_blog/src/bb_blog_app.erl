-module(bb_blog_app).

-behaviour(application).
-export([start/2,stop/1]).


%% @spec start(_Type, _StartArgs) -> ServerRet
%% @doc application start callback for bb_blog.
start(_Type, _StartArgs) ->
    bb_blog_deps:ensure(),
    bb_blog_sup:start_link().

%% @spec stop(_State) -> ServerRet
%% @doc application stop callback for bb_blog.
stop(_State) ->
    ok.
