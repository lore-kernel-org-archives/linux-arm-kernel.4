Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C24A606A691
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XfPhXM00;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jHEwGN+i;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LpgNyv99
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OIT3LY/NnA77L/6DRiyEURyM+xFwCg00LGKNqW3Vx/k=; b=XfPhXM00hxHK4p
	k7WHadtAPXucdkJ205id9m7ORdqKqf9U5KjiDJNCwZlkEOSXKlrnlrnsFWO6HJoyrIgOgvrBYW4JI
	FM4/UOhj4IXbx6pVOpIg+N7PHITIKGmybYIz7Xwoy3S2Ue6ON+VRn6rHefxwY1SyKJPEy6xXohp3x
	Q0cXFD8ytrJsANbnYxnlMT+Y89rhAagpbv/DuUCtQrY5JZhDU+19nLHXSDrj/zL6kYRHUNBdaAibz
	vlFjzdKLiO8HOxT4J2XewYQ1MCCmxgJbSF5oBEBYMkai3JQj6cWSndcuKqxzvcW39Zsq38MlMXjQN
	XPa21aKhU1HlyLk55A7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCWl-00000009u8q-3bgj;
	Wed, 25 Nov 2026 12:55:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCWW-00000009u2G-2K4L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:54:57 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mFgD3126473
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OIT3LY/NnA77L/6DRiyEURyM+xFwCg00LGKNqW3Vx/k=; b=jHEwGN+imaVLuIM7
	RTyc7knKXnMGosalgXSIcs6sABQ6f+v8JqLqjxsWe2VaPujdmV6F2IQuTPfDvQma
	zhALd1ZCDuRCUJ4bTxbDBini0EDYPTSt47UuLYAzMubFBpd/89Jayy7X7E0Og+xz
	DQnqIRplI2jhfReki0E9fSn9UkBFze20gv2phZLfwFgX33bedtbHkrtn1M//GBI4
	FnB9sAnb0oTWo75mZry6+qgB743qbDMrZNUqVrzDsnkCr7o/WJ7fOC3O6eNrEb3R
	EfO8ZfxgLES89sIw1UGMgJdR8b94BGYtx6CxbaufhJGHb4oInTQY1oFTttnkhw6e
	OzVlrQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydc800-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:54:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f01caa8ab9so6289425ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 04:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795611295; x=1796216095; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OIT3LY/NnA77L/6DRiyEURyM+xFwCg00LGKNqW3Vx/k=;
        b=LpgNyv99zGprYji/wfy51spxEHCjhEHKvysjzRKpfFj2WiCIXULZlkxVUFwTPQRidk
         7zc5YmUc5CH+zfqChZ0cVBVk1cgc2P6+Tpi7zrNwxdFY/sW+JJUlcIPJNSAiYqnXSW0A
         OxpxgS+Rw7MiFkPL9iT8pqQJQpIg2xkdZ3Qp8HHp9L/xqAjHdief/EkfBusrtVQzVoqH
         zn39UQeUA4bfiFnCNMivo09TVkc+o0jrukNu7lM9UMR66KvVZ/DV6c1H1nHSa4Sry6iR
         j6ehYrzrxZWAUi3H2FYRraORieS/lJx8Ge6fGeiQ3CrKl39f6toTfF8vehj7LxGz1FB7
         IlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611295; x=1796216095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OIT3LY/NnA77L/6DRiyEURyM+xFwCg00LGKNqW3Vx/k=;
        b=uhqQ/1bTqTcMlBrIzeDpgVlw50Gbq6cdMCHYGe7Dk2x28DJIO17CpEJlrHGLx3uFk0
         XH4U/3uCfEID//42yaDNidXf7ap0Z0mHXk2KrL+R2sgGZvpD6gZ0ru1Z1pPmOI1G78mR
         8n8stOykwG6rgzO+tueRq3kRTosNLjCbjfMmx3j3lEks3aV6JINyWE9hGU4rOWctFhZB
         44voILLLLW3TYQCbzacwCeqPA92zZSeCHhvchTb3EDORcnHBbGlIvqNEqdUXhnuH24cs
         oTJxYpAYurlERKd02iNPtzaoQqyn32W9ig9vWmqBneM5NBARV3AHrAWZyEziaIja6ZNd
         DcQQ==
