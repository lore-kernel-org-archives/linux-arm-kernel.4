Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA27D606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 09:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oKiLvr9s;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=UWnIVu4l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FLTgX6LXmfZbFelzTi0LMWJd4LIKhoEfobITuQk3Lys=; b=oKiLvr9sj03VZk
	AT35m4fDAw532HYsthypEO0FLgwM/xBqUkijes/FCANpWxO926Xhfyna5ZqzaBz2LJlr2ZYL0B+j9
	OB1j128edG3Nja4EmKtU80Raa5MJgsg8PXaclmPIfAfAeQ2Ln/RXFs5RdgaXgjWWVocaXmhq8vpqB
	I6UBGc9ODS0GP+l/M8w51x0r8hrbilPEKSrOLwtF7oFG3MZpQFracPunhIaCEsgQZaEBgR8OYHhWX
	HG79gfK89CjDeL0CiQf6tAfml1eP3Bc6gCKMqKEdmJOTG6/ExL38xLW++ZiWjnFxbszurDWJPc+Ux
	+FswNwqRtLCCtryPw6fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnRb-0000000CCZ8-49pH;
	Fri, 13 Nov 2026 09:19:40 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.48])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnRX-0000000CCXt-1AHR;
	Fri, 13 Nov 2026 09:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794561570; bh=FLTgX6LXmfZbFelzTi0LMWJd4LIKhoEfobITuQk3Lys=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=UWnIVu4lhrn12D3GDRA1T/IpcrZATfsAZKhHh1RBcmU32Zq41Z/C31Srj3Ou4Uf/k
	 OI4h9p8Dwg9Uc2z69vGurDAWcnX0hcdRbqDXduvSb4cIkHxJbhKPQCAsI32Cagub2E
	 PmIYoeKahTWwzJGjWxisKNlYBuh+ZerWGjR4W8iM=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-XMAILINFO: Nc4sSaQs5LhjhuwfxraDTfC6XJ/Rq8jVRZP+R02RkzswqGKmXwU+qN/L8r8TM0
	 ww6H5yShFksTHfz6DZtO/O4eW58x8upCQL3BaNjMQ2MMIK93ee9tbGTT4cu5UvBop/m/SQZcEFbvy
	 s5KQDYRHQqxrpitZIqhfWE+2edJnrhVyf/3xKXDSGu6Ilvoz9yUgX+UrbaI6i4Z0KOOa7jGFK8m0h
	 hcXUkDgdlETV7YgTdI4PCKNwS0glh3eAouEq9foflNg0BxVPSRY6fqoH863nEDLs2Nt22DtsevRZn
	 nSVa7F8qFQzkXPCzNmaFivG6qlECtvkPDLG6+q7gElMzz3RIkqu1QINE/BLMt9N2cxJaTULz+O/o4
	 unZ2pTu2f7Ocz/sphtnjd+///icmb+/Ve+GUhBQ62OlBKzh0lEOS7EBEYV2wtFgewLmT0rzaK0SDD
	 2VpisKVUmOwi9HMsLWmBOeZqP0Tc1QHA1S6erwXfazW0lTFQnpNh+fQXGTunlSsOPYsaVQo12mtwK
	 lPieW/Mm8rPIIqoov/MNBd+7T4UFGW4ixL6sXQm2nCmYEYhjq+LpkHQCI1LGg/zwaHDtbRT52R+vp
	 bRG1w19lQStBXkNOEjAnYcDcpkVKu5pHzXwUs54Yhb6zRdRZOrKq7DODU+t5Di4qUgYLfKwiegaa5
	 Q/b7I9DAQyb6oPmhtbRzVyZwsmESwjIXMKdCWQ00c9MenbK3HG3E22/kSB3Zzdf64REnXz9+CY6Rn
	 RBAKCHxux0VZybjWAVBCYgowHGKGwbIq2nwy8kSnfsDEt55K9N64rVryLMZy8mI3gnfaeTwpef04w
	 DLtoG8XgS5dfPYfx5kX/m5zfw95aKe+Th8/33pA/qrEoX9wG7gUlTWypkiaSBR9mfn37sgwE1eW9T
	 tMXBzbotnsecZp5cqfOIg8uQd+2ZF0FYbnoHUiCoAqcq+cBAiUasy3RsJgycwOTJjnyzMykMyhKki
	 IcAtNdWglbcy0TT3ZP6HUq8PSZ2orbedL9sl/ZFCJnv4MjUx5twYWTxA5r8NzpTPeTirXQMmaT7j/
	 WPBGvl4jiQeTL9H4b7fphUfA11dsTqP3HDSGEp7RAgjek8JY=
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?TWF4aW1lIENoZXZhbGxpZXI=?=" <maxime.chevallier@bootlin.com>, "=?utf-8?B?QW5kcmV3IEx1bm4=?=" <andrew+netdev@lunn.ch>, "=?utf-8?B?RGF2aWQgUy4gTWlsbGVy?=" <davem@davemloft.net>, "=?utf-8?B?RXJpYyBEdW1hemV0?=" <edumazet@kernel.org>, "=?utf-8?B?SmFrdWIgS2ljaW5za2k=?=" <kuba@kernel.org>, "=?utf-8?B?UGFvbG8gQWJlbmk=?=" <pabeni@redhat.com>, "=?utf-8?B?Um9iIEhlcnJpbmc=?=" <robh@kernel.org>, "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzk+dt@kernel.org>, "=?utf-8?B?Q29ub3IgRG9vbGV5?=" <conor+dt@kernel.org>, "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko@sntech.de>, "=?utf-8?B?RGF2aWQgV3U=?=" <david.wu@rock-chips.com>, "=?utf-8?B?QWxleGFuZHJlIFRvcmd1ZQ==?=" <alexandre.torgue@foss.st.com>, "=?utf-8?B?R2l1c2VwcGUgQ2F2YWxsYXJv?=" <peppe.cavallaro@st.com>, 
	"=?utf-8?B?Sm9zZSBBYnJldQ==?=" <joabreu@synopsys.com>, "=?utf-8?B?TWF4aW1lIENvcXVlbGlu?=" <mcoquelin.stm32@gmail.com>
