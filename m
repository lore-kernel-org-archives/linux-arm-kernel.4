Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1149606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vXKZPz/P;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dY67sa80
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=v5L08Jod6ZO59LdGm3Xb4YC2Fa48wRZlTTU52Vj5qtQ=; b=vXKZPz/PSAc7RkCub4fTmHeO+T
	SiJIXL42ufjA36RgzS7DHHtNW+JlflSAyMBuTF5SKggTSpf6VjAiGT/CRMdYEqwmy+bpDFMdKX9YD
	1FIP5LQChb5h283+eot3UulD/vFOg2nT8W3/fcrOHeL8f+Vf+OQaMW7Ufao5Xvifffvw5zy4dcqhU
	/J/MdGwMZoX6yJ2ZcB5H84bO3ztqGo6PYvq0D26QZOP2hGX4xPYA0QI2DD6+kzuadnwJrTWBU0LS5
	KEyJylzUPeybc1iiRiuOjvlj7ksLdo4YTcYlw1tzINiIlYtJzv0t9YW1F3UT4bttI8bK00lBT7LRB
	82h+32gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQS3q-00000001Awb-3om4;
	Mon, 09 Nov 2026 16:17:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQS3p-00000001AwJ-2i6A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:17:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A52E60D24;
	Mon,  9 Nov 2026 16:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 225B61F008A1;
	Mon,  9 Nov 2026 16:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794241052;
	bh=v5L08Jod6ZO59LdGm3Xb4YC2Fa48wRZlTTU52Vj5qtQ=;
	h=From:To:Cc:Subject:Date;
	b=dY67sa80Cm3J6+iuhMA+b5YW0Gj5WLhiCYUvoPc06cssx30tP/K5YwSY1lF1MIztM
	 QWjHvDaC+LJA1u7RCgDfLJZQ8oGXb8YaJSmNjju5mbbqbGiSYNCfa97Ajvrn2fOw8j
	 xj+wuYWwwRAXhGOrYopgWdVkjIf1C2iMG9CoOCFw0tG4b+a8foERSuoU+Gn8MWjJD1
	 tiuRgWktEeEOIqgl64J6bnjXEoqw7nUOwZygJKwv/Bepmhg0c1Jo2BuNQRZs4mxSUk
	 DOfWy55aCD2Nlv1Gd3X8i59xU13KFWq4QspfnmUszR9+4mjbQfc0H5vegGh5duWDEk
	 GYpc0bEm6Cr1Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] ARM: dts: nxp/imx6: Drop unused kontron-samx6i .dtsi
Date: Mon,  9 Nov 2026 10:17:12 -0600
Message-ID: <20261109161713.3618477-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
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

These 2 kontron-samx6i .dtsi files are not included anywhere in the tree
and can't be tested. The kontron-samx6i support is already in place in
the imx6(q|dl)-kontron-samx6i-ads2.dts files which just include all the
necessary .dtsi files directly.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v3:
 - Drop pico boards and reword commit msg
---
 arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi | 12 ------------
 arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi  | 12 ------------
 2 files changed, 24 deletions(-)
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
deleted file mode 100644
index 5a9b819d7ee8..000000000000
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
+++ /dev/null
@@ -1,12 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0 OR X11
-/*
- * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
- */
-
-#include "imx6dl.dtsi"
-#include "imx6qdl-kontron-samx6i.dtsi"
-
-/ {
-	model = "Kontron SMARC-sAMX6i Dual-Lite/Solo";
-	compatible = "kontron,imx6dl-samx6i", "fsl,imx6dl";
-};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
deleted file mode 100644
index e76963436079..000000000000
--- a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
+++ /dev/null
@@ -1,12 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0 OR X11
-/*
- * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
- */
-
-#include "imx6q.dtsi"
-#include "imx6qdl-kontron-samx6i.dtsi"
-
-/ {
-	model = "Kontron SMARC-sAMX6i Quad/Dual";
-	compatible = "kontron,imx6q-samx6i", "fsl,imx6q";
-};
-- 
2.53.0


