#!/usr/bin/env bash

mkdir -p ~/.kube

mkdir -p common/eu-test
mkdir -p common/us-test
mkdir -p common/eu-prod
mkdir -p common/us-prod

echo -e "$TEST_EU_CA_PEM" > common/eu-test/ca.pem
echo -e "$TEST_US_CA_PEM" > common/us-test/ca.pem
echo -e "$PROD_EU_CA_PEM" > common/eu-prod/ca.pem
echo -e "$PROD_US_CA_PEM" > common/us-prod/ca.pem

echo -e "$TEST_EU_ADMIN_PEM" > common/eu-test/admin.pem
echo -e "$TEST_US_ADMIN_PEM" > common/us-test/admin.pem
echo -e "$PROD_EU_ADMIN_PEM" > common/eu-prod/admin.pem
echo -e "$PROD_US_ADMIN_PEM" > common/us-prod/admin.pem

echo -e "$TEST_EU_ADMIN_KEY_PEM" > common/eu-test/admin-key.pem
echo -e "$TEST_US_ADMIN_KEY_PEM" > common/us-test/admin-key.pem
echo -e "$PROD_EU_ADMIN_KEY_PEM" > common/eu-prod/admin-key.pem
echo -e "$PROD_US_ADMIN_KEY_PEM" > common/us-prod/admin-key.pem
