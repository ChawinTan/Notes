# Networking 

## 5 layer model/Tcp-ip

1) The physical layer

Physical devices of the computer that interconnect computers - etc  specifications, cables

2) Datalink layer/network access layer

Responsible for defining a common way of interpreting these signals so network devices can communicate - eg, ethernet standard define a protocol for getting data to nodes on the same network or link

3) Network Layer/internet layer

Allows different networks to communicate with each other through devices known as routers. An internetwork is a collection of networks connected together through routers, for example the internet. Responsible for getting data delivered across a collection of network. Protocol used - IP/internet protocol

4) Transport layer

Sorts out which client and server programs are supposed to get that data. Protocls on this layer include TCP and UDP. TCP has instructions that ensures data is reliably delivered while UDP does not.

5) Application layer

Applications. Protocols include HTTP, for example.

## Cables

Copper - Cat 5, 5e, 6 cables. Cat 5e and 6 have more stringent requirements and reduce cross talk.
Fibre - use light to represent binary data

## Routers

Router is a device that can forward data between independent network. Operates at layer 3.

## Servers and client

What it is called depends on its purpose of existance.

## Ethernet and MacAddresses

CSMA/CD is used to determine when the communications channels are clear, and when a device is free to transmit data. Each device in the collision domain waits for a random amount of time before sending data again.

MAC address = media access control address. It is a globally unique identifier attached to an individual network interface. A 48 bit number. The first 3 octets of a mac address are known as OUI (organizationally unique identifier). (manufactuarer:product)

Ethernet uses Mac addresses to ensure that the data it sends has both an address for the machine that sent the transmission and the machine that the transmission was intended to receive.

## Unicast Multicast and Broadcast

A unicast transmission is always meant for just one receiving address. Represented by setting the least significant bit in the first octet of a destination address to 0.

If the least significant bit in the first octet of a destination address is set to one, it is a multicast frame. Can accepted or discarded base on criteria other than Mac Addresses.

Broadcast is sent to all devices on the lan. Ethernet broadcast address is all Fs.


Ethernet itself only reports on data integrity, not recovery.

## IP Address (ipv4)

32 bit long numbers made up of 4 octects of 8 bits. Biggest number is 2^8-1(255).  IP addresses belong to networks, not devices attached to networks. Static ip addresses are reserved for servers and network devices while dynamic ip addresses are reserved for clients.

Ip datagram - header and payload

Can be split into networkId and the hostId. NetworkId can be up to the first 3 number, depending on class, remaining for hostId. class A - (0-126), class B - (128-191), class C - (192-224). classs D - (224-239), used for multicasting, class E - remaing, used for testing

## ARP

Address resolution protocol

Arp table - list of ip addresses(network) and mac addresses(hardware) associated with them
