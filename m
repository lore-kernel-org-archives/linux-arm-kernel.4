Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D5D606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bCUMD8wO;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AuEEmUUT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eq1p+Ex/8mIBHU8Qt5C30QIxZgDwKvzJ+MobtiE/1K8=; b=bCUMD8wOxWHFPAk08FCWWAyvvp
	cL2vZ3FOPq2IqIUBI+zzVVsYYXeEM3Zxbq1OlpqO60+5/+jhOTvhOLWSfvtwJGD98exuKTf09MsVA
	wy6EFzXQFRRn/V0m2R/KHFEn2DujoGk1ExHJA2e8UkxJWYAG5K90K9dGb56If/2xEQU2KZLtygSWd
	xBgGgb74mt4TKMvBtMzzM4biNppZVmdIG2t7hEBfyHQ5E12t2emWy0HTmKA86doWMrb6HrspFQd6x
	Mq5S0eCp+jg0vW8uVp/gKF3M1t3A7PYY8nxoyyFsKVRRS33XfIAVp9RgqHWfifXYubpYHJKwEuSUV
	GCR5Z4sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWW52-0000000CbgJ-29C7;
	Thu, 26 Nov 2026 09:47:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWW51-0000000Cbf5-3rTv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 09:47:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E639D6116B;
	Thu, 26 Nov 2026 09:47:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795686470;
	b=f9OLc+EbCkw/JvwlQvrTHNsOPa45x/N6WHD4KcJCFJ1dlO1BIt3FEl2q1R+zFXBLZDJS
	 JMAEk5DdS40Z2vKRUGHkKPedwot30VTMRS9iV1iF6x2PcDrxEgp616nIt4NihOohx7iUv
	 asew/brHNnECI5aQJ3eU/jo4I0FAc7V2JtcNMrwucMtRvKNNM72iN6gnsmh/Hn/fjSzkO
	 SjdcsMNt06EDIBUr/aATQe2k0fk7QTmATwGNAnTyHHsJSlei5o3z44PhoIgqWIj/Syw5u
	 6MY0DdJcmSoJ93LHo//3GBsLoX7LONzaEV7+a/OUMG1oKlzuGolfsNe2FjsQtCDjMsw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795686470;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=eq1p+Ex/8mIBHU8Qt5C30QIxZgDwKvzJ+MobtiE/1K8=;
	b=jnjGluZbFbUoa49RiczPzyke5LW/7/1uQxBDj50Jlk0ZkfFLVFUohhG/7X/9VzvYKZKw
	 cLkV1UZFnhcYxt3btBQ86vhU1IU8gjsjhKPGnibbTD4dNnpxBwXuhetp0d0QYcTMjnRMS
	 GuKrzYtWl/ad8wR0TD1IekJG7+pKA7XSp8ACh/tMkF7STRGPEDYdl5RyJH0M8KPQHuFGk
	 70JpklCyMW7j3gGltCt8TJhFa4HsJABKf57o0L2HFK11hE/KxZFv3lC6P/wboFRts0uMh
	 Qu2y5GoUp3nYKnJ49YJPWnC3gMokrnxssvLpRCUlVjKZeWuX/VZDNb8HMjWLX/NXKLA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E99581F0156B;
	Thu, 26 Nov 2026 09:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795686470;
	bh=eq1p+Ex/8mIBHU8Qt5C30QIxZgDwKvzJ+MobtiE/1K8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AuEEmUUTj6UBrMuRDptqMy+CBkt43yvvBu1OMI7ot13L8vfVMohHk+/h14nYrnydh
	 /uuPQdzvuNQqyRPH2jhJEQ+2cR/8ggwlUoEsisqiRO/m6Iv349rc8qRWUO8GX9LJZT
	 tJE8NOiLEAomaDMACe0mc/R7Ed2XzQ+3ldPddjQaS1JXwBqa2rBiSWFYWT8rTyzwS9
	 d7yOlKFBSrlS7ffM53O4OmDCqXLl5R7Mcg58Jk6am6lxari3rmmMIxkRvAMNFxiRpL
	 VjZHT9xC9S3NUDjfm0UMFJSrwpLdmzhnM82qRn4neE7ggz4yHQmN1RcipaYsEhAhrT
	 XEe4QgsA3mQ/g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 776DB4D3BE;
	Thu, 26 Nov 2026 09:47:37 +0000 (UTC)
