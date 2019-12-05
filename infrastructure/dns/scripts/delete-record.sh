# Export cloud computer dns environment
eval "$(yarn environment)"

# Command line arguments
HOSTNAME=$1

# Delete the record matching the given HOSTNAME
delete_record () {
  EXISTING_RECORD=$(yarn get-record $HOSTNAME)

  if [ -z "$EXISTING_RECORD" ]; then
    echo "Record not found: $HOSTNAME"
    exit 1
  fi

  EXISTING_RECORD_ID=$(echo "$EXISTING_RECORD" | jq .id --raw-output)

  curl "https://api.cloudflare.com/client/v4/zones/$CLOUD_COMPUTER_DNS_ZONE/dns_records/$EXISTING_RECORD_ID" \
    --header "Authorization: Bearer $CLOUD_COMPUTER_DNS_TOKEN" \
    --header "Content-Type: application/json" \
    --output /dev/null \
    --request DELETE \
    --silent
}

# Delete the dns mapping for the supplied ip and hostname
delete_record
