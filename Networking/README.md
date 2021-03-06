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

## Subnetting

Process of taking a very large network and splitting it up into many individual and smaller subnetworks

An example of a subnet mask:

255.255.255.0 -> 11111111 11111111 11111111 00000000, means that only 2^8 bits are available for host networking, shorthand way to write this is (your ip)/24, where 24 is the number of 1s in the subnet mask

Link to calculate subnet, subnet range<b/> 
https://www.pluralsight.com/blog/it-ops/simplify-routing-how-to-organize-your-network-into-smaller-subnets

## Simple binary math

x bit can represent 2^x numbers.

Two most important operators are AND and OR.

`OR`<b/>
If x OR y is true, then z is true

`AND`<b/>
If x and y is true, then z is true

## CIDR

Classless inter domain routing. Uses the (ip)/xx format to determine how many host networks are available and not through network classes

## Routing

Basic routing steps:

1) Receive the data packet
2) examines the destination ip address
3) looks up ip destination network in routing table
4) forwards traffic to destination

## Routing tables

1) destination network
2) next hop - ip address of the computer intended to receive for the destination network
3) total hops - keep track of how far destination is and decides best path
4) interface

## Non Routable address space

1) 10.0.0.0/8
2) 172.16.0.0/12
3) 192.168.0.0/16

All 3 are available for use in internal network. Routed by interior gateway protocols but not exeterior gateway protocols

## Ports

Transport layer handles multiplexing and demultiplexing through ports. Ports are 16 bit numbers.

## Three way handshake

Control flags:

1) URG - urgent (1/0)
2) ACK - acknowledge
3) PSH - push (transmitting device wants the receiving device to push currently buffered data to the application on the receiving end as soon as possible)
4) RST - reset (One of the sides of TCP hasn't been able to properly recover from a series of missing or malformed segments)
5) SYN - synchronize (Used when establishing a TCP connection and makes sure the receiving end knows to examine the sequence number field)
6) FIN - finish (no more data to be send, connection can be close)

Computer A is transmitting device. Computer B is receving device

1) Computer A sends a TCP segment with a SYN flag send, tells B where the sequence number starts
2) Computer B sends back a TCP segment with a SYN and ACK flag, acknowledge sequence number
3) Computer A sends back a segment with an ACK flag set.

Connection establish, start sending data! Ensures that they are speaking the same protocol and are able to understand each other.

## 4 way handshake (closing connection)

Computer B wants to close.

1) computer B sends a FIN flag.
2) computer A sends back a segment with an ACK flag.
3) if computer A is ready to close a connection, it responds back with an FIN flag
4) computer B responds back with an ACK flag to close

## TCP sockets

1) LISTEN
2) SYN_SENT
3) SYN-RECEIVED
4) FIN_WAIT
5) CLOSE_WAIT
6) CLOSED

## UDP (connectionless protocol)

Used to send data that is not crucial to have all data to be received. Does not establish a connection through the various handshakes. Does not incur the overhead of redundant data to ensure connection is established through the various handshake models.

## Firewall

A device that blocks traffics that meets certain criteria. Block and allow traffic to certain ports on network level.
