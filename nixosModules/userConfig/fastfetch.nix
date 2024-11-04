{
  programs.fastfetch = {
    settings = {

      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      logo = {
	type = "small";
      };
      display = {
	separator = " ";
	color = "blue";
      };
      modules = [
      {
	type = "title";
	format = "{user-name-colored}{at-symbol-colored}{host-name-colored}";
      }
      {
	type = "os";
	key = "os    ";
      }
      {
	type = "host";
	key = "host  ";
      }
      {
	type = "kernel";
	key = "kernel";
      }
      {
	type = "uptime";
	key = "uptime";
      }
      {
	type = "packages";
	key = "pkgs  ";
      }
      {
	type = "memory";
	key = "memory";
      }
      ];
    };
  };
}
    
