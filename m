Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE202606B233
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 18:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lf9GjTYe;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kmVcJak9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Ao45PZIc57K7i00r/ydgLRv43mzObnJdlxREPBvg2co=; b=lf9GjTYe2eiNvlq8+nKxGjvtOy
	0IjLLDB/lrD/wPG76uD05q3IiXoS7DOJ5jIklsk7ljaZRqUWrR7NjUM1uOtf++4mFRpUyNZLZxQgC
	b+1JkWJA5REEQYI1SDhInRwQQxP1rupi4GPRWWo5gUSsatJeT8O2HuyvgbbPm0ydii9SvYyTNx74k
	tiqdPdZcS3CN/DgKqQQDcu8u9+OOaGPvIPy8jPvUxzGPaafOfTxt0BEyU0/1lb93T16jfglA7vBwS
	5x403x0QtHxUcryRjioBmcBZWAR7keA1edQrSKTgM9ipjDHEAuM4fSMVjbJyDw+PVtL1OjXvXbCVT
	rFEk0CBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTEm-0000000FubR-01l2;
	Fri, 20 Nov 2026 18:21:28 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTB2-0000000FtR8-2m8D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 18:17:52 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so12384445e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 10:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795198655; x=1795803455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ao45PZIc57K7i00r/ydgLRv43mzObnJdlxREPBvg2co=;
        b=kmVcJak9qx6VlwfbbOwwskmI5s2EfjrqQ52LD/UNOrFqsFScgVQvye+7unOqV1kXlJ
         hPFiZJGkIca7MVrtyozPjF57RYZyOvUPrDY5iaPpAhynzE4uNhxC1GchnK4VieXZow1s
         wOHCHE31wwddghOj5FukcZvXi/IL1eRD9fZg8uwzcJGKpURHRWiftFG3crwrlNmVCoeR
         VkHGDff1nsHPZmsw3t9Zf61biYwz4VuASBAnXCYuPCCUdVrE7sU9xK9ZSg+CSDlVD18d
         qcj9bb7mKMUt0Wan/Oc+J/lOWZ5dQrBeErHvXA6sICbmnCNdOe/qUE1ow97lKJ2psfyp
         yV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795198655; x=1795803455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ao45PZIc57K7i00r/ydgLRv43mzObnJdlxREPBvg2co=;
        b=mmm4IdJRQWo54Q0hRUAlCbhvhXsFRXNVM4KWY/73IvY0xQcdQQHwFdtFkeSc0n1nvD
         C2r0BOW7ewBTgJKqwEVaLrDWcgi6rMiHtcAVuG+LuyrObG3J62jbiLX79ysy9Oak5t/c
         +ncDwIrRoizOpIyAo1/E4sJdDcoRlQd1wXL8fiIMn+Kdb1w9ckY3Z6XCz8rX63fmFC3D
         F1xRZCNXgHNwO95dYQ9TRHdsIhm9xewxYUrxDRNeGAbwlx9iDdP5zC5Ot1pENX4AFRHo
         AsfY+pFb693Qqyr4LG+P4Qy7VLs/2S2t9R4XbsY79wJy+5Gj4UvFqjROHot9WdHu+TJY
         /1BA==
X-Forwarded-Encrypted: i=1; AL+hErEFbsEcc5YGVYu9feI2bRBwMYt701THdqIA4oJ01qnewbFvNTWFDnvGCo40JDCkN7yKFRKADj/UqWV3yuG+HCjE@lists.infradead.org
X-Gm-Message-State: APuU4Z9OP39INNi1RcK+McV1rOj4/iSRHwV0PDpVxsH6jz3Z3br+6ceJ
	P/q8s760aitC/drqJ6S2id20BCCL6oD7oGN3VPFJr7bY1FPV92RzBJnO
X-Gm-Gg: AYBFou1ORho6IJGr7UQo/GlSdx0wPb8QqX+SYMK35+BaXXoSnSmOu4lhoDCVq9w4QGj
	gRO/dKyUnHby5CCPS/X0cOnywcLgafJGV7xYzS5+Gfu/ofS/RwVba8H8uuUbTjVl13hKmYSy3xu
	4VcpQbbVYDFr8Il30d+tfMceXBTd3Rt0FXefKXi7KIYwE4glGgjY7NUqjkD8/l/tKgmzWZGnmfd
	qfhmuxrZeipsaYusZ2QsYp1h7OZmmZaw9hOJRJKyVAUYFnBcHG1vU7okmGxm8yAm25qj6l40rxG
	Ekt9dMLbcHMSClgmGwSp8hiwuFT+SUggNxfQwdPZWoBzKqA9LeOBArF8D+UwUAMb9H+OAqc4+7x
	GsRGWtvVKCdL1L3EB4F84LGL77rfGKC8y935tvIfW+VWu/0y7Ach77ro3ELpWWCQAxO+Fbt0S9a
	SvwQVaX2f3JDSAh/vhMUqbpC2huvK+/NtPjmaOtyhRWEv11fd3BLEwfEGqceNovyvFkvJBebIaj
	K0MnK4Jvz1BgcucYaRxhgwFv371OzMIdPOaHyyfjZpU7sLqCVLl6JyqQgKcc5PWic0LmoBlQfHR
	ED+P2yaQosqNybin36QCoKyPjTg+Yvc6njzgvH2N2aQv5/yYAVDwQ7DYPJHlqNtrGosEShf5sAm
	TvrctFsKZmx4xQHffiAs2HxYkhOPp8QI9IcYrLDZrIGrwx7r1
