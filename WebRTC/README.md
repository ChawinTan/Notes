# WebRTC

Concepts on WebRTC

## Codecs

Codecs are compression technologies that have 2 components:

- Encoders to compress
- Decoders to decompress

There are codecs for different types of streams:

- Data (PKZIP)
- Images (JPEG, GIF, PNG)
- Audio (MP3, AAC)
- Video (Cinepack, MPEG-2, H.264, VP8)

There are 2 kinds of Codecs:

- lossy
- lossless

Lossless codecs return the exact same file after decompression.
Lossy codecs would cause a lose of quality after decompression. Intra frame is more effecient than interframe, hence most codecs are designed to look out for redundancies.

Most codecs today use I-frame, P-frame and B-frames.

Containers are not the same as codecs. Codec is an algorithm used for compression and decompresion while containers hold the compressed video. Containers take care of packaging, transport and presentation and are represented by file extensions.

Most codecs today on the web are H.264

## Stun and Turn servers

Stun and turn servers are used for `NAT` traversals.

Most of us are browsing websites behind firewalls or `NAT` that mask our ip addresses. Stun and turn servers are used to overcome this issue by helping users discover their mapped public ip addresses used for `UDP` flows to remote host.

If `ICE` negotiation fails, then a `TURN` server is used to relay media through a public server.

`ICE` uses both STUN and TURN protocols

## Basic scheme of WebRTC

1. Media capture - get permission from user to access the devices and manage the streams
2. Encoding - use of codecs to compress/decompress media while sending them over the internet
3. Transport layer - manages the order of packets and deal with packet loss
4. Session management - deals with managing, opening and organizing connections. Also known as signaling.

## WebRTC architecture

![ClientView](architecture.jpg)

## WebRTC API

1. RTCPeerConnection
2. MediaStream
3. RTCDataChannel

`RTCPeerConnection` object is the main entry point to the WebRTC API. It connects us to peers, initialize connections and attach media streams. It's main task is to set up and create a peer connection. This object fires a set of events as they appear and gives us access to the configuration of our connection.

To create,

```
var conn = new RTCPeerConnection(conf);

conn.onaddstream = function(stream) {
   // use stream here
};
```

config argument contains at least one key, `iceServers`. It is an array or url objects containing information about turn and stun servers.

`onaddstream` is fired when remote user adds a video or audio stream to their peer connection.

[Link](https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection) to various methods of rtcPeerConnection

`MediaStreamApi` gives developers access to stream objects representing video and audio streams, manages selection of user input devices, gives user a level of security as it gives users a choice whether to share his device or not.

[Link](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream) to various methods and events of mediaStream

`navigator.getUserMedia`

`RTCDataChannel` object allows sending of additional data other than media streams.

```
var peerConn = new RTCPeerConnection();

//establishing peer connection
//...
//end of establishing peer connection
var dataChannel = peerConnection.createDataChannel("myChannel", dataChannelOptions);

// here we can start sending direct messages to another peer
```

[Link](https://developer.mozilla.org/en-US/docs/Web/API/RTCDataChannel) to various methods of rtcDataChannel

## Signalling and negotiation

Steps:

1. Create a list of potential candidates for a peer connection
2. User/application selects a user to make a connection with
3. Signalling layer notifies another user that some one wants to make a connection and waits for his decision
4. Once accepted, the initiating user makes a RTCPeerConnection with another user.
5. Both users exchange software and hardware information through signalling server.
6. Both users exchange location information.
