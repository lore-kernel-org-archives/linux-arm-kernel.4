Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED1F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 03:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ho5sBcRP;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=fZUfxXVy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=q9XOYK7wX+00B6FBPgLD2vBKMAkmDiR49f/zui5qQz0=; b=Ho5sBcRP0LyeSZ
	B690a3NbTtEXp0vCfOH53J+HvN61QxjNHmkDyDKu08hxWH2eroTJkClmxLG2podbkgaP7u1HBy2EB
	IvY2fER4wtQZHJwlSutvcMXu4HP/rSdY69w+Z4/7rIMPoavGJ0oMollAPdhLwhP2NcoFd0h2sJVvR
	KsVPxhqIaes2mHja5uqXTCWOVe7394rQCgo50m3bYC9jL2swO3m1W4gSw+QwjsKCdPsZfdk/Gh88W
	4GYBrU8JU54+D3hxrM20x7+/DqL6DpIx8rTAG63tiLoAun9T9u+t46+VA+N1jM3QOofHLgKbkJ7kV
	0BxKRaUc7y2UpsVTgt8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcB9-00000002Dwt-1UvQ;
	Tue, 10 Nov 2026 03:05:47 +0000
Received: from out203-205-221-239.mail.qq.com ([203.205.221.239])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcB6-00000002DwF-0vZL;
	Tue, 10 Nov 2026 03:05:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794279939; bh=q9XOYK7wX+00B6FBPgLD2vBKMAkmDiR49f/zui5qQz0=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=fZUfxXVyc6DAD15Sv5X4swqN9j/GmjL8dRnoagW1DhD+O/L6QRUMlsggANFnRQ0Bj
	 D5veAtp3I1xww6mVMV1Tr+z5flqP62yg5Y/LzHau/FXDztMX9+63fkAMDnicnryiiA
	 RfwgTnlQNClTOqf3FGIO1LhVf7JathlzAxx97xHI=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-XMAILINFO: MzHbHz6ky8ylxXRwvpD01xe5vfDxiM5d4sy1mzo5PARKG0efZTjt8CVhuRmRZB
	 X916dvvbNf6mSP72RiWNcNkqCoNPOcxgBWOr5TCZcXnrUl9jCXlBL7sN0QJ4T5Y3UdWVhkCbnXnpG
	 vdp9c5eNmkQygDx70y3v0fP7PLOER3IGW5zxJhXPUmUgyxGfqZwX2rtwe3Jtn8xzOde1dGcyuBCqu
	 B3CmRyVm7R4LWQcm8jyBLfeacUa7dugB4ZvW+mqQuK17Ml+y8ub7YPpJctk25Nys2Mvv769EMSsdn
	 gyFpV4NtYY5QzHMlFVwUMf61TfKrDif+QvN+eKFykf8fTRr4P6tUAMX8EjrmxtXe08M0wJY2zcUsV
	 ZCbbeAv7i2dpy57uuj5FAmeBEfOhOs1aeSEH0H8cMnzrL5dxPYAS/1QrmLQ0Tnz/MFmRldWYiA+AG
	 caiEA5CJiQ34zO8hIgYLPotpS0901vK+WlSahYTacdWKy7Xxs8wr9JFeu4ioN5jSZWUXuuGtEd6Cl
	 CCMNpacI0piTaP6oj8dLwYr0Q9s2ZbZuL8q0lDeZOUh53rJLmlKt00fsxUCrOkTvd3utbbRA09EXR
	 q22YlOFFUVDNvtHFy0LzEi6f3c9jZsOK34FYUDLWr2avoGfnlcSFvpxriZBvxtK3CsV2toP3ohc8y
	 NMr0xO1FEC1hRQsL77+9TGn1IKzFmrjJJbkuQS4DIcFfsC5fXcYtBCnC/y355xwQqk95Ic+wvYhYN
	 as5k0cJeG2my4Jt7nJ6eEx/rYbxpgRw5gK4DODp4ef2+JhCC1cgOW3at0NnbaX0f450vYnOJHZEBU
	 HRoPJhcnehr04GJlF3dwm1u3UCTrR3iDsI5b57xBHS3Aw+ZocdVTg9dcE/M2hyvEV8Hc9ZGCS1eXg
	 onxDMmUiVaEXvBtajFT5QG0P+nx0d2HHMnE7cURCbigcGOWiCt1GLo+jsbEua2PJZlr7qnaVKSEbf
	 1i9qJJwVhsoLAP1jhHQzWj1nNX9WYsvWLk6T5wFS+mI9dsL6xI77tQvxdJFZ1pPERKAYtrirzDYJO
	 fpiPE+5B/T4uxxl4WF2yiIWequDXJkDxKHdZr
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?SmFrdWIgS2ljaW5za2k=?=" <kuba@kernel.org>
Cc: "=?utf-8?B?TWFyYyBLbGVpbmUtQnVkZGU=?=" <mkl@pengutronix.de>, "=?utf-8?B?a2VybmVs?=" <kernel@pengutronix.de>, "=?utf-8?B?VmluY2VudCBNYWlsaG9s?=" <mailhol@kernel.org>, "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko@sntech.de>, "=?utf-8?B?T2xpdmVyIEhhcnRrb3Bw?=" <socketcan@hartkopp.net>, "=?utf-8?B?RGF2aWQgUy4gTWlsbGVy?=" <davem@davemloft.net>, "=?utf-8?B?RXJpYyBEdW1hemV0?=" <edumazet@kernel.org>, "=?utf-8?B?UGFvbG8gQWJlbmk=?=" <pabeni@redhat.com>, "=?utf-8?B?U2ltb24gSG9ybWFu?=" <horms@kernel.org>, "=?utf-8?B?Sm9uYXRoYW4gQ29yYmV0?=" <corbet@lwn.net>, "=?utf-8?B?U2h1YWggS2hhbg==?=" <skhan@linuxfoundation.org>, "=?utf-8?B?UmFuZHkgRHVubGFw?=" <rdunlap@infradead.org>, "=?utf-8?B?V29sZmdhbmcgR3JhbmRlZ2dlcg==?=" <wg@grandegger.com>, "=?utf-8?B?bGludXgtY2Fu?=" <linux-can@vger.kernel.org>, 
	"=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bmV0ZGV2?=" <netdev@vger.kernel.org>, "=?utf-8?B?bGludXgtZG9j?=" <linux-doc@vger.kernel.org>, "=?utf-8?B?c3RhYmxl?=" <stable@vger.kernel.org>
