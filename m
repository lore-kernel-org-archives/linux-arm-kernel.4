Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1BE606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FA10Fhtx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9/78rtRRURK01QblaWP/fDifFu/hWWUOstlANF5c7ZE=; b=FA10FhtxgWql0lyAsruCAAkJFm
	uRRfX6RrUyWCkDXUpUkVM9qgIVPhD7jDe71RTamXaGpDUX/PBImCo7Vo95RKveAVtxpdiLqnYd2g1
	awnTIPAVFwoCYvJik8rg2QPAKbju7f3kQGXOSuymM2m5TfFyAufgln4QIizrQVEvol7WcP6b0EDyz
	/3hw+QQx2XGGr0TKHBocygFWTgm71+KB0BC2l7nQ2yFoxzUEZmyTU92S/YlwWz1SLgPst2WHDPo0C
	6MfPSot8D/QCjHU5uHjhIazhGpRTlruJFB37gNHwYyp3jzjZ91TtVOe60oFlvZvDq/PsQ6F0kyR29
	ylSzmFgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDAP-0000000A0t6-3vAk;
	Wed, 25 Nov 2026 13:36:10 +0000
Received: from exchange.fintech.ru ([195.54.195.159])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWD9x-0000000A0a9-3ekk;
	Wed, 25 Nov 2026 13:35:43 +0000
Received: from Ex16-02.fintech.ru (10.0.10.19) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 25 Nov
 2026 16:35:38 +0300
