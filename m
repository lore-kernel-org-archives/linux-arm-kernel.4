Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F7C606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 03:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IUfPkrqS;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=uyjm94tI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1Ydo/JFA5qxzni2gYLker+DXlrCuegpZ91spzV6zZE8=; b=IUfPkrqSVQEYWj
	asf6bRjARbkGgZd3xBp4DmN+OXri5LXdmgTOdTS0Z0DI36407KjWQkcapdsbbYEBzy1I21LTAENhC
	7T0m/l5QugkL7/3Cdrvpfrp9IIQo+PZi8HD5srLeXV+oAwo2HUaY9skeS4yK97Czui/Vm2gQZVGtz
	way9ZJ8xPevE6QhmF2sjWqMCxvp99MCfKnw56JEtTkfT2v87wMvvJZubdJj+1Ux1chM2CBzzWJVkb
	PMaHNRbVFg2FbcP229AecZaD5s6D/LAcZdleAua+j7OTkVMtP+fwCWqVrpFpYYPyiwUFTGf3we2Q2
	VeFByEWhYpw5a0romYSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSnE3-000000010ov-3BDw;
	Mon, 16 Nov 2026 03:17:47 +0000
Received: from out203-205-221-190.mail.qq.com ([203.205.221.190])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSnE0-000000010oH-0tkb;
	Mon, 16 Nov 2026 03:17:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794799055; bh=1Ydo/JFA5qxzni2gYLker+DXlrCuegpZ91spzV6zZE8=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=uyjm94tIVJhun8tf0cxQrwn3SAmdL9BJOgxG0SJruOCtLwTUvp0K6j/diLZyBSYif
	 14iFGOGdAOifYpm9yOb38h0c+n8OrC/TacPrib6ccHq+JOlniVfHtBRfSikerK+YXy
	 SJVXPJQ8pgXuNhr6SrizNxEnb7Pjgrug4c1S2BNE=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-XMAILINFO: OTkXlZHit/HD2ECOkNMUpes8JgqTDIrnl70ocTF10oUnzcXJddXHB8IPNghF2M
	 JHs400WfCpZeUssfdsYQd/c7h3L3LYYfnCRPV+X3YuVS/8S8eFX4wH/7S6tN2GZnKkaGo1tMKcA3e
	 NyGFphqRO+5RnMyHR29RtGVG8ST4RQgBvG4i8puzNz3i8tYEapvB24rIQhDyDUTMCs3GV4R4LD7cw
	 yTuq9t9T2CuV/VlV8vW/Vme/E4o7hDt6J+6HnmAPthlrC40NMLgV3Epr/IGGtiegRziuQmsNEsspl
	 Ze1CVKptd66VdpVLqDsMG6qotZNllafFC0EHsqaOKrlJl9cRbWUNgShd0oMSqu5p0SpBkuQyA1+P1
	 vuVY/OFE+p66Yv0px9wRlTy35WuuF/zAovV5TqyBlieIO63c36U/Q35TLmajQfcX/SkfT+8m9zfaC
	 vMOyC8DZnMvHNwAoOCWpwCUL5V5VKq2+KYLdZsSZCKkOhgrNVqQCbSEDE4WeNPGcCnp1RsAQkJb8J
	 vHHEGcNyAoVUc3w3y/i8iqFCwdhaeaPCQ9P9jyZztKpyR5MJTmKhagE60xs9Y+VlpwMMLicVefZmH
	 L/nXwsWP1JLFpblgK+HXuY9C/b4AsSuitvZXzNd5COYv6XCmEpNrdDPUYq8iAxLC2KA+is7TUJ5ck
	 cjLKdbl6YAjwGbYUBt1yAkGoH6owstvDJZm5I4dKDSBy9sAMenvlnSoXN0ukIl4cUTnK85iBV1O5z
	 bOxAkjBJvBoW2xVRsheWR9CbcyEjBJreUQOiRSn23BeypNvKC1cdJskR4IP5fcqFuDT6A0ZGS3o8s
	 EZaG+Clu38feonPN0W+0RQvFD+DkJ9drTX40ba0Bg+GWlO67W+1M61OlL/ej/Q1cnvRK2MAv9ejQB
	 vFrtr0K+wOyf2EnqPZ6EqAVz6OO+isn2wcEiL8Advqkq87CfkAIYYF8IqrQegaLsVMAOcos0CwsNY
	 60UC+MDUER7PAV1HHHxhJia4HxOHywop8LuEGyvEvhqm/M4xtQLvmq9pkopQsZe5wK8bPcXvWYtBo
	 MYgHtPwsT9u3NKQNFX8sqzsj9RFsanT56AQAzQBbXCJinzWE=
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko@sntech.de>
Cc: "=?utf-8?B?bGludXgtY2xr?=" <linux-clk@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?UmljaGFyZCBDb2NocmFu?=" <richardcochran@gmail.com>, "=?utf-8?B?RWxhaW5lIFpoYW5n?=" <zhangqing@rock-chips.com>, "=?utf-8?B?UGhpbGlwcCBaYWJlbA==?=" <p.zabel@pengutronix.de>, "=?utf-8?B?Q29ub3IgRG9vbGV5?=" <conor+dt@kernel.org>, "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzk+dt@kernel.org>, "=?utf-8?B?Um9iIEhlcnJpbmc=?=" <robh@kernel.org>, "=?utf-8?B?SmVyb21lIEJydW5ldA==?=" <jbrunet+clk@baylibre.com>, "=?utf-8?B?QnJpYW4gTWFzbmV5?=" <bmasney+clk@redhat.com>, "=?utf-8?B?U3RlcGhlbiBCb3lk?=" <sboyd@kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, 
	"=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bmV0ZGV2?=" <netdev@vger.kernel.org>
