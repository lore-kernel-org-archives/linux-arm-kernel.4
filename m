Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AC9606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 16:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qFq87Il/;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ZbOeqNtt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=snCMBOAglodr748wRnt9xySVHP/f+6uaFvHz0+tjdM0=; b=qFq87Il/rPCpNj
	eiXzn9+lOZTp9QzwVkTXsRVsmu5b/R/UXouPe/T45EF9C9guUFsPbwTQSAbV/lsQpRDIupWLT7T06
	mYnmXbQz9iEXbwyD1w2+D9Qm4KzPDc41I/wGPUMkmRj98gMo7raZAdS3yUvEpG9NIA6tPHB/8Dcoi
	LWX6bMrx3hAme2OXyuwRCkvUQuYklXBnCczCJ4GhXH6AVBsMSRJ3YtnbpvEoECMq2+o35kHj4WVwD
	OOXkwUwaEie9LK48FcBl7tXdmdTHyI+tf9te5Av/rnPstne66zncy/Hr6iQaTEU/zYWYH8jNwKwE/
	j62Uk33Iv1TsHT1IDrEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURu5-0000000FbR3-38p7;
	Fri, 20 Nov 2026 16:56:01 +0000
Received: from out162-62-57-210.mail.qq.com ([162.62.57.210])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURtc-0000000FbKz-1EWx;
	Fri, 20 Nov 2026 16:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795193727; bh=snCMBOAglodr748wRnt9xySVHP/f+6uaFvHz0+tjdM0=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=ZbOeqNttmDLDSsQ6C1wKyG4shRRWkqJg2zW6imq0aTNIK5pLfQ9T1Tp/qqOjEzL6f
	 M/Eq2x3rWYetUqST5iTggUgWAxO2Ma/1ojPHS0bBrWBnHI7+2AShksHRjtZHf0D9+J
	 n4ZY6VOPpNJyf+rV4POFtzjve3eizlB/FbVJXjsI=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-XMAILINFO: NB8AK7fcAs0KdrHQ5MculXsSnCvP/x+NaTXr1bzxOr0qWgcYZHV/jV0qCihvZU
	 D6sNKZ+9bwHJCV6T7pFiiux/A5lqnrJtZeIrPX1MTQG7SuiaoSZkzO494h8jX5aVx1AUnOOebH8Ru
	 Ev5ogkSY0Pk1L+ZTJj64CCai+sEKAPvirvCsvm95WLd4Otx/D5yEUHMMrcr+D2w9GjaR15bjHcfyd
	 0+Sr8q7zarpX5ysqvkWI7+jrvzIQ9NQj9NeehpyI86ouwkIB6xCO6VUK4yM+0CVkphfLlmD+dOKzb
	 LdIHUGwH/Wk+6Shjw8v4luncHs+eLS5I56x4Hj8r8/43faoANN/m6YLWt8t2UrEe8ed48U9lOffOb
	 bD43kWfShPpcGvMgiOy4T/4OLdWALkTMBIqqTxp413x/ao7GCWtNwgMrbAIIl0Vw278Q1tCjwI17H
	 ioJyOXc5oH1D03s7H4rBCqGRKkQ/st+38ikGwm6CRWrXqlNSG8uzA4+BQpk7Fdhtw4KNJ5a51sHpq
	 Us2G47XkCKNKttJ4SUIEMaoV351BtekCx8uGWHKjHzgZ8sWSgPTdpoTRqXl7c3boUUq+jeUmSzdGl
	 eGjOok3HzIjyx4HI3AvTu8c4km0UFt2kv7bNCgA797cwNuzy5SwuQc77iBORLjSaxIvchfPnlhgBn
	 rqiO42f1fe67qKc/gXy/socyzdx87cxUZu6rQrdjuSNAHBq2ASfGnUM+3Uxko3XeAB3bmfBep1sZP
	 06BZJHkSSAshxbIOty+Z1k07ADeynjRLF+tCba3UR4DOctxHZFDXk5h6Re+waOY6R6PLqvwj3pLbG
	 gVzd7fCm0zbu2wQabiNnd6O/7wxHh2FT3KVrBeKW9ynzDNmWTsK1RJ1X0iozdR71HDHh/YjypoLfI
	 EZBlzusn0dCYQMV5ptrQZnAT+xwG8pU4M/a83gVSioNIs4cvmtDiIW0F1GL6BGFgRLIhTz/wwmPbC
	 v+lkpgmOai0eTj1IuM7k4EE3jr+REaoVaZvI9bmtD0vS7KpZGpahB4UeRrVrCKC50oNC3ZbVCfmDw
	 pGlSijwrJ5VdnABEKzVwHNU75JbUgLiWeNVoRPSySaJMf3Rq1hvGphg8r1S/GCSA8sqtI3y7+zei2
	 0sfer53Js+0lA2jKzbQRfRKI
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?Sm9uYXMgS2FybG1hbg==?=" <jonas@kwiboo.se>
Cc: "=?utf-8?B?Um9iIEhlcnJpbmc=?=" <robh@kernel.org>, "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzk+dt@kernel.org>, "=?utf-8?B?Q29ub3IgRG9vbGV5?=" <conor+dt@kernel.org>, "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko@sntech.de>, "=?utf-8?B?RWxhaW5lIFpoYW5n?=" <zhangqing@rock-chips.com>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH v2] dt-bindings: soc: rockchip: Add RK3572 PMU and GRF
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Sat, 21 Nov 2026 00:55:25 +0800
X-Priority: 3
Message-ID: <tencent_71414D193416327F09E723DB01C688137E08@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261119-add-board-ok3572-c-soc-v2-1-86f331024ae6@qq.com>
	<0c495655-9ec8-4d16-a33e-ef4ef3a8f2bc@kwiboo.se>
