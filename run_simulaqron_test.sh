#! /bin/bash
#
# run_mock_test.sh
#
# Run a unit test for using Quantum Key Distribution (QKD) as the key exchange protocol in OpenSSL.
# This script uses the "mock" implementation of the ETSI QKD API.
# 
# (c) 2019 Bruno Rijsman, All Rights Reserved.
# See LICENSE for licensing information.
#

simulaqron set network-config-file $PWD/network.json
echo "Stopping simulaqron"
simulaqron stop --name openssl
sleep 2
echo "Starting simulaqron"
simulaqron start --name openssl --keep
sleep 1

./stop_server.sh
./start_tshark.sh
sleep 2
./start_server.sh
sleep 1
./run_client.sh
sleep 1
./stop_server.sh
sleep 1
./stop_tshark.sh
./stop_openssl.sh
echo "Stopping simulaqron"
simulaqron stop --name openssl
./check_tshark.py
