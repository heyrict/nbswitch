NBSWITCH
===
Helper script for switching between bbswitch(bumblebee) and nvidia prime offloading.

Bumblebee is an excellent program being able to turn off the power of
your discrete nvidia card to extend you battery life,
while as the time of writing, *Steam* does not support starting a game with
bumblebee's `primusrun` or `pvkrun`.
Switching to nvidia prime offloading is required
for a better gaming experience.

- bumblebee
    - [x] can switch off nvidia card for power saving
    - [x] vulkan support
    - [x] cuda support
    - [ ] steam support
- nvidia prime offloading
    - [ ] can switch off nvidia card for power saving
    - [x] vulkan support
    - [x] cuda support
    - [x] steam support

Besides, some specific software does not work under nvidia driver or nouveau driver.

## Prerequisitories
Bumblebee should be correctly or partially setup.
My config files can be found under [./config folder](./config)

Check the PCI BUSID for your iGPU and dGPU with `lspci`, and overwrite those in `./config/xorg/50-prime-offload.conf`

## Usage
The script should run with **NO X server** running.
Ensure that you are using `ttyX` instead of the terminal emulator under X.
If X is loaded, you will get you screen freezed or other unexpected behaviors.

1. Shutdown X server.

    ```bash
    # Depending on your distribution, the X server may differ.
    # Kill the X server itself
    pkill Xorg
    # , or kill the display manager.
    sudo service gdm stop
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

1. Restart X server.

    ```bash
    # Depending on your distribution, the X server may differ.
    startx
    # You can start the display manager of your own favor.
    sudo service gdm start
    ```
