# Website development notes

## Source of truth

- Repository: `chenhuanjie125/StitchPreview-Website`
- Website source: `web/`
- Intended domain: `https://stitch.showleafy.com/`
- Support: `support@showleafy.com`
- Local preview: `cd web && python3 -m http.server 8080`

## Public routes

| Route | App Store use |
| --- | --- |
| `/` | Marketing URL |
| `/support/` | Support URL; contains a working contact email |
| `/privacy/` | Privacy Policy URL |

## Product-copy guardrails

- StitchPreview is a macOS 15+ local, read-only Finder thumbnail and Quick Look preview tool.
- Supported launch formats are PES, DST, and JEF. Do not add EMB or unverified formats to public compatibility copy.
- Do not claim a release date, App Store listing, pricing, telemetry, cloud sync, or exact thread colour accuracy where the format cannot provide it.
- The app does not upload design files or require an account. The website itself has no form, cookies, or analytics in its static source.

## Design system

- Background: warm white `#fcfaf6`; ink: `#102744`; thread: `#d34b45`; teal stitch: `#4f8c91`.
- Display face: Georgia; UI/body: system sans-serif.
- Generated icon: `web/assets/stitchpreview-app-icon.png`. It is a website asset and a candidate application icon, pending the separate macOS App Icon asset-catalog export/review.
- Homepage concept reference: `docs/homepage-concept.png` (not a production page asset).

## Deployment status

Local browser acceptance completed on 2026-09-17:

- `/`, `/support/`, and `/privacy/` loaded from the local static server and exposed the expected semantic headings, navigation, and `mailto:` support links.
- Desktop visual review covered the homepage product-preview composition, support contact panel, and privacy-policy reading hierarchy.
- GitHub Pages source is the `web/` artifact, deployed by `.github/workflows/deploy-pages.yml` after Pages is enabled in the repository settings.
- The default public address will be `https://chenhuanjie125.github.io/StitchPreview-Website/`. The custom domain and DNS are separate post-acceptance steps.

## Custom-domain handoff

After GitHub Pages reports a successful default-domain deployment, configure `stitch.showleafy.com` as the custom domain in the repository’s Pages settings. At the DNS provider, add a `CNAME` record for host `stitch` with value `chenhuanjie125.github.io`; do not add a URL path or `https://` prefix. Wait for GitHub to verify the record, then enable HTTPS enforcement in the Pages settings.

## Fidelity ledger

| Check | Result |
| --- | --- |
| Homepage | Matches the generated direction’s warm paper, navy editorial type, coral call-to-action, and Finder/Quick Look visual without using the concept screenshot as a page asset. |
| Support | Retains the concept’s large editorial lead, dark contact treatment, working email, and practical support structure; only PES/DST/JEF are named. |
| Privacy | Retains the concept’s clear legal hierarchy and section dividers while using the product’s actual current data-practice claims. |
