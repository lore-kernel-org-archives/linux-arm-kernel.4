Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF39F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UgrMI60g;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBTD7Cxh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DcCGiCjdU5FhG+TlgbR/2iRKge2AOKDzUhGWjXjUD5k=; b=UgrMI60gWogK0+
	7/fIZXgKtJeaKWrtF2LZWuYvC1PZeRfraYnevAWmqbHaagaSaK8TRIH3GHBjBS2/64UK1ZVXu0VoX
	NRFHjNMrhFnT1+3TvtydG1nZxqpFEiyRfCQ8CJ/svosyIGgB19DuWo2Icf3+A0GO2BKOdUDBTAoq7
	Nb1DWNbWT8ztBgnRYau6X/QHhE9rUyGdkOOVFtVBb8LjNiHNRSvaLxFRoQM6VIOwYZw8HZVd8CI3C
	+qY0BDxvTxIlJ69qUPA1Bujm54/JYuv+F0v5JZ80VwQapnrVv5qez7SUty71GTTVa0qVvXM4I/9D6
	3t3T5mvSJJaQU40wFK1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjZY-00000003YBu-2kF6;
	Tue, 10 Nov 2026 10:59:28 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjZR-00000003Y7M-3hvv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:59:23 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4918c2d727fso974201f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 02:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308360; x=1794913160; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCGiCjdU5FhG+TlgbR/2iRKge2AOKDzUhGWjXjUD5k=;
        b=hBTD7Cxhji1b1LgU+Nu847OLHFWtUrhogqdt81QPMEFtyUniyDxj8FqIHB3d8JVlnk
         dOeuoxiAxNVwsqCPtg13mLRnPH/tgGd3wCy3TqGKhYU3dJ+HGTMlPs7+aqEp09R7/nk4
         WzrzCYGFkHoYpWs8BIAjM/gpIiZIc6Pz6BhFB3O7Y5mvQHcEnAcc83ysYQRpr5mgGMp3
         WTJBoJsEk6vw8e643KEZsmfUO5iasOb4ZElhPkQW6sQGACVVvAx7kHVoHSh8Lxw0E9hM
         zdsp9QxCIvPbYf4es1o3OWnHSQIBKxVxAmHziFGTgjwfL041e4pDL0l2XW+U8/YkGCqi
         GNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308360; x=1794913160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DcCGiCjdU5FhG+TlgbR/2iRKge2AOKDzUhGWjXjUD5k=;
        b=K/lXFawFfvLKGt9kTLukVRLgtKKeRxzuuAEcfypVEJSyPWh/idWWCt4NjG+uUnTYgv
         YDqxZI+z97e/YWfHanE3/XcSc7/ngZFI0mVA5j1YOuUtbh63RSDd0p89WpXky9CKATWz
         L0wHU1Fkz+8Qk+fF/yqEbPzwT+I1S8IyI3IsZYrJLmOVGlX/UUkzv13rqMD+BbIx3WAU
         LXsIxgc3Tu6QjNLFJ4apcYMfQJF8GmDCVlcOmt8k1h6cr6rHBX0F8mNm6hCN/KL/SGiB
         6+zSp2civX9RSSBx2AogBTC8Iga6tZR+JOohNdpAfYMnqk3Vi3ZW1fQ3huV+fmZRyx6Y
         7y4g==
X-Forwarded-Encrypted: i=1; AL+hErFHIy501eRi2BnYqERSYzxQAdiONrjy/q2VVsV1Y1U/ZJ18ERkNGcU+AvRn06MDOFD3jQNLXpzi/PNKN3xo7m23@lists.infradead.org
X-Gm-Message-State: APuU4Z9qRp92naBEJbrZi+QRqzN6dAxtBX5aCa2bQ+kXUWy5Zn9CI9BN
	QpoBimlUWQR91jwdzZIcHytgqDMJr4EANcOjJ5OS+obdfhaLBnX3Dhio
