Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A689A606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=06futSdK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CjlT3Moz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kguNqPOSlh7fe1C453DDiUzdHElyaO7Alv2xhzvgL+o=; b=06futSdK0Yq9lW
	0nusVXgBw8h08k6+/tDL/En2s+/NaO17uogREcjA8w6fW3KswiskIZrJNVa69bgrdeKe+jrB11GUW
	wyI7nSAJ/EtGALIASSZzGKshFguVlkOop5GqVj1nP7SnGaIWxGKirjErhD/HOQgIYo0NDN0fAPFTq
	XgcrL/RiJiTKBDm/NGhFncGMNWCZj5yXhL1lky6vOWIkqGORmrXUaDLvwBKsNWqiO5+yR16FDJbaa
	9N6s0H2JSQiEBE4qWYFlGb2dAl7Q3eEHjrwASznHM2lotzKpWaIQL6em10ELBSvf6jAqD5Ja1hGqz
	jffTs1q/Le/6XtBImX+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4Zp-0000000CZPe-48uq;
	Thu, 19 Nov 2026 16:01:34 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4ZU-0000000CZHh-0zj9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 16:01:13 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c4cdc606b47so414206566b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 08:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104070; x=1795708870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kguNqPOSlh7fe1C453DDiUzdHElyaO7Alv2xhzvgL+o=;
        b=CjlT3Moz788c5Spt/qJ3bEY7tIpwIoYM37u0lQ0ElnoWNIpKuoIVwstC1qrVI5v19g
         HqE7SiKB3t4XUNtrDTDld6rHpRvVSErazEzShaJjIfnTi4fXaOYUs8lgfxoh5EsaF5xl
         c3wu3g2TVM36plc6HoAP9Hp6EEZOdIS2Fu/VXAzCIyfLONmNyBSzekb5Zwg3Q2gnSZAQ
         Q6YfKRL2Is8x12FZXNzU9SgtU3/cYz+dF8ERMK8e/ZqJQntF/ltw8HCMbR7b5rWTCEKA
         bupxEmj5gQoa8zrIRK2SvdMnCcw1HzCq8j/b4ZPI403s7VThBoFbOyi3jd7l3ueQ/Z1P
         +ifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104070; x=1795708870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kguNqPOSlh7fe1C453DDiUzdHElyaO7Alv2xhzvgL+o=;
        b=VuJu0Wcv3n3CLKaic1WH4ayvZt0E88RmHHE00NhkmoquUcmGmfxeqjU5h/aWKW7swP
         HkbZmo8oes79fRP2QU2Hv+BcEc3ocwZsv5YtwgOZVdFqWfMja6OIHV3jt3ymvlN22Avi
         u6NpEtiFqIBCXcA8iu7agsacpMP7HSFkrQnTJRNYBSuBocy9wJRfJyjCDEp6Gp/YPhwJ
         8kMPATCl9gtvFc0ZQpmXpwZ2IghP8AY0IwmAqZ6knyiLjzHI0rylXm8UbUWIQ61JuqS3
         968a6Qr1WtzyCUjRs6Gzd9h2DwHOSHSTRTDoTI9avarys8aHoG28NbRXeZa6JxJebOw3
         4AHQ==
X-Forwarded-Encrypted: i=1; AL+hErHSyzkcnyOEDkvl3uxEiSkl5yBuUcrO/XBIAwxSC0ahBQZDH03PGAG+f/v4OTkTG0aL76h8xKiBvC9Y3Mbmp8AK@lists.infradead.org
X-Gm-Message-State: APuU4Z8ezXieZhLuSQc/aznAjaFXDf1UuaqdZGVEjY00esrD+X+hCE/4
	PrgiQ0fnwSftrNqAo2jgdhbCxSRCAzXOtLAhMGmkZMAdV33Y7UfWBJmz
