# LiveCaptures

Live Examples for the LiveCapture component library. Host your storybook here.

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
