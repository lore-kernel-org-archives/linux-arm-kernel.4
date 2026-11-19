Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A453606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 09:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z+TbQtmi;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mOgiUsI6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5bsnXM9lYnHDcLWwvi6s8sH/ygRCCvDbN6hw3fGCZdQ=; b=Z+TbQtmim48y0XV8UBPy3EHeFQ
	ILFeIr4OSiv/Kzb9W4Vd87ggjW6LHk2TVFw8rem7ycwWjCUeN92F1xjuaO9775tKtjenaChQ31weo
	L2LH9TaAL/lwPCeKPmlCpEFisI0eG4iwjFeYF0JYXEixCsPtM4pTMc1EM+Va3D+EjB9eynA7Rdt/+
	4LsSCAixtIBiV6E6tJBwT/TcOOU+va0/PkLJFTe76emJx4kUPL/hhqIGge9M4tlNLO6my5P8YJKN7
	DnDth1BP04YeAjlYmOIWNVXnW0QO3A2sZ4wHQQhc4YWoNPPqbLiJJxaojbBP7ZDTsvJbEDPqR4a9/
	EGk+jnXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy5p-0000000BLS2-2VWb;
	Thu, 19 Nov 2026 09:06:09 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy5n-0000000BLP2-0O8p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 09:06:08 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-49412eb1474so1209780f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 01:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795079165; x=1795683965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5bsnXM9lYnHDcLWwvi6s8sH/ygRCCvDbN6hw3fGCZdQ=;
        b=mOgiUsI60adRzlkM/38xPtlbAb8XUo7h9IQRy4kkmTomL3Zh7thRSb0MUKev+YMcdV
         gmIr6uVdPfU77EPU/DGXY/aNnJUWZOXj8x2+6y2NCNWk1nS4TjQeG5dd2PEtCLQrEqTr
         GsT+xCXMaL33Kkl+9Yd2MGAk2X0sc3joL/doC6+i4TWshn8NGFH6w0W7oaoufn2NPYsp
         c4cslQwnrSEkP69Gk6FVy/N/rLphmFgLiqkiuiCrYTm9Pd7hShNm/llT33IrerOhNyOK
         5rgOwnMWmsIIDbQp+1zZHBsIpQg4sk/aaqbLnT5LQQzDHDERZYi/sfHl05qQR4FqVInO
         v+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795079165; x=1795683965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bsnXM9lYnHDcLWwvi6s8sH/ygRCCvDbN6hw3fGCZdQ=;
        b=D25wLCR6qI45Y+/l8pk77anFzmWR9V6UhJmzi0b1+GVHSTt9AB1CSGqqdiZcwPBCnX
         lEZotmZ/0o9smqqaD6983MnUpBv8Am/8YY2R2jMTEzeN2ZxLOxTZEaXdxDkXQRdCKNb0
         +BRbLPT3S4Q7/fTVGmrYj84y11LeBnkUSXFuq5uo6yQZ3ZcNGoRbz3D/xQW/Z8yIYsNn
         XCt8X89r2IdslIcKFuh0DM2VqUuBDHDQTLZgZf5iKpV1onseQkNGjcdb2B3wsolzsTtQ
         p/oMmWbENx3HNTkLSgkfKJD9NYKjPwcEuyg6bBeYJWoF2899XMXUPE2BvUDTXxU7uiLO
         WRAA==
X-Forwarded-Encrypted: i=1; AL+hErHh1yyYSMNSMTLXzDgM8H9B0Vxktp0JyvdCcR876h44qymqICKtXj/CY4rbhZM/ZBFNl7x0uGUZ4duEOmvaB4UZ@lists.infradead.org
X-Gm-Message-State: APuU4Z9Bqgbs5gIo0pvrj9IQSNw1FFVuFKc6bwdBPMzJXnWYwMEOp9O5
	cuED8B5V7Yc+I2s18hmImw+tGS4Hb+h5Ly+h1wxrONk2vF+MsZjYkkdP
