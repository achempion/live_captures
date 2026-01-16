defmodule LiveCaptures.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LiveCapturesWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:live_captures, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: LiveCaptures.PubSub},
      # Start a worker by calling: LiveCaptures.Worker.start_link(arg)
      # {LiveCaptures.Worker, arg},
      # Start to serve requests, typically the last entry
      LiveCapturesWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveCaptures.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LiveCapturesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
