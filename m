Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319AA606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 06:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YxfbKpP4;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=pXDTTIPR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+Jd9GpNnKuAEXDZRlaw/A4HJ7oebPS5UXTKzQT7tnSw=; b=YxfbKpP4JMNqbE
	go2Ovyn+YoISo9c78Z4iso5z75lZncGmfuLw3O7P7hQbSsF3JTzQtVr4WOp/q0m4ciMXUGoeta65l
	2Rck/a9XotP9M7ukLSzS6bOQ/IIMOOpAPKz+TPtv5n8TWiZk3lEGOdDXRQc6xI+HqPdefzGMGxFPq
	07bAeZiGMGcf0DAlDiHq7SPus3YMcrJwA5bdiWlSn/l0XPHBYPkAmUpv5NfjiTN2MqaAI0WpaHvkb
	Z5oqEZsWKetvKu1CuYyt/YjXKeO3QyLJM12GdriWhnxKEikUbT8rCHElcGZVT5TB0ZYKC8Y5YyxSw
	B02FZEdEfi7XNbewDn/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Wc-00000008ggI-1pSa;
	Wed, 25 Nov 2026 06:30:38 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6WX-00000008gck-3eQY;
	Wed, 25 Nov 2026 06:30:35 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id AAE8A4C951;
	Wed, 25 Nov 2026 17:30:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795588224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Jd9GpNnKuAEXDZRlaw/A4HJ7oebPS5UXTKzQT7tnSw=;
	b=pXDTTIPReYFx9AL9Bd7ktHuVmFgDB3d218cZmrxtQG6VGpcK9QT741Mqbktcua3l8/FXPv
	UZOpcjQjKzYChKkqXPLE204ZSlNadlz9ZetzY/VaPNGsJUexhOoaB2++r9ZQFkWQVB5eDC
	BPfWGUgd1fprwXpO61xpyvOKLW7CstcW0iaTv75ipaCX27XnTSYyyG57W7POHz4/eUvTDA
	tnrFby/SjutnTmbYjYKOiBe7n82EH+OjD3rTNTBTIwWuVOgj1jnjQuMhEp53tWdo3e8Wbs
	r5f1peoT28tzk3Il0jw49/Cj0893XFSdlyYU+H/aAlzYkY9kE6BOPqczzmjYOQ==
X-GPT-Reason: This is a legitimate technical communication (patch
	submission) regarding Linux kernel or hardware driver development.
	The content is highly specific to technical engineering (PCIe,
	PHY nodes, DMA ranges) and aligns perfectly with the sender identity
	(alastair@d-silva.org) and the recipient's known personal domain
	(alastair@d-silva.org). No marketing, phishing, or scam indicators
	are present, and the technical nature of the body matches the expected
	activity for these specific users.
