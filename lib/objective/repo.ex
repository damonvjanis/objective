defmodule Objective.Repo do
  use Ecto.Repo,
    otp_app: :objective,
    adapter: Ecto.Adapters.Postgres
end
