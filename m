Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FCA606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A9ZnwtGJ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kt9prDvC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZmeARabfdEOi3PPZ96dBxEZL3vDEXEkKVWiX+j0djeU=; b=A9ZnwtGJQSwWva
	iDDTsbCJTc0W6FlAIniY9Chkq7YbW97q/neUBLUnWwv02YtvCp1YAAAf8KZYwSSV8Z4EBYAMP62iY
	xh8m0X4d7Q9EPZMFXZRiGokskK8y52ElHaXCw5o7nb9TQVntbYSKYipsotBbFtkcHb6qtcTjTKJFG
	182QTW+3tUIFobf0HckeyKR3lqtbGaj46C52ku7OQWNkDtj8kO0byw+2gFtMyc+CdFYUUQ7vSPfrJ
	kKdgtOBNOfPVQRjnpKNQCf0tKV3U1iGgu7j5yBIUwFKzH3la1VCJ1BOw89qtgcRkSWk52uUCMlijD
	jDcziT0DNPeXjCGjAHcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxUw-00000002miX-1VLo;
	Mon, 16 Nov 2026 14:15:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxUl-00000002mbj-0lwo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:15:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9798362C66;
	Mon, 16 Nov 2026 14:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A975D1F000C4;
	Mon, 16 Nov 2026 14:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794838542;
	bh=ZmeARabfdEOi3PPZ96dBxEZL3vDEXEkKVWiX+j0djeU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Kt9prDvC44VP1oUFIDE4JpL9BgjoE8yIWeNGcFt/B/vW7tWe/BCnGBmam4G3Un0uF
	 GNWmMsWIb/+jFfNZsIW1TA90zRXybFjNXQv8zUBPF+Z3mC9JlDXKhEw9Arf08lMEqz
	 nY128Vl16TLOaGIxK67a9fiV44DrUDCsnXYR9viVPXqXDTXSinZJqhPO0LzRdkWkMr
	 Z8nTSLxopkA76nrw8aXH3OIKHSNTV5bbi6wYSJnEnCFE6R/MeAjUms8Y3jfSvkeIr7
	 b6rOZyOL0LZ5NVK9BrcLsEE9RX72Kj/q9S3KvGFRZE++3t8XPiWaNmIwJbFcuJf9X5
	 bzcUiJJGCBQMQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 7/8] arm64: dts: synaptics: Add SL2610 Ethernet nodes
Date: Mon, 16 Nov 2026 21:54:41 +0800
Message-ID: <20261116135442.4827-8-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116135442.4827-1-jszhang@kernel.org>
References: <20261116135442.4827-1-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the first DWMAC controller in the common SL2611 dtsi, then add
the second controller for SL2619, including interrupts, clocks, PHY
interface control offsets, queues and AXI burst configuration.

Add the shared MDIO master selector as an mmio-mux child of the global
system controller. Leave the MACs and selector disabled for boards to
enable according to their wiring.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/arm64/boot/dts/synaptics/sl2611.dtsi | 41 +++++++++++++++++++++++
 arch/arm64/boot/dts/synaptics/sl2619.dtsi | 36 ++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/synaptics/sl2611.dtsi b/arch/arm64/boot/dts/synaptics/sl2611.dtsi
index 663fe6034ba0..f6e2ce21ed19 100644
--- a/arch/arm64/boot/dts/synaptics/sl2611.dtsi
+++ b/arch/arm64/boot/dts/synaptics/sl2611.dtsi
@@ -281,12 +281,53 @@ aioclk: aviogbl: syscon@f7490000 {
 			clocks = <&osc>;
 		};
 
+		ethernet0: ethernet@f7a04000 {
+			compatible = "syna,sl2610-dwmac", "snps,dwmac-5.20";
+			reg = <0xf7a04000 0x2000>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk CLK_GETHRGMII>,
+				 <&clk CLK_GETHRGMIISYS>, <&clk CLK_GE0_PTP_REF>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref";
+			snps,axi-config = <&stmmac_axi_config_0>;
+			snps,mixed-burst;
+			snps,mtl-rx-config = <&mtl_rx_setup_0>;
+			snps,mtl-tx-config = <&mtl_tx_setup_0>;
+			snps,pbl = <32>;
+			syna,syscon = <&chip 0xa18>;
+			status = "disabled";
+
+			mtl_rx_setup_0: rx-queues-config {
+				snps,rx-queues-to-use = <1>;
+				queue0 {};
+			};
+
+			mtl_tx_setup_0: tx-queues-config {
+				snps,tx-queues-to-use = <2>;
+				queue0 {};
+				queue1 {};
+			};
+
+			stmmac_axi_config_0: stmmac-axi-config {
+				snps,blen = <256 128 64 32 0 0 0>;
+				snps,rd_osr_lmt = <0x7>;
+				snps,wr_osr_lmt = <0x7>;
+			};
+		};
+
 		clk: pinctrl: rst: chip: syscon@f7e10000 {
 			compatible = "syna,sl2610-soc-syscon", "syscon";
 			reg = <0xf7e10000 0x10000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			clocks = <&osc>;
+
+			mux1: mux-controller {
+				compatible = "mmio-mux";
+				#mux-control-cells = <1>;
+				mux-reg-masks = <0xa04 0x10>;
+				status = "disabled";
+			};
 		};
 
 		cpuclk: cpu_wrap: syscon@f7e30000 {
diff --git a/arch/arm64/boot/dts/synaptics/sl2619.dtsi b/arch/arm64/boot/dts/synaptics/sl2619.dtsi
index 96bd58bbed3e..57933a9aba28 100644
--- a/arch/arm64/boot/dts/synaptics/sl2619.dtsi
+++ b/arch/arm64/boot/dts/synaptics/sl2619.dtsi
@@ -41,4 +41,40 @@ pmu {
 		interrupt-affinity = <&cpu0>,
 				     <&cpu1>;
 	};
+
+	soc {
+		ethernet1: ethernet@f7a06000 {
+			compatible = "syna,sl2610-dwmac", "snps,dwmac-5.20";
+			reg = <0xf7a06000 0x2000>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk CLK_GETHRGMII1>,
+				 <&clk CLK_GETHRGMII1SYS>, <&clk CLK_GE1_PTP_REF>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref";
+			snps,axi-config = <&stmmac_axi_config_1>;
+			snps,mixed-burst;
+			snps,mtl-rx-config = <&mtl_rx_setup_1>;
+			snps,mtl-tx-config = <&mtl_tx_setup_1>;
+			snps,pbl = <32>;
+			syna,syscon = <&chip 0xa3c>;
+			status = "disabled";
+
+			mtl_rx_setup_1: rx-queues-config {
+				snps,rx-queues-to-use = <1>;
+				queue0 {};
+			};
+
+			mtl_tx_setup_1: tx-queues-config {
+				snps,tx-queues-to-use = <2>;
+				queue0 {};
+				queue1 {};
+			};
+
+			stmmac_axi_config_1: stmmac-axi-config {
+				snps,blen = <256 128 64 32 0 0 0>;
+				snps,rd_osr_lmt = <0x7>;
+				snps,wr_osr_lmt = <0x7>;
+			};
+		};
+	};
 };
-- 
2.55.0


