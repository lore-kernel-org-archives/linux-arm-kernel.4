Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AD9606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 12:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ztx7Jbmr;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=vTcb4DeJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wr7RkffnYvOl3FhNLiB/TEwApGzEcSL4fP61HijSYoE=; b=ztx7JbmrEzLHrC
	RmPKbSzIr7V6/M0QwKMj2g3gkmQnd+Yu+Wnb3V6gfDEK/mm6SwN+XjMbYbC+eLe4HY8L0307pfLhe
	c/XcynuAq8yTaCZT5VSATdjNOARNuuxNS0zLEOuTetlOKjbLkULzWE2vqo3t9oTvbISLxqB4rXDAK
	0RCfZy2uZj8S9JA1tGvTbXeYQkFop8CBoE7IcA4I3Wfl4ABdGjr7z+An5yAq3V2v6AZqaRk0HzPED
	8tcKUrac6+FmGNxgZJCXH2ku3x7po2xM42+srildv6mIuVjtK5iekNQ1MFpn+tMRopHZObFolO6VA
	1gfLU/xehOWZLkU3WieA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpr4-00000006XEL-0Mo8;
	Tue, 24 Nov 2026 12:42:38 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpqn-00000006X9w-3n2n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 12:42:25 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id D7B861FB20;
	Tue, 24 Nov 2026 13:42:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1795524136;
	bh=wr7RkffnYvOl3FhNLiB/TEwApGzEcSL4fP61HijSYoE=; h=From:To:Subject;
	b=vTcb4DeJttwb6sp4bEBQAEbPu/MiFi5AHxbBpKY3L6mdbNBqNO0mew4K2YU6hCdw0
	 2/x3MchUb+iUG7J/0eFO42Kw5RSrU5oAtB+3RPpCtlicbMRUOz3EepOBQANwKxX8mx
	 UniYikXtukgDhmg6oeiZ9eAsPZjtFFDST3KbSrGc8Tv4AwKDmxhyvPUeVnRDgRQCoL
	 yjiiy9YNGRaqy+rYg8ubzQYMpdv8cVttHHVjOE2ODLKcVx0G9izqNirZ/+RdF8Nqh8
	 gZlDBz3OvVX6y2HGdm/WydtMoDeNwkm0JJNgLR5k50yk2rgQJzd7LoBrngpdmZl+vK
	 NJe8logeqaTtw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: ti: k3-am69-aquila: Add tdx vendor prefix to display overlays
Date: Tue, 24 Nov 2026 13:42:05 +0100
Message-ID: <20261124124207.199382-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124124207.199382-1-francesco@dolcini.it>
References: <20261124124207.199382-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_044223_712582_3D8D6EDC 
X-CRM114-Status: UNSURE (   9.01  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The Toradex display overlays are named after the accessory product name,
which on its own reads as a generic panel description. Prefix them with
the vendor, "tdx", as already done for third-party accessories (e.g.
"rpi-display-2-7in") and for the Toradex overlays in the NXP i.MX
directories, to have a consistent naming across all Toradex DT files.

The 10.1" LVDS display exists in a V1 and a V2 version, encode it as a
"-v1"/"-v2" suffix. The combined DTBs are renamed accordingly.

Link: https://lore.kernel.org/all/20261026111149.GA46946@francesco-nb/
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               | 48 +++++++++----------
 ...apter-tdx-panel-cap-touch-10inch-dsi.dtso} |  0
 ...dapter-tdx-panel-cap-touch-7inch-dsi.dtso} |  0
 ...o-lvds-tdx-panel-cap-touch-10inch-v1.dtso} |  0
 ...o-lvds-tdx-panel-cap-touch-10inch-v2.dtso} |  0
 ...quila-tdx-panel-cap-touch-10inch-dsi.dtso} |  0
 ...aquila-tdx-panel-cap-touch-7inch-dsi.dtso} |  0
 7 files changed, 24 insertions(+), 24 deletions(-)
 rename arch/arm64/boot/dts/ti/{k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtso => k3-am69-aquila-adapter-tdx-panel-cap-touch-10inch-dsi.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtso => k3-am69-aquila-adapter-tdx-panel-cap-touch-7inch-dsi.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtso => k3-am69-aquila-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso => k3-am69-aquila-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am69-aquila-panel-cap-touch-10inch-dsi.dtso => k3-am69-aquila-tdx-panel-cap-touch-10inch-dsi.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am69-aquila-panel-cap-touch-7inch-dsi.dtso => k3-am69-aquila-tdx-panel-cap-touch-7inch-dsi.dtso} (100%)

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 4c31fceb6497..7061e28719f1 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -212,14 +212,14 @@ dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 
 # Boards with J784s4 SoC
-k3-am69-aquila-clover-panel-cap-touch-10inch-dsi-dtbs := \
+k3-am69-aquila-clover-tdx-panel-cap-touch-10inch-dsi-dtbs := \
 	k3-am69-aquila-clover.dtb \
