# Justfile for common tasks

# List available commands
default:
    @just --list

# Check code for syntax errors
check:
    cargo check

# Run strict linting
lint:
    cargo clippy --all-targets --all-features -- -D warnings

# Run all tests
test:
    cargo nextest run --all-targets --all-features --no-tests=pass

# Test coverage report
coverage:
    cargo llvm-cov nextest --all-features

# Audit dependencies for vulnerabilities and policy violations
audit:
    cargo audit
    cargo deny check

# Report unused and outdated dependencies
deps:
    cargo machete
    cargo outdated --workspace

# Format code
fmt:
    cargo fmt
    taplo fmt

# Check formatting (for CI)
fmt-check:
    cargo fmt --check
    taplo fmt --check

# Build the project
build:
    cargo build

# Run the application
run:
    cargo run -p app

# Fix auto-fixable lint issues
fix:
    cargo clippy --fix --allow-dirty --allow-staged
