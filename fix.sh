#!/bin/bash

# --- Configuration ---
FILE_LINKS=(
  "https://github.com/handingslider/duchamp_focaltech_dt2w/raw/refs/heads/main/focaltech_touch.ko"
  "https://github.com/handingslider/duchamp_focaltech_dt2w/raw/refs/heads/main/xiaomi_touch.ko"
  # Add more raw file links here
)
LOCAL_PATH="/vendor_dlkm/lib/modules"
TEMP_DIR=$(mktemp -d)
SUDO_USER="$USER" # Default to the current user for su -c

# --- Functions ---

log_info() {
  echo "[INFO] $1"
}

log_error() {
  echo "[ERROR] $1" >&2
}

check_dependencies() {
  if ! command -v wget &> /dev/null; then
    log_error "Error: wget is not installed. Please install it."
    exit 1
  fi
}

download_and_copy() {
  local file_link
  for file_link in "${FILE_LINKS[@]}"; do
    local filename=$(basename "$file_link")
    local temp_file="$TEMP_DIR/$filename"
    local target_file="$LOCAL_PATH/$filename"

    log_info "Downloading: $file_link to $temp_file"
    if wget -q "$file_link" -O "$temp_file"; then
      log_info "Copying: $temp_file to $target_file using su"
      if su -c "cp -f '$temp_file' '$target_file'" "$SUDO_USER"; then
        log_info "Successfully downloaded and copied: $target_file"
      else
        log_error "Error copying with su: $temp_file to $target_file"
      fi
    else
      log_error "Error downloading: $file_link"
    fi
  done
}

cleanup() {
  log_info "Cleaning up temporary directory: $TEMP_DIR"
  rm -rf "$TEMP_DIR"
}

# --- Main Script ---

check_dependencies
download_and_copy
cleanup

exit 0
