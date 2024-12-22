# Python Bazel Monorepo

## Overview

**monorepo-bazel** is an open-source Python monorepo managed with [Bazel](https://bazel.build/). This project demonstrates how to structure multiple Python applications and shared libraries within a single repository, leveraging Bazel's powerful build system to handle dependencies, toolchains, and build configurations efficiently.

## Project Structure (Simplified)

```

monorepo-bazel/
├── MODULE.bazel
├── apps/
│ ├── agent/
│ │ ├── BUILD
│ │ ├── README.md
│ │ ├── requirements_lock.txt
│ │ ├── requirements.txt
│ │ └── src/
│ │ └── main.py
│ ├── main/
│ │ ├── BUILD
│ │ ├── README.md
│ │ ├── requirements_lock.txt
│ │ ├── requirements.txt
│ │ └── src/
│ │ └── main.py
│ └── scraper/
│ │ ├── BUILD
│ │ ├── README.md
│ │ ├── requirements_lock.txt
│ │ ├── requirements.txt
│ │ └── src/
│ │ └── main.py
├── libs/
│ └── shared/
│ │ ├── BUILD
│ │ ├── README.md
│ │ ├── requirements_lock.txt
│ │ ├── requirements.txt
│ │ └── src/
│ │ └── helpers.py

```

## Applications

### 1. Agent

- **Path:** `apps/agent/`
- **Description:** A basic Python 3.10 application that returns an answer to a question (The `question` is returned as the answer).
- **Dependencies:** Defined in `requirements.txt`.
- **Entry Point:** `src/main.py`

### 2. Main

- **Path:** `apps/main/`
- **Description:** A FASTAPI using Python 3.13 that integrates with other apps.
- **Dependencies:** Defined in `requirements.txt`.
- **Entry Point:** `src/main.py`

### 3. Scraper

- **Path:** `apps/scraper/`
- **Description:** A simple Python 3.12 application that fetches raw HTML data from a specified URL.
- **Dependencies:** Defined in `requirements.txt`.
- **Entry Point:** `src/main.py`

## Shared Libraries

### Shared

- **Path:** `libs/shared/`
- **Description:** Contains shared Python libraries to use across apps.
- **Dependencies:** Defined in `requirements.txt`.
- **Components:** `src/helpers.py`

## Setup and Installation

A Makefile is provided to simplify the setup and installation process. The Makefile commands are defined in the `Makefile` file.

1. **Clone the Repository**

   ```bash
   git clone https://github.com/your-username/monorepo-bazel.git
   cd monorepo-bazel
   ```

2. **Install Bazel**

   Use the Makefile command:

   ```bash
   make install-bazel
   ```

3. **Install Buildifier**

   Use the Makefile command (See [Buildifier Installation and Setup](docs/buildifier/BUILDIFIER_INSTALATION_AND_SETUP.md) for more details):

   ```bash
   make install-buildifier
   ```

4. **Build and Run Applications**

   ```bash
   make run
   ```

## Current Status

The project is a work in progress. Initial setup has been established with multiple Python applications and shared libraries . However, there are some issues with the Bazel configuration that need to be resolved and the project has never ran so other issues may arise.

## Current Aims

- Use the correct imports for local libraries.
- Use the correct python version for each app.
- Resolve all existing Bazel issues including `rules_python` configuration issues to ensure seamless building and running of all applications and shared libraries using the correct dependencies and Python versions.

## License

This project is licensed under the [MIT License](docs/mit-license/LICENSE).
