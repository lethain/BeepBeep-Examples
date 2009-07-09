-module(bb_blog_utils).
-author("Will Larson <lethain@gmail.com>").
-version("Version 0.1").
-export([create_db/0, delete_db/0, info_db/0, reset_db/0]).
-export([create_document/3, delete_document/2, documents/0, documents/2, document/1]).
-define(COUCHDB_CONN, {"localhost", 5984}).
-define(BB_BLOG_DB, "bb_blog").

% Create a database in CouchDB, and then generate
% a CouchDB view for querying documents by slug.
create_db() ->
    erlang_couchdb:create_database(?COUCHDB_CONN, ?BB_BLOG_DB),
    erlang_couchdb:create_view(?COUCHDB_CONN, ?BB_BLOG_DB, "_blog", <<"javascript">>,
			       [{<<"entries">>,	<<"function(doc) { emit(doc.slug, doc) }">>}]).

% Drop the database, including all documents and views.
delete_db() ->
    erlang_couchdb:delete_database(?COUCHDB_CONN, ?BB_BLOG_DB).

% Retrieve the current status of the database.
info_db() ->
    io:format("~p",[erlang_couchdb:database_info(?COUCHDB_CONN, ?BB_BLOG_DB)]).

% Delete and then recreate the database.
reset_db() ->
    delete_db(),
    create_db().

% Create a blog entry in the database.
create_document(Title, Slug, Body) ->
    erlang_couchdb:create_document(?COUCHDB_CONN, ?BB_BLOG_DB,
				   [{<<"title">>, list_to_binary(Title)},
				    {<<"slug">>, list_to_binary(Slug)},
				    {<<"body">>, list_to_binary(Body)}]).

% Delete a blog entry from the database.
delete_document(Id, Rev) ->
    erlang_couchdb:delete_document(?COUCHDB_CONN, ?BB_BLOG_DB, Id, Rev).

% Retrieve up to the first ten documents in the _blog/entries view.
documents() ->
    documents(0,10).

% Retrieve documents Offset - Offset+Limit from _blog/entries view.
documents(Offset, Limit) ->
    Attrs = [{"skip",Offset},{"limit",Limit}],
    Resp = erlang_couchdb:invoke_view(?COUCHDB_CONN, ?BB_BLOG_DB, "_blog", "entries",Attrs),
    {json, {struct, Data}} = Resp,
    Data.

% Retrieve a given document by its slug.
document(Slug) ->
    Attrs = [{"key",lists:concat(["\"",Slug,"\""])}],
    Resp = erlang_couchdb:invoke_view(?COUCHDB_CONN, ?BB_BLOG_DB, "_blog", "entries",Attrs),
    {json, {struct, Data}} = Resp,
    Rows = proplists:get_value(<<"rows">>, Data),
    [{struct, Row}] = Rows,
    Row.
    