From: =?utf-8?q?Alexandra_=C3=98stermark_via_B4_Relay?= <devnull+alex.cramt.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 10:47:37 +0100
Subject: [PATCH v2 3/3] arm64: dts: socfpga: agilex5: add support for
 Terasic DE25-Nano
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-de25-nano-v2-3-02e43ba72681@gmail.com>
References: <20261126-de25-nano-v2-0-02e43ba72681@gmail.com>
In-Reply-To: <20261126-de25-nano-v2-0-02e43ba72681@gmail.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Mahesh Rao <mahesh.rao@altera.com>, 
 Mohamad Asyraaf Azhar <mohamad.asyraaf.azhar@altera.com>, 
 James Clark <jjc@jclark.com>, 
 =?utf-8?q?Alexandra_=C3=98stermark?= <alex.cramt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795686456; l=3350;
 i=alex.cramt@gmail.com; s=20261118; h=from:subject:message-id;
 bh=V3m+t24prnHtAV40uETUSwMPIzzcnltdfZUuhWnXUvU=;
 b=0091DnP1cT+Ozo3KkmjOpUkM79VI8nlQNYDhMoZRh5Vx87yNIH6UDuImeRYszSHV2M6RQ9msN
 EqYg0aaRwPZDelg67jfCnsBdGajePK5ZcMulkTh69GedmwT8qSWbp8Z
X-Developer-Key: i=alex.cramt@gmail.com; a=ed25519;
 pk=vQBaXUvFG7cCIaWDKclPMjo3b4XfPEVkuPjaWCkYddc=
X-Endpoint-Received: by B4 Relay for alex.cramt@gmail.com/20261118 with
 auth_id=1561
X-Original-From: =?utf-8?q?Alexandra_=C3=98stermark?= <alex.cramt@gmail.com>
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: alex.cramt@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alexandra Østermark <alex.cramt@gmail.com>

The DE25-Nano is an Agilex 5 SoC FPGA board with gigabit Ethernet, a
microSD slot wired for 3.3 V only, USB and one HPS LED.

Based on Terasic's and Altera's vendor device trees for the board, which
describe the SD slot on an SDHCI node that upstream doesn't have; this
uses the upstream SD6HC sdmmc node instead.

The HPS LED is active high: the vendor trees mark it active low, which
inverts it.

I2C1 is on the HPS's own pins and reaches the onboard LIS2DW12
accelerometer at 0x19, so unlike the other I2C controllers it doesn't
depend on the FPGA design.

Boot from microSD, gigabit Ethernet, USB, the LED, I2C1 and the watchdog
were tested on the board. The QSPI flash, the other I2C buses and the
SDM hardware monitor are left out until they have been tested.

Signed-off-by: Alexandra Østermark <alex.cramt@gmail.com>
---
 arch/arm64/boot/dts/altera/Makefile                |  1 +
 .../boot/dts/altera/socfpga_agilex5_de25_nano.dts  | 95 ++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/Makefile b/arch/arm64/boot/dts/altera/Makefile
index d38fe88a1..29170f793 100644
--- a/arch/arm64/boot/dts/altera/Makefile
+++ b/arch/arm64/boot/dts/altera/Makefile
@@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
 				socfpga_agilex_socdk_multiqspi.dtb \
 				socfpga_agilex_socdk_nand.dtb \
 				socfpga_agilex3_socdk.dtb \
+				socfpga_agilex5_de25_nano.dtb \
 				socfpga_agilex5_socdk.dtb \
 				socfpga_agilex5_socdk_013b.dtb \
 				socfpga_agilex5_socdk_modular.dtb \
diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex5_de25_nano.dts b/arch/arm64/boot/dts/altera/socfpga_agilex5_de25_nano.dts
new file mode 100644
index 000000000..128095578
--- /dev/null
+++ b/arch/arm64/boot/dts/altera/socfpga_agilex5_de25_nano.dts
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023, Intel Corporation
+ * Copyright (C) 2026, Alexandra Østermark
+ */
+#include "socfpga_agilex5.dtsi"
+
+/ {
+	model = "Terasic DE25-Nano";
+	compatible = "terasic,de25-nano", "intel,socfpga-agilex5";
+
+	aliases {
+		serial0 = &uart1;
+		ethernet0 = &gmac0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			label = "hps_led0";
+			gpios = <&portb 17 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the reg */
+		reg = <0x0 0x80000000 0x0 0x0>;
+	};
+};
+
+&gmac0 {
+	/* TX/RX delays are on the PCB */
+	phy-mode = "rgmii";
+	phy-handle = <&emac0_phy0>;
+	max-frame-size = <9000>;
+
+	status = "okay";
+
+	mdio0 {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		emac0_phy0: ethernet-phy@1 {
+			reg = <1>;
+		};
+	};
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&osc1 {
+	clock-frequency = <25000000>;
+};
+
+&sdmmc {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	disable-wp;
+	no-1-8-v;
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
+
+&smmu {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&usb0 {
+	disable-over-current;
+
+	status = "okay";
+};
+
+&watchdog0 {
+	status = "okay";
+};

-- 
2.56.0



