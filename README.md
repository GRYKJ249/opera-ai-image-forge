# Opera AI Image Forge

Initialize and build the Opera AI ecosystem based on the repository https://github.com/GRYKJ249/hello-world-initiative and the master blueprint.

Core Issue to Fix:
In the chat interface, when users ask Opera AI to generate or draw an image (e.g. "ولد صورة قط", "ارسم لي قطة", or "/image a space cat"), the model currently outputs programming code (like Python/Canvas/SVG) instead of generating and displaying an actual image.

Required Fix & Implementation:
1. Integrate image generation directly into the chat flow:
   - Implement tool calling or an intent/command parser (including supporting `/image <prompt>` and natural language image requests) in `/api/chat` and `ThreadPage` / `chat.$threadId.tsx`.
   - Connect it to the image generation endpoint (`/api/generate-image`) powered by Lovable AI Gateway (`openai/gpt-image-2.5-sunburst`).
   - Render the generated image directly inside the chat message UI as a rich image card with loading preview, download button, and full-resolution lightbox viewer.
2. Ensure the chat system prompt clearly distinguishes text/coding tasks from image generation requests so it invokes image generation when an image is requested rather than writing generation code.
3. Preserve and ensure the full Opera AI experience from the repo:
   - 3D WebGL Earth globe and floating particle cosmic canvas with Space Cat mascot.
   - The 100-color theme dynamic selector.
   - TanStack Start routes with authentication, dashboard, and chat threads with Supabase persistence.

This project was built with [Lovable](https://lovable.dev).

## Build with Lovable

Continue developing this project in the [Lovable editor](https://lovable.dev/projects/a895be8e-872e-4b78-8cdb-1443109c6343).

- **Ship faster**: describe what you want to build and Lovable handles the code.
- **Stay in sync**: every change made in Lovable is committed straight to this repository.
- **Full ownership**: this code is yours. Push to `main` on GitHub and your changes sync back into Lovable, ready for your next prompt.

## Development

Prefer working locally? You need Node.js and npm — [install with nvm](https://github.com/nvm-sh/nvm#installing-and-updating).

```sh
git clone <this-repository-url>
cd <repository-name>
npm i
npm run dev
```