Cc: "=?utf-8?B?bmV0ZGV2?=" <netdev@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bGludXgtc3RtMzI=?=" <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: rockchip-dwmac: Add RK3572
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Fri, 13 Nov 2026 17:19:28 +0800
X-Priority: 3
Message-ID: <tencent_407EF44D1A34A432300969237F012088F708@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261111-add-board-ok3572-c-net-v2-0-304466394970@qq.com>
 <20261111-add-board-ok3572-c-net-v2-1-304466394970@qq.com>
	<85370a77-e2ef-4eae-96f0-7f591625f47d@bootlin.com>
In-Reply-To: <85370a77-e2ef-4eae-96f0-7f591625f47d@bootlin.com>
X-QQ-mid: xmsezb41-0t1794561568tn9q43j08
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_011935_861845_C3D5494E 
X-CRM114-Status: GOOD (  15.81  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCgo+ID7CoEFkZMKgdGhlwqByb2NrY2hpcCxyazM1NzItZ21hY8KgY29tcGF0aWJsZcKg
d2l0aMKgdGhlwqBzbnBzLGR3bWFjLTQuMjBhCj4gPsKgZmFsbGJhY2vCoGFuZMKgcmVxdWly
ZcKgcm9ja2NoaXAscGhwLWdyZi4KPiA+wqAKPiA+wqBTaWduZWQtb2ZmLWJ5OsKgQ3VuaGFv
wqBMdcKgPDE1Nzk1Njc1NDBAcXEuY29tPgo+ID7CoC0tLQo+ID7CoENoYW5nZXPCoGluwqB2
MjoKPiA+wqAtwqBBZGTCoFJLMzU3MsKgdG/CoHRoZcKgc2hhcmVkwqBTeW5vcHN5c8KgY29t
cGF0aWJsZcKgbGlzdMKgZm9ywqBjb25zaXN0ZW5jeS4KPgo+IFRoaXPCoGRvZXNuJ3TCoGFk
ZHJlc3PCoEFuZHJldydzwqByZXF1ZXN0wqB0b8KgZGVwcmVjYXRlwqB0aGXCoHR4X2RlbGF5
wqBhbmQKPiByeF9kZWxhecKgcHJvcGVydGllc8KgZm9ywqB0aGF0wqBuZXfCoFNvQy7CoEV2
ZW7CoGlmwqB0aGXCoGJvYXJkwqB5b3UncmXCoHVzaW5nCj4gZG9lc24ndMKgbmVlZMKgdGhl
bSzCoHdlwqBuZWVkwqB0b8KgbWFrZcKgc3VyZcKgbmV3wqBkZXNpZ25zwqB3aWxswqB1c2XC
oHRoZQo+IGdlbmVyaWPCoHByb3BlcnRpZXPCoGZvcsKgUkdNSUnCoGRlbGF5c8KgOikKPiAK
PiBUaGXCoG9sZGVywqByb2NrY2hpcMKgZ2x1ZXPCoGhhdmXCoG5vwqBjaG9pY2XCoGJ1dMKg
dG/CoGtlZXDCoGFjY2VwdGluZ8KgdGhlc2XCoGZvcgo+IGNvbXBhdMKgcmVhc29ucy4KClNv
cnJ5IGZvciB0aGUgbWlzdW5kZXJzdGFuZGluZy4gSSBoYWQgb25seSByZW1vdmVkIHR4X2Rl
bGF5IGFuZApyeF9kZWxheSBmcm9tIHRoZSBkZXZpY2UgdHJlZSBmb3IgdGhlIGJvYXJkIEkg
YW0gdXNpbmcuCgpJbiB2NCwgSSB3aWxsIGRpc2FsbG93IGJvdGggcHJvcGVydGllcyBmb3Ig
cm9ja2NoaXAscmszNTcyLWdtYWMgaW4KdGhlIERUIGJpbmRpbmcgYW5kIG1hcmsgdHhfZGVs
YXkgYW5kIHJ4X2RlbGF5IGFzIGRlcHJlY2F0ZWQuCgpCZXN0IHJlZ2FyZHMsCkN1bmhhbyBM
dQo=