X-Gm-Gg: AYBFou27ZdTKz2zHuo8TS68CltjusLsucj2y55IQ3bS8tbXMJFkEy3p3adqVPDfRCys
	eJFb8ejq7et7HMoKCvHIucNpDSZmzXoFxMao2RHNyCIRESwx3aGIggitivZrcXVa3lLEtZ7yb+D
	on1PiIfs7BuVyeO644V85kfh54POC6KLTsM/QRkE7g4TEYhPzIGzIZ42dQzAAqkr2I1X7pKNv9l
	Q93kmpoJFM9QDBPWnnZI6E3vm60j3OSKpJDHnOSNOtL8zk8NKEY2FsQJzfLEJ98Oa0q2oUt2/0Y
	wo02c2+ffDonBe2ceSyBMuk07d6x13bPFH+RYQQICIZ/BWFb10dDzXO1HMpxa7gFxEvd01JoSZP
	mfYUpKoXQ8W6a/bqgyxktiX1HkeZp4xsq69ci4DvjUlavS7F52BX8dnoij3ZjTJB1Y3EIaMA37q
	REPyFccJgHDmSmgwvHKCsTQIDnf8LDY4bBWpeaSRlqYZeBMqFA0iu0KuNYrtE0u25RxgMqJnwYM
	C/6gOQZio1XD6wLfuWOpDfe919KMihGQyMw7pTesL6sDV5J8PSwQ0Eh4cEZKG8/OfJmbKh/ootQ
	sNXCZiSSdd1z43UXS82tcRh2hm72hlGJsxnvEUcPl/5scH9HuVcEgvUj58OCZFGZz88HFZoy/mQ
	fgLJdTe5PohWpYjhd8dcMJIWouB5AkAhKD2SclJXvfcx9AHeCnQo=
X-Received: by 2002:a05:6000:460a:b0:48e:4300:c6d8 with SMTP id ffacd0b85a97d-498302fbab6mr3856100f8f.35.1794308359531;
        Tue, 10 Nov 2026 02:59:19 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:19 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Tue, 10 Nov 2026 11:59:15 +0100
Subject: [PATCH v2 3/6] ARM: dts: imx6dl-colibri: Add Toradex Capacitive
 Touch Display 7" Parallel
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-colibri-imx6-overlays-v2-3-9776c186d953@toradex.com>
References: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
In-Reply-To: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4169;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=9wYjQMWgGZ2miySG/qhMsDxpWS6y2NDDR/Qv0+L/cjs=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JPZ7v7UNSkCzt9e1x90ORjV9ayX2TmIIUc6YEG72
 W6z17qWHaUsDGJcDLJiiiwZT1QF+RRCZD04mpNh5rAygQxh4OIUgIn0zWX4H9Bddcuo3tVz27J1
 Mo2OB/Oak602q93+8sXxdsvO9OT1Pxn+F78VfSQR+dDLLLNr6WPD/S5VLrdk789W27ppytwHFlJ
 r+QA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_025921_963365_D4029A56 
X-CRM114-Status: GOOD (  15.07  )
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

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a device tree overlay for the Capacitive Touch Display 7" Parallel
on the Colibri iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
and the touch input is provided by an Atmel MaxTouch capacitive touch
controller.

The touch controller is connected to the Toradex 10-way Capacitive Touch
Interface connector available on Iris v2 and Aster carrier boards.

The touch interrupt and reset signals on SODIMM 107 and SODIMM 106 share
their pads with the WEIM nEXT_CS1 and nEXT_CS2 chip selects, disable
WEIM to avoid the pin conflict.

The overlay is also combined with the Colibri iMX6 V1.2 Iris v2 and
Aster carrier board device trees to provide ready-to-use DTBs.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 | 11 +++++++
 ...colibri-tdx-panel-cap-touch-7inch-parallel.dtso | 38 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index c72920658609..7f527e2b9090 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -80,6 +80,10 @@ imx6dl-colibri-v1.2-aster-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx-hdmi.dtbo
 
+imx6dl-colibri-v1.2-aster-tdx-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6dl-colibri-v1.2-aster.dtb \
+	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtbo
+
 imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx-hdmi.dtbo
@@ -92,6 +96,10 @@ imx6dl-colibri-v1.2-iris-v2-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx-hdmi.dtbo
 
+imx6dl-colibri-v1.2-iris-v2-tdx-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -132,14 +140,17 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-iris-hdmi.dtb \
 	imx6dl-colibri-iris-v2.dtb \
 	imx6dl-colibri-iris-v2-hdmi.dtb \
+	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtbo \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
+	imx6dl-colibri-v1.2-aster-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-v1.2-iris-v2-hdmi.dtb \
+	imx6dl-colibri-v1.2-iris-v2-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-cubox-i.dtb \
 	imx6dl-cubox-i-emmc-som-v15.dtb \
 	imx6dl-cubox-i-som-v15.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtso
new file mode 100644
index 000000000000..13b4888e07db
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtso
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display and 10-way Capacitive Touch Interface connectors
+ * (as featured on Iris v2 and Aster v1.1 carrier boards).
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
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
+	power-supply = <&reg_module_3v3>;
+
+	status = "okay";
+};
+
+&weim {
+	status = "disabled";
+};

-- 
2.55.0


