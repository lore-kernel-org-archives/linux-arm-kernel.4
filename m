Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BDA606A899
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zTJO1eO8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nLiB9Vzp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PrbRgt2I4AZhKGeB3X2rrcoDbn6hGDT1j9aliR6cklU=; b=zTJO1eO8nt5BK7
	YEX4v5SSFoz6Ziuwg5NsCJcpBGvEnwcwGS17VHvBsoW6aioEe9Lyirtvt3V1rOi0bh/I4qT9zxQQb
	oCON+WFWS+VV6HXRLICjOEafkRXnYR9aU3FhiM4552nZKDcCi8ZohjAn6424gW24SiDMuWO6n/knm
	pz9Iw7GQtwebF/wVuE56ksnWtjL+q3QCcuTvZIp30fzd/6dZ7ZgzPz7ebbRz0tJ7Tv12ZV79+DmjS
	sHcHDhGS4HoiJSw6BaRfJyGwCE4cFQoIkYgXtccCvDmdWiG+4BpwdKgYtCSSLN9tHKRe8neOKL8hT
	ChnDYyokzFJAgCFhKsPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDcq-00000007TnL-2L5i;
	Wed, 11 Nov 2026 19:04:52 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDcm-00000007TkS-30rl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:04:50 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso2605332a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 11:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423888; x=1795028688; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrbRgt2I4AZhKGeB3X2rrcoDbn6hGDT1j9aliR6cklU=;
        b=nLiB9VzpFer1jAsraCeFdUeFOEqgxsQUd32r4vSxrvJikqwNartItVCyI1FySetMJ1
         p6RF+Jimoau0EiC37EuGVuCD4EWu7H/Z9kfjPp1BmfVJkV0Ui2bLr8U5eTYpYltE7nSV
         J/hO7o0k2WYHeovrpNIpJ1l4lBB955c16L7mROWuJ35+oFz/J43ACGIBxKN3xEutm6Zm
         /pUyzumG7hzH6lpR+E7lvO80Y4tB8wWeHxjc4b0QY7TRn3GB7k8YA3VXWhFmZ4SjhkuJ
         b9a7lXgVQXPbJ1zqK2TboUfRfz0J2tjgrAylvIcCyVyIGroMgQCtUj8M526FhUN6mQCQ
         Sx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423888; x=1795028688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PrbRgt2I4AZhKGeB3X2rrcoDbn6hGDT1j9aliR6cklU=;
        b=K+0InVmJ/La7/o2JVc2KSaXaEQAdXS1zre5gxUkZ3jjwVcvPCjxtlYnZQy12tFsCtv
         pHMpJ+7jMIf9k6im3/CaC57usvXKLYQaZP2hULG++hBLmIdYE1nIxXbuT2kFJlzQzGPw
         DaWolpniKSyAiJs3hfHEsuPjM79eS0EFdcEkmgVyPGq6Y92samPbe2ugzpOqxf+pLYAT
         gsVAV3oW9c6NcO8pN8fy1HMrHsQcoKKmWP5/gfbX1T9+svwxsiX7VoKLi6A0kDM5TOzo
         d/2miaoFAX/5mMPiYs99suoZJHIsrccXdPNAEn7TwKRIf9+9XlHO34h2/V7655JXMSn8
         1ejw==
X-Forwarded-Encrypted: i=1; AL+hErFdVd7Yt+u5RTiSc3vVRbeZz/3vPotIm6uayZN6l3rJNYiFKFJBQmsmDxyQRcIXagST37g/Jko73nkM2gyqijRt@lists.infradead.org
X-Gm-Message-State: APuU4Z908dhwZAheMkkFmWhcQBGTBgWOnQtcF2P+Vavwbvz5DqApiiky
	3rJ6FJzksF2mixfFQXtsf8Gi80qfUqWUhJVsUavYzh2EW2QZmkk6aw3YO2dNmvM/
