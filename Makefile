# Bazel Installation
install-bazel:
	@bash ./.infrastructure/scripts/setup/bazel/install.sh

uninstall-bazel:
	@bash ./.infrastructure/scripts/setup/bazel/uninstall.sh

# Buildifier Installation
install-buildifier:
	@bash ./.infrastructure/scripts/setup/buildifier/install.sh

uninstall-buildifier:
	@bash ./.infrastructure/scripts/setup/buildifier/uninstall.sh

clean-bazel:
	bazel clean --expunge

# Run the application
run:
	bazel run //apps/main:main_app
