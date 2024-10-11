#!/usr/bin/env sh

#
# This script reports network statistics.
#
#
# Example telegraf.conf input:
#
# [[inputs.exec]]
#     name_override = "host_net"
#     commands = ["/path/to/script/hostnet.sh"]
#     timeout = "5s"
#     data_format = "json"
#     tag_keys = ["interface"]

HOSTFS="${HOST_MOUNT_PREFIX}"

# ignore lo and veth interfaces (optional)
INTERFACES=$(ls "$HOSTFS/sys/class/net/"|grep -v -e 'lo' -e 'veth' -e 'br-' -e 'docker')

for IFACE in ${INTERFACES}
do
  INTERFACE="$IFACE"
  BYTES_SENT=$(cat $HOSTFS/sys/class/net/$IFACE/statistics/tx_bytes)
  BYTES_RECV=$(cat $HOSTFS/sys/class/net/$IFACE/statistics/rx_bytes)
  PACKETS_SENT=$(cat $HOSTFS/sys/class/net/$IFACE/statistics/tx_packets)
  PACKETS_RECV=$(cat $HOSTFS/sys/class/net/$IFACE/statistics/rx_packets)
  ERR_IN=$(cat $HOSTFS/sys/class/net/$IFACE/statistics/tx_errors)
  ERR_OUT=$(cat $HOSTFS/sys/class/net/$IFACE/statistics/rx_errors)
  DROP_IN=$(cat $HOSTFS/sys/class/net/$IFACE/statistics/tx_dropped)
  DROP_OUT=$(cat $HOSTFS/sys/class/net/$IFACE/statistics/rx_dropped)

  if [ -z != ${BYTES_SENT} ] &&
     [ -z != ${BYTES_RECV} ] &&
     [ -z != ${PACKETS_SENT} ] &&
     [ -z != ${PACKETS_RECV} ] &&
     [ -z != ${ERR_IN} ] &&
     [ -z != ${ERR_OUT} ] &&
     [ -z != ${DROP_IN} ] &&
     [ -z != ${DROP_OUT} ]
  then
    JSON=$(echo "${JSON}{\"interface\":\"${IFACE}\",\"bytes_sent\":${BYTES_SENT},\"bytes_recv\":${BYTES_RECV},\"packets_sent\":${PACKETS_SENT},\"packets_recv\":${PACKETS_RECV},\"err_in\":${ERR_IN},\"err_out\":${ERR_OUT},\"drop_in\":${DROP_IN},\"drop_out\":${DROP_OUT}},")
  fi
done

# Remove trailing comma on last item.
JSON=$(echo ${JSON} | sed 's/,$//')

echo [${JSON}] >&1