X-Gm-Gg: AYBFou1O69cG4k0uW49CCDA4T2oPxYEXviCavHyVMjQGH6xR885XgoI5J1XphWu8GU4
	XLfO5UPlaMCpZg6QsFFqNHBpAXgi1PsJC37/LDaWpW0fNbXdfsgAc8AJLWTckQ7wrP4ZCDAKYTT
	jOJFOWoBho6moz1cgSuBGY1/CjBCMs2VT9BnBwgwjqTpfu4kYMfo1Fr2b9E8BQdjRhoKrSic5op
	hoRjcHJ+0AxHkn2OvsX35STWkn3l6nuZv69f1hKaIzFazES80QjusDSrZ4WUCTB+KBn/KW4XABs
	8wb3XAFxn7peXI2RnPyjWSbmdOeSBP2ANiKUPo5qQ8N2fj/Nif2cvQltNQwn3/Y4AoBUwoefIY3
	/YqsUCJkzZFMS01MG1iR344rTGJ71jdcKoHc7mgPczYEZWq5Baw5ffpLOIoJGLklfJjabyS+bqf
	LiTQsDpBpw8UWKmOecIHQXsGAg4ymi59OcsoGOUcpV/bU0y40PpwKiY3PT4JvQGwzWe4tspg1py
	cXJNhRpQsQEIhH8w17ajX1h4Idc5I6Ya4KMhsyWQoVsIMTRVPRmciqVon8p/qtp+I6nQpT0jlJV
	wrQr+rCwiP8kgXzm0zZAZ4miNAA5df86uA==
X-Received: by 2002:a17:90a:e7d1:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3b182e9415emr3094237a91.17.1794423887377;
        Wed, 11 Nov 2026 11:04:47 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:47 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:04:01 -0300
Subject: [PATCH v2 5/7] ARM: dts: imx6q-apalis: Add Toradex Resistive Touch
 Display 7" Parallel
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-5-8129b21634c7@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=3352;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=eN7DvQ1E51+JeMrXQEgkpfFssIEPFBdeHdO7BmoHJX8=;
 b=5NJeH5jEmlLAdlRZBAIQgCXVcpiyPOftIb6QuJlQMcDPSElxKYbFx8QwR5gx8VE0bQtiAujaK
 kWmjaDj5Pw0DtP8TD82axOS+f5Z3LVZwK804fkVYt9rjkG9d7uAUk++
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_110448_786525_454391D0 
X-CRM114-Status: GOOD (  13.91  )
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

Add a device tree overlay for the Resistive Touch Display 7" Parallel
on the Apalis iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHR 7" WVGA TFT Transmissive LCD
with a resistive touch.

The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
Board V1.2 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 |  6 +++++
 ...-apalis-tdx-panel-res-touch-7inch-parallel.dtso | 30 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index d7f9b2b5bb493..fc9a68cbdd313 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -172,6 +172,10 @@ imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-7inch-parallel-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-res-touch-7inch-parallel-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-tdx-panel-res-touch-7inch-parallel.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -330,6 +334,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtbo \
 	imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtbo \
+	imx6q-apalis-tdx-panel-res-touch-7inch-parallel.dtbo \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
@@ -342,6 +347,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-10inch-lvds-v1.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-7inch-parallel.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-res-touch-7inch-parallel.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-res-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-res-touch-7inch-parallel.dtso
new file mode 100644
index 0000000000000..be2164dcd0369
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-res-touch-7inch-parallel.dtso
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Resistive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display connector (as featured on Ixora carrier board and
+ * Apalis Evaluation Board). Touchscreen is available only on Apalis iMX6 v1.2.
+ *
+ * https://docs.toradex.com/104498-7-inch-parallel-resistive-touch-display-800x480.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
+ * https://www.toradex.com/accessories/resistive-touch-display
+ */
+
+/dts-v1/;
+/plugin/;
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
+	compatible = "logictechno,lt161010-2nhr";
+	power-supply = <&reg_3v3_sw>;
+
+	status = "okay";
+};

-- 
2.43.0


