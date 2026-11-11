Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BBF606A8A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rGSMHkRJ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Itnofz9e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lnltaZLRhP4fBsVvq0mCqASYDVlLQyGo5RH8flPD4Rg=; b=rGSMHkRJoIIXgy
	sjS9GTrdZ8RO6D3UdRxDEVSPj3jZpaMHuAieFmEUoBuZvIL7l358uTcTjS95++PgW151aLQVrvpiZ
	tfk+2WBlI/4r1j3OiwgQDBX3UIeOgdHazRvv3O+SE7+9sj4n+D78E7cuqETcxowISCKZ077PK05YE
	cF0rPCVQGrV0DtEw+fGB4Q7kctoARrMhLSox41FYC4wqrVwKshBsEfTW64f7YamLXScZLn5hz9qIK
	rmjJ5hMxlYMdcmmQVWg2dwI1cZIWYXHFPlh40g3G9cuEVeq0i9p4+2VOtN9DVSeAvBg0N0SvL3rXs
	v/KqpVI3kSaYoW8723hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDcf-00000007TeH-0SeB;
	Wed, 11 Nov 2026 19:04:41 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDcb-00000007TcX-4BvN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:04:39 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1434541a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 11:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423877; x=1795028677; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lnltaZLRhP4fBsVvq0mCqASYDVlLQyGo5RH8flPD4Rg=;
        b=Itnofz9eaLgFMrTbq0MC279lQ0gphQyo1TINPJBWEZCYWCsJb6YK1FXIsQoQ/8nv1F
         EHj8jObRD6UYT+qY3brhj18jdAAWrwhfrIssP5lgA58EOlr/Ynt3kYvtIIls8moxb+84
         ZjAc1UKIo/XRTRdw1rvPnCEGSzt3CR2Yf64s69Ooa2dYIy8kTMFDvTUI7JjFUWsjnZzm
         GFsQycVMvl25Ok0V2qlh7izWE/0kDMs5uW8FaKoxCZXRTIOVqHsGm/70rb5fNuizt4vu
         XyDtKt6iBSYzYimjCaEv69H7LaHJBxf2l0sqYJp1tX/lE505PnX6e2Yl7GjzZG6XDrPO
         KnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423877; x=1795028677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lnltaZLRhP4fBsVvq0mCqASYDVlLQyGo5RH8flPD4Rg=;
        b=XWSXnQiS7DpM/LM/gPOEpIiS7grQVyIrNKn/Zoxshd91c9Ggr9Gvoqm+loom9sxxFO
         75GENSTy38TDj0PUGc3CoVTDOlxFsar3Rsqf+8/SkXTAJuOYPCLaDuiyL2eQ/x5pOzuo
         LyUWcrcHzvilkpXVnp511MUPDBGSPGg3pJA8WD16zX72B10LrM1yGPkDi04R91CDzAbE
         F1KI3fVwHxjTrDH1J8NPsrD7pjjYZrwMZYVwgslxr8xNr/JDiTsDEkbVjOtSo9mitCb4
         K+5AUV+wEfGHyymWdMbqU915Nr8O7S5X4v514o+6Z3/B+VZLeJc/Nzol3wiRwlKBysbg
         mzbg==
X-Forwarded-Encrypted: i=1; AL+hErF5QwBjLR+HV/HBmF61vCBGcghaNRNnO5b4+xykwWn/rVQQ25YHEuycj2PxQzpPdbC2SuOw4oQC7zE/aNG/QWmt@lists.infradead.org
X-Gm-Message-State: APuU4Z9pPQO6RBY4hPI3LCXJ/Fe/W4yTSix2n9a7ET9byW/LBa8XAGH8
	UhRiWOS0Qvve2gvk5az55eib3qY7v4Eyg0wvt1iIyYeLtga4yKmReCuN
