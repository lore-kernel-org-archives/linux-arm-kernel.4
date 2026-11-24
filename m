Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CF4606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 12:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t8M5pbPn;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=I9gPpYeg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FXHwcBo55fXV6NB/G7yDaAi5wcc/RVjDUECLhPxRCew=; b=t8M5pbPnJ1k0qh
	DIeXhz5uSpxS3EV2UqLKzjgBiToTeehNw72ZrdqHSUACxwvDxeZizjsLPK6CiO1U3p4iWLZ1FZ834
	cQBACUNBkoTuhv4XsvgU+/AjT33CZNe7hMskOv3U3kWb/9UpIVbDpCm+I52nfGhHRXsG11o6k9G9B
	DEQ5mY456Saf8LRzWqz7/tRTQ5AG60fZYcOJHFbag7q53UvqlAv+PYmAq9q7SqWeSDFcYqTUbBN81
	Pd91GOykPp89LorCp0+40RgTw5uXWxMzZCPcs/U7C86kcOBTph4HZOMz9wHiZLlgbGaiTtDIfTDpR
	zxAlDHwlNHWp985GaqVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpr0-00000006XDm-1zy1;
	Tue, 24 Nov 2026 12:42:37 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpqn-00000006X9d-1fkk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 12:42:25 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 28416204EE;
	Tue, 24 Nov 2026 13:42:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1795524135;
	bh=FXHwcBo55fXV6NB/G7yDaAi5wcc/RVjDUECLhPxRCew=; h=From:To:Subject;
	b=I9gPpYegYYcFWSPNMPsH/TDQ5cFhYbWw55w/KqFQTk/9+163UX5KA149aulT5ODc4
	 qKfHJDbvJdxqWXg+D0zzGgEujZcTo3Ld8pdE6bOdr9r0H42TQYUtDqNLkj5tcitphj
	 7IOEAkkAEpaNq8lKUOTumIDUeTPIYTZiZUcQ1GvtigjFqglu+DnnJq72mkFZQBOhEH
	 UMnwNzU1CNYHcc9o9ZpCKavUcjM+3Dl5XPoF88Y52Vq83BJhRFgcIIPIgqXZGY1cN5
	 mF5v27pjdQNqgWwbQza6D1D+2R1X7BHwJ4DOEgWG1ltVRQHEIzUVxCHOXqBMm6CsD4
	 DMLrK+dekQ0CQ==
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
Subject: [PATCH v1 1/2] arm64: dts: ti: k3-am62-verdin: Add tdx vendor prefix to display overlays
Date: Tue, 24 Nov 2026 13:42:04 +0100
Message-ID: <20261124124207.199382-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124124207.199382-1-francesco@dolcini.it>
References: <20261124124207.199382-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_044222_500370_01506F95 
X-CRM114-Status: UNSURE (   8.92  )
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
 arch/arm64/boot/dts/ti/Makefile               | 72 +++++++++----------
 ...e-tdx-panel-cap-touch-10inch-lvds-v1.dtso} |  0
 ...e-tdx-panel-cap-touch-10inch-lvds-v2.dtso} |  0
 ...o-lvds-tdx-panel-cap-touch-10inch-v1.dtso} |  0
 ...o-lvds-tdx-panel-cap-touch-10inch-v2.dtso} |  0
 ...erdin-tdx-panel-cap-touch-10inch-dsi.dtso} |  0
 ...n-tdx-panel-cap-touch-10inch-lvds-v1.dtso} |  0
 ...n-tdx-panel-cap-touch-10inch-lvds-v2.dtso} |  0
 ...verdin-tdx-panel-cap-touch-7inch-dsi.dtso} |  0
 9 files changed, 36 insertions(+), 36 deletions(-)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso => k3-am625-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso => k3-am625-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso => k3-am625-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso => k3-am625-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-panel-cap-touch-10inch-dsi.dtso => k3-am625-verdin-tdx-panel-cap-touch-10inch-dsi.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso => k3-am625-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtso => k3-am625-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-panel-cap-touch-7inch-dsi.dtso => k3-am625-verdin-tdx-panel-cap-touch-7inch-dsi.dtso} (100%)

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index da654153a35b..4c31fceb6497 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -11,16 +11,16 @@
 # Boards with AM62x SoC
 k3-am625-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := k3-am625-verdin-nonwifi-dahlia.dtb \
 	k3-am625-verdin-dsi-to-hdmi.dtbo
-k3-am625-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := \
+k3-am625-verdin-nonwifi-dahlia-tdx-panel-cap-touch-10inch-dsi-dtbs := \
 	k3-am625-verdin-nonwifi-dahlia.dtb \
-	k3-am625-verdin-panel-cap-touch-10inch-dsi.dtbo
+	k3-am625-verdin-tdx-panel-cap-touch-10inch-dsi.dtbo
 k3-am625-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := k3-am625-verdin-nonwifi-dev.dtb \
 	k3-am625-verdin-dsi-to-hdmi.dtbo
 k3-am625-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := k3-am625-verdin-wifi-dahlia.dtb \
 	k3-am625-verdin-dsi-to-hdmi.dtbo
-k3-am625-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := \
+k3-am625-verdin-wifi-dahlia-tdx-panel-cap-touch-10inch-dsi-dtbs := \
 	k3-am625-verdin-wifi-dahlia.dtb \
-	k3-am625-verdin-panel-cap-touch-10inch-dsi.dtbo
+	k3-am625-verdin-tdx-panel-cap-touch-10inch-dsi.dtbo
 k3-am625-verdin-wifi-dev-dsi-to-hdmi-dtbs := k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay.dtb
