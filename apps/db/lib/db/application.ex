defmodule Db.Application do
  use Application

  def start(_type, _args) do
    Bus.call() |> IO.inspect(label: "DB")
    Db.call() |> IO.inspect(label: "DB")
    Service.call() |> IO.inspect(label: "DB")
    Sync.call() |> IO.inspect(label: "DB")

    opts = [strategy: :one_for_one, name: Db.Supervisor]
    Supervisor.start_link([], opts)
  end
end