X-Gm-Gg: AYBFou2OnZe3wfmRSNV01sxHXKs6omNG3vNqbHg9pI6E70svCbyREjdt6A8XvakoUij
	7Bzwe47tV6WSM2qB/WfCOl1GjwhZp0JNAbrpEbQ3NhsK92O1ceUPGeXesKf15dvL/EUTT/wcu4o
	naFzkCg1eoYwmZt1YEqtdf2n+PUWuS5N/kkNU0Sulepc1Igh5YprujqXL4PFZm37JBbSAaaOS2a
	d9LGcajr4fKKwn/AnoarAayGdu/7waU8X1SHeSZ3UNtfkdwaSVFz3Bzgyjk5peB51p6SHxsg5HA
	vFa8+DJIKcxNq+5ug/kFiAiGLBwn5/Q9ada6F3QFFhbOsXHfd3KXFmixeQAmGqsvYFlbT8ysfkB
	NJaTtJFCAwGV2s8W1wgkw0ssRC5tiXZ/ItUTap/Ec3JeGDlO3yvhJY9n1C7kvScTTR3Xdm97O5R
	zGqq0hw2/L6yY9IzH8srhj9iBDn37PnV5c2hGrl1KuMtRV9NpyGVrWDKup9lpXEAusj0rWgCTqI
	2qlGBER14Q9+mnhh97iWIBaMkJ8hksJDHIK8pyDVQVX8L9AgzNULfjLDBUk5XKamMhuHvtJm77/
	Y2Q4NHz6pAkwk4bSGh2EQgNuWAmq1n3pDQ==
X-Received: by 2002:a17:90b:1f90:b0:3a7:e11c:4e6e with SMTP id 98e67ed59e1d1-3b182f5a142mr3250774a91.59.1794423876623;
        Wed, 11 Nov 2026 11:04:36 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:36 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:03:59 -0300
Subject: [PATCH v2 3/7] ARM: dts: imx6q-apalis: Add Toradex Capacitive
 Touch Display 10.1" LVDS
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-3-8129b21634c7@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=4455;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=oe0gNHFEkUnU4DGWTju+MJg1QgwQQbBq6PPLVxbI5NU=;
 b=lhQ2QCeAMTxHxA6IWvu2h/Y6r9QtaPWxJFG8efc2jLx/HSL0wnuHil7uHqrWS5Po1Lq2DorDn
 CGVUtSIkP2MBnzpcQOF+hJQg3ZiifuRvsFb33h7G4Vrw2sWkihPB98K
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_110438_070637_15581157 
X-CRM114-Status: GOOD (  15.99  )
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

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
LVDS connected via the Apalis iMX6 LDB.

The panel is a LogicTechno LT170410-2WHC 10.1" WXGA IPS LCD and the
touch input is provided by an Atmel MaxTouch capacitive touch
controller.

Remove the panel-lvds node from the Apalis iMX6 dtsi, as it is an
external component that does not exist at the SoM level.

The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
Board V1.2 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 |  6 +++
 ...-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtso | 53 ++++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi      | 13 ------
 3 files changed, 59 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index cc0f5f100892f..3b69669b27129 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -164,6 +164,10 @@ imx6q-apalis-v1.2-ixora-v1.2-hdmi-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx-hdmi.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -320,6 +324,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
+	imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtbo \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
@@ -330,6 +335,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-10inch-lvds-v1.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtso
new file mode 100644
index 0000000000000..a84114e1d3fba
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtso
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" connected via Apalis iMX6 LDB
+ * on carrier boards with a Toradex standard LVDS display connector.
+ *
+ * https://docs.toradex.com/105952-10-1-inch-lvds-capacitive-touch-display-1280x800-datasheet.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	panel-lvds {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight>;
+		power-supply = <&reg_3v3_sw>;
+
+		port {
+			lvds_panel_in: endpoint {
+				remote-endpoint = <&lvds0_out>;
+			};
+		};
+	};
+};
+
+&atmel_mxt_ts {
+	status = "okay";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&ldb {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	lvds-channel@0 {
+		reg = <0>;
+
+		status = "okay";
+	};
+};
+
+&lvds0_out {
+	remote-endpoint = <&lvds_panel_in>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index af038ac472261..8f5a9ab1f20fa 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -95,18 +95,6 @@ lcd_panel_in: endpoint {
 		};
 	};
 
-	panel_lvds: panel-lvds {
-		compatible = "panel-lvds";
-		backlight = <&backlight>;
-		status = "disabled";
-
-		port {
-			lvds_panel_in: endpoint {
-				remote-endpoint = <&lvds0_out>;
-			};
-		};
-	};
-
 	poweroff {
 		compatible = "regulator-poweroff";
 		cpu-supply = <&vgen2_reg>;
@@ -735,7 +723,6 @@ port@4 {
 			reg = <4>;
 
 			lvds0_out: endpoint {
-				remote-endpoint = <&lvds_panel_in>;
 			};
 		};
 	};

-- 
2.43.0


