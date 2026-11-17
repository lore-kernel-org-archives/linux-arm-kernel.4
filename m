Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8CF606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 12:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gvatya6J;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cg9YxSYx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ioTQSBNyFu5FG64fJJQ7wrnnkB4xsmHATDHe8Yz9hOc=; b=Gvatya6J8jW9Yi
	ZMfKPEsJc8FCEBzipxlSVmce8FmOQoL+5SaGVv3y5mnlsd+afmNVQQQtPrYaRcwWp+Fnf1/QqPSPO
	rH6gyrhSQVWoFZxhyUJzvkypc6zH5wGpGy0Fqa/HXtf+iaDraEaAECWx6sqGv1ZgrOXbp44aXuLiV
	degyuhUf3xb3CMKry4wxEyZd88W8jHtcekuoor/nbIrwE0IKQhAAZANI3blXF/q1l+wocmf+Nz151
	THk8WJ85XGz1nPXxJ/KZiZ1FwW3Ta45uMARcH3UpCwy/vv5+GjkQQaGlagw5xA0vDL5/5doI7y2Qo
	WS23ZpOd+ug9wjCh0rVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIYV-00000005iL7-08oF;
	Tue, 17 Nov 2026 12:44:59 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIYQ-00000005iIF-1694
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 12:44:56 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2efdbab4e03so3401855ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 04:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919493; x=1795524293; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ioTQSBNyFu5FG64fJJQ7wrnnkB4xsmHATDHe8Yz9hOc=;
        b=Cg9YxSYxfXYie/0AQEdSYsp37hGSAQwoxcZ6vWUQIFyODE63bJuKDZxZpEEqp5lVBW
         ivjzO9iwYVTDAEoOVcNlzIeDalYRnlM5MM0TBGyteQRmlFPmEHLwlf1oXklcyWnW0rlr
         8Mp5h1i4llLMtbPWT3uwlcBXvXcVlONuXd7Os+bluUOWnwdZXOE9akzTowfR7BWnt9Lb
         rlFp039PnuZaNjn93cDGsZuwmrYNIWzHg2TuIqTj6QBgtwadLkHkQ1lTBr24ZkPefqk4
         NS+nRNSxrAcIEAzr1EyqsWUkps1qwff/DWBivjEl98bn8vfxH1kOVBqLskTr/n9SHJhE
         z0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919493; x=1795524293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ioTQSBNyFu5FG64fJJQ7wrnnkB4xsmHATDHe8Yz9hOc=;
        b=q9AHMzij9jsE8BdFRsyIo/fY3QF/U1/XRS/bpQ1BhDhhKnL1gHqcYB5kuaVM9fWWKj
         /lYVhnN8r14d4HeHL5QP9tbRjQXNd+4X4fqI+iZCdJPFNVhpWHaw59oI4fyjhYANMt0d
         sDZMxckiJmnFfQPHPDwxrarsONPNMCbpW2E5Rxfgv5TLoXKQV6yBafdAd3fR2L1gz+c3
         rx+YJ83XqcWz47OPVfku/xeeLvC9XpWZMnuWsdz33mpX3KwLs6ATO6kzihTQqGY3k5XC
         1cF6pgYNgP+0UPYajhnTRFBgVf4y4oHwq+LFxCU+LskJBMu/JUyJDDH7tqRR+Y82QkKQ
         V2iw==
X-Forwarded-Encrypted: i=1; AL+hErElzGOoV+tHr381ZgyRL+zYj2kLX7DL+RUBeN9g7Iz5GQ6aOmyURgTH++7YG2jFmfIzHqzbDfk+O3nwpyrnd2ix@lists.infradead.org
X-Gm-Message-State: APuU4Z+LPRkW0GUSliHuqOWzNe+ToGKwCUwHfYCYQANSmIjbNtpnku09
	YiQQ5PkbI9KAac0zu6tylH4Owzy1vRME29QyRBD+XCp6EvTlQ4E8r+X6
X-Gm-Gg: AZFdTZc4XhGPmqliHneyknGR/NFdP74eRfm8VjPn0FMOWqJUSg1UkmCUBxj/7F2nbEr
	jCZhX9PZtOJcVL4DlkLjGgVsRlZn1d8k4KEmXXNRu39e+bgXxj2D24aj2+HFDRgF4IVXy2gFlUm
	ab4QhyXYijKSC82tIwX61ReFTO92otn55Ogl1m6uyRMzTw22frzjr6Q1CBEWOw+QXmLYoMd0kNS
	waAI0SQ1UsF0KqzXWejhqku77OptFIHGY/85CNIfLPPFXJeDdn4bChg1n4SGwv2TPFDLJXVx2Ee
	QSBx/LbqiqvccGTaALDgeTFucpgKdO1U13zZgeRHBdiw2mY42IVAj61jJQD6rhYaqKC7FtuRj+b
	zojC1tftY6TR+hGetfVkekwbrBmkNNiuEhYGdA4hDhxA9QXh5YbyyoW4u/N8dSA3w2mKZbhjczJ
	6rv92KiHFdx4Ti/RSDcB/b5D9014ar7aopNC2CCAjoqd5YZBWn5CtnjO3VoHv67qnTJG+uyzxCY
	ORRlKjjPkVO7btoaAdp0ipu5f5H+/MMr8TuLm5CHBIE02NcmmxO9MB4upmKSpEYT8No8Ma04QFI
	tMZbP5dR6VJcEQZRxiqVh/riIZ9qafelJw==
