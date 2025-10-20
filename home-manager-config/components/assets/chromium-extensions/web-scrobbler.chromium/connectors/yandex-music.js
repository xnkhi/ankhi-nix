"use strict";
(() => {
  // src/connectors/yandex-music.ts
  setupConnector();
  function setupConnector() {
    const body = document.querySelector("body");
    const isNewDesign = body?.classList.contains("ym-font-music") && (body.classList.contains("ym-dark-theme") || body.classList.contains("ym-light-theme"));
    if (isNewDesign) {
      setupNewConnector();
    } else {
      setupOldConnector();
    }
  }
  function setupOldConnector() {
    const observer = new MutationObserver(() => {
      const el = document.querySelector(".track.track_type_player");
      if (el) {
        observer.disconnect();
        Connector.playerSelector = ".track.track_type_player";
      }
    });
    const btn = document.querySelector(".player-controls__btn_play");
    if (btn) {
      const btnObserver = new MutationObserver(() => {
        Connector.onStateChanged();
      });
      btnObserver.observe(btn, {
        attributes: true,
        attributeFilter: ["class"]
      });
    }
    const trackObserver = new MutationObserver(() => {
      Connector.onStateChanged();
    });
    const trackNode = document.querySelector(
      ".player-controls__track-container"
    );
    if (trackNode) {
      trackObserver.observe(trackNode, { childList: true, subtree: true });
    }
    observer.observe(document.body, { childList: true, subtree: true });
    Connector.trackSelector = ".track__title";
    Connector.artistSelector = ".d-artists.d-artists__expanded";
    Connector.getTrackArt = () => {
      const container = document.querySelector(
        ".player-controls__track-container"
      );
      if (!container) {
        return null;
      }
      const images = container.querySelectorAll("img");
      for (const img of images) {
        const src = img.getAttribute("src");
        if (src && src.includes("50x50")) {
          const absoluteUrl = new URL(
            src,
            window.location.origin
          ).toString();
          return absoluteUrl.replace("50x50", "800x800");
        }
      }
      return null;
    };
    Connector.getCurrentTime = () => {
      const el = document.querySelector(".progress__bar.progress__text");
      const timeStr = el?.getAttribute("data-played-time");
      return timeStr ? parseFloat(timeStr) : null;
    };
    Connector.getDuration = () => {
      const el = document.querySelector(".progress__bar.progress__text");
      const durStr = el?.getAttribute("data-duration");
      return durStr ? parseFloat(durStr) : null;
    };
    Connector.isPlaying = () => {
      const btn2 = document.querySelector(".player-controls__btn_play");
      return btn2?.classList.contains("player-controls__btn_pause") ?? false;
    };
  }
  function setupNewConnector() {
    Connector.playerSelector = "section[class*='PlayerBarDesktopWithBackgroundProgressBar_root']";
    Connector.getTrack = () => {
      const playerContainer = document.querySelector(
        'section[class*="PlayerBarDesktopWithBackgroundProgressBar_root"]'
      );
      if (!playerContainer) {
        return null;
      }
      const titleContainer = playerContainer.querySelector(
        'div[class*="Meta_titleContainer"]'
      );
      if (!titleContainer) {
        return null;
      }
      const link = titleContainer.querySelector("a");
      if (!link) {
        return null;
      }
      const titleSpan = link.querySelector('span[class*="Meta_title__"]');
      if (!titleSpan) {
        return null;
      }
      let trackName = titleSpan.textContent?.trim() ?? "";
      const versionSpan = link.nextElementSibling;
      if (versionSpan && versionSpan.className.includes("Meta_version__")) {
        const versionText = versionSpan.textContent?.replace(/\u00a0/g, " ").trim();
        if (versionText) {
          trackName += ` (${versionText})`;
        }
      }
      return trackName || null;
    };
    Connector.getArtist = () => {
      const playerContainer = document.querySelector(
        'section[class*="PlayerBarDesktopWithBackgroundProgressBar_root"]'
      );
      if (!playerContainer) {
        return null;
      }
      const artistContainer = playerContainer.querySelector(
        'div[class*="SeparatedArtists_root"]'
      );
      if (!artistContainer) {
        return null;
      }
      const links = artistContainer.querySelectorAll("a");
      const artists = [];
      links.forEach((a) => {
        const span = a.querySelector('span[class*="Meta_artistCaption"]');
        if (span?.textContent?.trim()) {
          artists.push(span.textContent.trim());
        }
      });
      return artists.length ? artists.join(", ") : null;
    };
    Connector.getTrackArt = () => {
      const img = document.querySelector(
        'img[class*="PlayerBarDesktop_cover__"]'
      );
      const src = img?.getAttribute("src");
      return src ? src.replace(/\d+x\d+/, "600x600") : null;
    };
    Connector.getCurrentTime = () => {
      const el = document.querySelector('[class*="Timecode_root_start"]');
      const parts = el?.textContent?.trim().split(":");
      if (!parts || parts.length !== 2) {
        return null;
      }
      const minutes = parseInt(parts[0], 10);
      const seconds = parseInt(parts[1], 10);
      if (isNaN(minutes) || isNaN(seconds)) {
        return null;
      }
      return minutes * 60 + seconds;
    };
    Connector.getDuration = () => {
      const el = document.querySelector('[class*="Timecode_root_end"]');
      const parts = el?.textContent?.trim().split(":");
      if (!parts || parts.length !== 2) {
        return null;
      }
      const minutes = parseInt(parts[0], 10);
      const seconds = parseInt(parts[1], 10);
      if (isNaN(minutes) || isNaN(seconds)) {
        return null;
      }
      return minutes * 60 + seconds;
    };
    Connector.isPlaying = () => {
      const buttons = Array.from(
        document.querySelectorAll("button")
      );
      for (const btn of buttons) {
        if (Array.from(btn.classList).some(
          (c) => c.includes("BaseSonataControlsDesktop_sonataButton")
        )) {
          const label = btn.getAttribute("aria-label");
          if (label === "\u041F\u0430\u0443\u0437\u0430") {
            return true;
          }
          if (label === "\u0412\u043E\u0441\u043F\u0440\u043E\u0438\u0437\u0432\u0435\u0434\u0435\u043D\u0438\u0435") {
            return false;
          }
        }
      }
      return false;
    };
    Connector.onStateChanged();
    const playerNode = document.querySelector(Connector.playerSelector);
    if (playerNode) {
      const observer = new MutationObserver(() => Connector.onStateChanged());
      observer.observe(playerNode, { childList: true, subtree: true });
    } else {
      console.warn(
        "[Yandex Connector] \u041F\u043B\u0435\u0435\u0440 \u043D\u0435 \u043D\u0430\u0439\u0434\u0435\u043D \u2014 \u0438\u0441\u043F\u043E\u043B\u044C\u0437\u0443\u0435\u043C fallback \u0447\u0435\u0440\u0435\u0437 setInterval"
      );
      setInterval(() => Connector.onStateChanged(), 1e3);
    }
  }
})();
