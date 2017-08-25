#!/bin/bash

while $(pkill wpa_supplicant); do
    sleep 0.1
done

service networking restart

