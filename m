Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ADA606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 16:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KVNtaIAN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cod0zp7p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3A3E6sXLIyQnIHDEX6Cx1wJAY2QjzvuJ/e8FaTKLYEg=; b=KVNtaIAN96hg6VBYmWexgtfA+c
	XFa+jVtxlgn/XgOZNkK2GAXsoqDTUi4G2c/KVphfsJ0rVtDWWyhu4J0S6VVvl246GjGW5EFvTFDUr
	OWoLVlMeliY6yEPBB2YAZatIKNOmYFETY3kxtbZm5GzmYYy6IJ79mQSrZDiZenLHCb+Mqnf6zTHxv
	sfqHJvKeoeeaOu+FzcjBAZleEhBRQE8SyTLoXHB/mfucmfoZgmOpfAIBlETKv3iiYvwDyYWQc8zjB
	c4z87I1GRzuMS4xAfxryhv+LyH/t/yiFPrHiPLQiOpUXfNdUHudXQpLuWRR0cGfRZD7COI80FbBFm
	hGIy/8jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFcK-0000000AVbx-0Mfz;
	Wed, 25 Nov 2026 16:13:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFcE-0000000AVY7-1q7M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 16:13:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DE1EA633BE;
	Wed, 25 Nov 2026 16:13:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795623181;
	b=AwXAzTJe4jDnV7dByyOdWkZUc5A7qrXmofz2f49r6c/bs1eQu/9OfUUIcCqufHyWvFTb
	 cbNA4pbxLkQJ5IXEMfjzilELVqHH61ixWfKlhhjLC1bhV8Uhp/0I8HuYG5c8sRNUadWdD
	 hQJ0rX9jS0rIAKtmDsYn+yueWsQeXPAxQ3eQ9vBQLTc81TGMhutZe/Mh0dQqU1S3smN2q
	 CKgL8dwbfzwirfPfoK7Fe1h4sQ0CoaQo+63/K8AXpu8IL7ZR/zoTBXebzMY7jNlYYydpg
	 AfMe4dsQrWxXfeu+QIzUztpgaDyX7m+IegVzGeHy33fUNUz0UGimqgEFP9G5sqVJc0A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795623181;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3A3E6sXLIyQnIHDEX6Cx1wJAY2QjzvuJ/e8FaTKLYEg=;
	b=tvoTPy4hf1tmWOPBCHxe/8TAikMXFdRKrvJTGI6/2Ac01uw4yCECTwCdNHuV4egPB/pj
	 lLoo6Fp10xoC55/ZGSarXGsqNrK6sd9F80DQT/H1Jvqxs1vWtB5exEmYHx6Lk4oxd9fX7
	 jIwaBid7yp5mrpb52R9+lgF0sgsNZA3xn4rWLjiukl1qzELeYBem37S9YSIu6H4z8PYFE
	 9zMHbS1Op8qPkQsV1xJKWmN9UlRiuHyMu0CurExkUduKZCGDqARII2fUnM/haS+82cu95
	 viWWfcGYwyLMY3NuD7Css5DSezpLvW58cKQ6D1vgIi6mAZNnDhWym52l13WDW9n0/mw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B64E1F01563;
	Wed, 25 Nov 2026 16:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795623181;
	bh=3A3E6sXLIyQnIHDEX6Cx1wJAY2QjzvuJ/e8FaTKLYEg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cod0zp7pg6TARplVW2UT+a/RzoUhXIpDrRRScxu21m4cRA1EOkDY70RYeZk3uVdwV
	 ty3XwEDLZV+oz9t3Bp11qeS6XAMmPsn6/gAaRAO1mdlIidkPls6QD46JoO953tQgXo
	 UPHHldhWL2y9ToDuE2Vcq2m8cRqr6QGPA0epIh7CYnCwlfhXm5ZBEQOeDOBrOjP0YV
	 ooPsHLxeycuf9WS74csH/OQhIwiS/wTH+7b0vZEJdM52SSYyfVMEMCk9ID79HbGtoK
	 Gur9tqtkrubKP8o8cQxkauNCRvYrkpQjkQ0uRUOyQI3MZ4ggFs6wcn+TmAUshNywKd
	 +kx7FY6te26Tg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A5E734CF54;
	Wed, 25 Nov 2026 16:12:47 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Date: Wed, 25 Nov 2026 16:12:41 +0000
Subject: [PATCH v3 1/2] arm64: dts: exynos: exynos7885-gta3xllte: Enable
 USB support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-gta3xllte-usb-battery-v3-1-2ef962bf5423@mentallysanemainliners.org>
References: <20261125-gta3xllte-usb-battery-v3-0-2ef962bf5423@mentallysanemainliners.org>
In-Reply-To: <20261125-gta3xllte-usb-battery-v3-0-2ef962bf5423@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Umer Uddin <umer.uddin@mentallysanemainliners.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Henri Ommer <henri@ommer.net>, David Virag <virag.david003@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795623167; l=1634;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=lq3RkQ/cpzRDW2dTSf0wXDxDTq/ch8FNKpY2bDIwhtU=;
 b=xOchDRY8climikJIu/c0kZk8l7G16xlR0c+suCGIHRnwaSkguijrc8Bw7Nod5cCWD+7VwIrDY
 Xxl7rgE3ZIPDXoqr8+oNH+nxhLITY3gptUb6a6MKeQf2yLUpwZSYKbV
X-Developer-Key: i=umer.uddin@mentallysanemainliners.org; a=ed25519;
 pk=Hsgrt4A72CFTe27AI1AAWlnLsiQrlb4+T+cbrfWDhUA=
X-Endpoint-Received: by B4 Relay for
 umer.uddin@mentallysanemainliners.org/20261109 with auth_id=1466
X-Original-From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: umer.uddin@mentallysanemainliners.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Umer Uddin <umer.uddin@mentallysanemainliners.org>

The Samsung Galaxy Tab A 10.1 (2019) has a USB-C port capable of USB 2.0
speeds, used both as host and device, and is used for charging the
tablet.

The port is controlled by an S2MU005 IC. Until support for it is
added, only USB device functionality is available, so enable the USB
controller and PHY in peripheral mode.

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 .../arm64/boot/dts/exynos/exynos7885-gta3xllte.dts | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts b/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts
index 03476f8b1200..c71101ed0ba9 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts
@@ -68,6 +68,12 @@ memory@80000000 {
 		      <0x0 0xc0000000 0x40000000>;
 	};
 
+	/* TODO: Remove this once PMIC is implemented */
+	reg_dummy: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "dummy_reg";
+	};
+
 	reserved-memory {
 		ranges;
 		#address-cells = <2>;
@@ -127,3 +133,25 @@ key_volup: key-volup-pins {
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
 	};
 };
+
+&usbdrd {
+	vdd10-supply = <&reg_dummy>;
+	vdd33-supply = <&reg_dummy>;
+
+	status = "okay";
+};
+
+&usbdrd_dwc3 {
+	/*
+	 * SoC in theory supports SS but no known device (including this one)
+	 * has it wired up.
+	 */
+	maximum-speed = "high-speed";
+
+	/* Force to peripheral until we have Type-C working */
+	dr_mode = "peripheral";
+};
+
+&usbdrd_phy {
+	status = "okay";
+};

-- 
2.56.1