X-Received: by 2002:a17:903:1aa7:b0:2dd:b6e7:ac1b with SMTP id d9443c01a7336-2ee0da31f96mr148127665ad.2.1794919493062;
        Tue, 17 Nov 2026 04:44:53 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a85f1dsm14585725ad.59.2026.11.17.04.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:44:52 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Tue, 17 Nov 2026 09:44:13 -0300
Subject: [PATCH v2 1/2] arm64: dts: freescale: imx8mm-verdin: Rename
 Toradex display overlays
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-v2-imx8mm-verdin-add-lvds-v2-v2-1-ecfd237cf7ee@toradex.com>
References: <20261117-v2-imx8mm-verdin-add-lvds-v2-v2-0-ecfd237cf7ee@toradex.com>
In-Reply-To: <20261117-v2-imx8mm-verdin-add-lvds-v2-v2-0-ecfd237cf7ee@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794919484; l=7204;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=BwcIZ/VlbJg2I+2C67AXmg/i3dqu1nwSQOaQPkMofeE=;
 b=zTGHKRUj6+QU9NIEurqGNxE6+qIs8D/4pyarGxXDtGYWJ8gLa20jm7Ox+50i3lhQqvZTfyk4b
 I0EhtdF3zMjBAvrXHc5G1QeRcEQMgywvvyeCp+gsfFii5KIqDDoSZ2k
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_044454_335099_DFABB31C 
X-CRM114-Status: UNSURE (   9.67  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Leonardo Costa <leonardo.costa@toradex.com>

The Toradex Capacitive Touch Display 10.1" LVDS, Toradex Capacitive
Touch Display 10.1" DSI and 7" DSI are Toradex accessories, and the
overlay names are their product names. The naming pattern
"panel-cap-touch-<N>inch-<interface>" reads as a generic panel
description and could just as well name another vendor's display.

Prefix the accessory overlays with their vendor, "tdx", as is already
done for third-party accessories on Toradex boards (e.g. "rpi" in
k3-am625-verdin-rpi-display-2-7in.dtso). The combined DTBs are renamed
accordingly.

Additionally, the Toradex Capacitive Touch Display 10.1" LVDS has a
correspondent V2 that is meant to be its successor. Encode the major
version number by adding a "-v1" suffix in this overlay's name as well.

Link: https://lore.kernel.org/all/20261026111149.GA46946@francesco-nb/
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             | 30 +++++++++++-----------
 ...dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso} |  0
 ...8mm-verdin-tdx-panel-cap-touch-10inch-dsi.dtso} |  0
 ...x8mm-verdin-tdx-panel-cap-touch-7inch-dsi.dtso} |  0
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd5482843586..0bbc4b6a6b537 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -257,9 +257,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-hdmi.dtbo
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-tdx-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev.dtb
@@ -268,15 +268,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-tdx-panel-cap-touch-10inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-tdx-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-tdx-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-tdx-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
@@ -286,19 +286,19 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-zinnia.dtb
 
 imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-dahlia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
-imx8mm-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-nonwifi-dahlia.dtb \
-	imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
+imx8mm-verdin-nonwifi-dahlia-tdx-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-nonwifi-dahlia.dtb \
+	imx8mm-verdin-tdx-panel-cap-touch-10inch-dsi.dtbo
 imx8mm-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dahlia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
-imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-wifi-dahlia.dtb \
-	imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
+imx8mm-verdin-wifi-dahlia-tdx-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-wifi-dahlia.dtb \
+	imx8mm-verdin-tdx-panel-cap-touch-10inch-dsi.dtbo
 imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
-imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
-	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+imx8mm-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1-dtbs := imx8mm-verdin-wifi-dev.dtb \
+	imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
-imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
-	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
+imx8mm-verdin-wifi-dev-tdx-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
+	imx8mm-verdin-tdx-panel-cap-touch-7inch-dsi.dtbo
 imx8mm-verdin-wifi-dev-uart4-mcu-dtbs := imx8mm-verdin-wifi-dev.dtb imx-tdx-uart-mcu.dtbo
 imx8mm-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso
similarity index 100%
rename from arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
rename to arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-tdx-panel-cap-touch-10inch-dsi.dtso
similarity index 100%
rename from arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso
rename to arch/arm64/boot/dts/freescale/imx8mm-verdin-tdx-panel-cap-touch-10inch-dsi.dtso
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-tdx-panel-cap-touch-7inch-dsi.dtso
similarity index 100%
rename from arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso
rename to arch/arm64/boot/dts/freescale/imx8mm-verdin-tdx-panel-cap-touch-7inch-dsi.dtso

-- 
2.43.0


