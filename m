Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBE2606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lqkmzXRm;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=skxlQQ+b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KDtNFM/ZDCjrMncXpMX0NZxcAvy/V+uo/92tpKVrQoo=; b=lqkmzXRmINOLJg
	cbY1P3nsUJNfe37kw0sn0L0278L/MYkL1cGNYxi6tHmTh5iZPsEQksKZnE0OLbqg7m1xbQQYeRvA5
	MO5ksHDC11Coj522e3jvypi3se7em3c4V6FveQFUS++fmDjZ3F1L4DJaEnIOjqZ2VySOqPe/RfnZh
	jGi/pzHqn12Wb1sqjEj0nHfQsCf+Emme8itrK4yCKBPSC3AY4i/OM/o573eLCsX7Is5rt19ASSOY9
	sT9UbtInulWzLZPvUEd9E8HoB9BLeLb3olJxlYtvx/maVIfQ0iohoD9MaeVWJU96KDKz3lTOwHaBB
	irznnmz3haUCGVGTCZ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDcl-00000007TjK-1Scx;
	Wed, 11 Nov 2026 19:04:47 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDci-00000007TgY-1rT3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:04:45 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso2603926a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 11:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423883; x=1795028683; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KDtNFM/ZDCjrMncXpMX0NZxcAvy/V+uo/92tpKVrQoo=;
        b=skxlQQ+boJROLuctn1A+zQzLZcOTZq/YBPZALj2IyctSqPc3zjEJ7GjKHGNrYYoNy1
         tNdXRMSp6kuM6VHgQg7RzKd8ysvLBlfWrDY9wAX1ImgRIojELIhsbdAYyV6d5Y3UllP5
         YoZpIvRLJByydZ8deObkmPhWHuYtNF7eGhrXimnUfexPMFzdOBptCTvGMg8KTgdm1FYZ
         aSTI/fdxWE8T0FH17CSf1Dav4trm7HcigbaUNDGfuLtnMD4PxccW8+S5vVPtpQOCBSRH
         m2JzegF4DGTWd0vJ1UCWLj7Vi0wEEz9Riz72d0oVcFPlb5rbHjK0R0wBWPacpNahj+9q
         057A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423883; x=1795028683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KDtNFM/ZDCjrMncXpMX0NZxcAvy/V+uo/92tpKVrQoo=;
        b=dXzK5DIhDU6EpitxDb2QJn4dONjqJfsgnb6ZgfQ+kqeTF7Z7Dr5/wp4NJH87cEw3Mr
         vM3l7kha1pELbzpSxrXwaiskBO+UpsAtyOwXiwSqyXVP3YWfHx0KRWH833Pi05yvEpTp
         HbVduHYz1NEMwOFH34Ds3k09rzmcx73Elfi5xNrhI8SS4TiYh46CQGg/e+V3L8Wa3juG
         rMKtznNCH1DYh61vSF+tXpIU2WLaukDSVbKJlJ5jEA6e2P16HprgdsLNbikmcWNNMAne
         Ok6WnpI5Xz4QjVzeBm4sf/BS6of4M7eCAg9lSWvz5OoT+4Aej9f93pxrqvLfIPA8rzZ0
         0QVQ==
X-Forwarded-Encrypted: i=1; AL+hErFiFdsQyIR3iFCeJavA3pOqO7mQrVK0mUI3WbcJoUhDvSWt5MPDOQhQH54g0qvliEZk7HUb0OQTXP3EnWAw0K0A@lists.infradead.org
X-Gm-Message-State: APuU4Z//RFlxrOst/sVwboI5c2UZ7h8i68vHIn3gkM/Dh+4XDmcfXxrK
	Gob7zfzhhLib7wMlESvae/Losf3Rbr5ldl/b+j93SN28OARqaYhhm+9+
