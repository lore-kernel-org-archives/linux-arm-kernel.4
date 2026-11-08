Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9072606D815
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 14:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=afS/mr63;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=P7wBufqO;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=D8ON+GoZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sy3GGXbiim14+3emT4jupITc5ljZwoqUwy2yBUcnLsE=; b=afS/mr63JcbdRw
	uCDRku/O+C81SxFJVgfIZ7a6mt1jBzAWlbN0xa/bsXPX270yzMjGpyiDBQgnoU454KgfWjJmQXpdM
	BM6/rN0Rna3iVMp3HPn+h3bLgrISbDUv1hA71KCsRd1VKMzfLG6B0K9qab4R9ZyZX1srbTApwCV3U
	Ogv2g19go8ms5SKlcjCA64EQaKkczlGLmn/bimQBpz/u7J0gjQMQDrNXVNzBdZ5aEgEZ02bxrq/D/
	SxurIIpXtP16WsCN7Zdy0bkwGSgHEil8/RD++hmo68Dm5NgWjc0gxtsoZulmV4K3m64R841bpykcc
	0dy8/ORAjmhfAQtMtg7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ3nd-0000000GFR2-2bZO;
	Sun, 08 Nov 2026 14:23:13 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ3nV-0000000GFKv-1SYn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 14:23:06 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8F2851400132
	for <linux-arm-kernel@lists.infradead.org>; Sun,  8 Nov 2026 09:23:04 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 08 Nov 2026 09:23:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794147784;
	 x=1794234184; bh=sy3GGXbiim14+3emT4jupITc5ljZwoqUwy2yBUcnLsE=; b=
	P7wBufqOpBUk6Ke08YvlIrIlH5udt6hHqIDgASBRkcZKQ/mdy+h9r1be4LlJUiyj
	OHHQdqOzJWSWn6TTCLPO/7jfZO0LWnWMeiAlfoi5YdTYItjc9jwEpEdlQAM5FxeS
	MBYly9iPmwJxX4mAiXSnVx4upqQW/Dd3edeNP6YJU3oHFvRBmx3F2WOgsEaenAn/
	u3AH4YpYoPBoH275ifwTxzwBNWQuXred2b03K+cLDg4Cc0ccImpPxdxlPui5DwrY
	KYaZk6d2EwXGQGLMiPlzZcmyGhnIfq0/c+udiagsZe/g7ghHk5YcFRtItPYB150l
	fxDKIORkegpOaznysOctUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794147784; x=
	1794234184; bh=sy3GGXbiim14+3emT4jupITc5ljZwoqUwy2yBUcnLsE=; b=D
	8ON+GoZi+Je8djjLbi2eVHPbiXV6DhfOOn3KexTn2Y2W0rkgp247Z2K7AacmIr2a
	7JTng6BidpURIeJw5UktOGOZBsYj5L31TJMyFtjLNLgwNZQp5wXzOo0s49dbxeH2
	rig5BxCO1VUXx53Ez0selqFx2bYtS5ZXWvxIcs0TDc/zPZcE5Fl5ZRJE2ZNKXKTw
	RPNtHoYK3CRw1wgdAPw6+ly3lwQ2XJM62KiClSMv4PTBlyukiPka3XxHmUbyXJC5
	w5V8LwqeBzL68T0/7rTuER+S0uQKWvV7bJs+gSVuGLFSnb5Fmq208qYq5+RfcsTU
	CE3ghBcZ30FYqyUFAudyw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794147784; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:JAfwBlcKtZpAjpRhOvs+z/T/NFuzEhGrhvYoRXCae0TC38V
	WElMSho8aioZsgPGLaMsS4FLh3EDBl9sva54O6O6OKBiKGO64mYGSmjmuxa9UkZF
	qlqQmfYF/tgleWsDcKIDhT5p+W1Y33EOOB1SfkdSDMjOeFIYtUt2CWduRvE0fw69
	pKG6sFAggmBC59FsXvgTGub1tqfbFdUPoiTV65NYCbdyHIvIRRqet+xYtyBPTCXV
	AiJdKO2f6/FjWAPZH0NyawGXqB7R3UD6OQcH6ihfNUwMeoC58oGJyFz/kG7mtP2r
	OxgT/wgGaW9NPcHJKZO7eNCBiDlavUO8sn4n/1w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:6u3X/x9kbVPujw5Uk7rK/S3zUmt16smiZtaWQWH6PqQ=:r0rG/WrZOCC1QYcD/cUXrP1oUDkkSB0W4xjAYgXMERo=;
