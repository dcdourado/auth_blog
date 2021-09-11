defmodule AuthBlog.Application do
  @moduledoc false

  use Application

  @port 8080

  @impl true
  def start(_type, _args) do
    children = [
      {AuthBlog.WebServer, [port: @port]},
      {AuthBlog.Repo, []}
    ]

    opts = [strategy: :one_for_one, name: AuthBlog.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
