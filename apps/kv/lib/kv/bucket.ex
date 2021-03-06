defmodule KV.Bucket do
  @doc """
  Starts a new `Bucket`.
  """
  def start_link do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Gets value from `bucket` by `key`.
  """
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Get the keys contained by bucket
  """
  def keys(bucket) do
    Agent.get(bucket, &Map.keys(&1))
  end

  @doc """
  Puts the `value` for the given `key` in the `bucket`.
  """
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end

  @doc """
  Delete the value for `key` from the `bucket`.
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, &Map.pop(&1, key))
  end
end