X-ME-Sender: <xms:yIXwaubI3ZDWo9En0esClhJd9dqiiLyeozoqNnmF2vfsy9vLUjSv5w>
    <xme:yIXwalXtqzSTQTHnA7Ar0VCLT3RNmcMrGXKbganSriVKZ-Ig4BdlfvrcC9itJPab1
    DpOMHpoQmjDtbLqppWh1QUgQDbLLDgQrqQcqzwN0ReZEYIE9eu4pTc>
X-ME-Received: <xmr:yIXwatghwWiThFUlP3zvWBQMPsVyFIJZpqt_f1UsYEAR4A138q0BekkvRGOaxR4lCbjd7H29VG3E_uynt0DtXhHLSt2NZ7j7Ge4>
X-ME-Proxy-Cause: dmFkZTGo3CfmNkGVcoCqQm+2xF5BgQTQHLEob89QGgMg/fmpPsx9Ba22YEWDsCMCAsJVht
    iPMwYglQfWngG0EQiTCIk1j//mHbmcbWVDR0k5U/uGGvuPWIdI5VF0QmVDi2K9omMvQXse
    1SsImkgs2/+NnGnQwBHgKzDKk3rdaZCpy9lOm/CBgsoPRaB2SL90jN/DpplvLkjqri7DRF
    34GZFZT6mx2KG6dtb3J1oKeeuxv77VarACJ5K9flwFuG4XW+zRuJ4up6S+R6m6RCgUFeXK
    suuZS7ohMrlLQBXad0P686p3sxTyrb8JLChbCEM521ZgNKvK+lIcmDaAFt7tO6sNGMYcC3
    RZLn9/XYtFZgJSS0cPJ8yXmfha/G7VDOQF6DaezHzwGKzHYhuyM+8kOQkA59AWxNETtVKe
    EzbkCFzPYmMtyTz8XVn88G+NBbXiJyo96YxVbXtHLsmn2mCwpkvp5ZKuYpGql0Uiab8yUK
    FwPwRRN2sszuhmkzumWh2BQGVSKfNezPvSOac6x1MAv40rF1/sCj2ogFdYMZk4o3wl3imn
    dCkCqWDS5szo6gYA8WBJkMz2BZ1CkxwC/oYMjE12245xeVpUW0uu/cl78wHNqCC+GylPsn
    dfRfY9Arfa9i0r4cQiFNBYdrWUE6oeOSJMB9GsojDrIdsMH2Q7ftPzwElqJA
X-ME-Proxy: <xmx:yIXwaomCabdsDFw_dvndzQNxUREypcXZKNjlaxeCGnMOMBk_73AS-w>
    <xmx:yIXwauwHYxxWTdF80Exqto7jAedSU1bFewXRFvGc-HyFN4daOllMlA>
    <xmx:yIXwaru5x7Y1E5g7In6aujeNh4mHlO_wQm-0kNkPjHl0YZOcYY2_xA>
    <xmx:yIXwartOAsslzalXbZZQkc8i6qoEA_SHL89AEPB8vB3Nopv03Yl5Hw>
    <xmx:yIXwal0K1jHP1jEhSGDEl_mcjm_AJDRdpXu7i2skWeZRxUsox7BuevAf>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Nov 2026 09:23:03 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Sun, 08 Nov 2026 15:22:41 +0100
Subject: [PATCH v2 7/7] arm64: dts: apple: t6032-j575d: Add PCIe device
 nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-apple-m3-pcie-v2-7-0e5ffec71da4@jannau.net>