Subject: Re: [PATCH v5 2/4] clk: rockchip: Add internal support for 24-bit fractional dividers
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Mon, 16 Nov 2026 11:17:32 +0800
X-Priority: 3
Message-ID: <tencent_A76502128C463402C8115BFD549A4E69CE09@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261030-add-board-ok3572-c-clk-v5-0-9a43403cb149@qq.com>
 <20261030-add-board-ok3572-c-clk-v5-2-9a43403cb149@qq.com>
	<Yf6NfRPFTxKjDagKAm6hpw@sntech.de>
In-Reply-To: <Yf6NfRPFTxKjDagKAm6hpw@sntech.de>
X-QQ-mid: xmsezb41-0t1794799052treparxye
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_191744_597376_1CE397A7 
X-CRM114-Status: GOOD (  20.81  )
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

SGksCgpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIHJldmlldy4KCj4gPiBBZGQgYW4g
aW50ZXJuYWwgUm9ja2NoaXAgZnJhY3Rpb25hbC1kaXZpZGVyIGhlbHBlciBhbmQgY2xvY2sg
YnJhbmNoIHR5cGUKPiA+IGZvciB0aGlzIHJlZ2lzdGVyIGxheW91dC4gVGhpcyBwcm92aWRl
cyB0aGUgc3VwcG9ydCBuZWVkZWQgYnkgdGhlIFJLMzU3Mgo+ID4gYXVkaW8gZnJhY3Rpb25h
bCBjbG9ja3MuCj4KPiBQbGVhc2UgYWRkIGEgcGFyYWdyYXBoIGFib3V0IHRoZSAidjIiIG5h
bWluZy4KPiBJIGFzc3VtZSB0aGUgdjIgaXMgYSBSb2NrY2hpcCBuYW1pbmcsIGJlY2F1c2Ug
djEgd2FzIHRoZSBvdGhlciBvbmUgdGhhdAo+IGNvdWxkIHN0aWxsIGZpdCB0aGUgcmVndWxh
ciBmcmFuY3Rpb25hbCBkaXZpZGVyLgo+Cj4gPiArc3RhdGljIGlubGluZSB1MzIgY2xrX2Zk
X3YyX3JlYWRsKHN0cnVjdCBjbGtfZnJhY3Rpb25hbF9kaXZpZGVyX3YyICpmZCwKPiA+ICsg
ICB2b2lkIF9faW9tZW0gKnJlZykKPiA+ICt7Cj4gPiArIHJldHVybiByZWFkbChyZWcpOwo+
ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgY2xrX2ZkX3YyX3dyaXRlbChz
dHJ1Y3QgY2xrX2ZyYWN0aW9uYWxfZGl2aWRlcl92MiAqZmQsCj4gPiArICAgICB2b2lkIF9f
aW9tZW0gKnJlZywgdTMyIHZhbCkKPiA+ICt7Cj4gPiArIHdyaXRlbCh2YWwsIHJlZyk7Cj4g
PiArfQo+Cj4gd2h5IGRvIHdlIGhhdmUgdGhvc2U/IFRoZXkgZG8gbm90IHNlcnZlIGFueSBw
dXJwb3NlIEkgY2FuIHNlZS4KPiBTbyBwbGVhc2UganVzdCB1c2UgcmVhZGwgYW5kIHdyaXRl
bCBkaXJlY3RseSBhdCB0aGUgYXBwcm9wcmlhdGUgcGxhY2VzLgo+Cj4gWy4uLl0KPgo+ID4g
KyBpZiAoZmQtPmZsYWdzICYgQ0xLX0ZSQUNfRElWSURFUl9aRVJPX0JBU0VEKSB7Cj4gPiAr
ICgqbSktLTsKPiA+ICsgKCpuKS0tOwo+ID4gKyB9Cj4KPiAuLi4gYmxhbmsgbGluZSBwbGVh
c2UgLi4uCj4KPiA+ICsgaWYgKCEqbSAmJiAhKGZkLT5mbGFncyAmIENMS19GUkFDX0RJVklE
RVJfWkVST19CQVNFRCkpCj4gPiArIHJldHVybiBjbGtfZmRfdjJfZ2V0X2xvd19yYXRlX2Rp
dmlkZXIoZmQsIHJhdGUsIHBhcmVudF9yYXRlLCBtLCBuKTsKPgo+IC4uLiBibGFuayBsaW5l
IHBsZWFzZSAuLi4KPgo+IFsuLi5dCj4KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19v
cHMgY2xrX2ZyYWN0aW9uYWxfZGl2aWRlcl9vcHNfdjIgPSB7Cj4gPiArIC5yZWNhbGNfcmF0
ZSA9IGNsa19mZF92Ml9yZWNhbGNfcmF0ZSwKPiA+ICsgLmRldGVybWluZV9yYXRlID0gY2xr
X2ZkX3YyX2RldGVybWluZV9yYXRlLAo+ID4gKyAuc2V0X3JhdGUgPSBjbGtfZmRfdjJfc2V0
X3JhdGUsCj4gPiArfTsKPiA+ICsKPiA+ICtzdGF0aWMgc3RydWN0IGNsa19odyAqY2xrX2h3
X3JlZ2lzdGVyX2ZyYWN0aW9uYWxfZGl2aWRlcl92MihzdHJ1Y3QgZGV2aWNlICpkZXYsCj4K
PiBtYXliZSBhZGFwdCB0aGUgZnVuY3Rpb24gbmFtZS4KPiBGdW5jdGlvbiBhYm92ZSBhYmJy
ZXZpYXRlZCB0aGluZ3MgdG8KPgo+IGNsa19mZF92Ml9zb21ldGhpbmcsIHNvIG5hbWluZyB0
aGlzIGNsa19od19yZWdpc3Rlcl9mZF92MigpCj4gbWlnaHQgbWFrZSB0aGF0IGxpbmUgbGVz
cyB1bndpZWxkeT8KCkkgd2lsbCBmaXggdGhlc2UgaXNzdWVzIGluIHY2LgoKQmVzdCByZWdh
cmRzLApDdW5oYW8gTHUKCnB3LWJvdDogY3IK


