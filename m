Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B40606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 08:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ycdPvCBm;
	dkim=pass (2048-bit key) header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=KRftRRxu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GhXefzmZY9gWz2XO5wKueke+JFfkFr9M9YsFaTjCOvU=; b=ycdPvCBmX9kDYCYAPSJJ7tNCL6
	f+aLe9WQy0ViekoGaUbgclHIqVIN23P/6tQfVTqr1cV6eeUr4OrWoerhN/b1wNXBWdaG4r2xaOdFo
	zeD1UUOmhZCacRhnHeOLdNQB/z72BDna/rWulT/Xoi5yBpw79ZLi8doZLyq6cfM2n9LQnX2PrijgI
	Y8O4o+cRrCwuyaEgW1i0MNICEVatYWPiGfHeYry9UhdVJtKk+xCLybHHo2FFCQ6pdQXDBRKyTKrJy
	0Ewe5YFPaN80bC9O6L3RTQB631sNgxSK1OM803K9/rnc4bnqaDZ87wz1BZqtvgIZodRCGifYk4zPn
	YU4eKEzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUnf-0000000CNqA-04sd;
	Thu, 26 Nov 2026 08:25:51 +0000
Received: from mx3.securetransport.de ([2a01:4f8:c0c:92be::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUnb-0000000CNon-0SnP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 08:25:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1795681531;
	bh=GhXefzmZY9gWz2XO5wKueke+JFfkFr9M9YsFaTjCOvU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=KRftRRxuzHKoEGcsihtRYRfYTQ6HNy40Yr3998Pnsqg9qdd/TxNAIGeNHnXkPCiKf
	 XrsxZ/yuPY4TwPRukW/voTuKw/ZcmGOZjm3LeDb6kMj5MdiJ1sJHNXdAivn0QsRLBy
	 vJeRHR/jzwmZbS7MKCy5O2zycaHaNrqk5y+5DExOoEqPs5Kk54XhiEel1WLBBY5A6m
	 rYh9nznVIWPmBWlyGM9K/JkFHc4/GFz1b7iL2+j7UsvNnpL7jcyiBz2lXAc4bpL5tQ
	 9h2K7teuffOQwg6Pq4gTogXckCFK7fnYdiDb54hQnTkY1V9MtI1C7Et+heExTUOyjb
	 FJE6kftpUt5jQ==
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
Thread-Index: AQHdfNxvka56chsGIUmKS9A5oSlWCbc+vxUAgAFGNIA=
Date: Thu, 26 Nov 2026 08:25:29 +0000
Message-ID: <4ef4ff8128b049d59a0ab23bea906468@dh-electronics.com>
References: <20261125125621.6734-1-cniedermaier@dh-electronics.com>
 <a57373f2-dfb2-4344-8e2c-6621a623d170@nabladev.com>
In-Reply-To: <a57373f2-dfb2-4344-8e2c-6621a623d170@nabladev.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_002547_828962_984A4CEB 
X-CRM114-Status: UNSURE (   8.52  )
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

RnJvbTogTWFyZWsgVmFzdXQgPG1hcmV4QG5hYmxhZGV2LmNvbT4NClNlbnQ6IFdlZG5lc2RheSwg
Tm92ZW1iZXIgMjUsIDIwMjYgMjo1NyBQTQ0KPiBPbiAxMS8yNS8yNiAxOjU2IFBNLCBDaHJpc3Rv
cGggTmllZGVybWFpZXIgd3JvdGU6DQo+PiBGcm9tOiBQYXNjYWwgWmltbWVybWFubiA8cHppbW1l
cm1hbm5AZGgtZWxlY3Ryb25pY3MuY29tPg0KPj4NCj4+IFRlc3RzIGhhdmUgc2hvd24gdGhhdCwg
d2l0aCB0aGUgY3VycmVudCBwaW4gY29uZmlndXJhdGlvbiBvZiB0aGUNCj4+IGVNTUMgKHVzZGhj
MiBpbnRlcmZhY2UpIHJlYWQgZXJyb3JzIGNhbiBvY2N1ciB3aXRoIGEgY2VydGFpbg0KPj4gdHlw
ZSBvZiBlTU1DIGNoaXBzLg0KPiANCj4gV2hpY2ggY2hpcHMgYXJlIHRob3NlID8NCg0KVGhlIHBy
b2JsZW1zIG9jY3VycmVkIHdpdGggY2hpcHMgZnJvbSBNYWNyb25peC4NCg0KUmVnYXJkcw0KQ2hy
aXN0b3BoDQo=

