load("@main_deps//:requirements.bzl", "requirement")
load("@rules_python//python:defs.bzl", "py_binary", "py_library")

py_library(
    name = "main_lib",
    srcs = glob(["src/**/*.py"]),
    deps = [
        requirement("fastapi"),
        requirement("uvicorn"),

        # Local library from the scraper app
        "//apps/scraper:scraper_lib",

        # Local library from the agent app
        "//apps/agent:agent_lib",
    ],
)

py_binary(
    name = "main_app",
    srcs = [
        "src/main.py",
    ],
    main = "src/main.py",
    python_version = "PY3",

    # Force Python 3.13 for the main app
    toolchains = ["@python_3_13//:toolchain"],
    deps = [
        ":main_lib",
    ],
)
