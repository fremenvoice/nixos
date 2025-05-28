{
  disko.devices = {
    disk = {
      sda = {
        type = "disk";
        device = "/dev/sda"; # проверь lsblk — это должен быть твой системный диск!
        content = {
          type = "gpt";
          partitions = {
            esp = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            swap = {
              size = "34G"; # чуть больше RAM (32 ГБ)
              type = "8200";
              content = {
                type = "swap";
                resumeDevice = true;
                label = "swap";
              };
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };
    };
  };
}
