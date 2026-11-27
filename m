Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B3E606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PdCHgJhY;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K/OMN+fo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SjYmDtfI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HLfKmdXkOrxHqp3BSoOqfQOqkIGmy3ntNb8sAp8+qZw=; b=PdCHgJhYLjqrlY
	lKrtzNtvfhMGRNzA13g1Txzeym23LplK7F1eL0tAW5WD50GngrSk7l5szLOR2J7NELlxURb8n2GO1
	siOnFk+2EtkXbYf4k/oURzDifwqzFTgR+gXS0XDyOnM9NX5KVNGucOhNUqeEnX7irYURPsDZG1i43
	qK5RwJ7c2lbHuHLvZvmU7PhigZ8nqZTW//ERk6iZdeNKmoYFfyqzogKD97bPHEdVuCUbu3GxHxyrO
	AcdvbIIMLhy3yxVlWhSkA91W4xaTglet7xmaVShHmn1d21JHt5PuDO/0Z9CCXVGVbsenho1xq8vds
	rpkU+8n5FJsrFwgO3ILg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrfi-0000000FJpA-15rc;
	Fri, 27 Nov 2026 08:51:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWret-0000000FJSq-3TKu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 08:50:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GgcZ1475308
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 08:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HLfKmdXkOrxHqp3BSoOqfQOqkIGmy3ntNb8sAp8+qZw=; b=K/OMN+fo24vlwuHO
	uUTqUuHY2KVonk/t8UU1k4Hpmq4rdPvR5sWR67FN0MlXudC9WpVaWefB3482dGu3
	gozvJU9+YFI+8q2gKZeXyVQO0rPvv1YOpeEabXvd3ER3TAe551MhTwowH0Tqxo1L
	fUkrClWwQUnrGP0KnLe3VhWgq59E3yoDRIl1sKltBxXR5n2E7znaNj/5a9zIxNWR
	FGFPiUOuo6G2090C583cfi71JLpjQsMR71vzACzwSJeS8LVYTebgNRghK2ke2yn1
	biv589emSy8W2M4+IfrlBkYYQlzJaYkGgGIB25fjmBovsqlRQocFK8qBrQBDpC/i
	UcKduQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4ht5dy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 08:50:19 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdb53f8aab8so257790a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 00:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769419; x=1796374219; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLfKmdXkOrxHqp3BSoOqfQOqkIGmy3ntNb8sAp8+qZw=;
        b=SjYmDtfIutWtAJ9Yy329eqAAMPve8U+AcDJCMMA8UqNZ2clqltEK29qZQbCrDU4eTg
         tsnkmKDBTwKsaejMOicb9tr/jBo5A6MUNRpXIssrA+3R6TXbytoIdeU+nDLp35JP/INd
         mYRdBvo2GdQ/ljAk7E75WNP/BbzVS92EZV4TLGKcVPf9GQ/2ASvQlM1Ns0VT2/CwQmYd
         YeMJ77I7m8CMjdtlpePvw8FesJRyAQNr1EIYESg+tDQUIyhpIQRWjr4U1zNHjQ0goxIz
         rApyau37BKFMiJqNrL4223EaiELXrLXmoCm8iBwYzGryrT6FRiM1+0za9Ts/pHSaEzOd
         vGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769419; x=1796374219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLfKmdXkOrxHqp3BSoOqfQOqkIGmy3ntNb8sAp8+qZw=;
        b=PTi6FeD8iUgqL+BotcQ2BRs+46U7eIXIWGCX1eGOJM1/tECaUmFxfuuWP0DOcNLGVM
         h/72qMWyI1USYvG0lfUl5uImd6+Ak3D8ddsZrahSrFcjZWJkPIlHH/YNxgVwOu+AZVRc
         0xeI24UfGRTLGU2NiO16tl8VABBmOghIl+4aLWCns4KseK08csxhzO/FOyUIeQmkLQgj
         gg546FJv5X13mluFx8WtnG0qwDedWpYmBHGsiQUdj1WvwlT1ss/21Rvj2Whppr48wOuC
         ov0IPNDzQT1CScdL9opyC2dCLFXjKg28gfveanVZ1sjQnH4SSsmLmWtfyY2ZPIkovwUC
         635A==
