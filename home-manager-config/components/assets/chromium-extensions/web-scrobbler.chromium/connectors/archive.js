"use strict";
(() => {
  // src/connectors/archive.ts
  var numericTrackRegex = /^\d+\w+/;
  var filter = MetadataFilter.createFilter({ track: removeNumericPrefixes });
  function removeNumericPrefixes(track) {
    if (hasAllTracksNumericPrefix()) {
      return track.trim().replace(/^(\d+\w+)/, "");
    }
    return track;
  }
  function hasAllTracksNumericPrefix() {
    const tracks = getTracksElementShadowDom();
    if (tracks === null) {
      return false;
    }
    const trackTitles = tracks.querySelectorAll(".track .track-title");
    if (trackTitles.length === 0) {
      return false;
    }
    let hasAllTracksNumericPrefix2 = true;
    for (const trackTitle of trackTitles) {
      if (!numericTrackRegex.test(trackTitle?.textContent?.trim() ?? "")) {
        hasAllTracksNumericPrefix2 = false;
        break;
      }
    }
    return hasAllTracksNumericPrefix2;
  }
  function getTracksElementShadowDom() {
    const tracksElement = document.querySelector("play-av");
    if (tracksElement === null) {
      return null;
    }
    return tracksElement.shadowRoot;
  }
  Connector.applyFilter(filter);
  Connector.artistSelector = ".item-details-metadata > dl > dd a";
  Connector.albumSelector = ".item-title";
  Connector.currentTimeSelector = ".jw-text-elapsed";
  Connector.durationSelector = ".jw-text-duration";
  Connector.isPlaying = () => {
    const videoElement = document.querySelector("video");
    if (videoElement === null) {
      return false;
    }
    return !videoElement.paused;
  };
  Connector.getTrack = () => {
    const tracksElement = document.querySelector("play-av");
    if (tracksElement === null) {
      return null;
    }
    const trackElements = tracksElement.shadowRoot ? tracksElement.shadowRoot.querySelector(".track.selected .track-title") : null;
    return trackElements ? trackElements.textContent.trim() : null;
  };
  Connector.getTrackArt = () => {
    const theaterElement = document.querySelector("ia-music-theater");
    if (theaterElement === null) {
      return null;
    }
    return theaterElement.querySelector("img")?.getAttribute("src");
  };
  Connector.playerSelector = "#theatre-ia";
})();
