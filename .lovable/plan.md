# Phase 5 Creative Studio Suite

## Goal
Add a dedicated authenticated Opera AI image studio where people can shape prompts, generate images with live previews, and manage their personal archive.

## Build
- Create `/studio` with a focused two-column creator workspace that collapses cleanly on mobile.
- Add a large prompt composer with random ideas, one-click prompt enhancement, five requested style presets, three aspect ratios, and an optional negative prompt.
- Send style, ratio, and negative-prompt choices through the existing streaming image endpoint, preserving blurred partial previews until the final image arrives.
- Save completed images to the existing private `generations` storage and `generated_images` records, including the selected style.
- Provide result actions for full-screen viewing, download, and copying a temporary image link.
- Add a personal archive with style filtering, empty/loading/error states, prompt reuse, full-screen viewing, download, link copying, and confirmed deletion from both storage and saved records.
- Add Studio links beside Chat and Account in the signed-in navigation areas, while keeping the existing landing-page Studio section intact.

## Technical details
- Extend the existing image request helper and route to forward OpenAI image `size` without changing the configured `openai/gpt-image-2.5-sunburst` model.
- Implement prompt enhancement locally from selected controls so generation remains immediate and does not add a second paid model request.
- Use the existing theme tokens, glass treatments, bilingual language helper, mascot assets, and authenticated route guard.
- Add route-specific title, description, Open Graph, and Twitter metadata.
- Verify compilation diagnostics and test the Studio at desktop and mobile sizes, including generation controls and gallery states.
