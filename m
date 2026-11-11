Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB10606B012
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xJo941sF;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R/+5yJmE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9/5/8dOyDqQ1xEhv/96Eczu20G83ALlhjhXbEVyTE3A=; b=xJo941sF4Z6gPD
	2P9rhnmihjcFGZtyZXvQtFl12PiK5IfspADygyHfOJLi0hZCZ/6jtfUX58IB4kZazsiI4RrgKYu9o
	87lV2oEIXN++3JW74cWtLZoWAjphqUWdKYIdgB6X55i4cJ5wwdb7oNZdiT950D/lCEBxQbwpc5Z4N
	H1fAMV1otVN+LcFCHEnM3BZ7rIJdKGV53yXlinLfZsHqA2yl6sA99fvB+GBwWFuliFcUWGY8bdOdj
	A9FnDVdYjXgmQ7jIySOqjUno0yT+K/cv6sJzIUz2AJ43SNrBwWKDVptZoE7jQrRglZl59tzJkyrwU
	LkUT/mDNi/En7x6rI9Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH2W-000000080Q3-0vxi;
	Wed, 11 Nov 2026 22:43:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH2I-000000080IV-05P2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:43:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BA71642AC6;
	Wed, 11 Nov 2026 22:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620681F00A10;
	Wed, 11 Nov 2026 22:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794437001;
	bh=9/5/8dOyDqQ1xEhv/96Eczu20G83ALlhjhXbEVyTE3A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=R/+5yJmE4KaBsF1aXUf+XjI8G0njxOL9DRSS62soWh5qV6EpsGweYh8SvvT1Q4NWN
	 oD0dpqtE/SV288KczymCJqk30dbZ76d+km6r/bKOEsMUyd2DrXENWzQmFjHDQstVqW
	 03ES3pIeuqIgqo5D7JTbdvxDQOiZ4SNGD+a7pMb1kPyZuFQg4TtTXEiF0NSGJSv1Zo
	 Z7B/eWHQjkS1KXl3TZC3rJuUSnULofoSguyVmMqjFhZsCV4QWiaHNgReP88kyqxENr
	 jguGv4fjm2xOasjdfw1W/64ue9IkLwxb+bA4Wc9ba0rynirBhPm70ZL1sOLDQ+ALzf
	 RwSBeZHDc33mA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 16:43:02 -0600
Subject: [PATCH 5/9] arm64: dts: marvell: Fix node names
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-dtbs-marvell-v1-5-938788aff3ae@kernel.org>
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

Fix various node names to use standard names.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi              |  2 +-
 arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts |  2 +-
 arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts    | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
index 4878773883c9..814b8a2e8ea9 100644
--- a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
@@ -231,7 +231,7 @@ sdhci: mmc@805c0000 {
 		 * Dedicated section for devices behind 32bit controllers so we
 		 * can configure specific DMA mapping for them
 		 */
-		behind-32bit-controller@7f000000 {
+		dma-bus@0 {
 			compatible = "simple-bus";
 			#address-cells = <0x2>;
 			#size-cells = <0x2>;
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
index 4efa2a1dbda7..101d1518e28f 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
@@ -324,7 +324,7 @@ cp0_led1_pins: led1-pins {
 		marvell,function = "gpio";
 	};
 
-	cp0_copper_eth_phy_reset: copper-eth-phy-reset {
+	cp0_copper_eth_phy_reset: copper-eth-phy-reset-pins {
 		marvell,pins = "mpp43";
 		marvell,function = "gpio";
 	};
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts b/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
index 06a861f83ad8..68c8489e0a6f 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
@@ -165,7 +165,7 @@ cpu_active: cpu-active {
 		};
 	};
 	cooling-maps {
-		fan-map {
+		map-fan {
 			trip = <&cpu_active>;
 			cooling-device = <&chassis_fan_group0 64 THERMAL_NO_LIMIT>,
 					<&chassis_fan_group1 64 THERMAL_NO_LIMIT>;
@@ -191,19 +191,19 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0x0>;
 		spi-max-frequency = <20000000>;
-		partition@u-boot {
+		partition@0 {
 			label = "u-boot";
 			reg = <0x00000000 0x001f0000>;
 		};
-		partition@u-boot-env {
+		partition@1f0000 {
 			label = "u-boot-env";
 			reg = <0x001f0000 0x00010000>;
 		};
-		partition@ubi1 {
+		partition@200000 {
 			label = "ubi1";
 			reg = <0x00200000 0x03f00000>;
 		};
-		partition@ubi2 {
+		partition@4100000 {
 			label = "ubi2";
 			reg = <0x04100000 0x03f00000>;
 		};

-- 
2.53.0


