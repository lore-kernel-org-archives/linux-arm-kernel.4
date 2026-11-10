Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DA2606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kaPtMAIs;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w8QAMbZa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=38DpxKNBFRv9O6F0NQQ3cpvR3/Umf/+Ahhp81L3VJd8=; b=kaPtMAIsmlf9PY
	X88GJkKOSFnZfI9g49XML5PiHrV++BFD+XAQ88ScED8XfMtY5LRYJ7dLUxi5KYssBzEll1BxAqIJd
	Y8J+e96IDJLkakR4KXUUpNe0OqXBztAJM2q9oFwMTA++fwllXrgsF1K/nAFBJuvQF1Uvam/HTqCrG
	xmjoOkg74HmnPAjaUeSsiLClclEYnkZqKSfEEQxGsDP98B4qn6xuQEqFTUy1cMtQ1rEqQEsF945SR
	L+fcM/Bxy0HsZ6SCyyNjtkPSKdBG5TzR4qmWhcve9cQ9H+WD9DlKEYQ23x/QZN1wErC2X8/oEmCMv
	ojmidB7PtAK0eG+iQEzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjZY-00000003YCt-3tQq;
	Tue, 10 Nov 2026 10:59:28 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjZT-00000003Y89-0v8r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:59:24 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso797676f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 02:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308361; x=1794913161; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=38DpxKNBFRv9O6F0NQQ3cpvR3/Umf/+Ahhp81L3VJd8=;
        b=w8QAMbZaPVP2MFqyD0UF8+nSlbyrdy5vDHujWJJNz2Pk7xwthQz+381dpZHTik654k
         j1RT1HvaXrIeWM6fMEQCS/JUTNvTScDIQ7OJfAtkQSjbf+WZ6YOIWPLrfc2e2Jqi4dpM
         CPsXDxS1+NAgdaOuGzlSJzLSni9wVBr7RTC1tms/7JBNpi4q7lG47lBqRPBp0ML1+4zj
         4xNiKYC84cqKQ2LITY03RicNHnF2hNlsp2I4rIb16R76b83Tqv9CYZ5OPgBxnGZmdV50
         BBij4NJeM80pjz9iI0ZVz5sIZJ7989HfeI7DOGRyqtbiJrJK/ubDP5wf3DHj5jCqwohp
         11vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308361; x=1794913161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38DpxKNBFRv9O6F0NQQ3cpvR3/Umf/+Ahhp81L3VJd8=;
        b=2jp1aPVCINkjlKm3C0ypTSRUOI6R12MFcuzopdF0XLTdEx0xIOPh0ZpFPdOGBTwlkw
         CW1S4Rd0KBI7BWfWxS45RK59IWxm+304TTBiNxueMVrieQabveVRVbwg1MALfkf5L+sg
         IVs5vh+9O0s4ENojQlJZRvrHs4jCu0JRr767q0Awft/dIpGpwoWsCpByJC81QebZZnjn
         +zeclkjHErk1UscN+jLUu+nXWPhuoICnkkVVtGc29l7s4VGcEDj5o2x7gYxIRIzm0rZT
         dBwwlzq3ReF7EDwz8JRnCe62qo24LVTj7Z1QIpi7VpfNobESkM92Y3TgWoC8S0eQzkIK
         0vAg==
X-Forwarded-Encrypted: i=1; AL+hErG0fHmzXeVWk4AYq7qekrOk6cIvRxWaZWILj6szayIui5Q0VkVKXoPhKI1GY3KrpIFD+DbGbNA/j+oqqLeS/LSu@lists.infradead.org
X-Gm-Message-State: APuU4Z8APBQIrX1B8scbBhNfrWpoTN1jCueQQOfXelHh3DaqG881Rb1e
	nygQ6e4vmKB0zZBH4//sjfG3+YR+6s4NylJctgOyLiArAfbxRPd9uvMVZMRrL7gJ
