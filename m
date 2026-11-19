Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4766F606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 05:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AiWVVax8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=m6DdvMq3;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=d+ItCVEA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iSKDXQpYsz8DfCp+Hl6lFNxx6TqgKVLI7ynM++rZhRE=; b=AiWVVax8YaLShuQWe9yrtcs1NZ
	xDPZaQLihWkErFxCpSMD1BJwRmdpzuFQrUcTagY8G6JRiYM6cEfo2FI2NcNsYwLFAPVpcjJSczs8g
	8wy72fRHY/RONmVSwKfdpJVY/6SWrP5tOj98/umpMdVa/uWrRwS53F5sxqCjqAq58q00abd9eNNVM
	1GpiR7PtjbUR4kGclDkQ1NNIK8FuX4XQUWycRVg37sCdjFJYa7XMYMbQFbT6ZtCITG3ogEHbbxvam
	I435sPe1Vh1G2uvaAk3UJm0iXD3sMtEJjHCKg6E3IgnDiek+FxBIW4QRMFSFPvwApXVB2UrlsDM53
	EHDsOaCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTv5H-0000000Awue-0iqc;
	Thu, 19 Nov 2026 05:53:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTv5F-0000000AwuV-3Cke;
	Thu, 19 Nov 2026 05:53:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iSKDXQpYsz8DfCp+Hl6lFNxx6TqgKVLI7ynM++rZhRE=; b=m6DdvMq3iMhFXvspsbLV6utzdN
	9nOj7deRmqFZWsBckW7PyhKpBZv2v0icgHhv7zJsm6Sg7VziQIsjDG1DXaqxsiUvIIsSOdU3w3fX8
	RhIWBLB7wHM14zV44zenEpAn6B6IPz3bV679NgWQCSuksEztjzc3w1LGGcgZE7N1C2xhxQ2QfmonJ
	qUXQU68gycLlxNPUNgVYSHIIfO8k4gaW8u+g/wxGV7frvsbXozwXVZNrLqPy21O9hxUcSUQIDGHaf
	rEjmHU4MGK3mopc3WLpF9Non1RyekteTh2NO6R82UsJI285rb4PBKUMMc31mDwK7Tvb8OzmZO29e7
	Zc4pPUSg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTv5A-0000000GsPY-1nJ8;
	Thu, 19 Nov 2026 05:53:20 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AJ5qXaoD2067808, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795067554; bh=iSKDXQpYsz8DfCp+Hl6lFNxx6TqgKVLI7ynM++rZhRE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=d+ItCVEAfiNqS8aOFA4+hKsvTUNsK2N1ZmoG4Nv0oZ0xwxtiZa9kig3Zjs03gvhaz
	 fBWjmUfzlyUjdU5gS/6Pcc8+ry6wBtpht2qNrXnk+Y48qPhA+qE4TI1WorfVscNiI4
	 dLxXyB+vM4QZGkdV0dGs3++6urlWFOzKXvh6UhTWL8pWVqdz8ugIGV/2Y5763VOpmd
	 o2qjjoEVLoirT080izUHEO57Y2PT8D0ganWJts/RB0VPNw1fyYiLcH3EhnlQhHTZTv
	 5zmZa6FF8M7ZPfOzQqrzQh82N14OTf+eLqxObIWSyrwlfTIoytHQQTzVJxt7w2sqAc
	 sjUuLmQeeMk3g==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AJ5qXaoD2067808
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Nov 2026 13:52:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 13:52:30 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Thu, 19 Nov 2026 13:52:30 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Brian Masney <masneyb@kernel.org>
CC: "sboyd@kernel.org" <sboyd@kernel.org>, "bmasney+clk@redhat.com"
	<bmasney+clk@redhat.com>, "jbrunet+clk@baylibre.com"
	<jbrunet+clk@baylibre.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, =?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?=
	<cylee12@realtek.com>, "afaerber@suse.com" <afaerber@suse.com>,
	=?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
Subject: RE: [PATCH v16 6/9] clk: realtek: Add support for MMC-tuned PLL
 clocks