X-Forwarded-Encrypted: i=1; AL+hErFYcIx7kKz+fj0mm40wAR90Rr6fZW7fsJivwvYk1u2+9WWl+oj55nZzQhmmgRMRUKPnTW2rFuE/zZ/X75oex/Ad@lists.infradead.org
X-Gm-Message-State: APuU4Z9X6Bw6+xwp8S8dOHAoeB299mI9cwlWQcndzJ3FpkAg6vgz1CEd
	6jORC7nLkE4psBRYuwLagYInDn8aNBQwYiRvPAlzZYWWotGKGlTc0xKdJfnOArEjxgd7uAMORQn
	/mIl6TlD5iuDEGG1qoWxNEFktjrtc0J5+TCIhgezYOz10UwUbJMItBDqMJdscz+fWjhd9MKD8rW
	g+LQ==
X-Gm-Gg: AZFdTZeHjj0CE30USrlo0XX6tYzMgTy/s3vtPa6q85uk9n42PuJTVSe1f6WuY9arYFP
	0KSIL8j/gYiaEJ2bcJmFfBBjkgiNDvjjXjPST/ZF8Sj/BCnAT3vTOdee3uTB/3DC4SkKQn6iK2g
	ZwgTMWLLhFl4okvKT8PwDmzEzce/jRMaKLOltTpQjICcdhaY8VD1uVE4gAIlb/b5v2JCOcfpJ/M
	cI4XZJ8GtqVN0NixAnODEanLI5RiBzLnjPltAeIW1xUmE5vsHMCRZ+HYvxHS1ySuTPoTx7/GWiY
	D6yvlYT6h8TUzGx8dW6yAk2Z02mNfJFJ+iMSE/xIJqK3wG5eLdRJIvXJg9mshXtj1WNs/UawNul
	r2i1YomwFsOLo5gkvmvrCXs+3b0VNqFvFzvvVDzmgC/Z5l+ZdVbTVNbIgpHJ0uiqvYtT/zs3UFL
	jPkCu2dSAKhsOb+wzJVb6h7WO6OGe9Cuq5WMDTnICWnUJKRxjtgmShlKK4kGFHcIYNM5G0O9qLd
	3084BqNShxvDh4Ic27W8PQ1L4OU
X-Received: by 2002:a17:903:b4f:b0:2dd:b95a:e1db with SMTP id d9443c01a7336-2f03f1c9cd7mr295131185ad.3.1795611295161;
        Wed, 25 Nov 2026 04:54:55 -0800 (PST)
X-Received: by 2002:a17:903:b4f:b0:2dd:b95a:e1db with SMTP id d9443c01a7336-2f03f1c9cd7mr295130595ad.3.1795611294448;
        Wed, 25 Nov 2026 04:54:54 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm31940575ad.45.2026.11.25.04.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:54:54 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 18:24:27 +0530
Subject: [PATCH 3/5] arm64: dts: qcom: monaco-draco-evk: Add Raspberry Pi
 7" DSI panel overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-monaco_display_intf-v1-3-8a27d60b0d94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795611273; l=4084;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=NS+G7kuPoI5kpwYy8h9e04dPJOgLcttGfinqWG0uVlQ=;
 b=hvKx2XYbFNQClyDVj0S1dgMpa5wdjrHTv43YL+DMilg+Rt+JGeMS/0BCPkfwMNv6MSEG3N4EW
 hxRJ+hKYqCrBnGjnr3keTyCJQvU3rvFo78zsEIYIalOB5SeyUIJ/I1P
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX86jrs9EDijH7
 uHu4QYBRw97PBbPinEpMKqyPhHA6auXaYjIXwEwPVGCtWjiPvymSptnCGe6KeiASuTWwirpKApW
 cYhz4qrsoy9euVTCEpm/PeDsSe/UrVM=
