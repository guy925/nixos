{ inputs, config, ... }:
{
  imports = [ inputs.schizofox.homeManagerModule ];
  programs.schizofox = {
    enable = true;

    theme = {
      font = "Lexend";
    };

    search = {
      defaultSearchEngine = "Brave";
      removeEngines = ["Google" "Bing" "Amazon.com" "eBay" "Twitter" "Wikipedia"];
      searxUrl = "https://searx.be";
      searxQuery = "https://searx.be/search?q={searchTerms}&categories=general";
    };

    security = {
      sanitizeOnShutdown = false;
      sandbox = true;
    };

    misc = {
      drmFix = true;
      contextMenu.enable = true;
    };

    extensions = {
      simplefox.enable = true;
      darkreader.enable = true;
        extraExtensions = {
      "webextension@ublockorigin.com".install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
    };
    };
  };
}
