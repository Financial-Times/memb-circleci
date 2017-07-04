#!/usr/bin/env bash

mkdir -p ~/.kube

mkdir -p .circle/eu-test
mkdir -p .circle/us-test
mkdir -p .circle/eu-prod
mkdir -p .circle/us-prod

echo -e "$TEST_EU_CA_PEM" > .circle/eu-test/ca.pem
echo -e "$TEST_US_CA_PEM" > .circle/us-test/ca.pem
echo -e "$PROD_EU_CA_PEM" > .circle/eu-prod/ca.pem
echo -e "$PROD_US_CA_PEM" > .circle/us-prod/ca.pem

echo -e "$TEST_EU_ADMIN_PEM" > .circle/eu-test/admin.pem
echo -e "$TEST_US_ADMIN_PEM" > .circle/us-test/admin.pem
echo -e "$PROD_EU_ADMIN_PEM" > .circle/eu-prod/admin.pem
echo -e "$PROD_US_ADMIN_PEM" > .circle/us-prod/admin.pem

echo -e "$TEST_EU_ADMIN_KEY_PEM" > .circle/eu-test/admin-key.pem
echo -e "$TEST_US_ADMIN_KEY_PEM" > .circle/us-test/admin-key.pem
echo -e "$PROD_EU_ADMIN_KEY_PEM" > .circle/eu-prod/admin-key.pem
echo -e "$PROD_US_ADMIN_KEY_PEM" > .circle/us-prod/admin-key.pem
