defmodule Meowtube.Repo do
  use Ecto.Repo,
    otp_app: :meowtube,
    adapter: Ecto.Adapters.Postgres
end
