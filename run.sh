clear
podman build -t language-benchmarking .
podman run --rm -v $(pwd)/result:/output --name language-benchmarking language-benchmarking