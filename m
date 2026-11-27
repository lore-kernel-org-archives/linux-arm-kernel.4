Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D383D606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 02:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=woCXRtla;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Ua9oaYWn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=c+oGnDJwwxehyRrrXPLIjZAd481WLEPRKxHASXZGKfA=; b=woCXRtlaz4taQ5
	6FSlY8yDpMSxx43mmZfn+VnHmwc0P8PqJ6Us7E+i9gJJnq64mmZTFEqijCoELwuI8eudwyn0Qzens
	5nNfeXYdVPvFLIgCyLUxKZg1IVPP03h4A9A4l0G6cVbsPldH6eZmxd2oXttH+wN1cC1bTx7XLEMgJ
	yqbUE9o2HQEpN7b8kkHDRtGjzCLMsAQTUKSo4783nCI/arj0DZVA+fXdZBp+GCtZHm4/K1Gbqgi61
	QpE6D4BcZb4k8BHMfm1F+o2aKJQwrLM+JYx+G+B2bOXv5cLIwyCEVVuOgUh80hAqi2wPT1XTyRCGa
	CN3xy8q3dmh6ftVT+anQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWllg-0000000En40-410H;
	Fri, 27 Nov 2026 02:32:56 +0000
Received: from out203-205-221-231.mail.qq.com ([203.205.221.231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlld-0000000En3L-2YcJ;
	Fri, 27 Nov 2026 02:32:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795746766; bh=c+oGnDJwwxehyRrrXPLIjZAd481WLEPRKxHASXZGKfA=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=Ua9oaYWnO1m3cnr+lfiBvUVmM4dk2MidPPHFE1GORLksrtjQZ16qzxsXszc4RlfC/
	 N7lZutA2NAIB5LdrAVoeuMAvXAzzp45GlCxKE3KX7Xjj2ymXiaPe+9dU/9d5PY+UBH
	 YSwcoEzbN4roTCl8FyxkJXpMnW4j/FJM+ZM9EO+4=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-XMAILINFO: MMrWIrR84bVnl6F4Kn48QrsLzYD8r4M8GGan8Rst9arNRZCimojC4c4Uhi1/is
	 NPSfAfMIqtcaz0NjCgYx2piTvnoDFtNS0t3Vo8NBC3AuCtEroVh39CqQcdlCCgk/eNlOAAxPIYVkr
	 8N13zz1BdL4fhmM0eGZf4T21QhMKDbKuTRTR1mtiYIVe2O4pAoa6JpM1wmFckfJc81EnS1ovMsr5h
	 6ZZq/ugm4KpccTZfChcPS1haH5MU/i6ka/aHxOpiKJW5MdptG2vmtemLTYP0fzbe5P0aYjdjvlDaF
	 kPpGwfiv7faTJtE09ebMUDAr4vDtNDpFxFnKFD5/LUojdHWI1GamE4LHp2ga+Eb6CKzimOXakYPGU
	 zsP3hA7mNM+yhJGNpACpuRLYw1Zl3O3d05q77XuY/zjbhfMUZkuFc56PKZqQSYdnZ4l5lp2FvcxTp
	 GUIaJWeSkl+iXawcwMChW3zPOBDrS5SCEipAx5ob7rNkdvxNTc16zrVnbaDSwiNYJyYVMweWRv727
	 QrVi4pk1mWshqXlhWbgPSNmtPs5vD+wyjK43rbby/HFbH6E3vLIx0lm80dcgzFCqRk7M2eb2+JDLt
	 Qyvf6K/N4++WPXg2xORehvEcGyMcnMZOUlMV/OhpmBmh8fbDp00d8wL/nUt/w7qZQjr/2CIJUkba2
	 SUMz/+a990rdeKVv9FITrdHzW05opb4KaeSd8cWOvdpT9LFLQImmS9N6zZdNAbj67LAfEk75oFb4k
	 /CXg8MdmYAoPYCTqpGe6525M08FJptjXXXHlSZ3m6W052HVGeEYyWLcBU3LEXPiYBZ6ShMEEIrm3B
	 z1uOU/8E6Y9cEyeI50qenAYTOAjWlIPFzNp08JAIHjIC2MPz9lbd0uMkluYZW3AEiJ7G6OBlprip4
	 xiJKxtwXa/c9oAKXHEV1rhnYbixyIEFRwANVmGiJ9phiOYBicXVNMXTCkopnqnqdvy6ynNepCgEKm
	 JZA9SYOklThkm5qqEBYh54Qg1cZNZbeKjSpL0+4ONVgTyQmv7Hkz7NIRoeCXa/Rj+DWbRsHUvX+hM
	 U3eN/k0sJ4otjwI8=
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?U2ViYXN0aWFuIFJlaWNoZWw=?=" <sebastian.reichel@collabora.com>, "=?utf-8?B?Um9iIEhlcnJpbmc=?=" <robh@kernel.org>, "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzk+dt@kernel.org>, "=?utf-8?B?Q29ub3IgRG9vbGV5?=" <conor+dt@kernel.org>, "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko@sntech.de>, "=?utf-8?B?Q2hyaXMgTW9yZ2Fu?=" <macromorgan@hotmail.com>
Cc: "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?a2VybmVs?=" <kernel@collabora.com>, "=?utf-8?B?U2ViYXN0aWFuIFJlaWNoZWw=?=" <sebastian.reichel@collabora.com>, "=?utf-8?B?c3RhYmxl?=" <stable@vger.kernel.org>
Subject: Re: [PATCH 02/11] arm64: dts: rockchip: Fix USBDP ports for LubanCat 5IO board
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Fri, 27 Nov 2026 10:32:44 +0800
X-Priority: 3
Message-ID: <tencent_4909B12347019988CD7E8B4D3A345432CA08@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
	<20261126-rockchip-usb-c-dp-altmode-v1-2-7991eb5bb426@collabora.com>
In-Reply-To: <20261126-rockchip-usb-c-dp-altmode-v1-2-7991eb5bb426@collabora.com>
X-QQ-mid: xmsezb41-0t1795746764t45j0irwa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_183254_115307_6A9BED9C 
X-CRM114-Status: GOOD (  11.63  )
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

SGksCgo+IEZpeMKgdGhlwqBVU0JEUMKgUEhZwqBwb3J0c8KgZGVzY3JpcHRpb27CoGZvcsKg
dGhlwqBMdWJhbkNhdMKgNUlPLMKgc2/CoHRoYXTCoGl0Cj4gZm9sbG93c8KgdGhlwqBkb2N1
bWVudGVkwqBBQkkuwqBUaGXCoGN1cnJlbnTCoGJpbmRpbmfCoGNvbmZ1c2VzwqBlbmRwb2lu
dHPCoHdpdGgKPiBwb3J0c8KgYW5kwqBtYWtlc8Kgbm/CoHNlbnNlwqBhdMKgYWxsLgo+IAo+
IENjOsKgc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IEZpeGVzOsKgZjdiNTc2ZjM1MzU2wqAo
ImFybTY0OsKgZHRzOsKgcm9ja2NoaXA6wqBBZGTCoEx1YmFuQ2F0wqA1SU/CoGJvYXJkIikK
PiBTaWduZWQtb2ZmLWJ5OsKgU2ViYXN0aWFuwqBSZWljaGVswqA8c2ViYXN0aWFuLnJlaWNo
ZWxAY29sbGFib3JhLmNvbT4KClRoYW5rcyBmb3IgZml4aW5nIHRoaXMuCgpJIGJhY2twb3J0
ZWQgdGhpcyBwYXRjaCBhbmQgcGF0Y2ggMS8xMSAoImFybTY0OiBkdHM6IHJvY2tjaGlwOiBG
aXgKVVNCLUMgRFAgQWx0TW9kZSB2ZG8iKS4gSSB0ZXN0ZWQgdGhlbSBvbiBteSBMdWJhbkNh
dCA1SU8gd2l0aCBBcm1iaWFuCmtlcm5lbHMgNi4xOC42MCBhbmQgNy40LXJjNC4KCk9uIDYu
MTguNjAsIHRoZSBVU0JEUCBQSFkgc2NoZW1hIHJlamVjdHMgdGhlIHBvcnRzIG5vZGUuIEkg
Z290IHZpZGVvCm92ZXIgVVNCLUMgd2l0aCBib3RoIHRoZSBiYXNlbGluZSBhbmQgcGF0Y2hl
ZCBEVEJzLgoKTXkgNy40LXJjNCBidWlsZCBpbmNsdWRlcyB0aGUgdGhyZWUgZHJpdmVyIHNl
cmllcyBsaXN0ZWQgaW4gdGhlIGNvdmVyCmxldHRlci4gV2l0aCB0aGUgYmFzZWxpbmUgRFRC
LCBEVy1EUCBmYWlsZWQgdG8gZmluZCBpdHMgZm9sbG93LXVwCmJyaWRnZSwgc28gRFAtMSBk
aWQgbm90IHJlZ2lzdGVyLiBXaXRoIGJvdGggcGF0Y2hlcyBhcHBsaWVkLCBEUC0xCnJlZ2lz
dGVyZWQgYW5kIEkgZ290IHZpZGVvIGF0IDI1NjB4MTQ0MCBhdCA2MCBIei4KCkZlZWwgZnJl
ZSB0byBhZGQgbXkgVGVzdGVkLWJ5IHRhZyBpZiB1c2VmdWwuCgpUZXN0ZWQtYnk6IEN1bmhh
byBMdSA8MTU3OTU2NzU0MEBxcS5jb20+CgpCZXN0IHJlZ2FyZHMsCkN1bmhhbyBMdQ==