X-Gm-Gg: AYBFou1VOwZwTlJg7ueUTfNUEaFjkDnfAjHf3Zhjtu1NCGD6hsPs2eHXjPg2sr/JoxP
	u4jwg+AI2Ayj0Q51H9Lj/gfxN2vDmx3Ym5o+XSpq0P/izIWMDOZASAuVgV6SsfGvZYI/7tiQ8YP
	zFOuySMNQ2dHetHxPgNbLnCXiPvxF/atl1UpmohpqcLPfAsbICFCJr7m5SLI0ZJcftGwMQTbRs4
	7cYNJ6vpnZuhRdxktAdyVrtUXmBJnzFVCktJQjIh9M84wH76yePK9emuO1kPBho1XJ1whqFS7g3
	sfccOZGP3QxdX+cCA6wA1vCCOiHtXUfIV8bwUY8Cc0KeT0n7FrVm9u/zd0sTTUNXHQEAfPCYJR9
	S60befGu3hjSpj1dkaMDF8wKKlCc7XieOWNVyFJcwpCRPAYF17wLd5OjWLiHE0cN3K1YyXWAtQm
	OtL0fiwbfpnr+lSdxzIiccMtGd6BYa2KQ6U43ie9saCrtInM3nhPm8uu4CdKMQzifEoc9BrwOF/
	0S5y7j9y5bntYlmmkz/9WzPdR5BQ744hrcMzc78q1MUSNLumqy78tR4esxghAS17S/9JWgL8GSn
	80fJyNVZWdJ3O96by1bBUkrL9Z5tI7KPnBsmWXqQC1cMW4jO7xXI6YA=
X-Received: by 2002:a17:90b:3b48:b0:3b0:9e42:b67c with SMTP id 98e67ed59e1d1-3b182f63031mr3037004a91.61.1794423882994;
        Wed, 11 Nov 2026 11:04:42 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:42 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:04:00 -0300
Subject: [PATCH v2 4/7] ARM: dts: imx6q-apalis: Add Toradex Capacitive
 Touch Display 7" Parallel
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-4-8129b21634c7@toradex.com>
References: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
In-Reply-To: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-bsp@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=3576;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=ZRG6uTVDCNpvd0EHx/INXE11uzseEG+H6P3n5N9dPRk=;
 b=gMm6Huj51U6J6pMlyymBdzIF5kciVOacCr9+30TMDp5J4q5dzRWiQvxRTBPUIsqOtODnGwOtg
 S4o3V/Mx2M4B0pBSn2y4caf+1wAwhzWVtRS/9A9nn3U12oI3nk3WFJH
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_110444_501145_D87B396A 
X-CRM114-Status: GOOD (  14.17  )
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

Add a device tree overlay for the Capacitive Touch Display 7" Parallel
on the Apalis iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
and the touch input is provided by an Atmel MaxTouch capacitive touch
controller.

The touch controller is connected to the Toradex 10-way Capacitive Touch
Interface connector available on Ixora carrier board and Apalis
Evaluation Board.

The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
Board V1.2 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 |  6 ++++
 ...-apalis-tdx-panel-cap-touch-7inch-parallel.dtso | 34 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 3b69669b27129..d7f9b2b5bb493 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -168,6 +168,10 @@ imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -325,6 +329,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.2.dtb \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtbo \
+	imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtbo \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
@@ -336,6 +341,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-10inch-lvds-v1.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtso
new file mode 100644
index 0000000000000..f04516e3c5cfa
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtso
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display and 10-way Capacitive Touch Interface connectors
+ * (as featured on Ixora carrier board and Apalis Evaluation Board).
+ *
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-parallel
+ */
+
+/dts-v1/;
+/plugin/;
+
+&atmel_mxt_ts {
+	status = "okay";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&lcd_display {
+	status = "okay";
+};
+
+&panel_dpi {
+	compatible = "logictechno,lt161010-2nhc";
+	power-supply = <&reg_3v3_sw>;
+
+	status = "okay";
+};

-- 
2.43.0


