%%
%% Sample default controller
%%
-module(home_controller,[Env]).

-export([handle_request/2,before_filter/0]).

random_prime(N) ->
    % skipping the logic for finding
    % nth prime to keep things simple.
    % I may have gotten ahead of myself..
    101.

handle_request("index",[]) ->
    N = random:uniform(100),
    SomePrime = random_prime(N),
    {render, "home/primes.html", [{prime, SomePrime}]};


handle_request("show",[Year]) ->
    Sid = beepbeep_args:get_session_id(Env),
    Name = beepbeep_args:get_param("name",Env),
    {render,"home/show.html",[{year,Year},{sid,Sid},{name,Name}]}.

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
    FilterOnly = ["show"],
    case lists:member(beepbeep_args:get_action(Env),FilterOnly) of
	true ->
	    error_logger:info_report("Doing the filter for SHOW~n"),
	    ok;
	false ->
	    ok
    end.

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