@@ -33,14 +33,14 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-sk-microtips-mf101hie-panel.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-can.dtbo
-dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
-dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-hdmi.dtbo
-dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
-dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
-dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia-tdx-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dev.dtb
@@ -50,13 +50,13 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-ov5640-24mhz.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-ov5640.dtbo
-dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-dsi.dtbo
-dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
-dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtbo
-dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-rpi-display-2-7in.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-tdx-panel-cap-touch-10inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-tdx-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-dsi-to-hdmi.dtb
-dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-tdx-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dev.dtb
@@ -271,40 +271,40 @@ k3-am625-sk-csi2-tevi-ov5640-dtbs := k3-am625-sk.dtb \
 k3-am625-sk-hdmi-audio-dtbs := k3-am625-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am625-sk-microtips-mf101hie-panel-dtbs := k3-am625-sk.dtb \
 	k3-am625-sk-microtips-mf101hie-panel.dtbo
-k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
+k3-am625-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
-	k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
-k3-am625-verdin-wifi-dev-dsi-to-lvds-v2-panel-cap-touch-10inch-dtbs := \
+	k3-am625-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
+k3-am625-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
-	k3-am625-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtbo
+	k3-am625-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtbo
 k3-am625-verdin-wifi-dev-mezzanine-can-dtbs := k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dev-mezzanine-can.dtbo
-k3-am625-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-dtbs := \
+k3-am625-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
-	k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
-k3-am625-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-v2-dtbs := \
+	k3-am625-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
+k3-am625-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v2-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
-	k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtbo
+	k3-am625-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtbo
 k3-am625-verdin-wifi-dev-nau8822-btl-dtbs := k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dev-nau8822-btl.dtbo
 k3-am625-verdin-wifi-dev-ov5640-24mhz-dtbs := k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-ov5640-24mhz.dtbo
 k3-am625-verdin-wifi-dev-ov5640-dtbs := k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-ov5640.dtbo
-k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := \
-	k3-am625-verdin-wifi-dev.dtb \
-	k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
 k3-am625-verdin-wifi-dev-rpi-display-2-7in-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-rpi-display-2-7in.dtbo
+k3-am625-verdin-wifi-dev-tdx-panel-cap-touch-7inch-dsi-dtbs := \
+	k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-tdx-panel-cap-touch-7inch-dsi.dtbo
 k3-am625-verdin-wifi-dev-uart4-mcu-dtbs := k3-am625-verdin-wifi-dev.dtb \
 	k3-am62x-verdin-uart4-mcu.dtbo
-k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
+k3-am625-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
 	k3-am625-verdin-wifi-mallow.dtb \
-	k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
-k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-v2-dtbs := \
+	k3-am625-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
+k3-am625-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v2-dtbs := \
 	k3-am625-verdin-wifi-mallow.dtb \
-	k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtbo
+	k3-am625-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtbo
 k3-am62-lp-sk-hdmi-audio-dtbs := k3-am62-lp-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am62-lp-sk-nand-dtbs := k3-am62-lp-sk.dtb k3-am62-lp-sk-nand.dtbo
 k3-am62a7-phyboard-lyra-disable-eth-phy-dtbs := k3-am62a7-phyboard-lyra-rdk.dtb \
@@ -445,19 +445,19 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-tevi-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
 	k3-am625-sk-microtips-mf101hie-panel.dtb \
-	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
-	k3-am625-verdin-wifi-dev-dsi-to-lvds-v2-panel-cap-touch-10inch.dtb \
+	k3-am625-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtb \
+	k3-am625-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtb \
 	k3-am625-verdin-wifi-dev-mezzanine-can.dtb \
-	k3-am625-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds.dtb \
-	k3-am625-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtb \
+	k3-am625-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtb \
+	k3-am625-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtb \
 	k3-am625-verdin-wifi-dev-nau8822-btl.dtb \
 	k3-am625-verdin-wifi-dev-ov5640-24mhz.dtb \
 	k3-am625-verdin-wifi-dev-ov5640.dtb \
-	k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb \
 	k3-am625-verdin-wifi-dev-rpi-display-2-7in.dtb \
+	k3-am625-verdin-wifi-dev-tdx-panel-cap-touch-7inch-dsi.dtb \
 	k3-am625-verdin-wifi-dev-uart4-mcu.dtb \
-	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb \
-	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-v2.dtb \
+	k3-am625-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1.dtb \
+	k3-am625-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v2.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
 	k3-am62-lp-sk-nand.dtb \
 	k3-am62a7-phyboard-lyra-disable-eth-phy.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso
similarity index 100%
rename from arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso
rename to arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtso
similarity index 100%
rename from arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
rename to arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtso
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso
similarity index 100%
rename from arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
rename to arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso
similarity index 100%
rename from arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
rename to arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-tdx-panel-cap-touch-10inch-dsi.dtso
similarity index 100%
rename from arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-dsi.dtso
rename to arch/arm64/boot/dts/ti/k3-am625-verdin-tdx-panel-cap-touch-10inch-dsi.dtso
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso
similarity index 100%
rename from arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso
rename to arch/arm64/boot/dts/ti/k3-am625-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtso
similarity index 100%
rename from arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtso
rename to arch/arm64/boot/dts/ti/k3-am625-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtso
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-7inch-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-tdx-panel-cap-touch-7inch-dsi.dtso
similarity index 100%
rename from arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-7inch-dsi.dtso
rename to arch/arm64/boot/dts/ti/k3-am625-verdin-tdx-panel-cap-touch-7inch-dsi.dtso
-- 
2.47.3


