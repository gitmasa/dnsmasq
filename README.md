## dnsmasq fork with wildcard dns

仮想マシンネットワークなど、ローカルIPのドメイン設定時、xip.ioやnip.io等のドメインを設定することが多いと思います。
これらをssl化することは簡単ではないですが、ワイルドカード証明書と、このdnsmasqを利用することで、いちいちDNSに登録
しなくてもいいというメリットを活かしつつ、SSL化することができます。

When setting the domain of the local IP such as the virtual machine network,
You often sets domains such as xip.io and nip.io.
It is not easy to use ssl, but by using wildcard certificate and this dnsmasq,
You can make it SSL without register in DNS.


### case1
 同一階層のみのワイルドカード証明書(ex:*.example.com)を使う場合  
 When using a wild card certificate (ex: *. Example.com) of only the same hierarchy.

* dnsmasq.conf
```
 wildcard-domain=example.com
```
* hostname pattern
```
 # SERVICE-UNDERSCORE_IP.example.com

 ex1) http-192_168_0_1.example.com
 ex2) test-192_168_0_1.example.com
 ex3) 192_168_0_1.example.com

```

### case2
 マルチ階層のワイルドカード証明書(ex:example.com)を使う場合  
 When using multi-level wild card certificate (ex: example.com)

* dnsmasq.conf
```
 wildcard-domain=example.com
```
* hostname pattern
```
 # SERVICE-IP.example.com
 or
 # SERVICE.IP.example.com

 ex1) http-192.168.0.1.example.com
 ex2) test.192.168.0.1.example.com
 ex3) 192.168.0.1.example.com

```