X-Received: by 2002:a05:600c:828e:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb8878702emr102579795e9.0.1795198654474;
        Fri, 20 Nov 2026 10:17:34 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm131698035e9.5.2026.11.20.10.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:17:33 -0800 (PST)
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
Subject: [PATCH v2 1/1] arm64: dts: freescale: imx8mp-var: Add Cortex-M7 support
Date: Fri, 20 Nov 2026 19:17:27 +0100
Message-ID: <20261120181727.33321-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_101741_475584_9FA6FFA4 
X-CRM114-Status: GOOD (  17.87  )
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

Add Cortex-M7 configurations for DART-MX8M-PLUS on Sonata,
VAR-SOM-MX8M-PLUS on Symphony and VAR-SMARC-MX8M-PLUS on Echo.

Share the reserved memory and remoteproc configuration through a common
include, and add board overlays and combined -m7 DTBs for remoteproc and
RPMsg support.

Mark the UART, I2C, SPI and CAN controllers used by the Cortex-M7 firmware
with "reserved" status. Disable PCIe on Symphony and USB-C on Echo,
since their reset and role controllers depend on the I2C buses reserved
for the M7.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Use common node names for memory regions

 arch/arm64/boot/dts/freescale/Makefile        | 13 ++++
 .../dts/freescale/imx8mp-var-common-m7.dtsi   | 68 +++++++++++++++++++
 .../freescale/imx8mp-var-dart-sonata-m7.dtso  | 31 +++++++++
 .../freescale/imx8mp-var-smarc-echo-m7.dtso   | 36 ++++++++++
 .../freescale/imx8mp-var-som-symphony-m7.dtso | 36 ++++++++++
 5 files changed, 184 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-common-m7.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata-m7.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo-m7.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony-m7.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index ae28e6b02a5c..3745688a5b4a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -723,9 +723,22 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-ultra-mach-sbc.dtb
+
+imx8mp-var-dart-sonata-m7-dtbs := imx8mp-var-dart-sonata.dtb imx8mp-var-dart-sonata-m7.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-dart-sonata-m7.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-dart-sonata-m7.dtbo
+
+imx8mp-var-smarc-echo-m7-dtbs := imx8mp-var-smarc-echo.dtb imx8mp-var-smarc-echo-m7.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-smarc-echo.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-smarc-echo-m7.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-smarc-echo-m7.dtbo
+
+imx8mp-var-som-symphony-m7-dtbs := imx8mp-var-som-symphony.dtb imx8mp-var-som-symphony-m7.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony-m7.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony-m7.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw71xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw72xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw73xx-2x.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-common-m7.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-common-m7.dtsi
new file mode 100644
index 000000000000..486b924e202d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-common-m7.dtsi
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Common Cortex-M7 configuration for Variscite i.MX8M Plus modules
+ *
+ * Link: https://www.variscite.com/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+#include <dt-bindings/clock/imx8mp-clock.h>
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
+		vdev0vring0: memory@40000000 {
+			reg = <0 0x40000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@40008000 {
+			reg = <0 0x40008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: memory@400ff000 {
+			reg = <0 0x400ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: memory@40400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x40400000 0 0x100000>;
+			no-map;
+		};
+
+		/*
+		 * Keep this region aligned with the Cortex-M7 DDR region in the
+		 * boot firmware's RDC configuration.
+		 *
+		 * RDC DDR addresses are encoded as:
+		 * (physical address - 0x40000000) >> 1.
+		 */
+		m7_reserved: memory@7b000000 {
+			reg = <0 0x7b000000 0 0x1000000>;
+			no-map;
+		};
+	};
+
+	cm7: imx8mp-cm7 {
+		compatible = "fsl,imx8mp-cm7";
+		clocks = <&clk IMX8MP_CLK_M7_CORE>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&m7_reserved>, <&rsc_table>;
+		memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
+				      "m7-reserved-ddr", "rsc-table";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata-m7.dtso b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata-m7.dtso
new file mode 100644
index 000000000000..c5cc032fb4be
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata-m7.dtso
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M7 support for Variscite DART-MX8M-PLUS on Sonata-Board
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
+#include "imx8mp-var-common-m7.dtsi"
+
+/* Reserve the peripherals used by the Cortex-M7 firmware. */
+&ecspi1 {
+	status = "reserved";
+};
+
+&flexcan1 {
+	status = "reserved";
+};
+
+&i2c3 {
+	status = "reserved";
+};
+
+&uart3 {
+	status = "reserved";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo-m7.dtso b/arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo-m7.dtso
new file mode 100644
index 000000000000..2b91511084f4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo-m7.dtso
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M7 support for Variscite VAR-SMARC-MX8M-PLUS on Echo-Board
+ *
+ * Link: https://variscite.com/carrier-boards/echo-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-var-common-m7.dtsi"
+
+/* Reserve the peripherals used by the Cortex-M7 firmware. */
+&ecspi2 {
+	status = "reserved";
+};
+
+&flexcan1 {
+	status = "reserved";
+};
+
+&i2c2 {
+	status = "reserved";
+};
+
+&uart4 {
+	status = "reserved";
+};
+
+/* The USB-C role controller is on I2C2. */
+&usb_dwc3_0 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony-m7.dtso b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony-m7.dtso
new file mode 100644
index 000000000000..710ddff2fb11
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony-m7.dtso
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M7 support for Variscite VAR-SOM-MX8M-PLUS on Symphony-Board
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
+#include "imx8mp-var-common-m7.dtsi"
+
+/* Reserve the peripherals used by the Cortex-M7 firmware. */
+&ecspi2 {
+	status = "reserved";
+};
+
+&flexcan2 {
+	status = "reserved";
+};
+
+&i2c4 {
+	status = "reserved";
+};
+
+/* The PCIe reset GPIO is provided by the expander on I2C4. */
+&pcie {
+	status = "disabled";
+};
+
+&uart4 {
+	status = "reserved";
+};
-- 
2.47.3


