defmodule Phxball.Repo do
  use Ecto.Repo,
    otp_app: :phxball,
    adapter: Ecto.Adapters.Postgres
end
