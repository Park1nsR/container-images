#!/usr/bin/env bash

version="nginx/1.18.0"
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
