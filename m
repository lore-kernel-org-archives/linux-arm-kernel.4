Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BDB606A68C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Skr7DOE8;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dIGatuEn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tlf2Ji41
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GkrVX5hmqwOj1uqSDHPg3dZrCtzSVe8oFTjGOLlhb9A=; b=Skr7DOE8Tx3xZ2
	lXhaWDKd4BMsx8k64fX+KmaYIrI48l8LbEMHKqB7cICEqpYnrZy3/fzLoie2ZBd17nuHClWprum/N
	MFC+RhCKUM3QZxR9Q/KdOqLN63kQtA+zJj11mWqrgE50uPax9HfXRcuA3hQlui68QIRSKqdldvVsR
	8WIvg3atZ6/Whfz5A8sMDqJwPpjFZ/SzjKaNRUcOnVK4INZkRgeJL/ZRrSVIsNSCOrzCzBK4ydTj7
	0CELx6VqZScya+10ufCOPt2e/yhZFpxloO2ZA4zX0W4YMiBJ3COgIbFLwhHv2oBh/ADcG3CRpKoBh
	z3SorTya5uT8mtRLgfXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCWm-00000009u9D-0YLn;
	Wed, 25 Nov 2026 12:55:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCWb-00000009u49-1rKA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:55:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APC26TR416040
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GkrVX5hmqwOj1uqSDHPg3dZrCtzSVe8oFTjGOLlhb9A=; b=dIGatuEnNrSEPkUe
	cFNOr5SSZ8rc0TeagdnMl+X4+5zBnkc45bHx3JuJPAhZLu81bP4KHRy7+aNZJkP2
	OKAEFmJINCA2SebrVwy1K+8oJ1Cljylu8A4R+ajWxqKY/1f+MZ/1UOxZ5GJDwhIj
	13e1XNgCLvvB7Y2hK0q5LUy74LAcKg+ibW8CgX3E1EpyCewO2fNydUyywbWYT3UL
	z/nCOEBNM0qAnamvrY9ebqRddhgaGwJECGkICdTqVmlbzvZ5BU+2f99ZWY647W4c
	Za8y2zvLdIZRNmh+HRmx/koCocpNdtQHZyzeGqRa7ouQI/Xe2g6kGQ5ZDtvMVFwr
	/9RTxQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5yaxr6ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:55:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f053ce0234so6008805ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 04:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795611300; x=1796216100; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GkrVX5hmqwOj1uqSDHPg3dZrCtzSVe8oFTjGOLlhb9A=;
        b=Tlf2Ji41p5kxnieJswb05A/6f+dn4B3jb3DiUPgzcWkuz1QE/89MTupDo0cscd1xhu
         DsZ6RJH2F94z8BPtCa0ya0jee92/q4MvjhcaHDoGfoBqSM1ls/pkWpqOr8ryxAfWwwIb
         GNHxQ9lVW8wjqf6zQ/PhOisd81SjVij7uLr6/SGCa1DEDoR5YLiRfwc3appsE8gQTCVs
         XtqwxXF64QlXJ7rRD6T31XmsSipQvp0Tdi7E8pd/MPrAROs0rXDs/px855gRKnvxvr3i
         obykwVvnx8ESBjH7So7hiP8stAlQUiymqRg01yvm9zp9i4li6Vfo2rWBSW12n1RdMySx
         pHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611300; x=1796216100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GkrVX5hmqwOj1uqSDHPg3dZrCtzSVe8oFTjGOLlhb9A=;
        b=inXnrtvMEvaG6gFpuAPIaYSoCz7Z2a8apTN4htEvc78eyw6AMDsZJjM6/SUMxu9otL
         7gpls8esPm1dgEKCDS9273nUxcqT7hb7n9s8wNDk0VRpZgxZSTjwiXx9BruekQkfgCOR
         V0OhJozwlLXbshNXN32cTvbhmVs1jCSVH3REZN5slPVwJjjGFbDXrmE1PmDqfBjuD2VP
         mCZixt54kwLLDUi5D3xqcyakwn05sExZZIQrGBgJb86BtCpJ8jNnPC45n2se6fwPZCA3
         5f662kdXDs1HDq/A4TVTgQORFCBsjXN7+0L4GenmQirxABBlg8mST9cOaTDHt3BGzPD1
         WOew==
