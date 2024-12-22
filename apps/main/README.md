# Main app

This is the main app for the monorepo. It is a FastAPI app that serves as the entry point for the API.

## Running the app

```bash
bazel run //apps/main:run
```

## Building the app

```bash
bazel build //apps/main:run
```

## Running the app with hot reloading

```bash
bazel run //apps/main:run --watch
```
