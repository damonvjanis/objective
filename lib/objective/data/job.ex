defmodule Objective.Data.Job do
  use Ecto.Schema
  import Ecto.Changeset

  schema "jobs" do
    field :name, :string

    timestamps()

    has_many(:applicants, Objective.Data.Applicant)
  end

  @doc false
  def changeset(job, attrs) do
    job
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