X-Forwarded-Encrypted: i=1; AL+hErEfdJB2b6oHrSb7U9ibD3ub2f0Hba4DXa6LrUXjNJN7CespZQO3/UBxDExwy/tpkXbNWg0VNSe7B5c+6cr+wmsT@lists.infradead.org
X-Gm-Message-State: APuU4Z91Ad5N+mBxajenVgshfgileOFb5nU34jjqrTuRxaFMlaVcIV8H
	3oTg/yY4uWnldOIplc2sAutUIuUMfZOMgdR2og2a8huweYc+tAIa6+2Nnk7+tJPiRXg4x8rbTcR
	0ulLhdq9Ym9VBADbbF0QX4zgciaL7x5nQ0xb45+3Q6eKvcQ7KTWr8RgfnU40860KbM2p0ZE+J80
	n+NxMmjE+jpg==
X-Gm-Gg: AZFdTZfxTW3E5ojgShipMFpybMXgwp2snV4vtLRmEfPhfFjKypAtXe655s+MqUmIxGc
	4rlpBu+Di7+q/BcvXtJyOYoiZbapkJbLMNsuRR7UT/KKYtIbGS6TtXHI5dbFHGvqou1EApQj7sx
	W7pl39O75iCefx0zKru/paLyhRia+L9tWF6EGq43igKp7h1ya1XLp6Mdm4r6INT6y1jX97DXfPT
	I4LguX3Ki7apImgQbCn18+jr0rS+NORCC/DxqEqLUk0cc118WS/D0XAQlRNVobOVk7X9EePpoTV
	9pAHSebeT3rDi9Onj4HZBKnEBfo4umPI/RGNE8Ko9igHO0wNEknriNSArJwlSFYP2ObIh5CT5gc
	Q+ghbD+YRi8/UY0ehh72LRGpTvlXmljsk4xyUJD5ErryJXZnwazknW29IsDi+u30R3V46aFk+OG
	pZNt01EA6p5qTGdvRY5C9MbAyYdlnCp8nNGTWJjZ/ga5S38vHFuqMoH6Ui+o/NLrGq/Ipoz9Ul6
	01dxxXroiaGyyjfXgBamtwKtLfd
X-Received: by 2002:a17:902:e948:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2f03ee6a938mr277103325ad.0.1795611300276;
        Wed, 25 Nov 2026 04:55:00 -0800 (PST)
X-Received: by 2002:a17:902:e948:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2f03ee6a938mr277103005ad.0.1795611299750;
        Wed, 25 Nov 2026 04:54:59 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm31940575ad.45.2026.11.25.04.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:54:59 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 18:24:28 +0530
Subject: [PATCH 4/5] arm64: dts: qcom: monaco-draco-evk: Add Waveshare 8"
 DSI panel overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-monaco_display_intf-v1-4-8a27d60b0d94@oss.qualcomm.com>
