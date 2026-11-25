Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC27606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0ksuXMRI;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zex+jN/+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0yUkBGKmBoC6GhNX7wcbNe62PEHvACOAwQiXFUd2RPI=; b=0ksuXMRIRcAdTzBm1LY1kovhI8
	Y2+OvvH4HVK411k8PVnbjsMcEwNJuGIyqYnf+wlBuqUzJfI9YCS8wkx9B4gUHsLTt5M/5iPeeGKiX
	7MXLg+xcmMTn653gFfay6H5DgbCpgBHXXPGXbI7ZPE0Brc5vOkGe7Ng7zU0qsvdVf198S3el4ZVJ7
	2Tl3IzCtmFJ1jT/7xt5nBNIG3rScVKEDks8ELaLOpmMifsQGfmIo1O+sx/ZDRlRQs30ki0Wn867UV
	8+DEzWshCYTZOF+hedYQBaXxTwUhKE+SSrCWJzBOCr0Y95qU1ciCsLuz6pmKOOE1evkV94Eee0LJZ
	pyB3vh9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9R5-00000009KFn-3T68;
	Wed, 25 Nov 2026 09:37:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9PV-00000009JGo-19IX;
	Wed, 25 Nov 2026 09:35:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F3C3A43653;
	Wed, 25 Nov 2026 09:35:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795599328;
	b=ZzB6lleHf7a0HXp5DpV3ipNNvEO8o0onl47+OMH+SJODVRo79gGnqn6Lhoq+Nb0CmncP
	 52fZOomUL8667LoeH0ZgCw5iQAMxNZy3qFwsp/Gt3bj8A5YmK735DUYEOqckreV/Knk4i
	 D1uZMlAGtblSRVUr3FNUzLvCoKzykdpPNGKj5sG95KoslKuOrajx9AOWIazL0cXN39Ck2
	 rOSoJZvjqKZoiwaGRjbkoEuJ6EJ/KciZfV5eB8EalCOVRiuef5HD9lPQhoInELNXIrsgM
	 N/2zrJKFuJjzhwzzIzx6rDCARk+IzEGPYxwDpQhgG10YeoIx2OrVC+dlhD1QEorURFA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795599328;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0yUkBGKmBoC6GhNX7wcbNe62PEHvACOAwQiXFUd2RPI=;
	b=3PNh2NfTImGH73IFpmemJDBSXqTphzfqW9SgZszDqRUdSr5IewWB0Zb9W0oLxlv/MRWL
	 y58PK3Jx0rKrxmT41vq6+G8V09O5+4UWDvFBr5H8EzzaLpBb3F+R26UXcVzdy6O7+exLK
	 8Tq4zkVIfuGXOuD1euePfGh4oPr3W4Ix72m3TruOV9ng5lNwluUFfaZjluQ9dzLRaBus5
	 a7A3BOpT41Jjb9miO3VpH5oj07hYhK33X9D4NN05Px56FvGWwNnFGEhnatwy+O1biMV/V
	 nBZcuCFLeW+uyiR7XIb6g2X2hNnklRB3pXqKFWum1zqtLmuy7LHcYfSOWteKUsV3L1Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6E4BE1F000F0;
	Wed, 25 Nov 2026 09:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795599328;
	bh=0yUkBGKmBoC6GhNX7wcbNe62PEHvACOAwQiXFUd2RPI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Zex+jN/+37HMvNaBECWdUKjnUlubol4xzfXc7I3G3u1Iy2zSoZMMpUSnUMXjVBWjV
	 2qp8mNfop9TM/bn80ojjR8p2wZSJIeFKLCQGxhYJWznnRK1JIop4EtRFit1LIJrEZ6
	 mxhGIN624A+pfx6R57Bu+FaYzMAI7VnaI0tc4BigbCSLC/Rtx4fd3ajO5Tt5YJP6J2
	 JJYWjasA03W/b4mKRLIwz3P9HNyT2Oc4b8PV9dGEfZx548JQOhQ4hygvBi7REXr1jt
	 wg2FJ9z0QwQUhLHvCf9qDH12IullaBfoEIBhKTeoMqFmXHlQOaeHAiDl++ydAQkj1A
	 6TrzeN7A7SMJw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2FD814CE2A;
	Wed, 25 Nov 2026 09:34:38 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Wed, 25 Nov 2026 10:33:57 +0100
Subject: [PATCH RFC v4 15/15] arm64: dts: s32g: Add S32G3-RDB3 SerDes
 routing variants
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-s32g_serdes-v4-15-3bfe0589be8d@oss.nxp.com>
References: <20261125-s32g_serdes-v4-0-3bfe0589be8d@oss.nxp.com>
In-Reply-To: <20261125-s32g_serdes-v4-0-3bfe0589be8d@oss.nxp.com>
To: Vincent Guittot <vincent.guittot@linaro.org>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Bogdan Hamciuc <bogdan.hamciuc@nxp.com>, 
 Ionut Vicovan <ionut.vicovan@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795599274; l=5200;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=ey+259q8NVdz+nmA6w91HlJzOAXDIhQhflExVQ+Y8o0=;
 b=O0br6DpDGuG00R9/Celm9Vz7oEv9fLtAFCfkd5v/N6CHAZKEdn/Imv4bxMILlCtnoOJSiljUK
 aZxBB69RSipClJeod4fr8tGUD+wbk0T49UrIEPVkvvKgfIFgP0hgD4B
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
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
Reply-To: jan.petrous@oss.nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

The S32G3-VNP-RDB3 wires GMAC0 to an on-board KSZ9031 RGMII PHY by
default. Add two board variants which route GMAC0 over SerDes_0 for
SGMII instead:

  - mode 1: PCIe x1 on lane 0, GMAC0 SGMII (XPCS0) on lane 1;
  - mode 3: GMAC0 SGMII (XPCS0) on lane 0. Lane 1 (XPCS1, PFE_MAC2)
    has no consumer, as there is no PFE driver, and is not described.

