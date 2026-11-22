Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FF2606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 09:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=llQ2iq9x;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=V0VwF8LO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S60eQj6lys+qvFpthCLcJhVk99IHyJ9jWJ9dj910x3k=; b=llQ2iq9xHaXJpt
	Qhi+FS0K2ne1KFVVt02nfdbEckUAah9a3tnsWFWapbbKHEX77w8OgehLD5soypUgV+KUwE83KwECS
	ugKbZ+XjiD5wGs9NGhaptL47IHWP+ITe0Tu0EH7+2zk/7ma+Ntcup5IAdpkEOt81oJY1EhPzljIF2
	zIiDZzKo+tkk9YguaLqUH9MXvoNlFM5wXzt6SBVknoyPLp3sXZTqv7IprfuW0HZOg3hA/z4dQRYVH
	ErzWyksuAIDT6fF7sm3EBl93ZFNm5JT+zE6F7d6pXqeIX4sFtYlVyg7DJmicrOKMu9kWlznnmWdxA
	bM7sjYyViON6JQeE+DKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3t3-00000000uka-3JPC;
	Sun, 22 Nov 2026 09:29:29 +0000
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net ([162.243.161.220])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3sw-00000000ujI-1Ojb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 09:29:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
	In-Reply-To:References:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID; bh=S60eQj6lys+qvFpthCLcJhVk99IHyJ9jWJ9d
	j910x3k=; b=V0VwF8LOFPgOgNwIkSOimGPvC/vW2bPFgbmf5jww9RwO4xerY/uW
	WV8Afs7LjGh6t27SDOi0Fk1nZNpSrHDj/42EzapeDgwirIaB1QCe5UtgpZnBgeFG
	m1A2/XBFDcFol5M9lHit9m2u/bwjh2uv73JUZ8F3nYgDPIjn6eNbPvs=
Received: from wanghr2026$mail.zgclab.edu.cn ( [58.206.201.104] ) by
 ajax-webmail-web1 (Coremail) ; Sun, 22 Nov 2026 17:29:13 +0800 (GMT+08:00)
Date: Sun, 22 Nov 2026 17:29:13 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?546L5rWp54S2?= <wanghr2026@mail.zgclab.edu.cn>
To: "Brian Masney" <masneyb@kernel.org>
Cc: linusw@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] clk: versatile-icst: release regmap on registration
 failure
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT5 build
 20261010(691d8f62) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-4df55a87-4b50-4a66-85a0-70f79cb6c8b5-tsinghua.edu.cn
