clear
podman build -t language-benchmarking .
podman run --rm -v ${PWD}/result:/output --name language-benchmarking language-benchmarking