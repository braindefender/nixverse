{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ copyparty ];

  services.copyparty = {
    enable = true;

    user = "brain";
    group = "users";

    settings = {
      i = "0.0.0.0";
      p = [ 3210 3211 ];
      no-reload = true;
      ignored-flag = false;
    };

    accounts = {
      brain = {
        # provide the path to a file containing the password, keeping it out of /nix/store
        # must be readable by the copyparty service user
        passwordFile = "/home/brain/copyparty/password";
      };
    };

    volumes = {
      "/" = {
        path = "/nexus";
        access = {
          r = "*";
          A = [ "brain" ];
        };
        flags = {
          # "fk" enables filekeys (necessary for upget permission) (4 chars long)
          fk = 4;
          # scan for new files every 60sec
          scan = 60;
          # volflag "e2d" enables the uploads database
          e2d = true;
          # "d2t" disables multimedia parsers (in case the uploads are malicious)
          d2t = true;
        };
      };
    };

    openFilesLimit = 8192;
  };

  # users.users.copyparty.extraGroups = [ "users" ];

  systemd.services.copyparty.serviceConfig.AmbientCapabilities = "CAP_NET_BIND_SERVICE";
}