References: <20261125-monaco_display_intf-v1-0-8a27d60b0d94@oss.qualcomm.com>
In-Reply-To: <20261125-monaco_display_intf-v1-0-8a27d60b0d94@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795611273; l=3852;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=AYpwK+oMY29nTRrXB5g76kNxMBtgPBjHP+Erts0kWLY=;
 b=VPq/xz95s4qEJIiMSnzPU2MYdlsR/X/L5522kfVJKkIF17DvhT4gb/P4vNmnj4qVo9dIVzcvm
 /ATiQwdtpaVDd8tgId3WFuYXiCnpU4+kJ4q59o0L7au3tAPP2D4jaEJ
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: 5L2uBag9hzSN7ZQwiHE7g3I35Cvcp1mW
X-Proofpoint-ORIG-GUID: 5L2uBag9hzSN7ZQwiHE7g3I35Cvcp1mW
X-Authority-Analysis: v=2.4 cv=ULpIjyfy c=1 sm=1 tr=0 ts=6b06daa4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=8-LhdloVUtFS-VMo-UAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfXzjkvdxp0Plnk
 8q2HlbsNzVuV6JHtYS2xuwoaNNXgsIbYVFshGW9iaFb+NUuDbG+/eIqk94zhlkNcYv3+ncFhSXW
 bVxiA/3NHwG8uUD/p2bmlXlu+tVb+xfxIgfiwyQwoTwtbYi2EZouO0NX52zkBJatd6dpiz6E7fs
 KHyKScwKucRdZb8ikAffIjkIDWII3WyHcbiG8ldTBul3SV4ZkvtS0NvgIIpxHJ7vT2aVsPj275t
 oBvHnyTxZn+mpbS30jzm47CQmeez4Upc+ChFdfqIgQ97w5hHFGWpLvvlCdam9upgUoLqnFTabOz
 U2ptDCp048dqBSKPRYq4OqEeumq1mr4w/JfxHqCOlOlsqz6+GFw/jXtJN6Y5RRs9GEKAJc2jGdy
 1WXMos8xRt6mW2mqMnXcSXyVy8hEV5iACoGlkiy7BkVpeNZy3Yf1v0drMJEsrcT2/P3Sv8YLsGV
 6e+2RaGYO5XQN224jWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX731Ly1kZ7dHR
 13AYLCB0reKqTT/8Er6i9SH/Jrh7Vsq8NI4eF3JNYEWR0sPhtwvj8Y3CFSydUw+107bj30BC+Fc
 IER/SwOr7GDNf43292FphMuDSLIIEDU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_045501_505253_F23E7C6B 
X-CRM114-Status: GOOD (  18.22  )
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

Add a DT overlay to enable the Waveshare 8" DSI touch panel connected to
DSI0 on the Monaco Draco EVK, with four DSI lanes. The panel supplies,
reset, backlight and the Goodix GT9271 touch controller reset are
controlled through the panel GPIO expander on channel 0 of the I2C mux.

DSI0 is shared with the LT9611UXD HDMI bridge on the base board, so
disable the default HDMI bridge and connector in favour of the
Waveshare 8" panel.

DIPSW2.4 needs to be OFF on the board for this configuration.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +
 .../qcom/monaco-draco-evk-waveshare-dsi-8inch.dtso | 94 ++++++++++++++++++++++
 2 files changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d677d1677f24..99c733c480ce 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -99,6 +99,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-dlc0697-dsi.dtbo
 monaco-draco-evk-raspberrypi-dsi-7inch-dtbs := monaco-draco-evk.dtb monaco-draco-evk-raspberrypi-dsi-7inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-raspberrypi-dsi-7inch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-raspberrypi-dsi-7inch.dtbo
+monaco-draco-evk-waveshare-dsi-8inch-dtbs := monaco-draco-evk.dtb monaco-draco-evk-waveshare-dsi-8inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-waveshare-dsi-8inch.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-waveshare-dsi-8inch.dtbo
 
 monaco-draco-evk-el2-dtbs := monaco-draco-evk.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-evk-waveshare-dsi-8inch.dtso b/arch/arm64/boot/dts/qcom/monaco-draco-evk-waveshare-dsi-8inch.dtso
new file mode 100644
index 000000000000..79ce8cc4a289
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-draco-evk-waveshare-dsi-8inch.dtso
@@ -0,0 +1,94 @@
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
+	panel_avdd: regulator-panel-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-avdd";
+		gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	panel_iovcc: regulator-panel-iovcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-iovcc";
+		gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	panel_vcc: regulator-panel-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-vcc";
+		gpios = <&wsgpio 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+&i2c_mux {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	i2c@0 {
+		reg = <0>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		wsgpio: gpio@45 {
+			compatible = "waveshare,dsi-touch-gpio";
+			reg = <0x45>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		touch: goodix@5d {
+			compatible = "goodix,gt9271";
+			reg = <0x5d>;
+			reset-gpios = <&wsgpio 9 GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+&mdss_dsi0 {
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
+		reg = <0>;
+
+		backlight = <&wsgpio>;
+		reset-gpios = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+		vccio-supply = <&panel_iovcc>;
+		vdd-supply = <&panel_avdd>;
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
+	data-lanes = <0 1 2 3>;
+};

-- 
2.34.1