X-Forwarded-Encrypted: i=1; AL+hErF08aaCOg5tO/hcO5xdRjfVRu/8ND9OAHK25o2AMNpyMl7akbhcBEi+wssNMQbpQvkrmHRHKzjCcEgMDuHiurrp@lists.infradead.org
X-Gm-Message-State: APuU4Z/9TmR9qdnVrCTtgtkjWDEbINBKG7IjfjwY30BB9u1D+461EXki
	Sfhz2/wx2HB4IppWziQpdUcBnFz76zVPKRYNLqNAX2CpE0WRTMOcZsFHKmliIYRdREzyllT1ZZs
	a5kWz7Ji6TjO/B6pu0KGJ+aAOr68EwNd9R4kP0UgvIZJ/CJ1iFQEABcnS4KuwdaLtPOXhSOfnBI
	oOOw==
X-Gm-Gg: AZFdTZeSkhB4HMf1wLluKksI/bIAuckIGA30IVTkVnswpRe/vigfl6KPsGXYwCEDpLI
	n8DiAvvtRpgvEgIGMWB06JtbVZLm6ADGg+w607s3tbaXnW63gMTOkL1frymeHl48jV9t3rCQtwX
	I5V7ZUrfoRlysmpbHijyKPFASyDszWYgsCAgZmXLOPw2QwIIzyCL0jTrxkkK7ib/hhUs/kS6GKP
	+q+09EP2pCU5brfEN6E2m0SvHNVe0m/YTNfkjPXL3/zEGZv3J+R3NJISuJShUTzVIJwSwbHNilo
	1p2lpVCC8qk/JfWOIU9VahOu3bIEeS8iLmomRc0Jdv9Oxj9xXL7ZQfLQeQR+iKluPzQQQB4NarQ
	29wrPJkgM5Qfh+thtgg5G9Jec7IeW8//rg7NXroNbzGKfSL7p80nPFRCD+Gg3x0Y6bZGEQoZTBZ
	JGcNh35JAWalq35jLG6ukQz430q1oPzbyXKmr/azZfKpzHLyVPURoM6fbqZY+YnYHe7oNOKD4+U
	Qj5g1Hu6wUQzPUafxiCzIcTbs3FsQ==
X-Received: by 2002:a17:903:4586:b0:2f0:3cbf:743d with SMTP id d9443c01a7336-2f03f16db29mr372607205ad.4.1795769418680;
        Fri, 27 Nov 2026 00:50:18 -0800 (PST)
X-Received: by 2002:a17:903:4586:b0:2f0:3cbf:743d with SMTP id d9443c01a7336-2f03f16db29mr372606715ad.4.1795769418150;
        Fri, 27 Nov 2026 00:50:18 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:50:17 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:29 +0530
Subject: [PATCH 7/7] arm64: dts: qcom: eliza-evk: Add Waveshare 8-inch DSI0
 overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-eliza_disp_all-v1-7-a18be7f65fd4@oss.qualcomm.com>
References: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
In-Reply-To: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=4338;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=SwOJkD5k51eMYdmiVGocyS7PkkS4YfIBvna4bjROP+0=;
 b=6aUHcSgSuJ2hsUNECxOSGw9D8wbA1xO5InaER3fUVpnz2ElDvR4FtbWwfJoz1A0wEkWGaAzOS
 hw6jGgbFBEZD47RBYAd4aEdKwqb7hTNXY1QeHY0BmWkh+d5e4f12svL
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX7uCAhbvwT+NY
 zJ2ZvOAO1Ijo+2ZhyDkNFiQmiThuyoSUUs1xtbmVBHhu5xY+s2SsN5gD/aubHQpP2sle31+e6bM
 TJn86IhaMUd4+WD+cIoi51glUZjV5gY=