Received: from Ex16-01.fintech.ru (10.0.10.18) by Ex16-02.fintech.ru
 (10.0.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 25 Nov
 2026 16:35:38 +0300
Received: from Ex16-01.fintech.ru ([fe80::2534:7600:5275:d3f9]) by
 Ex16-01.fintech.ru ([fe80::2534:7600:5275:d3f9%7]) with mapi id
 15.01.2242.004; Wed, 25 Nov 2026 16:35:38 +0300
From: =?utf-8?B?0JbQsNC90LTQsNGA0L7QstC40Ycg0J3QuNC60LjRgtCwINCY0LPQvtGA0LU=?=
 =?utf-8?B?0LLQuNGH?= <n.zhandarovich@fintech.ru>
To: Damon Ding <damon.ding@rock-chips.com>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>
CC: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, Sandy Huang <hjc@rock-chips.com>,
	=?utf-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, Andy Yan
	<andyshrk@163.com>, Alexandre Marquet <tb@a-marquet.fr>, Marek Szyprowski
	<m.szyprowski@samsung.com>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "lvc-project@linuxtesting.org"
	<lvc-project@linuxtesting.org>
Subject: RE: [PATCH 2/3] drm/rockchip: analogix_dp: Disable pclk if setting
 eDP mode fails
Thread-Topic: [PATCH 2/3] drm/rockchip: analogix_dp: Disable pclk if setting
 eDP mode fails
Thread-Index: AQHdfNI4tpDqD8mls0G0iPaPmNDMp7c+lzeAgAAyieA=
Date: Wed, 25 Nov 2026 13:35:38 +0000
Message-ID: <81d9540f6b80438ba9b890023a984c90@fintech.ru>
References: <20261125114319.1089186-1-n.zhandarovich@fintech.ru>
 <20261125114319.1089186-3-n.zhandarovich@fintech.ru>
 <cb5cc4d5-150a-4215-a894-3b9c66db06fd@rock-chips.com>
In-Reply-To: <cb5cc4d5-150a-4215-a894-3b9c66db06fd@rock-chips.com>
Accept-Language: en-US, ru-RU
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_053542_294024_DAD25155 
X-CRM114-Status: GOOD (  21.38  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGVsbG8sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFtb24gRGlu
ZyA8ZGFtb24uZGluZ0Byb2NrLWNoaXBzLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJl
ciAyNSwgMjAyNiA0OjM0IFBNDQo+IFRvOiDQltCw0L3QtNCw0YDQvtCy0LjRhyDQndC40LrQuNGC
0LAg0JjQs9C+0YDQtdCy0LjRhyA8bi56aGFuZGFyb3ZpY2hAZmludGVjaC5ydT47IEFuZHJ6ZWoN
Cj4gSGFqZGEgPGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPjsgTmVpbCBBcm1zdHJvbmcNCj4gPG5l
aWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+OyBSb2JlcnQgRm9zcyA8cmZvc3NAa2VybmVsLm9yZz4N
Cj4gQ2M6IExhdXJlbnQgUGluY2hhcnQgPExhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNv
bT47IEpvbmFzIEthcmxtYW4NCj4gPGpvbmFzQGt3aWJvby5zZT47IEplcm5laiBTa3JhYmVjIDxq
ZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+OyBMdWNhDQo+IENlcmVzb2xpIDxsdWNhLmNlcmVzb2xp
QGJvb3RsaW4uY29tPjsgTWFhcnRlbiBMYW5raG9yc3QNCj4gPG1hYXJ0ZW4ubGFua2hvcnN0QGxp
bnV4LmludGVsLmNvbT47IE1heGltZSBSaXBhcmQNCj4gPG1yaXBhcmRAa2VybmVsLm9yZz47IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPjsNCj4gRGF2aWQgQWlybGllIDxh
aXJsaWVkQGdtYWlsLmNvbT47IFNpbW9uYSBWZXR0ZXIgPHNpbW9uYUBmZndsbC5jaD47IERtaXRy
eQ0KPiBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAb3NzLnF1YWxjb21tLmNvbT47IFNhbmR5
IEh1YW5nDQo+IDxoamNAcm9jay1jaGlwcy5jb20+OyBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250
ZWNoLmRlPjsgQW5keSBZYW4NCj4gPGFuZHlzaHJrQDE2My5jb20+OyBBbGV4YW5kcmUgTWFycXVl
dCA8dGJAYS1tYXJxdWV0LmZyPjsgTWFyZWsNCj4gU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNh
bXN1bmcuY29tPjsgbGludXgtDQo+IHJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGx2Yy0NCj4gcHJvamVj
dEBsaW51eHRlc3Rpbmcub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8zXSBkcm0vcm9ja2No
aXA6IGFuYWxvZ2l4X2RwOiBEaXNhYmxlIHBjbGsgaWYgc2V0dGluZw0KPiBlRFAgbW9kZSBmYWls
cw0KPiANCj4gSGkgTmlraXRhLA0KPiANCj4gT24gMTEvMjUvMjAyNiA3OjQzIFBNLCBOaWtpdGEg
WmhhbmRhcm92aWNoIHdyb3RlOg0KPiA+IFRoZSBlRFAtbW9kZSByZWdpc3RlciB3cml0ZSB2aWEg
cm9ja2NoaXBfZ3JmX2ZpZWxkX3dyaXRlKCkgY2FsbCBjYW4NCj4gPiBmYWlsIGFmdGVyIHBjbGsg
aGFzIGJlZW4gZW5hYmxlZC4gVG8gcHJldmVudCB0aGlzLCBkaXNhYmxlIHBjbGsgYmVmb3JlDQo+
ID4gcmV0dXJuaW5nIHRoYXQgZXJyb3Igc28gdGhlIHBsYXRmb3JtIHBvd2VyX29uIGNhbGxiYWNr
LCBpbiB0dXJuLA0KPiA+IHJlbGVhc2VzIHRoZSBjbG9jayByZWZlcmVuY2UgaXQgYWNxdWlyZWQg
b24gZmFpbHVyZS4NCj4gPg0KPiA+IEZpeGVzOiA3MjlmOGVlZmRjYWQgKCJkcm0vcm9ja2NoaXA6
IGFuYWxvZ2l4X2RwOiBBZGQgc3VwcG9ydCBmb3INCj4gUkszNTg4IikNCj4gPiBTaWduZWQtb2Zm
LWJ5OiBOaWtpdGEgWmhhbmRhcm92aWNoIDxuLnpoYW5kYXJvdmljaEBmaW50ZWNoLnJ1Pg0KPiA+
IC0tLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2FuYWxvZ2l4X2RwLXJvY2tjaGlw
LmMgfCA0ICsrKy0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAv
YW5hbG9naXhfZHAtcm9ja2NoaXAuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9hbmFs
b2dpeF9kcC1yb2NrY2hpcC5jDQo+ID4gaW5kZXggM2E4MDYwMGVlY2UxLi5hOTA1NjMwM2E5ODcg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2FuYWxvZ2l4X2RwLXJv
Y2tjaGlwLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvYW5hbG9naXhfZHAt
cm9ja2NoaXAuYw0KPiA+IEBAIC0xNDUsOCArMTQ1LDEwIEBAIHN0YXRpYyBpbnQgcm9ja2NoaXBf
ZHBfcG93ZXJvbihzdHJ1Y3QNCj4gYW5hbG9naXhfZHBfcGxhdF9kYXRhICpwbGF0X2RhdGEpDQo+
ID4gICAJfQ0KPiA+DQo+ID4gICAJcmV0ID0gcm9ja2NoaXBfZ3JmX2ZpZWxkX3dyaXRlKGRwLT5n
cmYsICZkcC0+ZGF0YS0+ZWRwX21vZGUsIDEpOw0KPiA+IC0JaWYgKHJldCAhPSAwKQ0KPiA+ICsJ
aWYgKHJldCAhPSAwKSB7DQo+ID4gICAJCURSTV9ERVZfRVJST1IoZHAtPmRldiwgImZhaWxlZCB0
byBzZXQgZWRwIG1vZGUgJWRcbiIsDQo+IHJldCk7DQo+ID4gKwkJY2xrX2Rpc2FibGVfdW5wcmVw
YXJlKGRwLT5wY2xrKTsNCj4gPiArCX0NCj4gPg0KPiA+ICAgCXJldHVybiByZXQ7DQo+ID4gICB9
DQo+IA0KPiBGb3IgdGhlIGVhcmxpZXIgcm9ja2NoaXBfZHBfcHJlX2luaXQoKSwgSSB0aGluayBh
IGdvdG8tYmFzZWQgZXJyb3IgcGF0aA0KPiBtaWdodCBiZSBjbGVhbmVyLg0KPiANCj4gQmVzdCBy
ZWdhcmRzLA0KPiBEYW1vbg0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmVjb21tZW5kYXRpb24sIEkn
bGwgaW5jbHVkZSB0aGlzIGNoYW5nZSBpbiB0aGUgdjIgc2VyaWVzLg0KDQpCZXN0IHJlZ2FyZHMs
DQpOaWtpdGENCg0K

