defmodule Objective.Data.Applicant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "applicants" do
    field :cover_letter, :string
    field :email, :string
    field :name, :string
    field :website, :string

    timestamps()

    belongs_to(:job, Objective.Data.Job)
    has_many(:skills, Objective.Data.Skill)
  end

  @doc false
  def changeset(applicant, attrs) do
    applicant
    |> cast(attrs, [:name, :email, :website, :cover_letter, :job_id])
    |> validate_required([:name, :email, :website, :cover_letter, :job_id])
  end
end
