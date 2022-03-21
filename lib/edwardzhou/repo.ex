defmodule Edwardzhou.Repo do
  use Ecto.Repo,
    otp_app: :edwardzhou,
    adapter: Ecto.Adapters.Postgres

  use Scrivener, page_size: 3
end