In-Reply-To: <0c495655-9ec8-4d16-a33e-ef4ef3a8f2bc@kwiboo.se>
X-QQ-mid: xmsezb41-0t1795193725tg1wj8w7y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_085534_588298_B7E68B54 
X-CRM114-Status: GOOD (  18.49  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgSm9uYXMsCgo+ID7CoGRpZmbCoC0tZ2l0wqBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zb2Mvcm9ja2NoaXAvZ3JmLnlhbWzCoGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NvYy9yb2NrY2hpcC9ncmYueWFtbAo+ID7CoGluZGV4wqBlOTRj
ODNkN2MxMzguLjBlMGJmOGUyMzRjOMKgMTAwNjQ0Cj4gPsKgLS0twqBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2Mvcm9ja2NoaXAvZ3JmLnlhbWwKPiA+wqArKyvC
oGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9yb2NrY2hpcC9ncmYu
eWFtbAo+ID7CoEBAwqAtMzAsNsKgKzMwLDEywqBAQMKgcHJvcGVydGllczoKPiA+wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAtwqByb2NrY2hpcCxyazM1NjgtcGlwZS1ncmYK
PiA+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAtwqByb2NrY2hpcCxyazM1Njgt
cGlwZS1waHktZ3JmCj4gPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLcKgcm9j
a2NoaXAscmszNTY4LXVzYjJwaHktZ3JmCj4gPsKgK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAtwqByb2NrY2hpcCxyazM1NzItaW9jLWdyZgo+ID7CoCvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgLcKgcm9ja2NoaXAscmszNTcyLW52bTAtZ3JmCj4gPsKgK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAtwqByb2NrY2hpcCxyazM1NzItcGhwLWdyZgo+ID7CoCvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLcKgcm9ja2NoaXAscmszNTcyLXBpcGUtcGh5
LWdyZgo+ID7CoCvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLcKgcm9ja2NoaXAscmsz
NTcyLXBtdTAtZ3JmCj4KPiBBcmUgd2UgbWlzc2luZyByb2NrY2hpcCxyazM1NzItcG11MS1n
cmYgYW5kIHBvc3NpYmxlIG90aGVyIHN5c2NvbnM/CgpJIGhhdmUgbGltaXRlZCB0aW1lIGFu
ZCBjYW4gb25seSB0YWtlIG9uIHNvIG11Y2ggbXlzZWxmLiBGb3IgdGhpcwpmaXJzdCByb3Vu
ZCwgSSdkIGxpa2UgdG8gZ2V0IGEgYmFzaWMgc3lzdGVtIHVwc3RyZWFtIHdpdGggQ1BVLCBV
U0IsCkdNQUMsIFVBUlQsIGFuZCBzbyBvbi4gSSd2ZSBvbmx5IGRvY3VtZW50ZWQgdGhlIEdS
RiBpbnN0YW5jZXMgSQphY3R1YWxseSB1c2UgaW4gdGhlIHByb3Bvc2VkIGRldmljZSB0cmVl
LgoKT25jZSB0aGlzIHJvdW5kIGlzIGRvbmUsIEkgcGxhbiB0byBwb3J0IGFuZCB0ZXN0IHN1
cHBvcnQgZm9yIHNtYWxsZXIKZmVhdHVyZXMgc3VjaCBhcyByZWJvb3QtbW9kZSwgRERSIGZy
ZXF1ZW5jeSBzY2FsaW5nLCBPVFAsIGFuZCBUUk5HLAphcyB3ZWxsIGFzIEdQVSwgTlBVLCBQ
Q0llLCBDQU4sIGFuZCBvdGhlciBoYXJkd2FyZSBpbiBhIGZvbGxvdy11cApzZXJpZXMuCgo+
IERvwqB3ZcKgbmVlZMKgYcKgc3BlY2lhbMKgcm9ja2NoaXAscmszNTcyLXVzYjJwaHktZ3Jm
P8KgSWbCoHJrMzU3MsKgbWltaWNzCj4gUkszNTc2wqB0aGVyZcKgYXJlwqB0d2/CoHVzYjJw
aHnCoEdSRizCoGVhY2jCoG9uZcKgaWRlbnRpY2FswqBhbmTCoG9ubHnCoGNvdmVyaW5nCj4g
dXNiMnBoecKgZnVuY3Rpb25zLgo+IAo+IFdpdGjCoEdSRsKgY29tcGF0wqBJwqBleHBlY3TC
oHRoZcKgRFTCoHNvwqBiZcKgc29tZXRoaW5nwqBsaWtlwqBmb2xsb3dpbmc6Cj4gCj4gwqDC
oHVzYjJwaHkwX2dyZjrCoHN5c2NvbkAyNjA1NDAwMMKgewo+IGNvbXBhdGlibGXCoD3CoCJy
b2NrY2hpcCxyazM1NzItdXNiMnBoeS1ncmYiOwo+IHJlZ8KgPcKgPDB4MMKgMHgyNjA1NDAw
MMKgMHgwwqAweDIwMDA+Owo+IAo+IHVzYjJwaHkwOsKgdXNiMnBoecKgewo+IGNvbXBhdGli
bGXCoD3CoCJyb2NrY2hpcCxyazM1NzItdXNiMnBoeSI7Cj4gfTsKPiDCoMKgfTsKPiAKPiDC
oMKgdXNiMnBoeTFfZ3JmOsKgc3lzY29uQDI2MDU2MDAwwqB7Cj4gY29tcGF0aWJsZcKgPcKg
InJvY2tjaGlwLHJrMzU3Mi11c2IycGh5LWdyZiI7Cj4gcmVnwqA9wqA8MHgwwqAweDI2MDU2
MDAwwqAweDDCoDB4MjAwMD47Cj4gCj4gdXNiMnBoeTE6wqB1c2IycGh5wqB7Cj4gY29tcGF0
aWJsZcKgPcKgInJvY2tjaGlwLHJrMzU3Mi11c2IycGh5IjsKPiB9Owo+IMKgwqB9Owo+IAo+
IFRoZcKgdXNiMnBoecKgY2hpbGTCoG5vZGXCoHdvdWxkwqBiZcKgdGhlwqBzb2xlwqBjaGls
ZMKgbm9kZcKgb2bCoEdSRsKgYW5kwqB0aGXCoGNoaWxkCj4gbm9kZcKgY29uc3VtZcKgd2hv
bGXCoHBhcmVudMKgcmVnwqBzcGFjZS7CoFNob3VsZMKgdGhlecKgaW5zdGVhZMKgYmXCoG1l
cmdlZD/CoFRoYXQKPiBpc8KgaG93wqBJwqBkZXNjcmliZWTCoHRoZcKgdXNiMnBoecKgbm9k
ZXPCoGluwqBVLUJvb3TCoG1haW5saW5lwqB3b3JrwqBhdMKgWzFdLgo+IAo+IFsxXcKgaHR0
cHM6Ly9naXQudS1ib290LXByb2plY3Qub3JnL3UtYm9vdC9jb250cmlidXRvcnMva3dpYm9v
L3UtYm9vdC8tL2Jsb2IvcmszNTYyL2FyY2gvYXJtL2R0cy9yazM1NzIuZHRzaSNMMzU3LTQw
MwoKU29ycnkgSSBtaXNzZWQgdGhpcy4gSSB0b29rIHRoZSBVU0IyIFBIWSBsYXlvdXQgZGly
ZWN0bHkgZnJvbSB0aGUKUkszNTcyIGRldmljZSB0cmVlIGluIFJvY2tjaGlwJ3Mga2VybmVs
LgoKSSBjaGVja2VkIGJvdGggUkszNTcyIGFuZCBSSzM1NzYgaW4gUm9ja2NoaXAncyBrZXJu
ZWwuIE9uIFJLMzU3NiwgdGhlClVTQi9EUCBQSFkgYWxzbyByZWZlcmVuY2VzIHRoZSBVU0Iy
IFBIWSdzIHBhcmVudCBHUkYuIE9uIFJLMzU3MiwgSQpkaWRuJ3QgZmluZCBhbnlvbmUgdXNp
bmcgdGhlIHBhcmVudCBHUkYgb3RoZXIgdGhhbiBpdHMgb3duIFVTQjIgUEhZCmNoaWxkcmVu
LgoKSSdtIGxlYW5pbmcgdG93YXJkIHlvdXIgYXBwcm9hY2ggYXMgd2VsbCwgc28gSSdsbCBz
d2l0Y2ggdG8gb25lIG5vZGUKcGVyIFBIWSBpbiB2My4KClAuUy4gSSBwcm9iYWJseSB3b24n
dCBzZW5kIFNvQyB2MyByaWdodCBhd2F5LiBJJ2xsIHdhaXQgdW50aWwgdGhlIG90aGVyCnJl
bGF0ZWQgcGF0Y2hlcyBhcmUgYWNjZXB0ZWQgYmVmb3JlIHBvc3RpbmcgaXQuCgpCZXN0IHJl
Z2FyZHMsCkN1bmhhbyBMdQoKcHctYm90OiBjcgo=


