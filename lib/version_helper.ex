defmodule VersionHelper do
  @moduledoc """
  Helper functions for dealing with `Version` values.
  """

  @doc """
  Bumps the specified `part` of the given `version`, zeroing out all smaller parts of the version.

  ## Examples

  Bump the major version, which increments the major version number and zeroes out the minor and
  patch version numbers.

      iex> {:ok, version} = Version.parse("1.2.3")
      iex> VersionHelper.bump(version, :major)
      #Version<2.0.0>

  Bump the minor version, which leaves the major version number unchanged, increments the minor
  version number, and zeroes out the patch version number.

      iex> {:ok, version} = Version.parse("1.2.3")
      iex> VersionHelper.bump(version, :minor)
      #Version<1.3.0>

  Bump the patch version, which leaves the major and minor version numbers unchanged, and increments
  the patch version number.

      iex> {:ok, version} = Version.parse("1.2.3")
      iex> VersionHelper.bump(version, :patch)
      #Version<1.2.4>

  Bump the patch version when there is build or prerelease information in the version number, which
  strips the build and prerelease information and leaves the rest of the version unchanged.

      iex> {:ok, version} = Version.parse("1.2.3-beta+20170611")
      iex> VersionHelper.bump(version, :patch)
      #Version<1.2.3>
  """
  def bump(version, part)

  def bump(version, :major) do
    %Version{
      build: nil,
      major: version.major + 1,
      minor: 0,
      patch: 0,
      pre: []
    }
  end

  def bump(version, :minor) do
    %Version{
      build: nil,
      major: version.major,
      minor: version.minor + 1,
      patch: 0,
      pre: []
    }
  end

  def bump(version = %Version{build: b, pre: p}, :patch) when not is_nil(b) or p != [] do
    %Version{
      build: nil,
      major: version.major,
      minor: version.minor,
      patch: version.patch,
      pre: []
    }
  end

  def bump(version, :patch) do
    %Version{
      build: nil,
      major: version.major,
      minor: version.minor,
      patch: version.patch + 1,
      pre: []
    }
  end
end
