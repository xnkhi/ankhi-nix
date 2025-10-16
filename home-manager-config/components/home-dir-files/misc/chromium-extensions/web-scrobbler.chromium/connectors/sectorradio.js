"use strict";
(() => {
  // src/connectors/sectorradio.ts
  Connector.playerSelector = ".player";
  Connector.artistSelector = ".player__title";
  Connector.trackSelector = ".player__trackname";
  Connector.isPlaying = () => Util.hasElementClass("#play", "pause");
})();
