{application, bb_blog,
 [{description, "bb_blog"},
  {vsn, "0.01"},
  {modules, [
    bb_blog,
    bb_blog_app,
    bb_blog_sup,
    bb_blog_web,
    bb_blog_deps
  ]},
  {registered, []},
  {mod, {bb_blog_app, []}},
  {env, []},
  {applications, [kernel, stdlib, crypto]}]}.