References: <20261108-apple-m3-pcie-v2-0-0e5ffec71da4@jannau.net>
In-Reply-To: <20261108-apple-m3-pcie-v2-0-0e5ffec71da4@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Joshua Peisach <jpeisach@ubuntu.com>, 
 Michael Reeves <michael.reeves077@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2481; i=j@jannau.net;
 h=from:subject:message-id; bh=r0rG/WrZOCC1QYcD/cUXrP1oUDkkSB0W4xjAYgXMERo=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqwPrdt6lOorT5Xvydos/KRg2sp5L29rFe2LyNr4fdpzM
 fcvliX6HRNZGMS4GCzFFFmStF92MKyuUYypfRAGM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFR/PcbIMOWWyBK9gLlbeJoOT7k/cbrWvmcHXFenf324vu+Iza6jOxwY/gqF7wm
 QrpZW5JcUFb/HKnjg2FnhGULTviz/Iv2zMZYhhgcA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_062305_470949_BBA9EF5F 
X-CRM114-Status: GOOD (  11.55  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add WiFi, Bluetooth, SD-Card reader, ethernet NIC and USB xHCI device
nodes for M3 Ultra Mac Studio.
The bootloader will fill MAC addresses for the network devices, add
Wifi and Bluetooth calibration data and set "apple,antenna-sku".

Signed-off-by: Janne Grunau <j@jannau.net>

---
Changes in v2:
- fix copy'n'pated error in WiFi/Bluetooth PCI device compatibles,
  adjust to BCM4388 used on this devices
---
 arch/arm64/boot/dts/apple/t6032-j575d.dts | 72 +++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6032-j575d.dts b/arch/arm64/boot/dts/apple/t6032-j575d.dts
index 12991546d4bb..902fd90c25a5 100644
--- a/arch/arm64/boot/dts/apple/t6032-j575d.dts
+++ b/arch/arm64/boot/dts/apple/t6032-j575d.dts
@@ -16,7 +16,10 @@ / {
 	model = "Apple Mac Studio (M3 Ultra, 2025)";
 
 	aliases {
+		bluetooth0 = &bluetooth0;
+		ethernet0 = &ethernet0;
 		serial0 = &serial0;
+		wifi0 = &wifi0;
 	};
 
 	chosen {
@@ -46,3 +49,72 @@ memory@10000000000 {
 &serial0 {
 	status = "okay";
 };
+
+/* PCIe devices */
+
+/*
+ * Force the bus number assignments so that we can declare some of the
+ * on-board devices and properties that are populated by the bootloader
+ * (such as MAC addresses).
+ */
+&port00 {
+	/* WLAN */
+	bus-range = <1 1>;
+
+	wifi0: wifi@0,0 {
+		compatible = "pci14e4,4434";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		/* To be filled by the loader */
+		local-mac-address = [00 10 18 00 00 10];
+		apple,antenna-sku = "XX";
+		brcm,board-type = "apple,aruba";
+	};
+
+	bluetooth0: bluetooth@0,1 {
+		compatible = "pci14e4,5f72";
+		reg = <0x10100 0x0 0x0 0x0 0x0>;
+		/* To be filled by the loader */
+		local-bd-address = [00 00 00 00 00 00];
+		brcm,board-type = "apple,aruba";
+	};
+};
+
+&port01 {
+	/* SD card reader */
+	bus-range = <2 2>;
+
+	mmc@0,0 {
+		compatible = "pci17a0,9755";
+		reg = <0x20000 0x0 0x0 0x0 0x0>;
+		cd-inverted;
+		wp-inverted;
+	};
+};
+
+&port02 {
+	/* AQC113 10 Gbit Ethernet */
+	bus-range = <3 3>;
+	status = "okay";
+
+	ethernet0: ethernet@0,0 {
+		compatible = "pci1d6a,04c0";
+		reg = <0x30000 0x0 0x0 0x0 0x0>;
+		/* To be filled by the loader */
+		local-mac-address = [00 10 18 00 00 00];
+	};
+};
+
+&port03 {
+	/* USB xHCI */
+	bus-range = <4 4>;
+	status = "okay";
+};
+
+
+&pcie0_dart_2 {
+	status = "okay";
+};
+
+&pcie0_dart_3 {
+	status = "okay";
+};

-- 
2.56.0