Thread-Topic: [PATCH v16 6/9] clk: realtek: Add support for MMC-tuned PLL
 clocks
Thread-Index: AQHdcmZF5zcH/kJ6kk+n4kke5Xzn1LcqJ8QAgAHllPCACCHKAIAAwBIA
Date: Thu, 19 Nov 2026 05:52:30 +0000
Message-ID: <03f88e4e3b274aa5be2f9a415f69c73b@realtek.com>
References: <20261112052544.555563-1-eleanor.lin@realtek.com>
 <20261112052544.555563-7-eleanor.lin@realtek.com>
 <179450369605.1227210.10143810675268582312.b4-review@b4>
 <54a7a77705674bfdac23727f5fb92cb6@realtek.com> <av5dut67EajT0zn3@x1g10>
In-Reply-To: <av5dut67EajT0zn3@x1g10>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_055318_120720_5C23439D 
X-CRM114-Status: GOOD (  19.32  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQnJpYW4sDQoNCj4gSGkgWXUtQ2h1biwNCj4gDQo+IE9uIEZyaSwgTm92IDEzLCAyMDI2IGF0
IDAyOjEyOjU5UE0gKzAwMDAsIFl1LUNodW4gTGluIFvmnpfnpZDlkJtdIHdyb3RlOg0KPiA+ID4g
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBydGtfY2xrX3BsbF9tbWNfcmF0ZSAqDQo+ID4gPiA+ICty
dGtfY2xrX3BsbF9tbWNfZmluZF9jbG9zZXN0X3JhdGUoY29uc3Qgc3RydWN0DQo+ID4gPiA+ICty
dGtfY2xrX3BsbF9tbWNfcmF0ZSAqdGJsLA0KPiA+ID4gdTMyIG51bSwNCj4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHJhdGUsIHVuc2lnbmVkIGxv
bmcNCj4gPiA+IG1pbl9yYXRlLA0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgbWF4X3JhdGUpIHsNCj4gPiA+ID4gKyAgICAgY29uc3Qgc3RydWN0
IHJ0a19jbGtfcGxsX21tY19yYXRlICpiZXN0ID0gTlVMTDsNCj4gPiA+ID4gKyAgICAgdW5zaWdu
ZWQgbG9uZyBiZXN0X2RlbHRhID0gfjBVTDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICBmb3Ig
KHVuc2lnbmVkIGludCBpID0gMDsgaSA8IG51bTsgaSsrKSB7DQo+ID4gPiA+ICsgICAgICAgICAg
ICAgY29uc3Qgc3RydWN0IHJ0a19jbGtfcGxsX21tY19yYXRlICplbnRyeSA9ICZ0YmxbaV07DQo+
ID4gPiA+ICsgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBkZWx0YTsNCj4gPiA+ID4gKw0KPiA+
ID4gPiArICAgICAgICAgICAgIGlmIChlbnRyeS0+cmF0ZSA8IG1pbl9yYXRlIHx8IGVudHJ5LT5y
YXRlID4gbWF4X3JhdGUpDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsN
Cj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgICAgICAgIGRlbHRhID0gZW50cnktPnJhdGUgPj0g
cmF0ZSA/IGVudHJ5LT5yYXRlIC0gcmF0ZSA6DQo+ID4gPiA+ICsgcmF0ZSAtDQo+ID4gPiBlbnRy
eS0+cmF0ZTsNCj4gPiA+ID4gKyAgICAgICAgICAgICBpZiAoZGVsdGEgPCBiZXN0X2RlbHRhKSB7
DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBiZXN0ID0gZW50cnk7DQo+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICBiZXN0X2RlbHRhID0gZGVsdGE7DQo+ID4gPiA+ICsgICAgICAg
ICAgICAgfQ0KPiA+ID4gPiArICAgICB9DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgcmV0dXJu
IGJlc3Q7DQo+ID4gPiA+ICt9DQo+ID4gPg0KPiA+ID4gVGhpcyBkdXBsaWNhdGVzIHRoZSBmdW5j
dGlvbmFsaXR5IGluIGZ0YmxfZmluZF9jbG9zZXN0X2J5X3JhdGUoKSBmcm9tIHBhdGNoDQo+IDMu
DQo+ID4gPg0KPiA+DQo+ID4gSSBjb25zaWRlcmVkIHNoYXJpbmcgdGhlIGxvZ2ljLCBidXQgdGhl
IHR3byB0YWJsZXMgaGF2ZSBkaWZmZXJlbnQNCj4gPiBlbnRyeSBsYXlvdXRzLg0KPiA+DQo+ID4g
VW5pZnlpbmcgdGhlbSB3b3VsZCBuZWVkIGEgbWFjcm8gb3IgKHZvaWQgKikgKGJvdGggbG9zZSB0
eXBlDQo+ID4gY2hlY2tpbmcpLCBvciBlbWJlZGRpbmcgcnRrX2ZyZXFfdGFibGUgd2l0aCBjb250
YWluZXJfb2YoKSAoYSBsYXJnZXINCj4gPiByZXdvcmsgZm9yIGxpdHRsZSBnYWluKS4gSSBwcmVm
ZXIga2VlcGluZyB0aGUgdHdvIHR5cGUtc2FmZSBmdW5jdGlvbnMuIElzIHRoYXQNCj4gYWNjZXB0
YWJsZT8NCj4gDQo+IFdoYXQgYWJvdXQgdGhpcz8gVGhpcyBpcyBjb21wbGV0ZWx5IHVudGVzdGVk
Lg0KPiANCj4gICAjZGVmaW5lIGZ0YmxfZmluZF9jbG9zZXN0X2J5X3JhdGUoX3RibCwgX3JhdGUs
IF9taW4sIF9tYXgpICh7ICAgICAgICAgXA0KPiAgICAgICAgIHR5cGVvZigmKF90YmwpWzBdKSBf
X2Jlc3QgPSBOVUxMLCBfX2U7DQo+IFwNCj4gICAgICAgICB1bnNpZ25lZCBsb25nIF9fciA9IChf
cmF0ZSksIF9fbG8gPSAoX21pbiksIF9faGkgPSAoX21heCk7ICAgICAgXA0KPiAgICAgICAgIHVu
c2lnbmVkIGxvbmcgX19iZXN0X2RlbHRhID0gVUxPTkdfTUFYOw0KPiBcDQo+IA0KPiBcDQo+ICAg
ICAgICAgZm9yIChfX2UgPSAoX3RibCk7IF9fZS0+cmF0ZTsgX19lKyspDQo+IHsgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwNCj4gICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgX19kOw0K
PiBcDQo+IA0KPiBcDQo+ICAgICAgICAgICAgICAgICBpZiAoX19lLT5yYXRlIDwgX19sbyB8fCBf
X2UtPnJhdGUgPiBfX2hpKSAgICAgICAgICAgICAgIFwNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgY29udGludWU7DQo+IFwNCj4gDQo+IFwNCj4gICAgICAgICAgICAgICAgIF9fZCA9IGFic19k
aWZmKF9fZS0+cmF0ZSwgX19yKTsNCj4gXA0KPiAgICAgICAgICAgICAgICAgaWYgKF9fZCA8IF9f
YmVzdF9kZWx0YSkNCj4geyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIF9fYmVzdF9kZWx0YSA9IF9fZDsNCj4gXA0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICBfX2Jlc3QgPSBfX2U7DQo+IFwNCj4gICAgICAgICAgICAgICAgIH0NCj4g
XA0KPiAgICAgICAgIH0NCj4gXA0KPiAgICAgICAgIF9fYmVzdDsNCj4gXA0KPiAgIH0pDQo+IA0K
DQpUaGFua3MhIEknbGwgdXNlIHRoaXMgYXBwcm9hY2ggYW5kIGFkZHJlc3MgeW91ciBvdGhlciBj
b21tZW50cyBvbiB0aGlzIHNlcmllcw0KYXMgd2VsbC4NCg0KQmVzdCBSZWdhcmRzLA0KWXUtQ2h1
bg0K

