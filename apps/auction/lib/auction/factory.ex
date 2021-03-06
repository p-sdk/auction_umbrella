defmodule Auction.Factory do
  use ExMachina.Ecto, repo: Auction.Repo

  def bid_factory do
    %Auction.Bid{
      amount: :rand.uniform(1000),
      item: build(:item),
      user: build(:user)
    }
  end

  def item_factory do
    %Auction.Item{
      title: sequence(:title, &"Item #{&1}"),
      ends_at: DateTime.add(DateTime.utc_now(), 1000),
      user: build(:user)
    }
  end

  def user_factory do
    %Auction.User{
      username: sequence(:username, &"User #{&1}"),
      password: "foobar",
      hashed_password: Auction.Password.hash("foobar")
    }
  end
end
