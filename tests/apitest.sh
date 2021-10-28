#!/usr/bin/env bash
echo exit | telnet localhost 2811 | grep 'Connected to localhost'