X-Gm-Gg: AYBFou3W14TBj+/kvZJhn4oocQmVqb6e+GDMfW9u7giyrkazf2TwbIVZSWuwVm0fUzK
	LNNhSDvw0frbIaGn0BnOMJ/wtKYSc5AqL1ZCx6ozJOgoSjA5JnGv3Xdy+1cMMKDzs5OGJ9N7l3P
	Jx6wuK7JQRNBLj8FNd0i77uhX0z2u+OaXcCEFRHHRZOOCN0mq7I+K/B533aAP8rvjlbcmPHYmwu
	C6t5PBmDe7OD3q5cksJ8ToKRWE+YZ27o5oDvKkRdQrmuPXxyS5yVej+KHh/oX6aedcQ3CxgId1n
	eS70e6B/ZM0RjR6lQLhcBgh9jUtshOdMpq2e9NKPisrzBDwZ4ULfW7ZC8zzyn0ZTqGHGR1g35hz
	BWzmEWi9aIi+vmvSNfz2Ai3DKLpbVf+sJi5FspOek2P+VDAsz2/RyGP2LfZfBNEOXa2ENLNq+j4
	VjEZNX+TC8B/c81euU9OLBzfUppmcDt0SbjOKufsWMAzXIn8FxYKx4CXd831YOFqUP7pb2e/drV
	l2n6s+7UF+SzMMgLsjs7mQLhnFRzTdbS/uopGHniWIPo5r2y07+e4fMzpLTV1scbFrTW+xHY5iJ
	aMo76oBOckUCbe3GVr6B3DanBgrexp9ZGtHlKlsvpgMrvZmKsp5VcS6SgVsn7XF4ug1BndVEgng
	jAT25w6SH8wH5X46CXV2SIos76g/8us1a6eODbBDIVcz+fkVUNCkgmdY=
X-Received: by 2002:a17:907:3e15:b0:c51:249f:7331 with SMTP id a640c23a62f3a-c513a3aacc8mr39598366b.1.1795104069371;
        Thu, 19 Nov 2026 08:01:09 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm323784f8f.44.2026.11.19.08.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:08 -0800 (PST)
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
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 2/2] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
Date: Thu, 19 Nov 2026 17:00:54 +0100
Message-ID: <f52268cdb748fc4fcca95f8de1384054da8d7964.1795103362.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795103362.git.stefano.r@variscite.com>
References: <cover.1795103362.git.stefano.r@variscite.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_080112_334667_C371CE40 
X-CRM114-Status: GOOD (  21.99  )
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
VAR-SOM-MX93 on Symphony. Use the common remoteproc configuration and
identify the existing reserved memory with memory-region-names.

Include the common configuration only from the overlays, so remoteproc
and MU1 are enabled only in the M33 variants. Use the -m33 DTB when
remoteproc support is needed.

Mark the peripherals used by the M33 firmware as reserved. Disable Wi-Fi,
Bluetooth and the devices depending on GPIO4. On Sonata, also disable USB
OTG1 because its USB-C role controller is unavailable.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
Changes in v3:
- Move the common configuration extraction to patch 1.
- Use "reserved" for peripherals assigned to the M33 firmware; keep
  "disabled" for dependent devices.

Changes in v2:
- Enable cm33 and MU1 only through the M33 overlay on DART-MX93.

This patch uses the following binding and driver commits, already in
linux-next:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../dts/freescale/imx93-var-common-m33.dtsi   |  2 +
 .../freescale/imx93-var-dart-sonata-m33.dtso  | 55 +++++++++++++++++++
 .../dts/freescale/imx93-var-dart-sonata.dts   |  2 +-
 .../boot/dts/freescale/imx93-var-dart.dtsi    |  1 -
 .../freescale/imx93-var-som-symphony-m33.dtso | 50 +++++++++++++++++
 6 files changed, 117 insertions(+), 2 deletions(-)
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
index de0e56f322a2..51b4cfe143d4 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
@@ -14,6 +14,8 @@ &mu1 1 1
 		  &mu1 3 1>;
 	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
 			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+	memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
+			      "vdev1vring0", "vdev1vring1", "rsc-table";
 	status = "okay";
 };
 
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
-- 
2.47.3


