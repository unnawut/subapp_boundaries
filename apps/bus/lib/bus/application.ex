defmodule Bus.Application do
  use Application

  def start(_type, _args) do
    Bus.call() |> IO.inspect(label: "Bus")
    Db.call() |> IO.inspect(label: "Bus")
    Service.call() |> IO.inspect(label: "Bus")
    Sync.call() |> IO.inspect(label: "Bus")

    opts = [strategy: :one_for_one, name: Bus.Supervisor]
    Supervisor.start_link([], opts)
  end
end
