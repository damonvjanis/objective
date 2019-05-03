defmodule Objective.Data.Skill do
  use Ecto.Schema
  import Ecto.Changeset

  schema "skills" do
    field :name, :string

    timestamps()

    belongs_to(:applicant, Objective.Data.Applicant)
  end

  @doc false
  def changeset(skill, attrs) do
    skill
    |> cast(attrs, [:name, :applicant_id])
    |> validate_required([:name, :applicant_id])
  end
end
