# Source nvm installation
export NVM_DIR="$HOME/.config/nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
  source "$NVM_DIR/nvm.sh"
else
  echo "nvm not installed, skipping"
fi

# Source ROS files if they exist
if [ -e /opt/ros/galactic/setup.zsh ]; then
  source /opt/ros/galactic/setup.zsh
else
  echo "ROS Galactic setup file not found, skipping"
fi
if [ -e ~/Repos/open_vins_ws/install/setup.zsh ]; then
  source ~/Repos/open_vins_ws/install/setup.zsh
else
  echo "OpenVINS setup file not found, skipping"
fi

# Add zsh completions
eval "$(register-python-argcomplete3 ros2)"
eval "$(register-python-argcomplete3 colcon)"

# Temporary fix for running ROS containers
ulimit -n 1024
