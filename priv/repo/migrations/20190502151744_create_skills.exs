defmodule Objective.Repo.Migrations.CreateSkills do
  use Ecto.Migration

  def change do
    create table(:skills) do
      add :name, :string
      add :applicant_id, references(:applicants, on_delete: :delete_all)

      timestamps()
    end

    create index(:skills, [:applicant_id])
  end
end