Subject: Re: [PATCH net v8 00/10] can: fix Rockchip TX stalls and bus-off restart/close races
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Tue, 10 Nov 2026 11:05:37 +0800
X-Priority: 3
Message-ID: <tencent_F59D327809C523BE014488357EEF4D163408@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261108-rockchip-canfd-restart-close-v8-0-3e7a23fd9eae@qq.com>
	<20261109112402.283c16a3@kernel.org>
In-Reply-To: <20261109112402.283c16a3@kernel.org>
X-QQ-mid: xmsezb41-0t1794279937tom1cqfol
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_190544_578032_1EEEA530 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCgo+ID7CoFN1YmplY3Q6wqBbUEFUQ0jCoG5ldMKgdjjCoDAwLzEwXcKgY2FuOsKgZml4
wqBSb2NrY2hpcMKgVFjCoHN0YWxsc8KgYW5kwqBidXMtb2ZmwqByZXN0YXJ0L2Nsb3NlwqBy
YWNlcwo+Cj4gcGxlYXNlwqB1c2XCoGdldF9tYWludGFpbmVyLnBsLMKgZG/CoG5vdMKgQ0PC
oG5ldGRldsKgb27CoENBTsKgcGF0Y2hlc8KgZGlyZWN0bHkuCgpJIHVzZWQgYjQgcHJlcCAt
LWF1dG8tdG8tY2MsIHdoaWNoIGludm9rZXMgZ2V0X21haW50YWluZXIucGwuClRoZSBzZXJp
ZXMgbW9kaWZpZXMgRG9jdW1lbnRhdGlvbi9uZXR3b3JraW5nL2Nhbi5yc3QsIHdoaWNoIG1h
dGNoZXMKRG9jdW1lbnRhdGlvbi9uZXR3b3JraW5nLyB1bmRlciBORVRXT1JLSU5HIFtHRU5F
UkFMXSBhbmQgaXMgbm90CmV4Y2x1ZGVkIHRoZXJlLCBzbyBuZXRkZXZAdmdlci5rZXJuZWwu
b3JnIHdhcyBhZGRlZCBhdXRvbWF0aWNhbGx5LgoKSSB3aWxsIG1hbnVhbGx5IHJlbW92ZSBu
ZXRkZXZAdmdlci5rZXJuZWwub3JnIGZyb20gQ2MgZm9yIHRoZSBuZXh0CnJldmlzaW9uLgoK
QmVzdCByZWdhcmRzLApDdW5oYW8gTHUK


