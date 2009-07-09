-module(blog_controller,[Env]).
-export([handle_request/2]).

handle_request("view",[Slug]) ->
    Resp = bb_blog_utils:document(Slug),
    error_logger:info_report(Resp),
    {struct, Doc} = proplists:get_value(<<"value">>, Resp),
    CleanDoc = lists:map(fun({K,V}) ->
				 {list_to_atom(binary_to_list(K)), V}
			 end, Doc),
    {render,"blog/view.html",[{doc, CleanDoc}]};
handle_request("create",[]) ->   
    Title = beepbeep_args:get_param("title", Env),
    Slug = beepbeep_args:get_param("slug", Env),
    Body = beepbeep_args:get_param("body", Env),
    error_logger:info_report([Title, Slug, Body]),
    case lists:member("", [Title, Slug, Body]) of
	true ->
	    {render, "blog/create.html",[]};
	false ->
	    bb_blog_utils:create_document(Title, Slug, Body),
	    {redirect, lists:concat(["/blog/view/",Slug,"/"])}
    end.

