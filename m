Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9C0606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 05:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gxQaG452
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qkLQzAOKh39KdTRpkQJLElksJFCsbYETiz/YkICCEb0=; b=gxQaG452wKM1hmzGzMWXdlx3og
	+KUgU+33OuidgSNOmlHIyYHI05ScXhp6qHSFe0SY4/leh9EE3yYFQVPNq8Y3FcIYszXeCLVxnhjnK
	Ir566Vf3S0TF5EBQNtXLwAeEJW5BLfT32Pe6azIHk/bHhVYWb/Hl+uA0IQJBimDPQhNQdDuvIg3rB
	HoKTHP+pwBBeKQ9kZAX0aIpeBGyraufiuP1AsGySyqK0+yjT9mrmfGZ5k4pZlk9QC4lWo6sVPdSb2
	sSJI/SPK4107GVWrSchh0EgZQ3NSEM9OKsFGYbBo/cCbJ51jttR0yvloPsZO5RciBZTiX4zYM+BQL
	BGSclegQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV0UM-00000000kur-1kWI;
	Sun, 22 Nov 2026 05:51:46 +0000
Received: from mail.hit.edu.cn ([202.118.224.62])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV0UG-00000000kuC-2Tnz;
	Sun, 22 Nov 2026 05:51:44 +0000
Received: from 220110626hanxuechao$alu.hit.edu.cn ( [219.223.233.19] ) by
 ajax-webmail-mail-appserver03 (Coremail) ; Sun, 22 Nov 2026 13:51:27 +0800
 (GMT+08:00)
Date: Sun, 22 Nov 2026 13:51:27 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: 220110626hanxuechao@alu.hit.edu.cn
To: linux-rockchip@lists.infradead.org
Cc: "Heiko Stuebner" <heiko@sntech.de>,
	"Liu Changjie" <liucj1228@outlook.com>,
	"Alexey Charkov" <alchark@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC] arm64: dts: rockchip: rk3576-lckfb-tspi-3m: sdmmc0_det_l
 question
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2026.2-cmXT5 build
 20261015(8d7e304b) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-0670b814-d594-4118-92e0-dc1bc2f00e12-hit.edu.cn
