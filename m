Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847D4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 08:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fmbxDCea;
	dkim=pass (2048-bit key) header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=U1iz78/+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JRdTm7MLn01nzpZdxxiuJqZxEVjGoxZUMxFX5IpmmAw=; b=fmbxDCeawXudyLTUJBDWdBad7a
	z6QHQGDvnGpjhx+TXc+KiY7pmF1eYJuWUp9exjjYSLr9PXdBjv3HEzP+WfqUTE011ttYCjVRi8tVp
	cT58ivkpRKDwdXQd9225uzrtBS2oezHsca1WWXT/WUWTF2QnI35nTbRwACFwlZLLQ5K9rKNopj+t5
	94KuUqYc0Wr1Wr/HagUAZ5c1uQTwezh8QtJxsYFW3673peZd9To8uSOPSMfLP/al9Zw9UQB8vcfny
	IE6uS9KPOUnPaId6QPJStnBCM9glCgdkVIEAj8hVHrQ0Z0gRQyIApjbFBW7B8+Kt0mwCRFInenA5Q
	AiuLfiag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVDR-0000000CReX-22eb;
	Thu, 26 Nov 2026 08:52:29 +0000
Received: from mx2.securetransport.de ([188.68.39.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVDD-0000000CRa6-0nqo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 08:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1795683115;
	bh=JRdTm7MLn01nzpZdxxiuJqZxEVjGoxZUMxFX5IpmmAw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=U1iz78/+fyPLPWeC2+oR4S3SnaaBmqfe+WSxXzeN0L2hdHDTdBRhanRB1OTQvJLZd
	 xQzhWUpwaUoMnAXwscUUiVe7NsHQwV2KEM2V46gOHrOxtEpm3hP77PS48hYs8NQfKw
	 tEnSp8OECKDY/g0smgXwvMkL2L0rzWBaghBMHQ8Io5+yj1lNmQnjsUfZXEnxljIULc
	 Jhl9GRwjQYqHxCwmfIOLPnDPntApFtCXsCRnm4V9240f4z2rSugfwhJXonb7vUzg6U
	 6Xx/CnM/aB1cd7ZxPbfvEIuKyewNReJfgJ8GMyAhZFsjwgUADbN1MtgbtT8Wmi8wiO
	 Xpi+j1geuliww==
X-secureTransport-forwarded: yes
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Marek Vasut <marex@nabladev.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
CC: Pascal Zimmermann <pzimmermann@dh-electronics.com>, Conor Dooley
	<conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Frank Li
	<Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring
	<robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, kernel
	<kernel@dh-electronics.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH V2] ARM: dts: imx6ull-dhcom: Change eMMC pin configuration
Thread-Topic: [PATCH V2] ARM: dts: imx6ull-dhcom: Change eMMC pin
 configuration
Thread-Index: AQHdfNxvka56chsGIUmKS9A5oSlWCbc+vxUAgAFGNICAAAaZYA==
Date: Thu, 26 Nov 2026 08:51:54 +0000
Message-ID: <5e607c068ea54d5a859e1de82c1574b7@dh-electronics.com>
References: <20261125125621.6734-1-cniedermaier@dh-electronics.com>
 <a57373f2-dfb2-4344-8e2c-6621a623d170@nabladev.com>
 <4ef4ff8128b049d59a0ab23bea906468@dh-electronics.com>
In-Reply-To: <4ef4ff8128b049d59a0ab23bea906468@dh-electronics.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_005215_466557_C58A6039 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogQ2hyaXN0b3BoIE5pZWRlcm1haWVyIDxjbmllZGVybWFpZXJAZGgtZWxlY3Ryb25pY3Mu
Y29tPg0KU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDI2LCAyMDI2IDk6MjUgQU0NCj4+IE9uIDEx
LzI1LzI2IDE6NTYgUE0sIENocmlzdG9waCBOaWVkZXJtYWllciB3cm90ZToNCj4+PiBGcm9tOiBQ
YXNjYWwgWmltbWVybWFubiA8cHppbW1lcm1hbm5AZGgtZWxlY3Ryb25pY3MuY29tPg0KPj4+DQo+
Pj4gVGVzdHMgaGF2ZSBzaG93biB0aGF0LCB3aXRoIHRoZSBjdXJyZW50IHBpbiBjb25maWd1cmF0
aW9uIG9mIHRoZQ0KPj4+IGVNTUMgKHVzZGhjMiBpbnRlcmZhY2UpIHJlYWQgZXJyb3JzIGNhbiBv
Y2N1ciB3aXRoIGEgY2VydGFpbg0KPj4+IHR5cGUgb2YgZU1NQyBjaGlwcy4NCj4+DQo+PiBXaGlj
aCBjaGlwcyBhcmUgdGhvc2UgPw0KPiANCj4gVGhlIHByb2JsZW1zIG9jY3VycmVkIHdpdGggY2hp
cHMgZnJvbSBNYWNyb25peC4NCg0KVG8gYmUgbW9yZSBzcGVjaWZpYywgdGhlIG1vZGVsIHRoYXQn
cyBjYXVzaW5nIHByb2JsZW1zIGlzIGNhbGxlZA0KdGhlIE1hY3Jvbml4IE1YNTJMTTA0QTExWFZX
Lg0KDQpSZWdhcmRzDQpDaHJpc3RvcGgNCg==

