# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :meowtube,
  ecto_repos: [Meowtube.Repo]

# Configures the endpoint
config :meowtube, MeowtubeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Mzp8DdmZieGDko1dxBR0jUxUlAXSc2eWe7iDDKlaYunKg2RQkkTztgKKtbbvssc9",
  render_errors: [view: MeowtubeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Meowtube.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "ttaB2Ofb"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configure Google OAuth
config :ueberauth, Ueberauth,
  providers: [
    google: {Ueberauth.Strategy.Google, [default_scope: "email profile plus.me"]}
  ]

config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: System.get_env("GOOGLE_CLIENT_ID"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET")

config :rummage_ecto, Rummage.Ecto,
  default_repo: Meowtube.Repo,
  default_per_page: 5

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