In-Reply-To: <179509997129.279270.1694900680492734463.b4-review@b4>
References: <1795076093787-3-ba1f065a@mail.zgclab.edu.cn>
 <179509997129.279270.1694900680492734463.b4-review@b4>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <6898ef95.3261f.1a20296984c.Coremail.wanghr2026@mail.zgclab.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: yAQGZQD3bT7ptQJrJYapAg--.47925W
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAgEQD2r+rlqQcgABsf
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_012924_925970_81E0B699 
X-CRM114-Status: GOOD (  16.80  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKCmRldm1fcmVnbWFwX2luaXRfbW1pbygpIGNhbm5vdCBi
ZSB1c2VkIGhlcmU6IHRoZSBvbmx5IGluLXRyZWUgY2FsbGVyCnBhc3NlcyBkZXYgPT0gTlVMTC7C
oCBpY3N0X2Nsa19yZWdpc3RlcigpIGlzIHJlYWNoZWQgZnJvbQp2ZXJzYXRpbGVfYXV4b3NjX2Ns
a19zZXR1cCgpLCByZWdpc3RlcmVkIHZpYSBDTEtfT0ZfREVDTEFSRToKCgrCoCDCoCBjbGsgPSBp
Y3N0X2Nsa19yZWdpc3RlcihOVUxMLCBkZXNjLCBjbGtfbmFtZSwgcGFyZW50X25hbWUsIGNtX2Jh
c2UpOwrCoCDCoCDCoCAoZHJpdmVycy9jbGsvdmVyc2F0aWxlL2Nsay12ZXJzYXRpbGUuYzo4MSkK
CgpUaGF0IHJ1bnMgYXQgZWFybHkgYm9vdCwgYmVmb3JlIGFueSBzdHJ1Y3QgZGV2aWNlIGV4aXN0
cywgd2hpY2ggaXMgd2h5CnRoZSBjb2RlIHVzZXMgdGhlIG5vbi1kZXZtIHJlZ21hcF9pbml0X21t
aW8oKSAtLSB0aGF0IGZ1bmN0aW9uIGhhcyBhbgpleHBsaWNpdCAiZGV2ID09IE5VTEwiIHBhdGgg
aW4gX19yZWdtYXBfaW5pdCgpLgoKCkkgdmVyaWZpZWQgdGhlIHByb3Bvc2VkIGNoYW5nZSBkaXJl
Y3RseTogYSBieXRlLWZvci1ieXRlIGNvcHkgb2YKaWNzdF9jbGtfcmVnaXN0ZXIoKSB3aXRoIHJl
Z21hcF9pbml0X21taW8oKSBzd2l0Y2hlZCB0bwpkZXZtX3JlZ21hcF9pbml0X21taW8oKSwgY2Fs
bGVkIGV4YWN0bHkgbGlrZSB0aGUgcmVhbCBjYWxsZXIgKGRldiA9PQpOVUxMLCBhIHJlYWwgaW9y
ZW1hcCgpJ2QgYmFzZSkuwqAgSXQgb29wc2VzIGluIGRldnJlczoKCgrCoCDCoCBVbmFibGUgdG8g
aGFuZGxlIGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgYXQgdmlydHVhbCBhZGRyZXNz
CsKgIMKgIMKgIDAwMDAwMDAwMDAwMDAyY2PCoCAob2Zmc2V0b2Yoc3RydWN0IGRldmljZSwgZGV2
cmVzX2xvY2spKQrCoCDCoCAuLi4KwqAgwqAgQ2FsbCB0cmFjZToKwqAgwqAgwqBfcmF3X3NwaW5f
bG9ja19pcnFzYXZlKzB4NWMvMHg4YyAoUCkKwqAgwqAgwqBkZXZyZXNfbm9kZV9hZGQrMHgyOC8w
eDcwCsKgIMKgIMKgX19kZXZtX2FkZF9hY3Rpb24rMHg3MC8weDkwCsKgIMKgIMKgX19kZXZtX3Jl
Z21hcF9pbml0KzB4NDAvMHg2OArCoCDCoCDCoF9fZGV2bV9yZWdtYXBfaW5pdF9tbWlvX2Nsaysw
eDg0LzB4ODAKwqAgwqAgwqBpY3N0X2Nsa19yZWdpc3Rlcl9kZXZtLmNvbnN0cHJvcC4wKzB4Njgv
MHhmOCBbdGVzdF9pY3N0XQoKCmRldnJlc19hZGQoKS9kZXZyZXNfbm9kZV9hZGQoKSBkZXJlZmVy
ZW5jZSBkZXYtPmRldnJlc19sb2NrLCBzbyBhbnkKZGV2bV8qIGNhbGwgaGVyZSBpcyBhIE5VTEwg
ZGVyZWZlcmVuY2UsIHdoZXJlYXMgcmVnbWFwX2luaXRfbW1pbygpCmhhbmRsZXMgZGV2ID09IE5V
TEwgZXhwbGljaXRseS7CoCBLZWVwaW5nIGl0IG5vbi1kZXZtIGFuZCByZWxlYXNpbmcgdGhlCnJl
Z21hcCB3aXRoIHJlZ21hcF9leGl0KCkgb24gdGhlIGljc3RfY2xrX3NldHVwKCkgZmFpbHVyZSBw
YXRoIGlzIHRoZXJlZm9yZSAKdGhlIGNvcnJlY3QgZml4LgoKClJlZ2FyZHMsCldhbmcgSGFvcmFu
CgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiQnJpYW4gTWFzbmV5IiA8
bWFzbmV5YkBrZXJuZWwub3JnPgo+IOWPkemAgeaXtumXtDoyMDI2LTExLTE5IDIyOjUyOjUxICjm
mJ/mnJ/lm5spCj4g5pS25Lu25Lq6OiAiV2FuZyBIYW9yYW4iIDx3YW5naHIyMDI2QG1haWwuemdj
bGFiLmVkdS5jbj4KPiDmioTpgIE6IGxpbnVzd0BrZXJuZWwub3JnLCBzYm95ZEBrZXJuZWwub3Jn
LCBibWFzbmV5K2Nsa0ByZWRoYXQuY29tLCBqYnJ1bmV0K2Nsa0BiYXlsaWJyZS5jb20sIGxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZywgbGludXgtY2xrQHZnZXIua2VybmVsLm9y
ZywgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZywgIkJyaWFuIE1hc25leSIgPG1hc25leWJA
a2VybmVsLm9yZz4KPiDkuLvpopg6IFJlOiBbUEFUQ0hdIGNsazogdmVyc2F0aWxlLWljc3Q6IHJl
bGVhc2UgcmVnbWFwIG9uIHJlZ2lzdHJhdGlvbiBmYWlsdXJlCj4gCj4gSGkgV2FuZywKPiAKPiA+
IGljc3RfY2xrX3JlZ2lzdGVyKCkgY3JlYXRlcyBhIG5vbi1kZXZtIHJlZ21hcCB3aXRoIHJlZ21h
cF9pbml0X21taW8oKSBhbmQKPiA+IGhhbmRzIGl0IHRvIGljc3RfY2xrX3NldHVwKCksIHdoaWNo
IG9uIGNsa19yZWdpc3RlcigpIGZhaWx1cmUgb25seSBmcmVlcwo+ID4gaXRzIG93biBzdHJ1Y3Rz
IGFuZCBkcm9wcyB0aGUgcmVnbWFwIHBvaW50ZXIsIHNvIHRoZSByZWdtYXAgYW5kIGl0cwo+ID4g
ZGVidWdmcyBlbnRyeSBsZWFrIHBlcm1hbmVudGx5LiBBIG5hbWUgY2xhc2ggaXMgYSBuYXR1cmFs
IHRyaWdnZXI6IGEgRFQKPiA+IHdpdGggTiBzYW1lLW5hbWVkIGF1eG9zYyBjaGlsZHJlbiByZWdp
c3RlcnMgIm9zYyIgb25jZSBhbmQgdGhlbiBmYWlscwo+ID4gLUVFWElTVCBvbiBldmVyeSBzdWJz
ZXF1ZW50IHJlZ2lzdHJhdGlvbiwgbGVha2luZyBOLTEgcmVnbWFwcyBwZXIgYm9vdC4KPiA+IAo+
ID4gUmVsZWFzZSB0aGUgcmVnbWFwIHdpdGggcmVnbWFwX2V4aXQoKSB3aGVuIGljc3RfY2xrX3Nl
dHVwKCkgZmFpbHMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFdhbmcgSGFvcmFuIDx3YW5naHIy
MDI2QG1haWwuemdjbGFiLmVkdS5jbj4KPiA+IEZpeGVzOiAxNzljOGZiM2MyYTYgKCJjbGs6IHZl
cnNhdGlsZS1pY3N0OiBjb252ZXJ0IHRvIHVzZSByZWdtYXAiKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2Nsay92ZXJzYXRpbGUvY2xrLWljc3QuYyBiL2RyaXZlcnMvY2xrL3ZlcnNhdGls
ZS9jbGstaWNzdC5jCj4gPiBpbmRleCAzNzMzNGFmZWUwNDAuLmU5YzczNTNhYTVkNSAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvY2xrL3ZlcnNhdGlsZS9jbGstaWNzdC5jCj4gPiArKysgYi9kcml2
ZXJzL2Nsay92ZXJzYXRpbGUvY2xrLWljc3QuYwo+ID4gQEAgLTQwNywxNCArNDA3LDE4IEBAIHN0
cnVjdCBjbGsgKmljc3RfY2xrX3JlZ2lzdGVyKHN0cnVjdCBkZXZpY2UgKmRldiwKPiA+ICAJCS5y
ZWdfc3RyaWRlID0gNCwKPiA+ICAJfTsKPiA+ICAJc3RydWN0IHJlZ21hcCAqbWFwOwo+ID4gKwlz
dHJ1Y3QgY2xrICpjbGs7Cj4gPiAgCj4gPiAgCW1hcCA9IHJlZ21hcF9pbml0X21taW8oZGV2LCBi
YXNlLCAmaWNzdF9yZWdtYXBfY29uZik7Cj4gPiAgCWlmIChJU19FUlIobWFwKSkgewo+ID4gIAkJ
cHJfZXJyKCJjb3VsZCBub3QgaW5pdGlhbGl6ZSBJQ1NUIHJlZ21hcFxuIik7Cj4gPiAgCQlyZXR1
cm4gRVJSX0NBU1QobWFwKTsKPiA+ICAJfQo+ID4gLQlyZXR1cm4gaWNzdF9jbGtfc2V0dXAoZGV2
LCBkZXNjLCBuYW1lLCBwYXJlbnRfbmFtZSwgbWFwLAo+ID4gLQkJCSAgICAgIElDU1RfVkVSU0FU
SUxFKTsKPiA+ICsJY2xrID0gaWNzdF9jbGtfc2V0dXAoZGV2LCBkZXNjLCBuYW1lLCBwYXJlbnRf
bmFtZSwgbWFwLCBJQ1NUX1ZFUlNBVElMRSk7Cj4gPiArCWlmIChJU19FUlIoY2xrKSkKPiA+ICsJ
CXJlZ21hcF9leGl0KG1hcCk7Cj4gCj4gVGhlcmUgaXMgYSBzdHJ1Y3QgZGV2IGhlcmUsIHNvIGRl
dm1fcmVnbWFwX2luaXRfbW1pbygpIHNob3VsZCBmaXggdGhpcwo+IGluIGEgY2xlYW5lciB3YXku
Cj4gCj4gQnJpYW4KPiAKPiAtLSAKPiBCcmlhbiBNYXNuZXkgPG1hc25leWJAa2VybmVsLm9yZz4K


