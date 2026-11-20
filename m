Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDE360A2602
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 18:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sLXw3/Fz;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=arB53MI0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gQSQjSRJnKJyi/DyI9dUqIc7eXSvEGbjLptiauw7SSs=; b=sLXw3/FzKeCi/9
	DsiqDP2CWxS7Pdmn6pon2Av/RBJUeJQYCsj+SbFYV3CrTIVYVX/dYaioLqO35bIRVwFin3o2t3COj
	xA4mCpGaiCfGjfaNeuCnZkIShO/lzrJTDq1u9S3uTJWJGKzW7rYU6kfS3G98TxiOr1Od7UZUgKrau
	4Rk3NUIznslfiK6/3C93Y6ePGDgivvx+joafMS+9S9XIyU1d9c5zgJR1oLMD/OfLAOsGd7JIdngCv
	AjYgXiza92JXzElDGgjX3KhkTR7fyhq4Zs7UxmfjUMFmz6cxh/O3f4MyCks8DBdUm4KfGCeTCAFtg
	WN+Jdtm0VG1mres3d6Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTQO-0000000FwqW-36m6;
	Fri, 20 Nov 2026 18:33:28 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTQ7-0000000Fwly-45wu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 18:33:21 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so10908005e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 10:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199590; x=1795804390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gQSQjSRJnKJyi/DyI9dUqIc7eXSvEGbjLptiauw7SSs=;
        b=arB53MI0zifVD8j9kq4su7x5MPCz6XSelW76jbT4ed5I01rBKxfsGq6iB64vcmuUI4
         i0UC//zkqpFbgFbCf3bv8k75fRZBzFp/jUbRdCajPbqeJbCzzjHObOPxBUK5bCjKs0r+
         aZK+1coXic5XOmjpONd+IfajICLNncPoSzWuP8DCxWQ2AwaK0Mx4bIgZ4MyyORUqi9kL
         cFzWqgRhCKa8P8DgmPxgdE2vvEq2k3RCYglBck1gpUiKmnhGIX7T88Wxe9KKepA0p2zQ
         OdUxusLMYSXwknf+7dwG2cQmnEPt5ogoE/txxF/rWeyfTX0hPuO92CHohGhs28eVAFBC
         ztSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199590; x=1795804390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gQSQjSRJnKJyi/DyI9dUqIc7eXSvEGbjLptiauw7SSs=;
        b=1kZQYYSz97hEfgmwNxR/401clpGzrXI4ucPP1s4y13k7pDanBXSxbvVZ7pp/AfOZ9c
         nIdxJ5vJ/OJmizyrkKofoYU7rLMqvHZpPWXiCVDuh0ocbSz0zlRdChqZwysFqyDhWifN
         wxxqItPlXCzPe+BK3QN6hUyBIkvqhz6R2POAIql7prlNBi+Ioa0coCT0ZjHWnXudS0iu
         RgS3c2yNxEoZucTpuJbhii2vuUJNtlHMCGGKrGOUitKYdGeg5//6tmQTOQpfB0Eh1neF
         eNx7a45VKRae3RVfstew2Foe/+fQ6lAswZxZBslaLSGzfgNZS9NZLRhzNdwnINYs0RE6
         8OMw==
X-Forwarded-Encrypted: i=1; AL+hErEv78CFE5dRO51F+Bsw89PQrbC46fLbQN69mHJpeAhCYFQzRXOqLlYPWNS2sl7bm1jsea5ZnpAzRKfhPa+lsY2k@lists.infradead.org
X-Gm-Message-State: APuU4Z81A6heYGsR5ERJ5vh7Zvv7q3wiCbChpaGr1rmtzLrMkjHFNVtA
	Tf/R9h48k22Phc7ZceBTyartAEEDQbnOpe37eWMz3MLe52zzCFzfuoT0
X-Gm-Gg: AYBFou0iohufhoyDOuxrexNAOQQ/dkSl2Bc31k7V2xP6WhZmmIdspD+vCKtPP1IjII3
	iBwLibODjAPl+76tksdT5dcnp9fnPN/akdBPgULBXsw5G39COFDVBSyZTv/InAeN2B2EPGReEHP
	eWHWFLtAJqIDPrtesleN1jUGd1Bfc/ytaXDcqJoDL5BWtJRz3yZJU0Mmyps+sE39dZtAy7fnbAO
	ZJFEqOt0rfASPiEJNlh8ujaTWg6EB/Gesj8V6+i0QUc4a3pd92Z3yNfo14q4+DqCUT/Ec49r3U7
	7dDkPeTZXUsTJ63rNIc2rqNRjam+hsq8K8KiRurOaLdwSLZkHkzulVs/ubdoKj0va+sd7HvKmp6
	aRCCoYBrM28LcB6apsh0/7Gmq1Umk6u+gH0H1MaDDG+wJ+h4HT/jqTppjl0LYS8ecDW3X+SeVBI
	cFEVDWqWUlAlCHqOHQ2SAfkTZ//jobQXHXJ+rSTpiRbU+DJISrZ4vpgDOHhHIt/nUJjWDqLO3yH
	ydYhmi4Xs5O1WZ96zMs9g+50Rkwc+A5scRB2IFCzAYWv699GgnzFMrPBpRKlGU/CYNu/p89EyrT
	fSlz1+9kxvG0Oivb0jd0gbvkpXUO5/6nxDzJc/13Nv0iFSj84TxtbxK1lhRz6q27xGBUEp9gTa2
	DvayEkPoeZsZ8zhfKAsiyEGcLOVtA98uW9RVlWBQcFs6HDvM=
