#!/usr/bin/env bash
# ProductHunt Product Info API – cURL example
# Usage: PILOTERR_API_KEY=your-key ./product_info.sh
set -euo pipefail

curl -sS --fail-with-body -G "https://api.piloterr.com/v2/producthunt/product/info" \
  -H "x-api-key: ${PILOTERR_API_KEY}" \
  --data-urlencode query=https://www.producthunt.com/products/miro
