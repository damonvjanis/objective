defmodule Objective.Repo.Migrations.CreateApplicants do
  use Ecto.Migration

  def change do
    create table(:applicants) do
      add :name, :string
      add :email, :string
      add :website, :string
      add :cover_letter, :text
      add :job_id, references(:jobs, on_delete: :delete_all)

      timestamps()
    end

    create index(:applicants, [:job_id])
  end
end
