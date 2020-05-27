defmodule Meowtube.TestHelpers do
  alias Meowtube.{Multimedia, Repo, User}

  def user_fixture(attrs \\ %{}) do
    params =
      attrs
      |> Enum.into(%{
        first_name: "Bruce",
        last_name: "Wayne",
        email: "batman#{System.unique_integer([:positive])}@example.com",
        token: "2oijf3a9ex634w3",
        provider: "google"
      })

    {:ok, user} =
      User.changeset(%User{}, params)
      |> Repo.insert()

    user
  end

  def youtube_video_fixture(%Meowtube.User{} = user, attrs \\ %{}) do
    video_params =
      attrs
      |> Enum.into(%{
        duration: "PT2M2S",
        thumbnail: "https://i.ytimg.com/vi/1rlSjdnAKY4/hqdefault.jpg",
        title: "Super Troopers (2/5) Movie CLIP - The Cat Game (2001) HD",
        video_id: "1rlSjdnAKY4",
        view_count: 658_281
      })

    {:ok, video} = Multimedia.create_video(user, video_params)

    video
  end
end