X-Received: by 2002:a05:600d:18:b0:4bb:9001:1aa with SMTP id 5b1f17b1804b1-4bb900102b8mr10489545e9.10.1795199589928;
        Fri, 20 Nov 2026 10:33:09 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm7467718f8f.53.2026.11.20.10.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:33:08 -0800 (PST)
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
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH v4 3/3] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
Date: Fri, 20 Nov 2026 19:32:30 +0100
Message-ID: <947a7bcf39d89b4a162f296278ccaa3db6512983.1795197853.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795197853.git.stefano.r@variscite.com>
References: <cover.1795197853.git.stefano.r@variscite.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_103312_102307_2FE6194F 
X-CRM114-Status: GOOD (  20.84  )
X-Spam-Score: -1.8 (-)
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

Include the common configuration only from the overlays, so the M33
memory regions are reserved and remoteproc and MU1 are enabled only in
the M33 variants. Use the -m33 DTB when remoteproc support is needed.

Mark the peripherals used by the M33 firmware as reserved. Disable Wi-Fi,
Bluetooth and the devices depending on GPIO4. On Sonata, also disable USB
OTG1 because its USB-C role controller is unavailable.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
Changes in v4:
- Move memory-region-names to the common configuration extraction patch.
- Remove the common include from both module DTSI files, so the M33
  memory regions are now reserved only in the M33 variants.

Changes in v3:
- Move the common configuration extraction to patch 1.
- Use "reserved" for peripherals assigned to the M33 firmware; keep
  "disabled" for dependent devices.

Changes in v2:
- Enable cm33 and MU1 only through the M33 overlay on DART-MX93.

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../freescale/imx93-var-dart-sonata-m33.dtso  | 55 +++++++++++++++++++
 .../dts/freescale/imx93-var-dart-sonata.dts   |  2 +-
 .../boot/dts/freescale/imx93-var-dart.dtsi    |  1 -
 .../freescale/imx93-var-som-symphony-m33.dtso | 50 +++++++++++++++++
 .../boot/dts/freescale/imx93-var-som.dtsi     |  1 -
 6 files changed, 115 insertions(+), 3 deletions(-)
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
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
new file mode 100644
index 000000000000..51ec0beea7c9
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
+	status = "reserved";
+};
+
+&gpio4 {
+	status = "reserved";
+};
+
+&lpspi5 {
+	status = "reserved";
+};
+
+/* Disable Bluetooth along with Wi-Fi and release the JTAG pins. */
+&lpuart5 {
+	status = "disabled";
+};
+
+&lpuart7 {
+	status = "reserved";
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
index efd51f6364f3..57007f716f22 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
@@ -260,7 +260,7 @@ ft5x06_ts: touchscreen@38 {
 	};
 
 	/* USB Type-C Controller */
-	typec@3d {
+	ptn5150: typec@3d {
 		compatible = "nxp,ptn5150";
 		reg = <0x3d>;
 		interrupt-parent = <&gpio4>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
index 4ee4d74cadea..6c596d61bd21 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
@@ -12,7 +12,6 @@
 
 #include <dt-bindings/usb/pd.h>
 #include "imx93.dtsi"
-#include "imx93-var-common-m33.dtsi"
 
 / {
 	model = "Variscite DART-MX93 Module";
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso
new file mode 100644
index 000000000000..8df03ed3c004
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
+	status = "reserved";
+};
+
+&gpio4 {
+	status = "reserved";
+};
+
+&lpspi6 {
+	status = "reserved";
+};
+
+/* Disable Bluetooth along with Wi-Fi and release the JTAG pins. */
+&lpuart5 {
+	status = "disabled";
+};
+
+&lpuart7 {
+	status = "reserved";
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
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 46b739a147e3..b0ffcb534cb6 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -7,7 +7,6 @@
 /dts-v1/;
 
 #include "imx93.dtsi"
-#include "imx93-var-common-m33.dtsi"
 
 /{
 	model = "Variscite VAR-SOM-MX93 module";
-- 
2.47.3


