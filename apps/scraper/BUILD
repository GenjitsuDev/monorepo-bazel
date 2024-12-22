load("@rules_python//python:defs.bzl", "py_binary", "py_library")
load("@scraper_deps//:requirements.bzl", "requirement")

py_library(
    name = "scraper_lib",
    srcs = glob(["src/**/*.py"]),
    deps = [
        requirement("pydantic"),

        # Local shared library
        "//libs/shared:shared_lib",
    ],
)

py_binary(
    name = "scraper_app",
    srcs = [
        "src/main.py",
    ],
    main = "src/main.py",
    python_version = "PY3",

    # Force Python 3.12 for the web scraper
    toolchains = ["@python_3_12//:toolchain"],
    deps = [
        ":scraper_lib",
    ],
)
