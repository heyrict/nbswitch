NVIDIA-COMPLEX
===
Helper script for switching between bbswitch(bumblebee) and nvidia.

Sometimes we want to switch off bbswitch ( or bumblebee ) for some reasons.
There are some major features for bumblebee and nvidia

- bbswitch
    - [x] can switch off nvidia card for power saving
    - [ ] vulkan support
    - [x] cuda support
- nvidia
    - [ ] can switch off nvidia card for power saving
    - [x] vulkan support
    - [x] cuda support

Besides, some specific software does not work under nvidia driver or nouveau driver.

## Prerequisitories
Bumblebee should be correctly or partially setup.
My config files can be found under [./config folder](./config)

## Usage
The script should run with you display manager unloaded.
Ensure that you are using `ttyx` instead of the terminal emulator under X.
If display manager is loaded, you will get you screen freezed or other unexpected behaviors.

1. Shutdown X server.

    ```bash
    # Depending on your distribution, the X server may differ.
    # The most used display managers are lightdm and gdm(gdm3)
    sudo service lightdm stop
    ```

1. Switching

    ```bash
    # To disable bbswitch and enable nvidia driver
    sudo make on
    # To enable bbswitch & bumblebee
    sudo make off
    # To inspect current status
    make show
    ```
