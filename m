Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8017E606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y5YQqCnx;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wDFmd5DK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qdwVpDmUyX6+miopugFQ74zvWKqlDoa5kHuLWgelFRU=; b=y5YQqCnx/QwUkxtmTuZ8deksX7
	UKjoSploLMEjSNJMtfr2GWKfhml94am6hk3unkKNFcxjKwr3IZ76rkL6k6RFupwleO/kKhYpyaiJf
	KAFCk14B3ZYSZ0XDgaDiivkdykiDfAW5YkkCtY+nLR/QstwxJZkXxvVvc2fg88Yvvp1QABMfeJRmf
	BmxanosSupJ4c1SbnbnQc5AlQYaA0sDgB2znpJ+jvPtZy/R65a+KqywCTRLZlMWlZXcNDpV5kF7IH
	4TwkFzbAJzBIyptCnO9QVc9h3N9wCgODibP+BPGB1QQ+Pjv0lGCUXHmx+K5tKyB+lmRDAufxz6vz9
	E3mPy+FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT13V-00000003UXE-22Ao;
	Mon, 16 Nov 2026 18:03:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT13O-00000003UVw-1NO6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:03:46 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so23752945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 10:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794852220; x=1795457020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qdwVpDmUyX6+miopugFQ74zvWKqlDoa5kHuLWgelFRU=;
        b=wDFmd5DKO+X/5pXnIi4PLQ+MAnOwy6uQueeMOcjdMZn2NazoRix8CEYZRgRAX+OLgO
         BmQ94hSq+mnHleaquzCbVWvTVNnPG2d6Bq3GmFpJzZk+0UtEbZlFlRLvHxnngzONxKpc
         suZIcuG8QNmY/Ar6rma1wJg2aV2mX23qw+NND4AQ6lhvl1Gd1maY/z/BX2dJ9FbhP3vp
         t4U91bcBvc8w/EFN32yb2ujeQ5WqBytuZnLEJbsBwOaS/U+/Ma2C35qj4ax2NLbbK2Hx
         ArBvejxG6JWuXCt2CLo0e9GlH7zHRBraz1NMJjnb9nHTPkZC419sxypbtjzr1UY/kM77
         ZYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852220; x=1795457020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qdwVpDmUyX6+miopugFQ74zvWKqlDoa5kHuLWgelFRU=;
        b=jDlTwjXi1hpZAZvkYUvuKLKZMrhUrEqqHi0QSkOLft7o0ICnXe7DJM0CzxYaXEIf8f
         xfts7PkdTvg8Q2dm8k2aJ1I1t+eqW/22C8ZXkhwL9kTNy0sXiUNHuZvrcAoyM72mN05B
         3kj3TbCfliF77eD7vuS1JQJpoSr/5VU3vIRA1cypDklVrASlbQFGGamgWOBGW/hqSisE
         gYYFITDYCq7NXYGngqKfiY0NU2aq8QK9Zuh1edJ0Nt4tjuOTXpAh94v1XazyzamEr1hV
         kF2b9HZGglJqnmY514qc8TUt/jRCDujNb1raiCFL8nZF1GYB+ScpgT5w9cYAZO1qffMB
         SklA==
X-Forwarded-Encrypted: i=1; AL+hErG+kyucftzLcgdnQHpBIvNS8OX6wZetSmuLzaNXi55HvxduDc0OINQcrsmbVSnP5zg6szeokFxxyMjO7LcscDvQ@lists.infradead.org
X-Gm-Message-State: APuU4Z+8NTvIM0ZsyE01XDQEwY3TLyGESCe8CJnSzEJ8QPp+5gziycVj
	sPvP9RM6VFOX1fBFlV5BrxwAHUJ6xSHssXe1I0C/Tn3ygPjSdgdeKetr
X-Gm-Gg: AYBFou3BTmwvA4ljQTVN4n9hMCnLtVIzFCjsDsFMH9YFc7zH9okOoR8TOt5gDhOVJ/H
	IbwhsSr3nCxGK2GlgS0KubjEa8ML72zUC++kKbF3AQb6otBQtEOZvF+Z6PinSLq5JvUe5bwTKIg
	eIgAyrsZCQ7wRuLpvfq8Gz5vFgAeKSXYoc9vRn+YbHs/jtSJdtb6jkfmGxUlilGbuTIA13PGR3X
	3+qIYFrXWvLlX2yim/vUaljmMoJu3Xeh9m7+pewVYIpvOZyrszb1R9qS7AjTPI9DvhdFDOePZpF
	nUK5rQLvCa0V5c7cSLNgxbo+8XyhpZuGSP3HqNflsUGyG7Bsw85kDm+g8fgF2DL5UXXFz+vfnzQ
	YEe+N8p0kkMf/fkAyOIE8Rw6Ajw0QqNMY6IMd2YSQNCakED8excuOkkr7MCOYOVKMS7iCWn3qeV
	OCgAOFQTiAKhiQyNdPgryEhQS+oJSPcQV6m368ulNluJCHIOP3iB4Da8lXyUKhMqe4JptmzGO/i
	sWyqn8VUGUffngWtMF4J+6RHodUk+HQ/w94GUgcsltMDjGygM01ozss2v6MnHgk8wkNPCBdZj2H
	jE6m1rEihCgrTTztuTiCYU114WBo/qzLXexFbWMZ0QttxbpcM2KquAFI063tlhQikfIwvjTR1Fh
	LIGo25O5yFRZqanhFnR8FUmY/8cnryYjAuW+5VcTlG33Jtv7rxW64IhM=