X-Proofpoint-ORIG-GUID: bw_ye8JQkw7LClijloEFiWWuwrTi2CSp
X-Proofpoint-GUID: bw_ye8JQkw7LClijloEFiWWuwrTi2CSp
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b06daa0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=fr-BqTdB3QoRZjYE0SAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX++HKcEaA6bYW
 m/eesXNa25L4PskIFREq0WO4zRnWbL4Y4ByGzPCDGv15v22cq0Y1i78UbRynVjWKAmAGk6BgfaE
 xsp8E8TkB44mzTWC7R8T/0kaoWKpXUZyAS5Q5l3EPp7pdehIjiuZsicKEAjzC4eordPOT2WYaX8
 CFifpQIKTduGQf1srebpE6OF6OvW787OFxw0oYRemqe3NkOG3mbRWuawv8a3od8+rWcX5EldF5H
 PgyeaDoZhkD3vDHTShuhPDLynBXM32GTFdJBslfngydA3Pzovb8avgl2fQkA4fomJWXMHA6YZB+
 F/P7nsdYd88zUFpEhRxbOolK/yhcaP8QvvkIf8ChfEw+ld6iAay36D7dC4G/D1TsQ+bKKFHadS/
 lSVc6cNujuVjNa5zqp295uYoZbp1n5P9StdFAKewsoN6BkkJULZFl7+gulWYZzKOwGfuz906CyM
 UGNj58FynEcaJZleE5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_045456_592594_6292CAA0 
X-CRM114-Status: GOOD (  18.55  )
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

Add a DT overlay to enable the Raspberry Pi 7" DSI panel connected to
DSI0 on the Monaco Draco EVK, with two DSI lanes. The panel is behind
the Raspberry Pi touchscreen regulator on channel 0 of the I2C mux,
which provides the panel reset GPIO and the PWM backlight. Also add the
Goodix GT911 touch controller on the same channel, with its supply
gated by a GPIO of the touchscreen regulator.

DSI0 is shared with the LT9611UXD HDMI bridge on the base board, so
disable the default HDMI bridge and connector in favour of the
Raspberry Pi 7" panel.

DIPSW2.4 needs to be OFF on the board for this configuration.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +
 .../monaco-draco-evk-raspberrypi-dsi-7inch.dtso    | 97 ++++++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 348ab62ddece..d677d1677f24 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -96,6 +96,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk.dtb
 monaco-draco-evk-dlc0697-dsi-dtbs := monaco-draco-evk.dtb monaco-draco-evk-dlc0697-dsi.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-dlc0697-dsi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-dlc0697-dsi.dtbo
+monaco-draco-evk-raspberrypi-dsi-7inch-dtbs := monaco-draco-evk.dtb monaco-draco-evk-raspberrypi-dsi-7inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-raspberrypi-dsi-7inch.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-raspberrypi-dsi-7inch.dtbo
 
 monaco-draco-evk-el2-dtbs := monaco-draco-evk.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-evk-raspberrypi-dsi-7inch.dtso b/arch/arm64/boot/dts/qcom/monaco-draco-evk-raspberrypi-dsi-7inch.dtso
new file mode 100644
index 000000000000..bb646714fe28
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-draco-evk-raspberrypi-dsi-7inch.dtso
@@ -0,0 +1,97 @@
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
+	display_bl: backlight {
+		compatible = "pwm-backlight";
+		power-supply = <&reg_dsi_panel>;
+		pwms = <&reg_backlight 0 255 0>;
+	};
+
+	reg_dsi_panel: regulator-dsi-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-dsi-panel";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_dsi_touch: regulator-dsi-touch {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-touch";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&reg_backlight 1 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <50000>;
+		enable-active-high;
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
+		reg_backlight: regulator@45 {
+			compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+			reg = <0x45>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#pwm-cells = <3>;
+		};
+
+		touchscreen@5d {
+			compatible = "goodix,gt911";
+			reg = <0x5d>;
+			AVDD28-supply = <&reg_dsi_touch>;
+			touchscreen-size-x = <720>;
+			touchscreen-size-y = <1280>;
+		};
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
+		reg = <0>;
+
+		backlight = <&display_bl>;
+		power-supply = <&reg_dsi_panel>;
+		reset-gpios = <&reg_backlight 0 GPIO_ACTIVE_LOW>;
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
+	data-lanes = <0 1>;
+	remote-endpoint = <&panel0_in>;
+};

-- 
2.34.1


