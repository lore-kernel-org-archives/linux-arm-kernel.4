Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCFC606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 13:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vEBGS1ZK;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=e8iUMloO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KYlDHaU0d0BcNbHJgBpvpRlrSDERAzx5Le8G4/1rMoY=; b=vEBGS1ZKHmd+7ac9dWyIpK+2cV
	8GOFsiGIZxoVY2nHkzWSlUe7n6bu7B6N05UpAj9eDLiJmyCE8LSxwBu98JjXN6/u+CBQRQV0jHHkG
	KwfhbXq+aQeTxmUd5xi4Jep0tkiVsUP0K+3boeWJrPpmWcRVGmZtvQMY6d9rI3v2wEjH0qQeq4S9+
	JtonB5aRRl1gr/NUtX2XcZDUciM/mNGQ1FO3V5lTBjPUXo1wp4D3b2icgC/NVj9Kb5Y4plbFr1dRf
	r7Fp10Nd6/MdE0X9xfCTJKvbiFOaUvX3FJqnhHss3mT9y9Qrd9SFWW74N8KdBycqTDwTbiP5385Z4
	GOA8nK4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTSz-00000003QVQ-3rCN;
	Mon, 23 Nov 2026 12:48:17 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTSw-00000003QUh-2o4b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 12:48:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9107D1A1797;
	Mon, 23 Nov 2026 12:48:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D6D7601E1;
	Mon, 23 Nov 2026 12:48:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 73FB511E68F49;
	Mon, 23 Nov 2026 13:48:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795438087; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KYlDHaU0d0BcNbHJgBpvpRlrSDERAzx5Le8G4/1rMoY=;
	b=e8iUMloOyNJ5zVEl5crV5boCsvIE2wqWJbvWJD1T/kqsFeIKQNBGWqNcHnCOFXGUiNYLY+
	sGj+sEJ5Ef750Gq6UB03oHHNijrhoaM5+i268AOMVpa/UREepJVHTthHBtSm40OECGKN4t
	g4f7lblY4VI/EFFs4FdqwdpjwEXfiD3wdu0OgDrBuHtqLrl6u3mdU9oy+Jwfc3MZpP+Yav
	qsseEMREUtf7fFvyWmDhSPmsj9JNcTfkkFx9omDo3/Qiuc4GM/ukV1G8O29b88Lm+TixkG
	8u07UvH8Zj746anst5Kk2/7wkKrVQefA/k0euVl7MVC8n6xWdRN7h2TnbhjcSA==
Message-ID: <06c5bb031304c493763b829899211cb46efb96f8.camel@bootlin.com>
Subject: Re: [PATCH v3 0/2] mailbox: Add Marvell MHU driver
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Sunil Kovvuri Goutham	
 <sgoutham@marvell.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Mon, 23 Nov 2026 13:48:02 +0100
In-Reply-To: <20261123094542.44101-1-paul.cercueil@bootlin.com>
References: <20261123094542.44101-1-paul.cercueil@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_044814_847401_4B952B53 
X-CRM114-Status: GOOD (  13.73  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

WW91IGNhbiBpZ25vcmUgdGhpcyB2My4KCkl0IGRvZXMgbm90IGNvbXBpbGUgYWx3YXlzIHdpdGgg
Q09NUElMRV9URVNULCBzbyBJJ2xsIHNlbmQgYSB2NC4KCkNoZWVycywKLVBhdWwKCkxlIGx1bmRp
IDIzIG5vdmVtYnJlIDIwMjYgw6AgMTA6NDUgKzAxMDAsIFBhdWwgQ2VyY3VlaWwgYSDDqWNyaXTC
oDoKPiBIaSBKYXNzaSwKPiAKPiBUaGlzIGlzIHRoZSB2MyBvZiBteSBwYXRjaHNldCB0aGF0IGFk
ZHMgc3VwcG9ydCBmb3IgdGhlIG1haWxib3ggZm91bmQgaW4KPiB0aGUgT2N0ZW9uVFggYW5kIE9j
dGVvblRYMiBiYXNlZCBTb0NzLCB3aGljaCBpcyB1c2VkIGZvciBTQ01JCj4gY29tbXVuaWNhdGlv
bi4KPiAKPiBUaGlzIHYzIGZpeGVzIGEgZmV3IHRoaW5ncyB0aGF0IFNhc2hpa28gY29tcGxhaW5l
ZCBhYm91dC4KPiAKPiBDaGFuZ2VzIGluIHYzOgo+IAo+IFsyLzJdOgo+IMKgLSBSZXF1ZXN0IGFu
IGludGVycnVwdCB2ZWN0b3Igb2YgZXhhY3RseSAzIGludGVycnVwdHMKPiDCoC0gUGFzcyBJUlFG
X05PX0FVVE9FTiB0byBkZXZtX3JlcXVlc3RfaXJxKCkKPiDCoC0gSW52ZXJ0IHN1Y2Nlc3MgY29u
ZGl0aW9uIG9mIG1ydmxfbWh1X2xhc3RfdHhfZG9uZSgpCj4gCj4gQ2hlZXJzLAo+IC1QYXVsCj4g
Cj4gR2VvcmdlIENoZXJpYW4gKDIpOgo+IMKgIGR0LWJpbmRpbmdzOiBtYWlsYm94OiBhZGQgTWFy
dmVsbCBNSFUKPiDCoCBtYWlsYm94OiBtYXJ2ZWxsLW1odTogYWRkIE1hcnZlbGwgTUhVIGRyaXZl
cgo+IAo+IMKgLi4uL2JpbmRpbmdzL21haWxib3gvbWFydmVsbCxtaHUueWFtbMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDYxICsrKysrCj4gwqBNQUlOVEFJTkVSU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDcgKwo+
IMKgZHJpdmVycy9tYWlsYm94L0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqAgMTEgKwo+IMKgZHJpdmVycy9tYWlsYm94L01ha2VmaWxlwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKwo+IMKgZHJpdmVy
cy9tYWlsYm94L21hcnZlbGxfbWh1LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
IDIzOCArKysrKysrKysrKysrKysrKysKPiDCoDUgZmlsZXMgY2hhbmdlZCwgMzE5IGluc2VydGlv
bnMoKykKPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWFpbGJveC9tYXJ2ZWxsLG1odS55YW1sCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9tYWlsYm94L21hcnZlbGxfbWh1LmMK


