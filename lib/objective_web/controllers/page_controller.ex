defmodule ObjectiveWeb.PageController do
  use ObjectiveWeb, :controller

  alias Objective.Data

  def index(conn, _params) do
    jobs = Data.list_jobs_preloaded()
    render(conn, "index.html", jobs: jobs)
  end
end