X-CM-CTRLMSGS: =?B?4U4dcjiH6nJ5xwDR7hwMki1N8jM=
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <5e6ebf68.3773.1a201cf3894.Coremail.220110626hanxuechao@alu.hit.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: P0WgCgDXlYffggJrW6MxAA--.1562W
X-CM-SenderInfo: yssqiiaqwslx5dq03vpfkd0qhdoxhxllwovvfxof0/1tbiAgQTAGs
	BgIcYVgAFsz
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_215141_059857_7F3AAEAD 
X-CRM114-Status: UNSURE (   3.72  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.2 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FROM_STARTS_WITH_NUMS,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgSGVpa28sIExpdSBDaGFuZ2ppZSwKCkkgaGF2ZSBhIHF1ZXN0aW9uIGFib3V0IHRoZSBTRCBj
YXJkIGRldGVjdCBjb25maWd1cmF0aW9uIG9mIHRoZSBMQ0tGQgpUYWlzaGFuIFBpIDNNLgoKVGhl
ICZzZG1tYyBub2RlIHVzZXMgdGhlIGJvYXJkLXNwZWNpZmljIHNkbW1jMF9kZXRfbCBncm91cDoK
CiAgICBzZG1tYyB7CiAgICAgICAgc2RtbWMwX2RldF9sOiBzZG1tYzAtZGV0LWwgewogICAgICAg
ICAgICByb2NrY2hpcCxwaW5zID0gPDAgUktfUEE3IFJLX0ZVTkNfR1BJTyAmcGNmZ19wdWxsX3Vw
PjsKICAgICAgICB9OwogICAgfTsKCndoaWNoIG11eGVzIEdQSU8wX0E3IGFzIGEgR1BJTywgbWF0
Y2hpbmcKCiAgICBjZC1ncGlvcyA9IDwmZ3BpbzAgUktfUEE3IEdQSU9fQUNUSVZFX0xPVz47CgpU
aGUgU29DIGR0c2kgYWxyZWFkeSBwcm92aWRlcyBzZG1tYzBfZGV0IGZvciB0aGUgc2FtZSBwaW4s
IHVzaW5nIHRoZQpTRE1NQzBfREVUbiBmdW5jdGlvbiBpbnN0ZWFkOgoKICAgIHNkbW1jMF9kZXQ6
IHNkbW1jMC1kZXQgewogICAgICAgIHJvY2tjaGlwLHBpbnMgPSA8MCBSS19QQTcgMSAmcGNmZ19w
dWxsX3VwPjsKICAgIH07CgphbmQgb3RoZXIgUkszNTc2IGJvYXJkcyB1c2UgaXQgdG9nZXRoZXIg
d2l0aCBjZC1ncGlvcywgZm9yIGV4YW1wbGUKcmszNTc2LWV2YjEtdjEwLmR0cyBhbmQgcmszNTc2
LWV2YjItdjEwLmR0cy4gQm90aCBncm91cHMgY29uZmlndXJlIHRoZQpzYW1lIHBpbiB3aXRoIHRo
ZSBzYW1lIHB1bGwtdXA7IG9ubHkgdGhlIHBpbiBmdW5jdGlvbiBkaWZmZXJzLgoKSSB0ZXN0ZWQg
dGhlIG5vZGUgYmVsb3cgb24gYSBUYWlzaGFuIFBpIDNNIHdpdGggbWFpbmxpbmUgdjcuNC1yYzIs
CmkuZS4gd2l0aCBzZG1tYzBfZGV0IGluc3RlYWQgb2Ygc2RtbWMwX2RldF9sIGFuZCBjZC1ncGlv
cyB1bmNoYW5nZWQsCmFuZCBjYXJkIGluc2VydGlvbiBhbmQgcmVtb3ZhbCBhcmUgc3RpbGwgZGV0
ZWN0ZWQgY29ycmVjdGx5OgoKICAgICZzZG1tYyB7CiAgICAgICAgYnVzLXdpZHRoID0gPDQ+Owog
ICAgICAgIGNhcC1zZC1oaWdoc3BlZWQ7CiAgICAgICAgY2QtZ3Bpb3MgPSA8JmdwaW8wIFJLX1BB
NyBHUElPX0FDVElWRV9MT1c+OwogICAgICAgIGRpc2FibGUtd3A7CiAgICAgICAgbWF4LWZyZXF1
ZW5jeSA9IDw1MDAwMDAwMD47CiAgICAgICAgbm8tbW1jOwogICAgICAgIG5vLXNkaW87CiAgICAg
ICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKICAgICAgICAvKiBHUElPMF9CNi9TRE1NQzBf
UFdSRU4gaXMgbm90IGNvbm5lY3RlZCBvbiB0aGlzIGJvYXJkLiAqLwogICAgICAgIHBpbmN0cmwt
MCA9IDwmc2RtbWMwX2NsayAmc2RtbWMwX2NtZCAmc2RtbWMwX2RldCAmc2RtbWMwX2J1czQ+Owog
ICAgICAgIHZtbWMtc3VwcGx5ID0gPCZ2Y2NfM3YzX3MwPjsKICAgICAgICB2cW1tYy1zdXBwbHkg
PSA8JnZjY2lvX3NkX3MwPjsKICAgICAgICBzdGF0dXMgPSAib2theSI7CiAgICB9OwoKQ291bGQg
eW91IGV4cGxhaW4gdGhlIHJlYXNvbmluZyBiZWhpbmQgdXNpbmcgc2RtbWMwX2RldF9sIGluc3Rl
YWQgb2YKc2RtbWMwX2RldCBoZXJlPyBDYXJkIGRldGVjdGlvbiBhbHNvIHdvcmtzIHdpdGggc2Rt
bWMwX2RldCBpbiBteQp0ZXN0aW5nLCBzbyBJIHdvdWxkIGxpa2UgdG8gdW5kZXJzdGFuZCB3aGV0
aGVyIHRoZSBib2FyZC1zcGVjaWZpYwpncm91cCBpcyByZXF1aXJlZCBvciBqdXN0IGEgcHJlZmVy
ZW5jZS4KClRoYW5rcywKWHVlY2hhbyBIYW4=

