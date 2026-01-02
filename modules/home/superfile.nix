{ ... }:

{
  programs.superfile = {
    enable = true;
    firstUseCheck = false;
    pinnedFolders = [
      {
        name = "Data";
        location = "/data";
      }
      {
        name = "Public";
        location = "/mnt/minis/public";
      }
      {
        name = "Private";
        location = "/mnt/minis/private";
      }
    ];
    settings = {
      debug = true;
      ignore_missing_fields = true;
      auto_check_update = false;
      theme = "catppuccin";
      code_previewer = "bat";
    };
    hotkeys = {
      quit = [ "q" ];
      cd_quit = [ "Q" ];
      cancel_typing = [ "esc" ];
      confirm_typing = [ "enter" ];
      confirm = [
        "enter"
        "right"
        "~"
      ];
      page_up = [ "pgup" ];
      page_down = [ "pgdown" ];
      create_new_file_panel = [ "n" ];
      close_file_panel = [ "w" ];
      next_file_panel = [
        "tab"
        "≈"
      ];
      list_up = [
        "up"
        "l"
      ];
      list_down = [
        "down"
        "k"
      ];
      previous_file_panel = [
        "shift+left"
        "J"
      ];
      parent_directory = [
        "left"
        "j"
        "backspace"
      ];
      # other
      copy_present_working_directory = [ "c" ];
      copy_path = [ "C" ];
      open_zoxide = [ "z" ];
      open_help_menu = [ "?" ];
      open_spf_prompt = [ ">" ];
      open_command_line = [ ":" ];
      open_sort_options_menu = [ "o" ];
      change_panel_mode = [ "V" ];
      toggle_file_preview_panel = [ "f" ];
      toggle_reverse_sort = [ "R" ];
      toggle_dot_file = [ "h" ];
      toggle_footer = [ "F" ];
      search_bar = [ "/" ];
      pinned_directory = [ "P" ];
      # focus
      focus_on_process_bar = [ "ctrl+p" ];
      focus_on_sidebar = [ "ctrl+s" ];
      focus_on_metadata = [ "ctrl+m" ];
      # compress and extract
      extract_file = [ "x" ];
      compress_file = [ "X" ];
      # editor
      open_file_with_editor = [ "e" ];
      open_current_directory_with_editor = [ "E" ];
      # file panel
      file_panel_select_mode_items_select_down = [
        "shift+down"
        "K"
      ];
      file_panel_select_mode_items_select_up = [
        "shift+up"
        "L"
      ];
      file_panel_select_all_items = [ "A" ];
      file_panel_item_create = [ "m" ];
      file_panel_item_rename = [ "r" ];
      # file operations
      copy_items = [
        "y"
        "ctrl+c"
      ];
      cut_items = [
        "d"
        "ctrl+x"
      ];
      paste_items = [
        "p"
        "ctrl+v"
      ];
      delete_items = [ "ctrl+d" ];
      permanently_delete_items = ["D"];
    };
  };
}
