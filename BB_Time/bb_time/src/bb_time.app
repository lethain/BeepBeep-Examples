{application, bb_time,
 [{description, "bb_time"},
  {vsn, "0.01"},
  {modules, [
    bb_time,
    bb_time_app,
    bb_time_sup,
    bb_time_web,
    bb_time_deps
  ]},
  {registered, []},
  {mod, {bb_time_app, []}},
  {env, []},
  {applications, [kernel, stdlib, crypto]}]}.
