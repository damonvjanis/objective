defmodule Objective.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :name, :string

      timestamps()
    end
  end
end
