{lib, ...}: let
  inherit (lib.options) mkOption mkEnableOption;
  inherit (lib.types) str bool listOf;
in {
  options.programs.schizofox.security = {
    javascript.enable = mkEnableOption {
      type = bool;
      default = true;
      example = true;
      description = ''
        JavaScript support in Schizofox. This defaults to true as many websites
        rely on Javascript to function properly, but it can be disabled for
        additional security and privacy purposes.
      '';
    };

    userAgent = mkOption {
      type = str;
      default = "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:110.0) Gecko/20100101 Firefox/110.0";
      description = "Spoof user agent";
      example = ''
        **Some other user agents**
        Mozilla/5.0 (X11; Linux x86_64; rv:110.0) Gecko/20100101 Firefox/110.0
        Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:110.0) Gecko/20100101 Firefox/110.0
        Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:110.0) Gecko/20100101 Firefox/110.0
        Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:106.0) Gecko/20100101 Firefox/106.0
        Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)
      '';
    };

    sanitizeOnShutdown = mkOption {
      type = bool;
      default = false;
      example = true;
      description = ''
        Clear cookies, history and other data on shutdown.
        Disabled on default, because it's quite annoying.

        Tip: use ctrl+i";
      '';
    };

    enableCaptivePortal = mkEnableOption "captive portal";

    noSessionRestore = mkOption {
      type = bool;
      default = false;
      example = true;
      description = ''
        Disable session restore on startup. This will will get rid of the
        "Restore tabs" button on startup if Firefox has exited unexpectedly.
      '';
    };

    wrapWithProxychains = mkOption {
      type = bool;
      default = false;
      example = true;
      description = ''
        Wrap schizofox desktop entry with proxychains-ng.

        See https://github.com/rofl0r/proxychains-ng for more details.
      '';
    };

    sandbox = mkEnableOption {
      type = bool;
      default = true;
      example = true;
      description = "runtime sandboxing with NixPak";
    };

    extraSandboxBinds = mkOption {
      type = listOf str;
      default = [];
      example = [
        "/home/\${username}/.config/tridactyl"
      ];
      description = "Extra read-only paths to bind-mount into the sandbox.";
    };

    webRTC = {
      disable = mkOption {
        type = bool;
        default = false;
        example = true;
        description = ''
          Whether to disable WebRTC in Firefox.

          WebRTC  is a technology that enables peer-to-peer communication
          directly within web browsers without the need for plugins or
          external applications. It supports video, voice, and generic data
          sharing between peers, which is highly useful for applications like
          video conferencing, file sharing, and live streaming.

          Disabling WebRTC _might_ prevent IP leaks and other privacy issues.
        '';
      };
    };
  };
}
