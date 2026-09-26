# Mando stream overlays ⚡

Animated overlays for [Mando](https://www.twitch.tv/mando)'s stream, made for OBS **Browser** sources. The background is transparent, and it's plain HTML/CSS/JS with no build step and no dependencies.

| File | What it is | OBS size |
|---|---|---|
| `camera-border.html` | Lightning border for the webcam in the bottom-right corner | **1920 × 1080** |
| `index.html` | Landing page: pick a color and copy the OBS link | — |

## Camera border

The webcam sits flush in the bottom-right corner of the screen, so the border only runs along its **top** and **left** edges. The name sits in a tag hanging inside the top-left corner, which keeps the League HUD above the webcam (champion portraits and health bars) uncovered.

Every 10 seconds a bolt comes down from the upper left and strikes the name. The name flashes, the charge bursts through the letters, and a current runs along the border in both directions: right until it leaves the screen, and down the left edge until it leaves the bottom. Between strikes the border hums with small crackles.

### Add it to OBS

1. **Sources → + → Browser**
2. **URL**: the link to the published page, e.g. `https://YOUR-DOMAIN/camera-border.html?color=green`
3. **Width 1920, Height 1080**. The source covers the whole screen and the border lands in the bottom-right corner on its own.
4. Keep it **above** the webcam in the source list, and size the webcam to fill the box (460 × 325 by default, or set `w` and `h` to match your webcam).

Open the link in a normal browser to see a demo background with a camera placeholder. Click anywhere to fire the lightning. Inside OBS the background is transparent.

### Link options

Combine them with `&`, e.g. `camera-border.html?color=red&every=6`.

| Option | What it does |
|---|---|
| `color=green` | Border color. Presets: `blue` (default), `cyan`, `teal`, `green`, `lime`, `yellow`, `gold`, `orange`, `red`, `crimson`, `pink`, `magenta`, `purple`, `violet`, `white`. Also accepts any hex (`color=ff6600`) or CSS color name (`color=hotpink`). |
| `w=460&h=325` | Webcam box size, in 1920 × 1080 pixels |
| `every=10` | Seconds between strikes |
| `name=MANDO` | Text on the border (`name=` with nothing hides it) |
| `place=top` | Puts the name on the top line instead of the corner tag. This covers whatever sits right above the webcam. |
| `zoom` | Browser preview only: close-up of the corner |
| `hud` | Browser preview only: mock League portraits above the webcam, to check that nothing covers them |

### Customize

Everything else is in the `CONFIG` block at the top of `camera-border.html`: font, line thickness, corner size, bolt height, current speed, idle crackles. Edit it, save, and redeploy if the page is published. Then in OBS, right-click the source → **Refresh**.

The name uses [Kanit](https://fonts.google.com/specimen/Kanit) Black Italic from Google Fonts.

## Deploy

It's static files, so any static host works.

**Coolify**

1. **Projects → New Resource → Public Repository** (or **GitHub App** to redeploy on every push) and paste this repo's URL.
2. **Build Pack**: `Static`, or `Dockerfile` (included, serves on port **80**).
3. Set the domain and hit **Deploy**. The border will be at `https://YOUR-DOMAIN/camera-border.html`.

**GitHub Pages**: Settings → Pages → Deploy from branch `main` / root. The border will be at `https://<user>.github.io/mando/camera-border.html`.