X-Received: by 2002:a05:600c:c167:b0:4bb:6a75:d04f with SMTP id 5b1f17b1804b1-4bb6a75defamr97842195e9.8.1794852219973;
        Mon, 16 Nov 2026 10:03:39 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1968sm23904692f8f.10.2026.11.16.10.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:03:38 -0800 (PST)
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
Subject: [PATCH v2 1/1] arm64: dts: imx8mm-var: Add Cortex-M4 support
Date: Mon, 16 Nov 2026 19:03:33 +0100
Message-ID: <20261116180333.43440-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_100344_525006_4AD459B9 
X-CRM114-Status: GOOD (  18.78  )
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

Add Cortex-M4 configurations for DART-MX8M-MINI on Sonata and
VAR-SOM-MX8M-MINI on Symphony.

Share the reserved memory and remoteproc configuration through a common
include, and add overlays and combined -m4 DTBs for remoteproc and RPMsg
support.

Reserve ECSPI1, I2C4, PWM3 and UART3 for the Cortex-M4 firmware. On Sonata,
also disable the buttons and PCIe, which depend on GPIO expanders on
I2C4.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
This patch depends on commit ebb21cc5d1c0
("dt-bindings: remoteproc: imx_rproc: Document memory-region-names to avoid implicit ABI")
for validation of the new memory-region-names property:
https://lore.kernel.org/r/20261023-memory-region-name-v9-1-ad597887dfe9@nxp.com

v1->v2:
 - Add memory-region-names as requested by Frank Li.
 - Convert the Sonata M4 configuration to an overlay, so both boards use
   the same approach and the overlays can be reused across board variants.

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../dts/freescale/imx8mm-var-common-m4.dtsi   | 62 +++++++++++++++++++
 .../freescale/imx8mm-var-dart-sonata-m4.dtso  | 49 +++++++++++++++
 .../freescale/imx8mm-var-som-symphony-m4.dtso | 31 ++++++++++
 4 files changed, 151 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd548284358..c542613ed3ea 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -245,9 +245,18 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-prt8mm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tqma8mqml-mba8mx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-iv-306-d.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-mini-111.dtb
+
+imx8mm-var-dart-sonata-m4-dtbs := imx8mm-var-dart-sonata.dtb imx8mm-var-dart-sonata-m4.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata-m4.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata-m4.dtbo
+
+imx8mm-var-som-symphony-m4-dtbs := imx8mm-var-som-symphony.dtb imx8mm-var-som-symphony-m4.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony-legacy.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony-m4.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony-m4.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw71xx-0x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw72xx-0x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw73xx-0x.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
new file mode 100644
index 000000000000..ba2457d0ec91
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Cortex-M4 configuration for Variscite i.MX8M Mini modules
+ *
+ * Link: https://www.variscite.com/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+#include <dt-bindings/clock/imx8mm-clock.h>
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
+		vdev0vring0: vdev0vring0@40000000 {
+			reg = <0 0x40000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@40008000 {
+			reg = <0 0x40008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@400ff000 {
+			reg = <0 0x400ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@40400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x40400000 0 0x100000>;
+			no-map;
+		};
+
+		m4_reserved: m4@7e000000 {
+			reg = <0 0x7e000000 0 0x1000000>;
+			no-map;
+		};
+	};
+
+	imx8mm-cm4 {
+		compatible = "fsl,imx8mm-cm4";
+		clocks = <&clk IMX8MM_CLK_M4_CORE>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&m4_reserved>, <&rsc_table>;
+		memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
+				      "m4-reserved-ddr", "rsc-table";
+		syscon = <&src>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dtso b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dtso
new file mode 100644
index 000000000000..dacc845e53ec
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dtso
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M4 support for Variscite DART-MX8M-MINI on Sonata-Board
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
+#include "imx8mm-var-common-m4.dtsi"
+
+/* The buttons use a GPIO expander on I2C4. */
+&{/gpio-keys} {
+	status = "disabled";
+};
+
+/* Reserve the peripherals used by the Cortex-M4 firmware. */
+&ecspi1 {
+	status = "disabled";
+};
+
+/*
+ * Keep the touchscreen enabled without its optional reset GPIO, since the
+ * GPIO expander on I2C4 is unavailable to Linux.
+ */
+&ft5x06_ts {
+	reset-gpios = <0>;
+};
+
+&i2c4 {
+	status = "disabled";
+};
+
+/* The PCIe reset uses a GPIO expander on I2C4. */
+&pcie0 {
+	status = "disabled";
+};
+
+&pwm3 {
+	status = "disabled";
+};
+
+&uart3 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso
new file mode 100644
index 000000000000..f2a1618edcf5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M4 support for Variscite VAR-SOM-MX8M-MINI on Symphony-Board
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
+#include "imx8mm-var-common-m4.dtsi"
+
+/* Reserve the peripherals used by the Cortex-M4 firmware. */
+&ecspi1 {
+	status = "disabled";
+};
+
+&i2c4 {
+	status = "disabled";
+};
+
+&pwm3 {
+	status = "disabled";
+};
+
+&uart3 {
+	status = "disabled";
+};
-- 
2.47.3


