-module(bb_blog_web).
-author('Dave Bryson <http://weblog.miceda.org>').

-export([start/1, stop/0, loop/1]).

start(Options) ->
    Loop = fun (Req) ->
                   ?MODULE:loop(Req)
           end,
    mochiweb_http:start([{name, ?MODULE}, {loop, Loop} | Options]).

stop() ->
    mochiweb_http:stop(?MODULE).

loop(Req) ->
	beepbeep:loop(Req, ?MODULE).

%% If necessary, add these hooks:
%% *DON'T FORGET TO EXPORT THEM AS NECESSARY*

%% before_filter/1
%%
%% Should return one of:
%% ok
%% {render, View, Data}
%% {render, View, Data, Options}
%% {static, File}
%% {text, Data}
%% {redirect, Url}
%% {controller, ControllerName}
%% {controller, ControllerName, ActionName}
%% {controller, ControllerName, ActionName, Args}
%%
%% before_filter(Env) ->
%%	ok.

%% before_render/2
%%
%% This hook accepts one of these tuples:
%% {render, View, Data}
%% {render, View, Data, Options}
%% {static, File}
%% {text, Data}
%%
%% Should return one of:
%% {render, View, Data}
%% {render, View, Data, Options}
%% {static, File}
%% {text, Data}
%% {redirect, Url}
%%
%% before_render({render, View, Data, Options}, _Env) ->
%%	{render, View, Data, Options}.

%% error/2
%%
%% Catch some errors:
%%
%% Should return one of:
%% {error, Reason}
%% {render, View, Data}
%% {render, View, Data, Options}
%% {static, File}
%% {text, Data}
%% {redirect, Url}
%%
%% error({error, _Reason} = Error, _Env) ->
%%	Error.