X-Gm-Gg: AYBFou3Gs02qy0mBrsOjfl5Q0Rj63Lhd5gI/a/gtxsRxqXUhjKME3ywf/0uVe/yLcAt
	e/zanEeydaSDhscQQZ/Prarh22TIXgLaxtynbAOAMsc4ZvEhVOBiT1zrKrnennT2cPtzWoq3jOw
	jZs2SPaQtdCrziIALCKsnMI9LorAwoQKZGhmaJW+o4RPpi8V5souNi5K11CogqU5ITIquWZMpOv
	Q8kVK+AxdZCnpFj56RSYs8bLXLKCcZILY9gOII19biY4B+PboW6vkJRsz+j9pPnHlnkrZqdi4Ii
	9Gx/U1EuOt/ljDpdwLJBH335h/ut52dScKXtOENeob5nVJnD4dQZCNx8+nWqDkJfix5CmIo1Qjp
	/Aui2G8bL7m6qGOe44r0Q3/ZeCFmCbW3BpJKrJxxH3Yp1so36kCuzlhLMf15X+sKSSO4kgKPafs
	uAD86+NRezFUNZLXn//O3UB5xRMcX7h7bQOo2IOU008NqPhs1vvQNw51jABp2Ef9d8a3ShB0hnR
	xxiciTD8XbOyGYAFPwx0O5AoG1aYedNoYNkN8TWhcsA7aVgHbQ1GlHmfOuneibpTJ0Hq3nTkn4o
	rqSdDvIoWrjFRbEnIQHtTNVl+SgHnQSEiVeMbF8Bq7ECC1Oqjj2O1NTT2nqufAOu89NU8m+LchF
	/Yhc5KTMxI6zuemMdtyLpQTOYaFCjkLBX+9YAW8eISXKOwSzmW8s=
X-Received: by 2002:a05:600c:c0d6:b0:4ba:6d8:dfaa with SMTP id 5b1f17b1804b1-4ba06d8e3afmr12626575e9.12.1794308361498;
        Tue, 10 Nov 2026 02:59:21 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:20 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Tue, 10 Nov 2026 11:59:17 +0100
Subject: [PATCH v2 5/6] ARM: dts: imx6dl-colibri: Add Toradex Resistive
 Touch Display 7" Parallel
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-colibri-imx6-overlays-v2-5-9776c186d953@toradex.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3298;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=TCfvQZMlT2FEQWtnKqizOTemtEj324CkM8hau8ASkwU=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JO5eZ+T8KJ/kwVPP/owd6nwBm69uJ9cP/uzLjhI3
 vufdPFfeUcpC4MYF4OsmCJLxhNVQT6FEFkPjuZkmDmsTCBDGLg4BWAiHR4M/wxYTFMzp29os1Wa
 vTrj3+FD+++2xXVydaj/M2q9Lxo4mY+RYULf8gXJff2Z16d9TN1+Pdp6ytPbHgzfX22/uXzrBn3
 WlTwA
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_025923_304794_B9556B70 
X-CRM114-Status: GOOD (  15.10  )
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

Add a device tree overlay for the Resistive Touch Display 7" Parallel
on the Colibri iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHR 7" WVGA TFT Transmissive LCD
with a resistive touch, handled by the touch controller on the module.

The overlay is also combined with the Colibri iMX6 V1.2 Evaluation
Board v3 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 |  6 +++++
 ...colibri-tdx-panel-res-touch-7inch-parallel.dtso | 29 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 02d21d62b370..c15b09c058eb 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -92,6 +92,10 @@ imx6dl-colibri-v1.2-eval-v3-tdx-panel-cap-touch-7inch-parallel-touch-adapter-dtb
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtbo
 
+imx6dl-colibri-v1.2-eval-v3-tdx-panel-res-touch-7inch-parallel-dtbs := \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-tdx-panel-res-touch-7inch-parallel.dtbo
+
 imx6dl-colibri-v1.2-iris-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx-hdmi.dtbo
@@ -146,12 +150,14 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-iris-v2-hdmi.dtb \
 	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtbo \
 	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
+	imx6dl-colibri-tdx-panel-res-touch-7inch-parallel.dtbo \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
 	imx6dl-colibri-v1.2-aster-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-eval-v3-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
+	imx6dl-colibri-v1.2-eval-v3-tdx-panel-res-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-res-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-res-touch-7inch-parallel.dtso
new file mode 100644
index 000000000000..331c81332081
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-res-touch-7inch-parallel.dtso
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Resistive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
+ * https://docs.toradex.com/104498-7-inch-parallel-resistive-touch-display-800x480.pdf
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
+	power-supply = <&reg_module_3v3>;
+
+	status = "okay";
+};

-- 
2.55.0


