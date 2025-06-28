{ lib, config, ... }:

{

  options.git.enable = lib.mkEnableOption "Enable git module";

  config = lib.mkIf config.git.enable {

    programs.git = {
      enable = true;
      userName = "Evsey Kazansky";
      userEmail = "67639168+scaik@users.noreply.github.com";

      delta.enable = true;

      signing = {
        signByDefault = true;
        format = "ssh";
        key = "~/.ssh/gh.pub";
      };

      extraConfig = {
        core = {
          compression = 9;
          whitespace = "error";
          preloadindex = true;
        };
        advice = {
          addEmptyPathspec = false;
          pushNonFastForward = false;
          statusHints = false;
        };
        init.defaultBranch = "main";
        status = {
          branch = true;
          showStash = true;
          showUntrackedFiles = "all";
        };
        diff = {
          context = 3;
          renames = "copies";
          interHunkContext = 10;
        };
        commit.template = "~/.gitmessage";
        push = {
          autoSetupRemote = true;
          default = "current";
          followTags = true;
        };
        pull = {
          default = "current";
          rebase = true;
        };
        rebase = {
          autoStash = true;
          missingCommitsCheck = "warn";
        };
        log = {
          abbrevCommit = true;
          date = "relative";
          follow = true;
        };
        branch.sort = "-committerdate";
        tag.sort = "-taggerdate";
        gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";

        "url \"git@github.com:scaik/\"".insteadOf = "me:";
        "url \"git@github.com:\"".insteadOf = "gh:";
      };
    };

    home.file.".gitmessage".text = ''
      # ✨ feat:
      # 🐛 fix:
      # ♻️ refactor:

      # ⚡ perf:
      # 🎨 style:
      # 🚨 test:
      # 📚 docs:
      # 👷 build:
      # 💚 ops:
      # 🔧 chore:

      # 🎉 initial commit
    '';

    home.activation.generateAllowedSigners = lib.hm.dag.entryAfter [ "writeFiles" ] ''
      GH_PUB_KEY=$(tr -d '\n' < "${config.home.homeDirectory}/.ssh/gh.pub")
      echo "* $GH_PUB_KEY" > "${config.home.homeDirectory}/.ssh/allowed_signers"
      chmod 600 "${config.home.homeDirectory}/.ssh/allowed_signers"
    '';

    programs.ssh = {
      enable = true;
      extraConfig = ''
        Host github.com
            IdentityFile ~/.ssh/gh
      '';
    };

  };

}
