Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9D6606AED6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VGWOhKXv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ieaEY6fX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=h7bCszpq0n0gWj6DI+tjC7E3+LNbnjacz978YYbgIjc=; b=VGWOhKXvYfeUkn
	p0f2lg3zU0UiHM+33cgcNHIkZ5E8Zl6IeeeWnvtNDvyAX3gJMe3o3MsuRmiHDaqbLOlGjEPoxavhX
	RGss9TD113A/QAYPsy0KtPC48SJWbIW8jPUqH2JoEPX62BNPUsKlx3Vgwe6jHADTya6XCAFRLXOyB
	6X8BCYQK5ExyKnqKQ0Jrc4rPnLaPeMiEXaWgXf/NCStmIuus719g5/HzBGUNHsgC9eppLFS9yl5G6
	KSqILI/xjO/M89I8gwSTaqRssXHXs+cUxixJdmlsxzQEcXUtgYWUkzbojZIazPDZ4MsetOSLuQF7O
	rzWcmY2MNYCoSaHo5bvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH2G-000000080HD-2vgL;
	Wed, 11 Nov 2026 22:43:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH2D-000000080Ez-2vjt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:43:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 735C640F3B;
	Wed, 11 Nov 2026 22:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2379A1F00A0E;
	Wed, 11 Nov 2026 22:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794436997;
	bh=h7bCszpq0n0gWj6DI+tjC7E3+LNbnjacz978YYbgIjc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ieaEY6fXfbMKqzpHj2WISul8cuukvFWzzZopah9l/MZl+VUjT1yoOPN3dXfLuUaMa
	 I3MtVK8xXM9K1QZO/UwR3/Wyu8drx9w66e+uackh9VtrkAn7t3iHmsfWlrdd8Pdacb
	 r0k0FAztw8uQmfUefhczD6MYRoWvEOCHFNbznuGbXhFqjMyneQS7uuEx7nQHHK6z1D
	 6OExRJH7C/Calsmjud71ydVBw6i+AMXgtQ8VE5VXNHd4NAOX6Fftmly+B+bJOYCoUF
	 bl2fbJt+dugOSlof2VBMqBEE9OdsL7A2aieEbXZJ4y0Wc2UOjSoyNzop+Wq5N4YfvB
	 B0UIIDW2UY33g==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 16:43:00 -0600
Subject: [PATCH 3/9] arm64: dts: marvell: Drop unused USB connector PHY
 supplies
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-dtbs-marvell-v1-3-938788aff3ae@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
In-Reply-To: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

'phy-supply' is not a documented USB connector property. The generic PHY
framework only retrieves phy-supply from a PHY provider node. These
connector-child properties have no consumer, so remove them.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts     | 1 -
 arch/arm64/boot/dts/marvell/armada-7040-db.dts             | 2 --
 arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 1 -
 arch/arm64/boot/dts/marvell/armada-8040-db.dts             | 1 -
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi         | 1 -
 arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts    | 1 -
 6 files changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
index bd00e7df87c6..1ef4689d5f18 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
@@ -284,7 +284,6 @@ &usb2 {
 &comphy2 {
 	connector {
 		compatible = "usb-a-connector";
-		phy-supply = <&exp_usb3_vbus>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
index 3add6506ff20..f5a53fad66e6 100644
--- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
@@ -224,7 +224,6 @@ &cp0_utmi {
 &cp0_comphy1 {
 	cp0_usbh0_con: connector {
 		compatible = "usb-a-connector";
-		phy-supply = <&cp0_reg_usb3_0_vbus>;
 	};
 };
 
@@ -238,7 +237,6 @@ &cp0_usb3_0 {
 &cp0_comphy4 {
 	cp0_usbh1_con: connector {
 		compatible = "usb-a-connector";
-		phy-supply = <&cp0_reg_usb3_1_vbus>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
index 90ae93274a16..4efa2a1dbda7 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
@@ -599,7 +599,6 @@ flash@0 {
 &cp1_comphy2 {
 	cp1_usbh0_con: connector {
 		compatible = "usb-a-connector";
-		phy-supply = <&v_5v0_usb3_hst_vbus>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-db.dts b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
index c7102f74d4d5..89e6f35f310d 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
@@ -170,7 +170,6 @@ &cp0_usb3_0 {
 &cp0_comphy4 {
 	cp0_usbh1_con: connector {
 		compatible = "usb-a-connector";
-		phy-supply = <&cp0_reg_usb3_1_vbus>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
index f2d278d171eb..006293931c78 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
@@ -370,7 +370,6 @@ flash@0 {
 &cp1_comphy2 {
 	cp1_usbh0_con: connector {
 		compatible = "usb-a-connector";
-		phy-supply = <&v_5v0_usb3_hst_vbus>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts b/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
index def25d51c4bf..06a861f83ad8 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
@@ -491,7 +491,6 @@ &cp1_uart0 {
 &cp1_comphy2 {
 	cp1_usbh0_con: connector {
 		compatible = "usb-a-connector";
-		phy-supply = <&v_5v0_usb3_hst_vbus>;
 	};
 };
 

-- 
2.53.0


