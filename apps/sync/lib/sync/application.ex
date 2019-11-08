defmodule Sync.Application do
  use Application

  def start(_type, _args) do
    Bus.call() |> IO.inspect(label: "Sync")
    Db.call() |> IO.inspect(label: "Sync")
    Service.call() |> IO.inspect(label: "Sync")
    Sync.call() |> IO.inspect(label: "Sync")

    opts = [strategy: :one_for_one, name: Sync.Supervisor]
    Supervisor.start_link([], opts)
  end
end