X-Gm-Gg: AZFdTZdTDYGtKU3DpdqeduVsx1KYmftoVbgfyOHmL0iZ9sg38O8hoaQRO/uliXyJL5Z
	3xkt9gxdp+rT1yNC+pk9fSsEDWNpfbx9JVrjh/wFiaeDh3/9egepCQdC3CtR6oOaMJxXBra3xKy
	sD5DZAJS0TWDF9sOF9gxIxFGOyQZ40KJnSns4uiHkCuuDqk1Zh/rZK4CKZCf0o1L2meRFggBgfi
	tRAQzzOw4okjEbO/SCZ0W1gMDJxp9hr8G6KH9VZUYBCOnORgsqcVyHYONAyFbNN+fTxPjXbCcHE
	aUq8bztJGumt9X4rKXQqaaPfs8XE/n4gkGwvWmNMfzA5POtTLMD+YV9PFkwvthDZD/W765iKoqg
	ZmrRy138ZDTF0MeHikSe9xiGKxp5XV45eWrWEUAvyeORS5myMesxvbANgeeYTYRuCPOnusYY7tr
	IsmED/ru4Xgo/jNQn+KKagJqjxIRyQOi2I7/oSd0kV63bIvRre7574IwTD2kwvHM1AKUGw1YqR/
	gNUTnDqHTEFPiRlD0A2cwZm5UJE4xCEm5cxp6d+47GoFm0WCxe1ApQpe7ylxS1pglt6nzwIq7VV
	eFC5gDL2Dh/Yl2EF2hXAHxW1QbLBFHxS0lLYiFtNk+dvXaTTrSrIykFOplHHS6+VRy0QXnxUYXl
	ufkPByztE7AUobhfnd2KTSSTCSyv1fxdRycw2R+xaB/WXeXvQZeXWB14=
X-Received: by 2002:a05:6000:4705:b0:4aa:2afc:ea30 with SMTP id ffacd0b85a97d-4aa2afceb05mr1443459f8f.19.1795079164332;
        Thu, 19 Nov 2026 01:06:04 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65683d5a2sm9770644f8f.43.2026.11.19.01.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:06:03 -0800 (PST)
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
Subject: [PATCH v2 1/1] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
Date: Thu, 19 Nov 2026 10:06:00 +0100
Message-ID: <20261119090600.9257-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_010607_222915_F3090095 
X-CRM114-Status: GOOD (  21.06  )
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

Add Cortex-M33 overlays and combined DTBs for DART-MX93 on Sonata and
VAR-SOM-MX93 on Symphony.

Share the remoteproc and mailbox configuration through a common include.
Reuse the reserved memory from each carrier DTS, preserving the different
resource table addresses.

Move the existing DART-MX93 remoteproc and MU1 configuration out of the
module DTSI so that they are enabled only by the M33 overlay. Use the
-m33 DTB when remoteproc support is needed.

Reserve the peripherals used by the M33 firmware and disable Wi-Fi,
Bluetooth and the devices depending on GPIO4. On Sonata, also disable USB
OTG1 because its USB-C role controller is unavailable.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
Changes in v2:
- Remove the cm33 and mu1 overrides from imx93-var-dart.dtsi,
  enabling them only through the M33 overlay.

This patch uses the memory-region-names binding and driver support from
the following commits, both already in linux-next:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

