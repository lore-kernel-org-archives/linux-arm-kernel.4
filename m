Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFEF606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aUDUAYCE;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yb4YDHnB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=k47tfCEJkcbLr56UWWN1mV8xEAHsP5jrj/tsgJbgRzY=; b=aUDUAYCEoiJZwI59YUphfIDPy+
	5pngrF+/bbKCctxxpjdNXTVL/BEFN87DURV+AjxHIXemyRI9WUrF7fQakBmQULC8Gt0U0voQjMIc8
	enNx6EvGeiDEX8Jv/G7bW4w5xM9Mx/24QgttkHrDHf7kiVFXa1DRl/Q/SI5TlsVV1Yygj9x2IWS69
	Pc8OJ8NQCplMs1WuSE/lBtp+u28etl/JKDDukWYre706dxCcJQ1N84BcctisxIP36WB7aq3r0nMsT
	rFFFliz29THe4UnO78uNcbjHjABW4+4wRNgR5VZK7SY0vH5J3ewT1iR+NWeFyEpxgKfgkaTpMSWeG
	aZIduOfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQS4f-00000001B6K-0Pbx;
	Mon, 09 Nov 2026 16:18:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQS4c-00000001B5j-2KLF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:18:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 06B2C61194;
	Mon,  9 Nov 2026 16:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ABB01F008A1;
	Mon,  9 Nov 2026 16:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794241101;
	bh=k47tfCEJkcbLr56UWWN1mV8xEAHsP5jrj/tsgJbgRzY=;
	h=From:To:Cc:Subject:Date;
	b=Yb4YDHnB6Exb1cY689qfkUxTSs0Q7/s5VcUWYeEkZb4yE/wLfvx6tGanvomg/z3qP
	 N3OTyYEn/sEwcb3hyG5fLlcC+N/8xex1np/vAi+p87Dle/Lk0Ump+HJKF+jVihxd61
	 ahIYnX9T42wZAGKaoco8OOJQ2farJD7VCzWe5xgHIPphIPxso2D/3JlbRqHQMrZFO/
	 P8WQrH4SuHsNYg/66xhThGu2fp8KBcAEmmkJH2dJszxLItK2mhbhhnHBMBEmPNHcPM
	 AOHlwepOogENYNfPiekZtRlS45yh5Ae7ZZmzY+TnwssULifj+7VkPqkvEUBm2Xoc7x
	 rLvQ09AjZsG3w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: sashiko-bot@kernel.org,
	stable@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: nxp/imx6: Fix imx6qdl pico dwarf and nymph includes
Date: Mon,  9 Nov 2026 10:18:09 -0600
Message-ID: <20261109161812.3629546-1-robh@kernel.org>
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

The imx6q/dl pico dwarf and nymph boards appear to have a copy-n-paste
error including the imx6qdl-pico-pi.dtsi by mistake. The
imx6qdl-pico-dwarf.dtsi and imx6qdl-pico-nymph.dtsi were otherwise unused.

Fixing the typos introduces some DT schema warnings, so fix them. The
supplies for MPL3115 are a guess based on other dwarf variants.

Reported-by: sashiko-bot@kernel.org
Link: https://lore.kernel.org/all/sashiko-outbox-199279@kernel.org
Fixes: 98670a0bb0ef ("ARM: dts: imx6qdl: Add imx6qdl-pico support")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/nxp/imx/imx6dl-pico-dwarf.dts   | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-pico-nymph.dts   | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-pico-dwarf.dts    | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-pico-nymph.dts    | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi | 3 +++
 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi | 1 +
 6 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-pico-dwarf.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-pico-dwarf.dts
index d85b15a8c127..dd8ce2df876c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-pico-dwarf.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-pico-dwarf.dts
@@ -9,7 +9,7 @@
 /dts-v1/;
 
 #include "imx6dl.dtsi"
-#include "imx6qdl-pico-pi.dtsi"
+#include "imx6qdl-pico-dwarf.dtsi"
 
 / {
 	model = "TechNexion PICO-IMX6 DualLite/Solo Board and Dwarf baseboard";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-pico-nymph.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-pico-nymph.dts
index 32ccfc5d41ce..4ce0d0d0756c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-pico-nymph.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-pico-nymph.dts
@@ -9,7 +9,7 @@
 /dts-v1/;
 
 #include "imx6dl.dtsi"
-#include "imx6qdl-pico-pi.dtsi"
+#include "imx6qdl-pico-nymph.dtsi"
 
 / {
 	model = "TechNexion PICO-IMX6 DualLite/Solo Board and Nymph baseboard";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-pico-dwarf.dts b/arch/arm/boot/dts/nxp/imx/imx6q-pico-dwarf.dts
index 479a63ed42af..5e1f8b79593d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-pico-dwarf.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-pico-dwarf.dts
@@ -9,7 +9,7 @@
 /dts-v1/;
 
 #include "imx6q.dtsi"
-#include "imx6qdl-pico-pi.dtsi"
+#include "imx6qdl-pico-dwarf.dtsi"
 
 / {
 	model = "TechNexion PICO-IMX6 Quad Board and Dwarf baseboard";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-pico-nymph.dts b/arch/arm/boot/dts/nxp/imx/imx6q-pico-nymph.dts
index e8ad4c12b263..d688b5bb6c6a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-pico-nymph.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-pico-nymph.dts
@@ -9,7 +9,7 @@
 /dts-v1/;
 
 #include "imx6q.dtsi"
-#include "imx6qdl-pico-pi.dtsi"
+#include "imx6qdl-pico-nymph.dtsi"
 
 / {
 	model = "TechNexion PICO-IMX6 Quad Board and Nymph baseboard";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
index 3a968782e854..feaadacfe7ff 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
@@ -22,6 +22,8 @@ &i2c1 {
 	mpl3115@60 {
 		compatible = "fsl,mpl3115";
 		reg = <0x60>;
+		vdd-supply = <&reg_3p3v>;
+		vddio-supply = <&reg_3p3v>;
 	};
 };
 
@@ -31,6 +33,7 @@ io-expander@25 {
 		reg = <0x25>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		interrupt-controller;
 		#interrupt-cells = <2>;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
index 3d56a4216448..a13f4d49c05d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
@@ -30,6 +30,7 @@ io-expander@25 {
 		reg = <0x25>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		interrupt-controller;
 		#interrupt-cells = <2>;
 	};
 };
-- 
2.53.0


