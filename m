Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B651A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 12:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gVy1gn1Q;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vl7XJkXw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9m1xm47iTHmLbcZlMUBpwxPOmBYRH1wRG2JSqMQ6DpY=; b=gVy1gn1QnSlzgl3tRFlKwlEW3B
	+aUDo9VxsNyAmR+Gy7VN41ZMypZDvweBdW/63GtfskjhxzHZwhLrNiXxu5nny0DzYIpiislmr1UYe
	psxspNijthKej9VAnS4XikH5K3wOxJJ4HRS9KB1f+KOZpNsIA8mHtsxX39DJ86UPI3qrRHmx9sjxQ
	1mhEEyElRscGOBK30wc4xJBIr56mpzcQR8QOlB9GpN33y9I5UxvkZMzmzIq5z25cQxByATGsEESsL
	0t3U5EVWnrsSSY8ZZ//jbweHw7LGLAZ0seATb0nL9mIGnvjtC/cBGr2h6ILclGp+IGAXdbhNXR2Gp
	+qhdhVcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTUc-00000003QuG-22Vh;
	Mon, 23 Nov 2026 12:49:59 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTUZ-00000003Qrr-18CK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 12:49:56 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4a9be758734so1944834f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 04:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438193; x=1796042993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9m1xm47iTHmLbcZlMUBpwxPOmBYRH1wRG2JSqMQ6DpY=;
        b=Vl7XJkXwz4KSXbu3ert6lX1QaCC2dz5BLLV+5SToG++vvvJWjGfk7lBUmy2wFnvW91
         Fprr61NCz5RUJDv5ZEcgbaoM87Blf88Z062xsnjugYwhilZSMEXJ2plZg+68DCmX0+qY
         jKarG0FFDshUOPW/dKwEExS6KW1AdnQCmQNCtoB++XEntTCJtcuA7lAUoepE1N9xRyGR
         8atoyLtVr5Ujivg3BtewT8Qlq4kUUsNRRfWPyNJDQcDNqb2taV/OdtnFEA+ubojDidj/
         zfRfsNNlVnIl13P1Mcz9LeTyFuOj9XYUHJce8nsFpuLBSozrgKNDMCekKRB/CSphLggy
         Ab2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438193; x=1796042993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9m1xm47iTHmLbcZlMUBpwxPOmBYRH1wRG2JSqMQ6DpY=;
        b=SWB36YvO/p2cVwhfVt4U63jeCKS716EzPJpH4QdpWqDKDeyqYR757SrzoRij/juLUG
         1znzEIZpKWN0TbuY5JqxRo6Fg+deKXLnbAVMngsyhNABsjFHzXhiyBsSgXoOKuPPClhv
         Jg+wc8SoY8zqkOK9gIaaGZT+SrDIIUGITeZOZFdaJJT7N7FMEqo9ivl9KVLsIOegYOoM
         cAhRIQLZssT5441mc8OfyVpmlmhsI1yyKPsDrM7GmpfsZIm/vDxdXIWKygzzbKaJG1uN
         rKOrPK4IBN1i+WVbRloE/vd7M621CpXielcMhYEi+kBNf/Hruv6fMGYwUPSFZNwH2h/0
         gz/A==
X-Forwarded-Encrypted: i=1; AL+hErERHBLlmDRqOpFjCdNlaPqktIqMztcMzJPi9zA40iz8y3HeOkq3xardbHX19T55rxbK79zZnxoBnyyBm8vlrN5K@lists.infradead.org
X-Gm-Message-State: APuU4Z+UrZkGPU1iJ6Z7eZCQmvoutnv5tIx/jRCbGGMwHYKn9wtpfuKM
	fZzx4n67qRSfMp/T/NsdCSu88ZP6H4ONCT9/3U1GMIT6ShxhsZUhElM1KFi/BA==
X-Gm-Gg: AZFdTZc3jm2IkHEefr6x6gknOihKJPOjug9Gs5Wfk7YoAkDOztktOEzFnazz9y71bSL
	DZ7r1JtL8QRE2ctAmUKB9JyQTVFJ5I2yai+Vw9EdHaJlr4OWXHZhMjie26EyX4I2xSSwYseqqnm
	SWlIhmcSWfaN1aq0VDPfBKaR+7aYeDBPUj8BI/JLz/sRuy/DKYuJQXuVD/LzO9ik1JF2Re9X9gt
	tLl0FkHuRnLDGOvJN4w+Ups2daTXb6V/cXrqFb05Hulc07EnmdyhcGTqF6RBAkDza1FCzs/BFZK
	uZcWpkFOEaFYGxeCTwVWzdj5a5Gm0PWkr0akV8NUNkBvfrDfVBlXDmXCOFWWVROtD5o7jrhLoQk
	3rAWdm5GfRxWPtRLAfilImsGJ0vFjaAcn4pIBxgkaa/zJEDFWN5NaY/81U8JE8XwbEyQrY63dgF
	1XrlBncFgHAlRXrbbfOpgSDRDAyYyDn/BEEFPt1O+daLe7abLynIhwUZhhpQhWTmo2HGGcX33YT
	hBwgr3Zuz5U3VrkxUsdl8udwiNdNCM6qHBvhhsXv5aLQ5DYKFU7UOPYfVbzM00FsC7BvCo9nQke
	GpPF1KcVl14Ne7HjYfXhT57/htDbtt36WoTW50nJLUlOLOsP7Iu6j9bDWsMhNdjLlzPPFU+AVDw
	A++2TXTQo6dYX9zkCWXNNlVqD2ynQGGWjQzx6Hed/NI/bkUS0cw==