The variants are full .dts files that include s32g399a-rdb3.dts, not
overlays: they drop the phy-handle of GMAC0, and /delete-property/ has
no effect in an overlay.

The routing is described by the consumers: the PCIe root ports
reference lane 0 with PHY_TYPE_PCIE, GMAC0 references its lane with
PHY_TYPE_SGMII and XPCS0, and takes the PCS from the SerDes through
pcs-handle.

The mode 1 variant also enables both PCIe root complexes: PCIe_0
reaches the M.2 slots when board switch SW17-2 is ON, PCIe_1 the PCIe
card slot. SerDes_1 carries only PCIe_1 on lane 0, as there is no PFE
driver to reference lane 1, and runs the first matching mode, PCIe x2,
with an x1 link.

The SGMII lane goes to the on-board SJA1110 switch, which the variants
do not describe, so the MAC side is a fixed 1G link.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  2 +
 .../dts/freescale/s32g399a-rdb3-serdes-mode1.dts   | 65 ++++++++++++++++++++++
 .../dts/freescale/s32g399a-rdb3-serdes-mode3.dts   | 40 +++++++++++++
 3 files changed, 107 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..f92670254c6a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -1047,5 +1047,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-phygate-tauri-l-rs232-rs485.dtb
 dtb-$(CONFIG_ARCH_S32) += s32g274a-evb.dtb
 dtb-$(CONFIG_ARCH_S32) += s32g274a-rdb2.dtb
 dtb-$(CONFIG_ARCH_S32) += s32g399a-rdb3.dtb
+dtb-$(CONFIG_ARCH_S32) += s32g399a-rdb3-serdes-mode1.dtb
+dtb-$(CONFIG_ARCH_S32) += s32g399a-rdb3-serdes-mode3.dtb
 dtb-$(CONFIG_ARCH_S32) += s32n79-rdb.dtb
 dtb-$(CONFIG_ARCH_S32) += s32v234-evb.dtb
diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3-serdes-mode1.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3-serdes-mode1.dts
new file mode 100644
index 000000000000..c881376db27a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3-serdes-mode1.dts
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright 2021-2026 NXP
+ *
+ * NXP S32G3 Reference Design Board 3 (S32G-VNP-RDB3),
+ * SerDes_0 Mode 1: PCIe x1 (lane 0) + 1G SGMII via GMAC0 (XPCS0, lane 1).
+ */
+
+#include <dt-bindings/phy/phy.h>
+#include "s32g399a-rdb3.dts"
+
+/ {
+	model = "NXP S32G3 Reference Design Board 3 (S32G-VNP-RDB3), SerDes_0 Mode 1";
+};
+
+&serdes0 {
+	status = "okay";
+};
+
+/*
+ * SerDes_1: PCIe_1 on lane 0. Lane 1 (PFE) has no consumer, so the first
+ * matching mode, PCIe x2, is used.
+ */
+&serdes1 {
+	status = "okay";
+};
+
+/*
+ * PCIe_0 reaches the M.2 slots (M-key or E-key) when board switch SW17-2 is
+ * ON, PCIe_1 the PCIe card slot.
+ */
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_rp {
+	num-lanes = <1>;
+	phys = <&serdes0 0 PHY_TYPE_PCIE 0 0>;
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_rp {
+	num-lanes = <1>;
+	phys = <&serdes1 0 PHY_TYPE_PCIE 0 0>;
+};
+
+&gmac0 {
+	/delete-property/ phy-handle;
+	clocks = <&clks 24>, <&clks 17>, <&clks 16>, <&clks 15>;
+	clock-names = "stmmaceth", "tx", "rx", "ptp_ref";
+	phy-mode = "sgmii";
+	phys = <&serdes0 1 PHY_TYPE_SGMII 0 1000>;
+	pcs-handle = <&serdes0>;
+	status = "okay";
+
+	/* The lane goes to the on-board SJA1110 switch, not described here */
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+		pause;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3-serdes-mode3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3-serdes-mode3.dts
new file mode 100644
index 000000000000..8b90d5f14d2a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3-serdes-mode3.dts
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright 2021-2026 NXP
+ *
+ * NXP S32G3 Reference Design Board 3 (S32G-VNP-RDB3),
+ * SerDes_0 Mode 3: 1G SGMII via GMAC0 (XPCS0, lane 0). Lane 1 (XPCS1,
+ * PFE_MAC2) is not described.
+ */
+
+#include <dt-bindings/phy/phy.h>
+#include "s32g399a-rdb3.dts"
+
+/ {
+	model = "NXP S32G3 Reference Design Board 3 (S32G-VNP-RDB3), SerDes_0 Mode 3";
+};
+
+/*
+ * SerDes_0 mode 3: GMAC0 via XPCS0 on lane 0. Lane 1, PFE_MAC2 via XPCS1,
+ * has no consumer, as there is no PFE driver.
+ */
+&serdes0 {
+	status = "okay";
+};
+
+&gmac0 {
+	/delete-property/ phy-handle;
+	clocks = <&clks 24>, <&clks 17>, <&clks 16>, <&clks 15>;
+	clock-names = "stmmaceth", "tx", "rx", "ptp_ref";
+	phy-mode = "sgmii";
+	phys = <&serdes0 0 PHY_TYPE_SGMII 0 1000>;
+	pcs-handle = <&serdes0>;
+	status = "okay";
+
+	/* The lane goes to the on-board SJA1110 switch, not described here */
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+		pause;
+	};
+};

-- 
2.55.0



