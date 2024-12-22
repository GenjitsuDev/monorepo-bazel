load("@agent_deps//:requirements.bzl", "requirement")
load("@rules_python//python:defs.bzl", "py_binary", "py_library")

py_library(
    name = "agent_lib",
    srcs = glob(["src/**/*.py"]),
    deps = [
        # Local shared library
        "//libs/shared:shared_lib",

        # External pip dependency pinned by @agent_deps
        requirement("emoji"),
    ],
)

py_binary(
    name = "agent_app",
    # The agent’s main entry point
    srcs = [
        "src/main.py",
    ],
    main = "src/main.py",
    python_version = "PY3",

    # Force Python 3.10 for the agent
    toolchains = ["@python_3_10//:toolchain"],
    deps = [
        ":agent_lib",
    ],
)
