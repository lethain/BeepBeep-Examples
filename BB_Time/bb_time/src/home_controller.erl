%%
%% Sample default controller
%%
-module(home_controller,[Env]).

-export([handle_request/2,before_filter/0]).

handle_request("index",[]) ->
    {_A,B,_C} = erlang:now(),
    {render,"home/index.html",[{time, B}]};

handle_request("time",[]) ->
    {_A,B,_C} = erlang:now(),
    {render,"home/ajax.html",[{time, B}]}.

%% If necessary, add these hooks:
%% *DON'T FORGET TO EXPORT THEM AS NECESSARY*

%% before_filter/0
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
before_filter() ->
    ok.

%% before_render/1
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
%% before_render({render, View, Data, Options}) ->
%%	{render, View, Data, Options}.
