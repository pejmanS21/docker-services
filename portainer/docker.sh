#!/bin/bash

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    --restart)
        docker compose down && docker compose up -d
        exit 0
      ;;
    --rebuild)
        docker compose down && docker compose up -d --build
        exit 0
      ;;
    --up)
      docker compose up -d
      exit 0
      ;;
    --down)
      docker compose down
      exit 0
      ;;
    --build)
      docker compose up -d --build
      exit 0
      ;;
    -h|--help)
      echo "Usage: docker.sh [--up|--down|--rebuild|--restart|--build|-h|--help]"
      echo " -h|--help: Show this help"
      echo " --up: Start all containers (docker compose up -d)"
      echo " --down: Stop all containers (docker compose down)"
      echo " --restart: Restart the containers (docker compose down && docker compose up -d)"
      echo " --rebuild: Rebuild the containers (docker compose down && docker compose up -d --build)"
      echo " --up: Start the containers (docker compose up -d)"
      exit 0
      ;;
    -*| --*)
      echo "Unknown option $1"
      exit 1
      ;;
  esac
done