From: Alastair D'Silva <alastair@d-silva.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH 5/5] arm64: dts: allwinner: sun60i-a733: Add PCIe and Combo PHY nodes
Date: Wed, 25 Nov 2026 17:29:48 +1100
Message-ID: <20261125062948.1234677-6-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125062948.1234677-1-alastair@d-silva.org>
References: <20261125062948.1234677-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_223034_252586_D0FE8E86 
X-CRM114-Status: UNSURE (   9.32  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add SerDes syscon, Cadence Combo PHY, and DesignWare PCIe Root Complex
nodes to sun60i-a733.dtsi.

Place pcie@6000000 at the root node because soc@0 uses 1-cell addresses
and a 1 GB ranges window, whereas pcie@6000000 requires 64-bit
dma-ranges. Use the DWC integrated MSI receiver (msi IRQ) while GICv3
ITS remains disabled.

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
index b0f642f37803a..64bab9e90b72b 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
@@ -4,6 +4,8 @@
 #include <dt-bindings/clock/allwinner,sun60i-a733-ccu.h>
 #include <dt-bindings/clock/allwinner,sun60i-a733-r-ccu.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy.h>
+#include <dt-bindings/power/allwinner,sun60i-a733-pck-600.h>
 #include <dt-bindings/reset/allwinner,sun60i-a733-ccu.h>
 #include <dt-bindings/reset/allwinner,sun60i-a733-r-ccu.h>
 
@@ -539,6 +541,30 @@ mmc2: mmc@4022000 {
 			status = "disabled";
 		};
 
+		serdes: syscon@6c00000 {
+			compatible = "allwinner,sun60i-a733-serdes-syscon",
+				     "syscon";
+			reg = <0x06c00000 0x8000>;
+		};
+
+		combophy1: phy@6ca0000 {
+			compatible = "allwinner,sun60i-a733-combophy1";
+			reg = <0x06ca0000 0x20000>;
+			clocks = <&ccu CLK_SERDES_PHY>,
+				 <&ccu CLK_AHB_SERDES>,
+				 <&ccu CLK_MBUS_SERDES>,
+				 <&rtc CLK_HOSC_SERDES1>;
+			clock-names = "serdes", "ahb", "mbus", "ref";
+			assigned-clocks = <&ccu CLK_SERDES_PHY>;
+			assigned-clock-parents = <&ccu CLK_PLL_PERIPH0_600M>;
+			assigned-clock-rates = <100000000>;
+			resets = <&ccu RST_BUS_SERDES>;
+			power-domains = <&pck600 PD_PCIE>;
+			#phy-cells = <1>;
+			allwinner,serdes-syscon = <&serdes>;
+			status = "disabled";
+		};
+
 		r_ccu: clock-controller@7010000 {
 			compatible = "allwinner,sun60i-a733-r-ccu";
 			reg = <0x07010000 0x250>;
@@ -654,4 +680,54 @@ rtc: rtc@7090000 {
 			#clock-cells = <1>;
 		};
 	};
+
+	pcie: pcie@6000000 {
+		compatible = "allwinner,sun60i-a733-pcie";
+		reg = <0x0 0x06000000 0x0 0x00010000>,
+		      <0x0 0x06300000 0x0 0x00100000>,
+		      <0x0 0x06400000 0x0 0x00080000>,
+		      <0x0 0x20000000 0x0 0x01000000>;
+		reg-names = "dbi", "atu", "app", "config";
+		#address-cells = <3>;
+		#size-cells = <2>;
+		bus-range = <0x00 0xff>;
+		device_type = "pci";
+		ranges = <0x81000000 0x0 0x21000000 0x0 0x21000000 0x0 0x00010000>,
+			 <0x82000000 0x0 0x22000000 0x0 0x22000000 0x0 0x06000000>;
+		dma-ranges = <0x03000000 0x0 0x40000000 0x0 0x40000000 0x3 0xc0000000>;
+		clocks = <&ccu CLK_PCIE_AUX>,
+			 <&ccu CLK_PCIE_AXI_SLV>,
+			 <&ccu CLK_BUS_ITS_PCIE0_ACLK>;
+		clock-names = "aux", "slv", "mstr";
+		assigned-clocks = <&ccu CLK_PCIE_AXI_SLV>;
+		assigned-clock-parents = <&ccu CLK_PLL_PERIPH0_400M>;
+		assigned-clock-rates = <400000000>;
+		resets = <&ccu RST_BUS_PCIE>,
+			 <&ccu RST_BUS_PCIE_PWRUP>,
+			 <&ccu RST_BUS_ITS_PCIE0>;
+		reset-names = "core", "pwr", "mstr";
+		interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "app", "msi";
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pcie_intc 0>,
+				<0 0 0 2 &pcie_intc 1>,
+				<0 0 0 3 &pcie_intc 2>,
+				<0 0 0 4 &pcie_intc 3>;
+		max-link-speed = <3>;
+		num-lanes = <1>;
+		linux,pci-domain = <0>;
+		phys = <&combophy1 PHY_TYPE_PCIE>;
+		phy-names = "pcie0";
+		power-domains = <&pck600 PD_PCIE>;
+		allwinner,serdes-syscon = <&serdes>;
+		status = "disabled";
+
+		pcie_intc: legacy-interrupt-controller {
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+		};
+	};
 };
-- 
2.53.0


