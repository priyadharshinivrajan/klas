# KLAS Website (demo)

Demo website for KLAS, injection moulded automotive components, Puducherry.

Plain HTML, CSS and JavaScript. No build step.

## Files

- `index.html` – the page
- `styles.css` – design and layout (light and dark mode)
- `script.js` – demo enquiry form behaviour
- `get-images.sh` – downloads the logo, photos, certificates and awards from the Wix draft into `images/`
- `render.yaml` – Render static site settings

## Images

Run `bash get-images.sh` once from this folder, then commit the `images/` folder.

## Still to fill in

Anything in an amber highlight (`<span class="ph">[...]</span>`): new unit details,
plot number, phone and email.

## Going live

1. Replace the placeholders.
2. Remove the `<meta name="robots" content="noindex, nofollow">` line in `index.html`.
3. Connect the enquiry form to a real inbox.
4. Point the company domain at the Render site.
