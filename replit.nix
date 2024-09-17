{pkgs}: {
  deps = [
    pkgs.google-cloud-sdk-gce
    pkgs.nvidia-docker
    pkgs.docker-compose_1
    pkgs.mcron
   ];
}
