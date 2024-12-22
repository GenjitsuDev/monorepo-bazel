load("@rules_python//python:defs.bzl", "py_binary", "py_library")
load("@shared_libs_deps//:requirements.bzl", "requirement")

py_library(
    name = "shared_lib",
    srcs = glob(["src/**/*.py"]),
    deps = [
        requirement("requests"),
    ],
)

py_binary(
    name = "shared_app",
    srcs = [
        "src/helpers.py",
    ],
    main = "src/helpers.py",
    python_version = "PY3",

    # Force Python 3.12 if that’s how you set up the shared libs
    toolchains = ["@python_3_12//:toolchain"],
    deps = [
        ":shared_lib",
    ],
)
