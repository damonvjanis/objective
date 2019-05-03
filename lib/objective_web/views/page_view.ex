defmodule ObjectiveWeb.PageView do
  use ObjectiveWeb, :view

  @doc """
  Finds the number of skills that the combined applicants for the job possess
  """
  def num_skills_in_job(job) do
    job.applicants
    |> Enum.map(& &1.skills)
    |> List.flatten()
    |> length()
  end

  @doc """
  Finds the number of skills that a single applicant possesses
  """
  def num_skills_in_applicant(applicant) do
    length = length(applicant.skills)

    if length > 0, do: length, else: 1
  end

  @doc """
  Finds the first skill name for an applicant, or returns an indicator that there is none
  """
  def first_skill_name([first | _]), do: first.name
  def first_skill_name([]), do: "---"

  @doc """
  Since the first skill has already been used, find the tail and return those skills
  """
  def remaining_skills([_ | remaining]), do: remaining
  def remaining_skills([]), do: []

  @doc """
  Finds the total number of applicants for the jobs
  """
  def num_applicants(jobs) do
    jobs
    |> Enum.map(& &1.applicants)
    |> List.flatten()
    |> length()
  end

  @doc """
  Finds the total number of applicants for the jobs
  """
  def num_unique_skills(jobs) do
    jobs
    |> Enum.map(& &1.applicants)
    |> List.flatten()
    |> Enum.map(& &1.skills)
    |> List.flatten()
    |> Enum.map(& &1.name)
    |> Enum.uniq()
    |> length()
  end
end
