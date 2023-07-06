defmodule TestM1Mac.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TestM1MacWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: TestM1Mac.PubSub},
      # Start the Endpoint (http/https)
      TestM1MacWeb.Endpoint
      # Start a worker by calling: TestM1Mac.Worker.start_link(arg)
      # {TestM1Mac.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TestM1Mac.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TestM1MacWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
