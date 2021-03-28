# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :food_monitor,
  ecto_repos: [FoodMonitor.Repo]

# Configures the endpoint
config :food_monitor, FoodMonitorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qj0l8B2k3Q1iTr599JL9sKEnbzuLyFUIkDLGnpfYGVKCyhqE5U4N11ygOL7TdZ1t",
  render_errors: [view: FoodMonitorWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: FoodMonitor.PubSub,
  live_view: [signing_salt: "0JxQXwRu"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
