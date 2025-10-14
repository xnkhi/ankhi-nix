"use strict";
(() => {
  // src/connectors/suno.ts
  var durationSelector = 'span[aria-label^="Playbar: Duration for"]';
  Connector.playerSelector = 'div:has(a[aria-label^="Playbar: Title"]):has(button[aria-label^="Playbar: Play button"])';
  Connector.artistSelector = 'a[aria-label^="Playbar: Artist"]';
  Connector.trackSelector = 'a[aria-label^="Playbar: Title"]';
  Connector.trackArtSelector = 'img[aria-label^="Playbar: Cover image"]';
  Connector.getCurrentTime = () => getTimeSeconds("current" /* Current */);
  Connector.getDuration = () => getTimeSeconds("duration" /* Duration */);
  Connector.playButtonSelector = 'button[aria-label^="Playbar: Play button"]';
  function getTimeSeconds(part) {
    const timeElement = document.querySelector(durationSelector);
    if (!timeElement || !timeElement.textContent) {
      return Util.stringToSeconds("");
    }
    const [currentTimeStr, durationStr] = timeElement.textContent.split("/").map((str) => str.trim());
    if (part === "current" /* Current */) {
      return Util.stringToSeconds(currentTimeStr ?? "");
    }
    return Util.stringToSeconds(durationStr ?? "");
  }
})();