X-Received: by 2002:a05:6000:29d2:b0:499:1c0d:4568 with SMTP id ffacd0b85a97d-4abb400ba02mr15984169f8f.48.1795438192874;
        Mon, 23 Nov 2026 04:49:52 -0800 (PST)
Received: from GLaDOS.station ([187.13.213.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm24902638f8f.24.2026.11.23.04.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:49:52 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 1/1] arm64: dts: freescale: imx95-var: Add Cortex-M7 support
Date: Mon, 23 Nov 2026 13:49:46 +0100
Message-ID: <20261123124946.13887-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_044955_356817_CF53CB72 
X-CRM114-Status: GOOD (  18.44  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Stefano Radaelli <stefano.r@variscite.com>

Add a Cortex-M7 configuration for DART-MX95 on Sonata.

Place the reserved memory, remoteproc and MU7 configuration in a common
include so other carrier boards using Variscite i.MX95 modules can add
M7 variants by reusing this configuration and providing their own
peripheral assignments in a board overlay.

Add a Sonata overlay and a combined -m7 DTB for remoteproc and RPMsg
support, enabling MU7 only in the M7 configuration.

Reserve eDMA1, eDMA2, FlexCAN1, LPI2C4, LPUART3 and LPUART8 for the remote
firmware. Use PIO for the remaining active I2C, SPI and UART controllers,
and disable SAI3 and its sound card because eDMA2 is unavailable to Linux.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
This patch depends on both of the following commits, which are already
present in linux-next:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

 arch/arm64/boot/dts/freescale/Makefile        |  5 ++
 .../dts/freescale/imx95-var-common-m7.dtsi    | 72 +++++++++++++++++++
 .../freescale/imx95-var-dart-sonata-m7.dtso   | 69 ++++++++++++++++++
 .../boot/dts/freescale/imx95-var-dart.dtsi    |  4 --
 4 files changed, 146 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-common-m7.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata-m7.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 4b2081a3290b..aa78f02fdef7 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -989,7 +989,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev-ser0-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
+
+imx95-var-dart-sonata-m7-dtbs := imx95-var-dart-sonata.dtb imx95-var-dart-sonata-m7.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-var-dart-sonata-m7.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-var-dart-sonata-m7.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-ivy.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-var-common-m7.dtsi b/arch/arm64/boot/dts/freescale/imx95-var-common-m7.dtsi
new file mode 100644
index 000000000000..21e89092de9e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-var-common-m7.dtsi
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Cortex-M7 configuration for Variscite i.MX95 modules
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+&{/} {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		m7_reserved: memory@80000000 {
+			reg = <0 0x80000000 0 0x1000000>;
+			no-map;
+		};
+
+		vdev0vring0: memory@88000000 {
+			reg = <0 0x88000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@88008000 {
+			reg = <0 0x88008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: memory@88010000 {
+			reg = <0 0x88010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: memory@88018000 {
+			reg = <0 0x88018000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0buffer: memory@88020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x88020000 0 0x100000>;
+			no-map;
+		};
+
+		rsc_table: memory@88220000 {
+			reg = <0 0x88220000 0 0x1000>;
+			no-map;
+		};
+	};
+
+	remoteproc-cm7 {
+		compatible = "fsl,imx95-cm7";
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu7 0 1
+			  &mu7 1 1
+			  &mu7 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>,
+				<&m7_reserved>;
+		memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
+				      "vdev1vring0", "vdev1vring1", "rsc-table",
+				      "m7-reserved-ddr";
+	};
+};
+
+&mu7 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata-m7.dtso b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata-m7.dtso
new file mode 100644
index 000000000000..5e63f8169a08
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata-m7.dtso
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M7 support for Variscite DART-MX95 on Sonata-Board
+ *
+ * Link: https://variscite.com/carrier-boards/sonata-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx95-var-common-m7.dtsi"
+
+/* SAI3 requires eDMA2, which is reserved for the Cortex-M7. */
+&{/sound-wm8904} {
+	status = "disabled";
+};
+
+/* Reserve the peripherals used by the Cortex-M7 firmware. */
+&edma1 {
+	status = "reserved";
+};
+
+&edma2 {
+	status = "reserved";
+};
+
+&flexcan1 {
+	status = "reserved";
+};
+
+/* Keep Linux I2C, SPI and UART controllers running in PIO mode. */
+&lpi2c3 {
+	dmas = <0>, <0>;
+};
+
+&lpi2c4 {
+	status = "reserved";
+};
+
+&lpi2c8 {
+	dmas = <0>, <0>;
+};
+
+&lpspi7 {
+	dmas = <0>, <0>;
+};
+
+&lpuart1 {
+	dmas = <0>, <0>;
+};
+
+&lpuart3 {
+	status = "reserved";
+};
+
+&lpuart5 {
+	dmas = <0>, <0>;
+};
+
+&lpuart8 {
+	status = "reserved";
+};
+
+&sai3 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
index 92ff09fe64a7..76145652b295 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
@@ -173,10 +173,6 @@ bluetooth {
 	};
 };
 
-&mu7 {
-	status = "okay";
-};
-
 &netc_blk_ctrl {
 	status = "okay";
 };
base-commit: 21d2357d5c1ebd2bd7726717e95765d031b55546
-- 
2.47.3


