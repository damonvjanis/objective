defmodule Objective.Data do
  import Ecto.Query, warn: false

  alias Objective.Repo
  alias Objective.Data.Job
  alias Objective.Data.Skill
  alias Objective.Data.Applicant

  @doc """
  Get all of the jobs in the database, but make sure the associations are loaded
  """
  def list_jobs_preloaded do
    Repo.all(from j in Job, preload: [applicants: [:skills]])
  end

  @doc """
  The ID's for each record are included in the dataset, which is important because the
  applicant ID's have to match what the Skill's applicant_id contains or they won't
  associate properly. So to get the ID's to populate correctly, the database has to be
  dropped and recreated each time the data is imported.

  To get around this, we could associate applicants and skills as
  a many_to_many relationship, so that the ID's could be ignored and the associations
  could be created on the fly.

  We're still allowing the database to auto-generate the ID fields because the ID's in the
  dataset are incremental and will match just fine. This creates an implicit dependency
  though that's good to be aware of.
  """
  def create_from_json(json) do
    # Pattern match to get the elements out of the dataset
    %{"jobs" => jobs, "applicants" => applicants, "skills" => skills} = Jason.decode!(json)

    # Create jobs first so that applicants will associate properly
    for job <- jobs do
      {:ok, _} = create_job(job)
    end

    # Create applicants
    for applicant <- applicants do
      {:ok, _} = create_applicant(applicant)
    end

    # Create skills
    for skill <- skills do
      {:ok, _} = create_skill(skill)
    end
  end

  def list_jobs do
    Repo.all(Job)
  end

  def get_job!(id), do: Repo.get!(Job, id)

  def create_job(attrs \\ %{}) do
    %Job{}
    |> Job.changeset(attrs)
    |> Repo.insert()
  end

  def update_job(%Job{} = job, attrs) do
    job
    |> Job.changeset(attrs)
    |> Repo.update()
  end

  def delete_job(%Job{} = job) do
    Repo.delete(job)
  end

  def change_job(%Job{} = job) do
    Job.changeset(job, %{})
  end

  def list_applicants do
    Repo.all(Applicant)
  end

  def get_applicant!(id), do: Repo.get!(Applicant, id)

  def create_applicant(attrs \\ %{}) do
    %Applicant{}
    |> Applicant.changeset(attrs)
    |> Repo.insert()
  end

  def update_applicant(%Applicant{} = applicant, attrs) do
    applicant
    |> Applicant.changeset(attrs)
    |> Repo.update()
  end

  def delete_applicant(%Applicant{} = applicant) do
    Repo.delete(applicant)
  end

  def change_applicant(%Applicant{} = applicant) do
    Applicant.changeset(applicant, %{})
  end

  def list_skills do
    Repo.all(Skill)
  end

  def get_skill!(id), do: Repo.get!(Skill, id)

  def create_skill(attrs \\ %{}) do
    %Skill{}
    |> Skill.changeset(attrs)
    |> Repo.insert()
  end

  def update_skill(%Skill{} = skill, attrs) do
    skill
    |> Skill.changeset(attrs)
    |> Repo.update()
  end

  def delete_skill(%Skill{} = skill) do
    Repo.delete(skill)
  end

  def change_skill(%Skill{} = skill) do
    Skill.changeset(skill, %{})
  end
end
