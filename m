Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADDD606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 20:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d8tLGr06;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pwt49z/C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L3RtAPo/Q0xISDGnqeW4o+tIddktllbaP7tLujNfIoM=; b=d8tLGr06ecDnX0
	5i7j/xwELN+zvjX0NF7EK/SHT4HpOtgifZDKewdu8BJfS9aoqJ9eI/ct4o9TEA3MN8Vc248isZQ3A
	r+z1hH+1EwRiDSEdzkdpkvozYJD38phRKEMJ1YQ3Vw13reVIBu550HNTKLZVDTABh/FMiya7qJooZ
	Jl6x1Jq/FH94xn+24sMF9YRiqJVutddPGdDKyXJ+7h5CuFRlGosYMHhekWjj2LhmVmQeW3x3DJqh1
	+V7j5qJW99A46ERMni+Wu8FXBC94SWz/aTZA689suaXLxqwgu46hzYL5TPuQKB9bULRwxqUNGOKiP
	UKJzKnRuUQArIAx1tusg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxQY-00000007lcV-059w;
	Tue, 24 Nov 2026 20:47:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxQR-00000007lYM-38ef
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 20:47:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 01BB662803;
	Tue, 24 Nov 2026 20:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF281F01564;
	Tue, 24 Nov 2026 20:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795553258;
	bh=L3RtAPo/Q0xISDGnqeW4o+tIddktllbaP7tLujNfIoM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Pwt49z/CAv3zxSsaIuFf0W5kP0eMaZhif6TjoTwPUnucefNvA4fNdwEmZsLPLJw5H
	 5Sn3Pjw5geaLSOSamgFYiAb4U6fVmBAcz7Vwq6SdA9Tq+6vUT3iEPHnQE1AbFwNfC5
	 XidJ2OzG2Ay351V47tlHAOXesY5jtLgPuAw/L/+DBSKktX83VSIoaVyR+w52I17SkI
	 8++8l6KGIKXPN4aVlb9FEhCIgSVxKUxc7OhSlodcYtS0+rqEAQHlGryL5CSoRMH2mx
	 sxZrSfHDQtFZvYy6/jvoxHzMeHLQ4BF8esPhMQk0npzyzoHAT34X+Ykr8Mbg/dNCrU
	 kMlXUB3AfbHvw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 24 Nov 2026 14:46:37 -0600
Subject: [PATCH v2 4/9] arm64: dts: marvell: armada-8040: Fix node names
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-dtbs-marvell-v2-4-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
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
v2:
 - Fix behind-32bit-controller@7f000000 in separate commit
---
 arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts |  2 +-
 arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts    | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
index 90ae93274a16..f9695b25da79 100644
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
index def25d51c4bf..4a0c477d65ed 100644
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