For dtbs_check on older trees, commit cebd1c0961d8 ("dt-bindings: gpio:
vf610: fix clock requirements per SoC"), also in linux-next, fixes the
pre-existing GPIO clock validation errors.

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../dts/freescale/imx93-var-common-m33.dtsi   | 24 ++++++++
 .../freescale/imx93-var-dart-sonata-m33.dtso  | 55 +++++++++++++++++++
 .../dts/freescale/imx93-var-dart-sonata.dts   |  2 +-
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 14 -----
 .../freescale/imx93-var-som-symphony-m33.dtso | 50 +++++++++++++++++
 6 files changed, 139 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd548284358..05a7556e9de9 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -956,8 +956,17 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb
+
+imx93-var-dart-sonata-m33-dtbs := imx93-var-dart-sonata.dtb imx93-var-dart-sonata-m33.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-var-dart-sonata-m33.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-var-dart-sonata-m33.dtbo
+
+imx93-var-som-symphony-m33-dtbs := imx93-var-som-symphony.dtb imx93-var-som-symphony-m33.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony-m33.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony-m33.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93w-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
new file mode 100644
index 000000000000..51b4cfe143d4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Cortex-M33 configuration for Variscite i.MX93 modules
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/* Use the reserved memory and resource table address from the carrier DTS. */
+&cm33 {
+	mbox-names = "tx", "rx", "rxdb";
+	mboxes = <&mu1 0 1
+		  &mu1 1 1
+		  &mu1 3 1>;
+	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+	memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
+			      "vdev1vring0", "vdev1vring1", "rsc-table";
+	status = "okay";
+};
+
+&mu1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
new file mode 100644
index 000000000000..d97da9916ef4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M33 support for Variscite DART-MX93 on Sonata-Board
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
+#include "imx93-var-common-m33.dtsi"
+
+/* Reserve the peripherals used by the Cortex-M33 firmware. */
+&flexcan1 {
+	status = "disabled";
+};
+
+&gpio4 {
+	status = "disabled";
+};
+
+&lpspi5 {
+	status = "disabled";
+};
+
+/* Disable Bluetooth along with Wi-Fi and release the JTAG pins. */
+&lpuart5 {
+	status = "disabled";
+};
+
+&lpuart7 {
+	status = "disabled";
+};
+
+/* The USB-C role controller uses an interrupt on GPIO4. */
+&ptn5150 {
+	status = "disabled";
+};
+
+/* The USB-C role controller is unavailable. */
+&usbotg1 {
+	status = "disabled";
+};
+
+/* Wi-Fi reset is connected to GPIO4. */
+&usdhc3 {
+	status = "disabled";
+};
+
+&wifi_pwrseq {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
index 1ca3ec8330d0..e3afd0efe5c7 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
@@ -291,7 +291,7 @@ ft5x06_ts: touchscreen@38 {
 	};
 
 	/* USB Type-C Controller */
-	typec@3d {
+	ptn5150: typec@3d {
 		compatible = "nxp,ptn5150";
 		reg = <0x3d>;
 		interrupt-parent = <&gpio4>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
index 69495bb7fc9f..6c596d61bd21 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
@@ -54,16 +54,6 @@ wifi_pwrseq: wifi-pwrseq {
 	};
 };
 
-&cm33 {
-	mbox-names = "tx", "rx", "rxdb";
-	mboxes = <&mu1 0 1>,
-		 <&mu1 1 1>,
-		 <&mu1 3 1>;
-	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
-			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
-	status = "okay";
-};
-
 &eqos {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_eqos>;
@@ -221,10 +211,6 @@ bluetooth {
 	};
 };
 
-&mu1 {
-	status = "okay";
-};
-
 &mu2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso
new file mode 100644
index 000000000000..96860a2dbf7c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M33 support for Variscite VAR-SOM-MX93 on Symphony-Board
+ *
+ * Link: https://variscite.com/carrier-boards/symphony-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx93-var-common-m33.dtsi"
+
+/* The resistive touchscreen uses GPIO4. */
+&ads7846 {
+	status = "disabled";
+};
+
+/* Reserve the peripherals used by the Cortex-M33 firmware. */
+&flexcan1 {
+	status = "disabled";
+};
+
+&gpio4 {
+	status = "disabled";
+};
+
+&lpspi6 {
+	status = "disabled";
+};
+
+/* Disable Bluetooth along with Wi-Fi and release the JTAG pins. */
+&lpuart5 {
+	status = "disabled";
+};
+
+&lpuart7 {
+	status = "disabled";
+};
+
+/* Wi-Fi reset is connected to GPIO4. */
+&usdhc3 {
+	status = "disabled";
+};
+
+&usdhc3_pwrseq {
+	status = "disabled";
+};
-- 
2.47.3


