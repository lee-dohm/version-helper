defmodule VersionHelper.Spec do
  use ESpec

  describe "bump/2" do
    context "when given a version number without build or prerelease info" do
      let_ok :version, do: Version.parse("1.2.3")

      context "and the major version number is bumped" do
        let :bumped_version, do: VersionHelper.bump(version(), :major)

        it do: expect(bumped_version().major).to eq(2)
        it do: expect(bumped_version().minor).to eq(0)
        it do: expect(bumped_version().patch).to eq(0)
        it do: expect(bumped_version().pre).to eq([])
        it do: expect(bumped_version().build).to be_nil()
      end

      context "and the minor version number is bumped" do
        let :bumped_version, do: VersionHelper.bump(version(), :minor)

        it do: expect(bumped_version().major).to eq(1)
        it do: expect(bumped_version().minor).to eq(3)
        it do: expect(bumped_version().patch).to eq(0)
        it do: expect(bumped_version().pre).to eq([])
        it do: expect(bumped_version().build).to be_nil()
      end

      context "and the patch version number is bumped" do
        let :bumped_version, do: VersionHelper.bump(version(), :patch)

        it do: expect(bumped_version().major).to eq(1)
        it do: expect(bumped_version().minor).to eq(2)
        it do: expect(bumped_version().patch).to eq(4)
        it do: expect(bumped_version().pre).to eq([])
        it do: expect(bumped_version().build).to be_nil()
      end
    end

    context "when given a version number with build info" do
      let_ok :version, do: Version.parse("1.2.3+20170611")

      context "and the major version number is bumped" do
        let :bumped_version, do: VersionHelper.bump(version(), :major)

        it do: expect(bumped_version().major).to eq(2)
        it do: expect(bumped_version().minor).to eq(0)
        it do: expect(bumped_version().patch).to eq(0)
        it do: expect(bumped_version().pre).to eq([])
        it do: expect(bumped_version().build).to be_nil()
      end

      context "and the minor version number is bumped" do
        let :bumped_version, do: VersionHelper.bump(version(), :minor)

        it do: expect(bumped_version().major).to eq(1)
        it do: expect(bumped_version().minor).to eq(3)
        it do: expect(bumped_version().patch).to eq(0)
        it do: expect(bumped_version().pre).to eq([])
        it do: expect(bumped_version().build).to be_nil()
      end

      context "and the patch version number is bumped" do
        let :bumped_version, do: VersionHelper.bump(version(), :patch)

        it do: expect(bumped_version().major).to eq(1)
        it do: expect(bumped_version().minor).to eq(2)
        it do: expect(bumped_version().patch).to eq(3)
        it do: expect(bumped_version().pre).to eq([])
        it do: expect(bumped_version().build).to be_nil()
      end
    end

    context "when given a version number with prerelease info" do
      let_ok :version, do: Version.parse("1.2.3-beta")

      context "and the major version number is bumped" do
        let :bumped_version, do: VersionHelper.bump(version(), :major)

        it do: expect(bumped_version().major).to eq(2)
        it do: expect(bumped_version().minor).to eq(0)
        it do: expect(bumped_version().patch).to eq(0)
        it do: expect(bumped_version().pre).to eq([])
        it do: expect(bumped_version().build).to be_nil()
      end

      context "and the minor version number is bumped" do
        let :bumped_version, do: VersionHelper.bump(version(), :minor)

        it do: expect(bumped_version().major).to eq(1)
        it do: expect(bumped_version().minor).to eq(3)
        it do: expect(bumped_version().patch).to eq(0)
        it do: expect(bumped_version().pre).to eq([])
        it do: expect(bumped_version().build).to be_nil()
      end

      context "and the patch version number is bumped" do
        let :bumped_version, do: VersionHelper.bump(version(), :patch)

        it do: expect(bumped_version().major).to eq(1)
        it do: expect(bumped_version().minor).to eq(2)
        it do: expect(bumped_version().patch).to eq(3)
        it do: expect(bumped_version().pre).to eq([])
        it do: expect(bumped_version().build).to be_nil()
      end
    end

    context "when given a version number with prerelease and build info" do
      let_ok :version, do: Version.parse("1.2.3-beta+20170611")

      context "and the major version number is bumped" do
        let :bumped_version, do: VersionHelper.bump(version(), :major)

        it do: expect(bumped_version().major).to eq(2)
        it do: expect(bumped_version().minor).to eq(0)
        it do: expect(bumped_version().patch).to eq(0)
        it do: expect(bumped_version().pre).to eq([])
        it do: expect(bumped_version().build).to be_nil()
      end

      context "and the minor version number is bumped" do
        let :bumped_version, do: VersionHelper.bump(version(), :minor)

        it do: expect(bumped_version().major).to eq(1)
        it do: expect(bumped_version().minor).to eq(3)
        it do: expect(bumped_version().patch).to eq(0)
        it do: expect(bumped_version().pre).to eq([])
        it do: expect(bumped_version().build).to be_nil()
      end

      context "and the patch version number is bumped" do
        let :bumped_version, do: VersionHelper.bump(version(), :patch)

        it do: expect(bumped_version().major).to eq(1)
        it do: expect(bumped_version().minor).to eq(2)
        it do: expect(bumped_version().patch).to eq(3)
        it do: expect(bumped_version().pre).to eq([])
        it do: expect(bumped_version().build).to be_nil()
      end
    end
  end
end
