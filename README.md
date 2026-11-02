<p align="center">
  <a href="https://www.piloterr.com"><img src="images/banner.png" alt="Product Hunt Scraper API by Piloterr – scrape Product Hunt data as JSON" width="100%"></a>
</p>

# Product Hunt Scraper API

[![Discord](https://img.shields.io/badge/Discord-Join%20the%20community-5865F2?logo=discord&logoColor=white)](https://discord.gg/CFj3ph8aHU) [![Get API key](https://img.shields.io/badge/Piloterr-Get%20a%20free%20API%20key-111827)](https://app.piloterr.com) [![API docs](https://img.shields.io/badge/Docs-OpenAPI-0EA5E9)](https://app.piloterr.com/openapi) [![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

The **Piloterr Product Hunt Scraper API** lets you extract public data from Product Hunt as **clean, structured JSON** — no proxies, headless browsers or HTML parsing to maintain. Endpoints available in production:

- **ProductHunt Product Info API** — Retrieve product data from ProductHunt, including tagline, categories, screenshots, reviews rating, and social links.

Use it for lead generation, CRM enrichment, market mapping, investment research or job market analytics.

| Endpoint | Path | Credits | What you get |
|---|---|---|---|
| [ProductHunt Product Info API](#producthunt-product-info-api) | `/v2/producthunt/product/info` | 1 | Retrieve product data from ProductHunt, including tagline, categories, screenshots, reviews rating, and social links. |

## Table of contents

- [How it works](#how-it-works)
- [ProductHunt Product Info API](#producthunt-product-info-api)
- [Code examples in other languages](#code-examples-in-other-languages)
- [Practical use cases](#practical-use-cases)
- [Why Piloterr?](#why-piloterr)
- [FAQ](#faq)
- [Related scrapers](#related-scrapers)
- [Support](#support)

## How it works

1. **Create a free Piloterr account** and copy your API key from the [dashboard](https://app.piloterr.com).
2. **Send a `GET` (or `POST`) request** to `https://api.piloterr.com/v2/...` with the header `x-api-key: YOUR_API_KEY`.
3. **Receive structured JSON** — Piloterr handles rendering, proxies, retries and parsing.

```bash
export PILOTERR_API_KEY="your-api-key"
pip install requests        # Python
# TypeScript: Node.js 18+ (native fetch), run with `npx tsx file.ts`
```

> Every endpoint accepts both `GET` (query string) and `POST` (JSON body with the same fields).

## ProductHunt Product Info API

Retrieve product data from ProductHunt, including tagline, categories, screenshots, reviews rating, and social links.

`GET | POST https://api.piloterr.com/v2/producthunt/product/info` · **1 credit per request** · [Full reference](https://app.piloterr.com/openapi)

### Request parameters

| Parameter | Type | Required | Description |
|---|---|---|---|
| `query` | string | ✅ | A ProductHunt product URL or product slug. |

### Python example

```python
import json
import os
import requests

response = requests.get(
    "https://api.piloterr.com/v2/producthunt/product/info",
    headers={"x-api-key": os.environ["PILOTERR_API_KEY"]},
    params={
        "query": "https://www.producthunt.com/products/miro",
    },
    timeout=120,
)
response.raise_for_status()
data = response.json()

print(json.dumps(data, indent=2, ensure_ascii=False)[:2000])
```

### TypeScript example

```typescript
type ProducthuntProductInfo = {
  id?: string;
  logo?: string;
  name?: string;
  slug?: string;
  tagline?: string;
  categories?: {
    name?: string;
  }[];
  description?: string;
  posts_count?: unknown;
  screenshots?: string[];
  pricing_type?: unknown;
  social_links?: {
    website?: string;
  };
  reviews_count?: unknown;
  reviews_rating?: number;
  reviewers_count?: number;
};

const params = new URLSearchParams({
  "query": "https://www.producthunt.com/products/miro",
});

const response = await fetch(`https://api.piloterr.com/v2/producthunt/product/info?${params}`, {
  headers: { "x-api-key": process.env.PILOTERR_API_KEY! },
});
if (!response.ok) throw new Error(`Piloterr error ${response.status}: ${await response.text()}`);

const data = (await response.json()) as ProducthuntProductInfo;

console.log(JSON.stringify(data, null, 2).slice(0, 2000));
```

<details>
<summary><b>POST variant</b></summary>

```http
POST https://api.piloterr.com/v2/producthunt/product/info
x-api-key: YOUR_API_KEY
Content-Type: application/json

{"query": "https://www.producthunt.com/products/miro"}
```
</details>

### Output example

Example response from the API reference, abridged — real values depend on the page you scrape.

```json
{
  "id": "111772",
  "logo": "https://ph-files.imgix.net/01cca4e0-cc5d-4b42-931e-c76756e76f07.jpeg",
  "name": "Miro",
  "slug": "miro",
  "tagline": "The visual collaboration platform for every team",
  "categories": [
    {
      "name": "Software Engineering"
    }
  ],
  "description": "The online collaborative whiteboard platform that enables distributed teams to work effectively together, from brainstorming with digital…",
  "posts_count": null,
  "screenshots": [
    "https://ph-files.imgix.net/8a41989e-dfd9-4002-8c1d-8a8ae637ce66.png",
    "https://ph-files.imgix.net/385889b3-c385-4e5b-b414-32eeb68fa5f4.png"
  ],
  "pricing_type": null,
  "social_links": {
    "website": "https://miro.com"
  },
  "reviews_count": null,
  "reviews_rating": 4.88,
  "reviewers_count": 108
}
```

### Response fields

| Field | Type | Description |
|---|---|---|
| `id` | string |  |
| `logo` | string |  |
| `name` | string |  |
| `slug` | string |  |
| `tagline` | string |  |
| `categories[]` | object[] |  |
| `categories[].name` | string |  |
| `description` | string |  |
| `posts_count` | object |  |
| `screenshots` | string[] |  |
| `pricing_type` | object |  |
| `social_links` | object |  |
| `social_links.website` | string |  |
| `reviews_count` | object |  |
| `reviews_rating` | number |  |
| `reviewers_count` | integer |  |

## Code examples in other languages

Ready-to-run examples live in the [`examples/`](examples) folder. Each one reads your key from the `PILOTERR_API_KEY` environment variable.

| Language | ProductHunt Product Info |
|---|---|
| cURL (Bash) | [`product-info`](examples/curl/product_info.sh) |
| PHP | [`product-info`](examples/php/product_info.php) |
| C# | [`product-info`](examples/csharp/ProductInfo.cs) |
| Go | [`product-info`](examples/go/product_info.go) |
| Java | [`product-info`](examples/java/ProductInfoExample.java) |
| Ruby | [`product-info`](examples/ruby/product_info.rb) |
| Node.js | [`product-info`](examples/nodejs/product_info.mjs) |

## Practical use cases

- **Lead generation** — Build target account lists from public company data.
- **CRM enrichment** — Keep firmographics, websites and descriptions up to date.
- **Market mapping** — Map competitors and segments across countries and industries.
- **Investment research** — Screen companies, funding and signals for deal flow.
- **Job market analytics** — Track hiring, roles and salaries where available.

## Why Piloterr?

- **No infrastructure** — no proxies, headless browsers or CAPTCHA solving to run yourself.
- **Structured JSON** — stable, documented fields instead of brittle HTML selectors.
- **Pay per request** — transparent credit cost per endpoint, failed requests are retried for you.
- **One API key, hundreds of sources** — Product Hunt plus many other e-commerce, search and company data endpoints in the [Piloterr library](https://www.piloterr.com/library).
- **Any language** — plain HTTPS + JSON, with examples for Python, TypeScript, cURL, PHP, C#, Go, Java, Ruby and Node.js.

## FAQ

### Is it legal to scrape Product Hunt?

Collecting publicly available data is generally allowed in many jurisdictions, but rules depend on your country, the data you collect and how you use it. Avoid personal data unless you have a lawful basis, respect the website's terms where they apply, and get legal advice for your specific use case. This is not legal advice.

### Do I need proxies or a headless browser?

No. Piloterr handles rendering, proxy rotation and retries on its side. You only send an HTTPS request with your `x-api-key` header and receive JSON.

### How much does a request cost?

Credits per call: `/v2/producthunt/product/info` **1**. See the [Piloterr website](https://www.piloterr.com) for plans.

### What data does the Product Hunt API return?

Each endpoint returns structured JSON: **ProductHunt Product Info** — `id`, `logo`, `name`, `slug`, `tagline`, `categories[]`.

### Which languages are supported?

Any language that can make an HTTP request. This README shows Python and TypeScript; the [`examples/`](examples) folder contains cURL, PHP, C#, Go, Java, Ruby and Node.js.

## Related scrapers

- [Company Database Scraper API](https://github.com/piloterr/company-data-api)
- [Crunchbase Scraper API](https://github.com/piloterr/crunchbase-scraper)
- [Europages Scraper API](https://github.com/piloterr/europages-scraper)
- [Fiverr Scraper API](https://github.com/piloterr/fiverr-scraper)
- [G2 Scraper API](https://github.com/piloterr/g2-scraper)
- [GitHub Scraper API](https://github.com/piloterr/github-scraper)
- [All Piloterr scrapers on GitHub](https://github.com/piloterr)

## Support

- 💬 Join the [Piloterr Discord](https://discord.gg/CFj3ph8aHU) to ask questions and share what you build.
- 📚 Browse the [API reference (OpenAPI)](https://app.piloterr.com/openapi) and the [Piloterr library](https://www.piloterr.com/library).
- 🔑 [Get your API key](https://app.piloterr.com).

---

<p align="center">
  <a href="https://www.piloterr.com">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="images/logo-dark.svg">
      <img src="images/logo.svg" alt="Piloterr" height="32">
    </picture>
  </a>
  <br>
  <sub>Built by <a href="https://www.piloterr.com">Piloterr</a> — web scraping APIs for e-commerce, search, real estate and more, one API key.</sub>
</p>

<sub>Product Hunt is a trademark of its respective owner. This repository is not affiliated with or endorsed by Product Hunt. Examples are released under the MIT license.</sub>