X-Proofpoint-GUID: JBrRXnPFd0ySKO8v_DvpvPv6i8kkJI3h
X-Proofpoint-ORIG-GUID: JBrRXnPFd0ySKO8v_DvpvPv6i8kkJI3h
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b09444b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TgV4GMnbXGDTyzeC6gUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX+RkgHIAwJUkq
 0UXo468ndIwZb7pv3hPC2pTlxM9gaNuINqiShzGn8U101YAkEMXoPvCpPJCU9RiO2sMlokTq7Rf
 p2p8x5YQ9KgE1KCBiAitjrpiiPivXD8NSZKp9DY/1isz7dI+i8Wj61FkteNS1ME17BocgYRmND4
 c2oOek1VQqAHrzFT0BR9qY8WPVrnLXtttSvw6h7RkgQQcZuh5FoH490jLIaBkaJtNF9dwqCTAJ8
 e3W0S+Bs6x3/3zUpU5vUmXG7uefkc6ZAk2HCLwOS9fCYp/3n6nTHcvaVHi/YEtvlG63OJM5WajR
 nM8I7KNZ8IWLobce1HJYY7smL4K1k4/jWqph0AUJL090fQ5vRIqfmf0Patr/ZNTOdDjfOEZjuCV
 dVGZI7uI4xqP6Zq/Vgja5UdfPUiRqSJfcir/8ED7MNUvx44NmYyIOGQ7hMe6mCkzTbFWO3hZ7D/
 01RbvD+YiVWgl7gw5Ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_005019_947413_5D190BA7 
X-CRM114-Status: GOOD (  16.70  )
X-Spam-Score: -2.8 (--)
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

Add a DT overlay for Qualcomm Eliza EVK to enable the Waveshare 8-inch
DSI touch panel on the DSI0 22-pin connector.

The overlay disables the default HDMI bridge path, routes DSI0 to the
panel and describes the Waveshare GPIO/backlight controller and Goodix
touch controller on I2C8.

The Waveshare DSI0 22-pin connector path expects SW3.5 to be on.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +
 .../dts/qcom/eliza-evk-waveshare-dsi0-8inch.dtso   | 87 ++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 9183f7c608c2..1d84dc4d81da 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -17,13 +17,16 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 eliza-cqs-evk-emmc-dlc0697-dsi0-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-dlc0697-dsi0.dtbo
 eliza-cqs-evk-emmc-lvds-auo,g133han01-dsi0-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-lvds-auo,g133han01-dsi0.dtbo
 eliza-cqs-evk-emmc-raspberrypi-dsi0-7inch-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-raspberrypi-dsi0-7inch.dtbo
+eliza-cqs-evk-emmc-waveshare-dsi0-8inch-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-waveshare-dsi0-8inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-dlc0697-dsi0.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-lvds-auo,g133han01-dsi0.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-raspberrypi-dsi0-7inch.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-waveshare-dsi0-8inch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-dlc0697-dsi0.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-lvds-auo,g133han01-dsi0.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-raspberrypi-dsi0-7inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-waveshare-dsi0-8inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-ufs.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-nothing-froggerpro.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk-waveshare-dsi0-8inch.dtso b/arch/arm64/boot/dts/qcom/eliza-evk-waveshare-dsi0-8inch.dtso
new file mode 100644
index 000000000000..1a61d28187fe
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-evk-waveshare-dsi0-8inch.dtso
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	reg_panel_avdd_dsi0: regulator-panel-avdd-dsi0 {
+		compatible = "regulator-fixed";
+		gpio = <&wsgpio_dsi0 0 GPIO_ACTIVE_HIGH>;
+		regulator-name = "panel-avdd-dsi0";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+	};
+
+	reg_panel_iovcc_dsi0: regulator-panel-iovcc-dsi0 {
+		compatible = "regulator-fixed";
+		gpio = <&wsgpio_dsi0 4 GPIO_ACTIVE_HIGH>;
+		regulator-name = "panel-iovcc-dsi0";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+	};
+
+	reg_panel_vcc_dsi0: regulator-panel-vcc-dsi0 {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-vcc-dsi0";
+		gpios = <&wsgpio_dsi0 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&hdmi_0_connector {
+	status = "disabled";
+};
+
+&i2c8 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wsgpio_dsi0: gpio@45 {
+		compatible = "waveshare,dsi-touch-gpio";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	touchscreen0@5d {
+		compatible = "goodix,gt9271";
+		reg = <0x5d>;
+		reset-gpios = <&wsgpio_dsi0 9 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
+		reg = <0>;
+		backlight = <&wsgpio_dsi0>;
+		reset-gpios = <&wsgpio_dsi0 1 GPIO_ACTIVE_LOW>;
+		vccio-supply = <&reg_panel_iovcc_dsi0>;
+		vdd-supply = <&reg_panel_avdd_dsi0>;
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+};

-- 
2.34.1


