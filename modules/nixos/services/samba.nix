{ ... }:

{
  services.samba = {
    enable = true;
    openFirewall = true;

    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "server string" = "nixsmb";
        "netbios name" = "nixsmb";
        "security" = "user";
        "hosts allow" = "192.168.1. 127.0.0.1 localhost";
        "hosts deny" = "0.0.0.0/0";
        # macOS related
        "fruit:model" = "MacSamba";
        "fruit:metadata" = "stream";
        "fruit:veto_appledouble" = "no";
        "fruit:nfs_aces" = "no";
        "fruit:wipe_intentionally_left_blank_rfork" = "yes";
        "fruit:delete_empty_adfiles" = "yes";
        "fruit:posix_rename" = "yes";
        "fruit:zero_file_id" = "yes";
        "fruit:encoding" = "native";
        "fruit:time machine" = "yes";
        "readdir_attr:aapl_max_access" = "no";
        "readdir_attr:aapl_finder_info" = "no";
        "readdir_attr:rsize" = "no";
        "veto files" = "/._*/.DS_Store/";
        "delete veto files" = "yes";
        "use sendfile" = "yes";
        "spotlight backend" = "tracker";
      };

      private = {
        "path" = "/nexus";
        "browsable" = "yes";
        "read only" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "brain";
        "force group" = "users";
      };
    };
  };

  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };

  networking.firewall.enable = false;
  networking.firewall.allowPing = true;
}
