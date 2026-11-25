# LiveCaptures

Live Examples for the LiveCapture component library. Host your storybook here.

## Development

Use Elixir **1.20.5** and Erlang/OTP **29.1.3**, pinned in `.tool-versions`:

```sh
asdf install
mix setup
mix phx.server
```

Run `mix precommit` before submitting changes. Build production assets with
`bin/build.sh`. Node.js is not required: the Mix wrappers download the pinned
Tailwind CSS and esbuild binaries.

The LiveDashboard dependency intentionally uses the `live-capture-example` fork,
which provides the capture examples not available in the upstream package.

Vendored frontend dependencies are daisyUI **5.8.2**, topbar **3.0.1**, and
Heroicons **2.2.0** (fetched through Mix).

## Website

The app is automatically deployed to [captures.captureui.com](https://captures.captureui.com/).

## Add Your Library

Want to showcase your LiveView component library?

1. Mount your library in `lib/live_captures_web/router.ex`:

   ```elixir
   live_capture "/your_library", YourLibrary.LiveCapture
   ```

2. Add your library card in `lib/live_captures_web/controllers/page_html/home.html.heex`:

   ```heex
   <.library
     name="your_library"
     org="your_org"
     explore="/your_library/components/Elixir.YourLibrary.Component/render"
   />
   ```

Then submit a pull request.
