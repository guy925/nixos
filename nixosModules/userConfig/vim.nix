{ pkgs, ... }:
{
  programs.neovide= {
    enable = true;
    settings = {
      fork = false;
      frame = "full";
      idle = true;
      maximized = false;
      no-multigrid = false;
      srgb = false;
      tabs = true;
      theme = "auto";
      title-hidden = true;
      vsync = true;
      wsl = false;

      font = {
	normal = [ "VictorMono NF Semibold" ];
	size = 14.0;
      };
    };
  };
  programs.nixvim = {
    opts.number = true;
    enable = true;
    opts.relativenumber = true;
    opts.shiftwidth = 2;
    defaultEditor = true;
    globals.mapleader = " ";
    keymaps = [
    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>g";
    }
    {
      action = "<cmd>tabnew<CR>";
      key = "<C-t>";
    }
    {
      action = "<cmd>tabclose<CR>";
      key = "<C-w>";
    }
    {
      action = "<cmd>tabnext<CR>";
      key = "<C-Tab>";
    }
    {
      action = "<cmd>tabprev<CR>";
      key = "<C-S-Tab>";
     }
     {
      action = "<cmd>NvimTreeToggle<CR>";
      key = "<C-o>";
    }
    {
      action = "<cmd>vsplit<CR>";
      key = "<C-l>";
    }
    {
      action = "<cmd>split<CR>";
      key = "<C-j>";
    }
    ];
    plugins = {
      lualine.enable = true;
      web-devicons.enable = true;
      bufferline.enable = true;
      treesitter.enable = true;
      nvim-tree.enable = true;
      telescope.enable = true;
      luasnip.enable = true;
      noice.enable = true;
      alpha.enable = true;
      nvim-colorizer.enable = true;
      alpha.theme = "dashboard";
      lsp = {
	enable = true;
	servers = {
	  ts_ls.enable = true;
	  lua_ls.enable = true;
	  rust_analyzer.enable = true;
	  rust_analyzer.installCargo = true;
	  rust_analyzer.installRustc = true;
	};
      };
    };
  };
}
