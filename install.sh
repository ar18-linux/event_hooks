#!/bin/bash

set -e
set -x

if [[ "$(whoami)" != "root" ]]; then
  read -p "[ERROR] must be root!"
  exit 1
fi

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

. "${script_dir}/vars"

mkdir -p "${install_dir}"

rm -rf "${install_dir}/${module_name}"
cp -rf "${script_dir}/${module_name}" "${install_dir}/${module_name}"
chmod +x "${install_dir}/${module_name}/"* -R

rm -f "/etc/acpi/actions/headphone-jack-handler.sh"
mkdir -p "/etc/acpi/actions"

cp "${install_dir}/${module_name}/handlers/"* "/etc/acpi/actions"
cp "${install_dir}/${module_name}/events/"* "/etc/acpi/events"

systemctl restart acpid