-	k3-am69-aquila-panel-cap-touch-10inch-dsi.dtbo
+	k3-am69-aquila-tdx-panel-cap-touch-10inch-dsi.dtbo
 k3-am69-aquila-dev-dsi-to-hdmi-dtbs := k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-dsi-to-hdmi.dtbo
-dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtbo
-dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtbo
-dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover-panel-cap-touch-10inch-dsi.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-adapter-tdx-panel-cap-touch-10inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-adapter-tdx-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover-tdx-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-csi1-ov5640-24mhz.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-csi1-ov5640.dtbo
@@ -228,10 +228,10 @@ dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-csi2-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-hdmi.dtbo
-dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
-dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtbo
-dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-panel-cap-touch-10inch-dsi.dtbo
-dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-tdx-panel-cap-touch-10inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-tdx-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
@@ -374,15 +374,15 @@ k3-am68-sk-base-board-csi2-dual-imx219-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtbo
-k3-am69-aquila-clover-panel-cap-touch-7inch-dsi-dtbs := \
+k3-am69-aquila-clover-tdx-panel-cap-touch-7inch-dsi-dtbs := \
 	k3-am69-aquila-clover.dtb \
-	k3-am69-aquila-panel-cap-touch-7inch-dsi.dtbo
-k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi-dtbs := \
+	k3-am69-aquila-tdx-panel-cap-touch-7inch-dsi.dtbo
+k3-am69-aquila-dev-adapter-tdx-panel-cap-touch-10inch-dsi-dtbs := \
 	k3-am69-aquila-dev.dtb \
-	k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtbo
-k3-am69-aquila-dev-adapter-panel-cap-touch-7inch-dsi-dtbs := \
+	k3-am69-aquila-adapter-tdx-panel-cap-touch-10inch-dsi.dtbo
+k3-am69-aquila-dev-adapter-tdx-panel-cap-touch-7inch-dsi-dtbs := \
 	k3-am69-aquila-dev.dtb \
-	k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtbo
+	k3-am69-aquila-adapter-tdx-panel-cap-touch-7inch-dsi.dtbo
 k3-am69-aquila-dev-csi-ov5640-24mhz-dtbs := \
 	k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-csi1-ov5640-24mhz.dtbo \
@@ -391,12 +391,12 @@ k3-am69-aquila-dev-csi-ov5640-dtbs := \
 	k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-csi1-ov5640.dtbo \
 	k3-am69-aquila-csi2-ov5640.dtbo
-k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
+k3-am69-aquila-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1-dtbs := \
 	k3-am69-aquila-dev.dtb \
-	k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
-k3-am69-aquila-dev-dsi-to-lvds-v2-panel-cap-touch-10inch-dtbs := \
+	k3-am69-aquila-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
+k3-am69-aquila-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2-dtbs := \
 	k3-am69-aquila-dev.dtb \
-	k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtbo
+	k3-am69-aquila-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtbo
 k3-am69-sk-csi2-dual-imx219-dtbs := k3-am69-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am69-sk-pcie0-ep-dtbs := k3-am69-sk.dtb \
@@ -495,13 +495,13 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am68-phyboard-izar-pwm-fan.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
-	k3-am69-aquila-clover-panel-cap-touch-7inch-dsi.dtb \
-	k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi.dtb \
-	k3-am69-aquila-dev-adapter-panel-cap-touch-7inch-dsi.dtb \
+	k3-am69-aquila-clover-tdx-panel-cap-touch-7inch-dsi.dtb \
+	k3-am69-aquila-dev-adapter-tdx-panel-cap-touch-10inch-dsi.dtb \
+	k3-am69-aquila-dev-adapter-tdx-panel-cap-touch-7inch-dsi.dtb \
 	k3-am69-aquila-dev-csi-ov5640-24mhz.dtb \
 	k3-am69-aquila-dev-csi-ov5640.dtb \
-	k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
-	k3-am69-aquila-dev-dsi-to-lvds-v2-panel-cap-touch-10inch.dtb \
+	k3-am69-aquila-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtb \
+	k3-am69-aquila-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
 	k3-j7200-evm-pcie1-ep.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-tdx-panel-cap-touch-10inch-dsi.dtso
similarity index 100%
rename from arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtso
rename to arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-tdx-panel-cap-touch-10inch-dsi.dtso
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-tdx-panel-cap-touch-7inch-dsi.dtso
similarity index 100%
rename from arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtso
rename to arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-tdx-panel-cap-touch-7inch-dsi.dtso
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso
similarity index 100%
rename from arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtso
rename to arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso
similarity index 100%
rename from arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
rename to arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-10inch-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-tdx-panel-cap-touch-10inch-dsi.dtso
similarity index 100%
rename from arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-10inch-dsi.dtso
rename to arch/arm64/boot/dts/ti/k3-am69-aquila-tdx-panel-cap-touch-10inch-dsi.dtso
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-7inch-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-tdx-panel-cap-touch-7inch-dsi.dtso
similarity index 100%
rename from arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-7inch-dsi.dtso
rename to arch/arm64/boot/dts/ti/k3-am69-aquila-tdx-panel-cap-touch-7inch-dsi.dtso
-- 
2.47.3


