fn main() {
    // Setup tracing (logging)
    tracing_subscriber::fmt::init();

    tracing::info!("Hello, world!");
}
