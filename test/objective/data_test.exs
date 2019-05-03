defmodule Objective.DataTest do
  use Objective.DataCase

  alias Objective.Data

  describe "jobs" do
    alias Objective.Data.Job

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def job_fixture(attrs \\ %{}) do
      {:ok, job} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Data.create_job()

      job
    end

    test "list_jobs/0 returns all jobs" do
      job = job_fixture()
      assert Data.list_jobs() == [job]
    end

    test "get_job!/1 returns the job with given id" do
      job = job_fixture()
      assert Data.get_job!(job.id) == job
    end

    test "create_job/1 with valid data creates a job" do
      assert {:ok, %Job{} = job} = Data.create_job(@valid_attrs)
      assert job.name == "some name"
    end

    test "create_job/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_job(@invalid_attrs)
    end

    test "update_job/2 with valid data updates the job" do
      job = job_fixture()
      assert {:ok, %Job{} = job} = Data.update_job(job, @update_attrs)
      assert job.name == "some updated name"
    end

    test "update_job/2 with invalid data returns error changeset" do
      job = job_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_job(job, @invalid_attrs)
      assert job == Data.get_job!(job.id)
    end

    test "delete_job/1 deletes the job" do
      job = job_fixture()
      assert {:ok, %Job{}} = Data.delete_job(job)
      assert_raise Ecto.NoResultsError, fn -> Data.get_job!(job.id) end
    end

    test "change_job/1 returns a job changeset" do
      job = job_fixture()
      assert %Ecto.Changeset{} = Data.change_job(job)
    end
  end

  describe "applicants" do
    alias Objective.Data.Applicant

    @valid_attrs %{
      cover_letter: "some cover_letter",
      email: "some email",
      name: "some name",
      website: "some website"
    }
    @update_attrs %{
      cover_letter: "some updated cover_letter",
      email: "some updated email",
      name: "some updated name",
      website: "some updated website"
    }
    @invalid_attrs %{cover_letter: nil, email: nil, name: nil, website: nil}

    def applicant_fixture(attrs \\ nil) do
      job = job_fixture(%{name: "some name"})

      {:ok, applicant} =
        job
        |> Ecto.build_assoc(:applicants, attrs || @valid_attrs)
        |> Map.from_struct()
        |> Data.create_applicant()

      applicant
    end

    test "list_applicants/0 returns all applicants" do
      applicant = applicant_fixture()
      assert Data.list_applicants() == [applicant]
    end

    test "get_applicant!/1 returns the applicant with given id" do
      applicant = applicant_fixture()
      assert Data.get_applicant!(applicant.id) == applicant
    end

    test "create_applicant/1 with valid data creates a applicant" do
      assert %Applicant{} = applicant = applicant_fixture(@valid_attrs)
      assert applicant.cover_letter == "some cover_letter"
      assert applicant.email == "some email"
      assert applicant.name == "some name"
      assert applicant.website == "some website"
    end

    test "create_applicant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_applicant(@invalid_attrs)
    end

    test "update_applicant/2 with valid data updates the applicant" do
      applicant = applicant_fixture()
      assert {:ok, %Applicant{} = applicant} = Data.update_applicant(applicant, @update_attrs)
      assert applicant.cover_letter == "some updated cover_letter"
      assert applicant.email == "some updated email"
      assert applicant.name == "some updated name"
      assert applicant.website == "some updated website"
    end

    test "update_applicant/2 with invalid data returns error changeset" do
      applicant = applicant_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_applicant(applicant, @invalid_attrs)
      assert applicant == Data.get_applicant!(applicant.id)
    end

    test "delete_applicant/1 deletes the applicant" do
      applicant = applicant_fixture()
      assert {:ok, %Applicant{}} = Data.delete_applicant(applicant)
      assert_raise Ecto.NoResultsError, fn -> Data.get_applicant!(applicant.id) end
    end

    test "change_applicant/1 returns a applicant changeset" do
      applicant = applicant_fixture()
      assert %Ecto.Changeset{} = Data.change_applicant(applicant)
    end
  end

  describe "skills" do
    alias Objective.Data.Skill

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def skill_fixture(attrs \\ nil) do
      applicant =
        applicant_fixture(%{
          cover_letter: "some cover_letter",
          email: "some email",
          name: "some name",
          website: "some website"
        })

      {:ok, skill} =
        applicant
        |> Ecto.build_assoc(:skills, attrs || @valid_attrs)
        |> Map.from_struct()
        |> Data.create_skill()

      skill
    end

    test "list_skills/0 returns all skills" do
      skill = skill_fixture()
      assert Data.list_skills() == [skill]
    end

    test "get_skill!/1 returns the skill with given id" do
      skill = skill_fixture()
      assert Data.get_skill!(skill.id) == skill
    end

    test "create_skill/1 with valid data creates a skill" do
      assert %Skill{} = skill = skill_fixture(@valid_attrs)
      assert skill.name == "some name"
    end

    test "create_skill/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_skill(@invalid_attrs)
    end

    test "update_skill/2 with valid data updates the skill" do
      skill = skill_fixture()
      assert {:ok, %Skill{} = skill} = Data.update_skill(skill, @update_attrs)
      assert skill.name == "some updated name"
    end

    test "update_skill/2 with invalid data returns error changeset" do
      skill = skill_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_skill(skill, @invalid_attrs)
      assert skill == Data.get_skill!(skill.id)
    end

    test "delete_skill/1 deletes the skill" do
      skill = skill_fixture()
      assert {:ok, %Skill{}} = Data.delete_skill(skill)
      assert_raise Ecto.NoResultsError, fn -> Data.get_skill!(skill.id) end
    end

    test "change_skill/1 returns a skill changeset" do
      skill = skill_fixture()
      assert %Ecto.Changeset{} = Data.change_skill(skill)
    end
  end
end
