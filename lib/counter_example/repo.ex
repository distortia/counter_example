defmodule CounterExample.Repo do
  use Ecto.Repo,
    otp_app: :counter_example,
    adapter: Ecto.Adapters.Postgres
end
