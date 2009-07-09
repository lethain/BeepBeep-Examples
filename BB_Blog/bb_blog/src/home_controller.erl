%%
%% Sample default controller
%%
-module(home_controller,[Env]).
-export([handle_request/2]).

handle_request("index",[]) ->
    Data = bb_blog_utils:documents(),
    RawRows = proplists:get_value(<<"rows">>, Data),
    Rows = lists:map(fun({struct, X}) ->
			     {struct, Row} = proplists:get_value(<<"value">>, X),
			     CleanRow = lists:map(fun({Key, Value}) ->
					       {list_to_atom(binary_to_list(Key))
						,Value}
				       end, Row),
			     CleanRow
		     end, RawRows),   				 
    {render,"home/index.html",[{rows, Rows}]}.


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
