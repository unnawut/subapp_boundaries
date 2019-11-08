defmodule Service.Application do
  use Application

  def start(_type, _args) do
    Bus.call() |> IO.inspect(label: "Service")
    Db.call() |> IO.inspect(label: "Service")
    Service.call() |> IO.inspect(label: "Service")
    Sync.call() |> IO.inspect(label: "Service")

    opts = [strategy: :one_for_one, name: Service.Supervisor]
    Supervisor.start_link([], opts)
  end
end
