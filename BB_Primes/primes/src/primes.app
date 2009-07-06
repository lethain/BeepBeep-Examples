{application, primes,
 [{description, "primes"},
  {vsn, "0.01"},
  {modules, [
    primes,
    primes_app,
    primes_sup,
    primes_web,
    primes_deps
  ]},
  {registered, []},
  {mod, {primes_app, []}},
  {env, []},
  {applications, [kernel, stdlib, crypto]}]}.
