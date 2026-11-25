Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD164606A69A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P3VakRE+;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cvgIjAAI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pkw/TcE7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bZFEZJh/kiz3Wuz0tlw5gxTMXmRS2CncrfuIY6KDmig=; b=P3VakRE+9FRZw2
	D8bderegU+tccXi0oyW3UeEUoqO6jl+tmSRNwdJCf9c63F+LzSroGt5KbJUT1q0n3eCkcLqUQV8CR
	Il0NdmvPqkZhncSslvSxbeExNjSDVLwiabbUVsVuXR0qsstKoBMZWKGtZRZsYQqQsvCWs12dZG8P3
	veCMea4hpDcs/3gAhQkl4EZn+Up/ujZn2uwlafEeh6hFz2a0muh4IJedTVF/jD5McoLlaU+40yNL6
	1dzupizIfptWvJVHvzXp8QCkWF+zBUlgiR1TFTp3zvKegX64dn0bwH1QBF7E+gbMP/dbiAmXuHlnW
	GYf/rZPbVztLvO53B0Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCX4-00000009uKL-2bcz;
	Wed, 25 Nov 2026 12:55:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCWg-00000009u6m-31RQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:55:07 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9me2u796853
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZFEZJh/kiz3Wuz0tlw5gxTMXmRS2CncrfuIY6KDmig=; b=cvgIjAAILbtsloFZ
	yrPlQ8iybmLMH7qFfd1sfPJkOjrxCS0CmvUTIvOQ92+goERSR0T7a9aM3zB1sxwW
	nZaIguRKoWVI95jjbHO8pSs1+lO6JdHB3qL0JlNk7+78CipCkhQ9bq8gtaLhnSAW
	j1sNQBP3FElTZDC9y4Rz6SlJlj5YYqyxPp5KRPvYZZ7zvTPoV4pFRI1UL54Nhpg3
	AWgbAbO889X+OvjRTGnasXbqlv/uoVx4jdLcsjbEyd6ayYOzA2I6Q9kFtHYEu1b6
	uxVW9LB/UJvjzZAvYqdJ5GGdnAo2z0mnb73S8J4dkjMJ7U1c/QRWxWQmkRwcO8cT
	mlCcpA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rtrq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:55:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2efb1ab7443so12897145ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 04:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795611305; x=1796216105; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZFEZJh/kiz3Wuz0tlw5gxTMXmRS2CncrfuIY6KDmig=;
        b=Pkw/TcE7LDWvPyo8ggNzxJB3mPeGBAvdDzN6ID5jhdX4eJG++ec/KiUP7lPR8bFU1e
         WAAMulBbWJc9FebLul0bwNejCWNBNZiEthPukv8XohZQ2gS0o4VJ6O0IGgtwr1w4nLEd
         b6RdcBBXHoMzKt/mMINlU9nm9ojiNeKiqOH/xHRnqIJjyaV8V4Ig6gQ+7PJgm5IxRfoA
         vgGyqhiZjWGKmIILnn7INjlOcRGlZQmdX5CbPXL0Ms+9Fo/9toA/GbYf+Wodjg2cbeyt
         idb3i7FjC8a5TLa3aJm/5yf95C5LrL0NVAzqfcGSX8820bmzTzkW05FtGHbmITVyGoUa
         Dgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611305; x=1796216105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZFEZJh/kiz3Wuz0tlw5gxTMXmRS2CncrfuIY6KDmig=;
        b=XBqHX977ZNVjd52L8/pGKw/ig9WpK+zkZ/k57KAub0Lrgj2/teE/TT0FBLBOS9fjjs
         n5bmcFtuZoCNCJpEG6pOPWypQZJ/+HxjPOTH4hW9zkUZD0ooFHsy/rIB1RAFSRjJ4qIj
         CKPV12aE0nmJF+tm2GzCXCHiyDNF0pZmcvb9Iw+tzsyNv2rPUvZAGKkjsz9fUG1xHpW0
         4NvgrB7aR/+FOOnNAMcAlLZRgJ1pb5CyYJY72bNHoNzMxeq5hhYFdVQJU7PnWDkDKoKb
         D+r9kIOvUlg9dItiyGYA6ywsZGGhrCcVk9UiAV6JPtjNSOSFcXSBFSCWXs7ej8stkPoS
         pa1Q==
X-Forwarded-Encrypted: i=1; AL+hErGu1lGa66Fz+rRIOhZNy9AfQ48aCaXGWsjHAHDJQqn/8KjhrhgXyQU2ftJIjTy3H5hzo5Lsumifx2Y/vUVMDt/R@lists.infradead.org
X-Gm-Message-State: APuU4Z+F6Lgbfjv1dgtf0ow/8/xTnPTZm7F0/POo7E33nT7eDXwwBX3d
	qZqUzhp2a1R8qudQp5A6K8bUPlixeiNGQ2xkM/9cA8SkekvD1qB1TXOLiF1ydQBzS5YLxOec7vF
	4NB5DjRJwZ/OJSx8wRmQ9W0FvFueXj3ZFGPG80TmUjwb43hWYffjHNz9YO2nDDoI6wkkm90YRdF
	TlTw==
X-Gm-Gg: AZFdTZfa2jbT0BzTapCYzWUc9RXzoo0KwEepat8pmNKsOGAXBTyJlSDVUkbHqxto5OF
	umnvHb83kHxnqOyrGw0JutezJbym4I8gFkrpJBREsMllIX2Jujc8+QAqXnfO5Olte7aTvPpBoZi
	NpXrVcpGEt1J4RquUIoi5um6D0mrNEtqZBMKGFAAENLf0l9FfCcsCqUGlqXTLGFFt0bnXIEjIzc
	y/W37nUWwSH6W+vDTZCdOPzr5D9RxuEFqSRMIUSTm60a01uQ3ur6vHvc9vE40iHb5wPr4ju7MyP
	+Bj0qdZSJWdpg9463zZ0peEZugirGKRcF+dd31mFVkr+gcr+OBYRNY2CdYQsopgsbI1YwlW9ElS
	pLSFht9zgIyN55v9bLtnuMIUVou4xsW6WULorX29AEJWrr70Pbc+99PZNRDTJyF30YqUkizseHB
	1OPybUx9uvMsZBAEEmPYGid7pEjdBTPngRFhwXBKGfRMwr1X1dUr04gMzx5cmmGF/qpfDzfmNSz
	n8dWch+ffteMlPFrACVY04Vbdxf
X-Received: by 2002:a17:902:e38b:b0:2f0:7707:227c with SMTP id d9443c01a7336-2f0770728c8mr126208705ad.4.1795611305469;
        Wed, 25 Nov 2026 04:55:05 -0800 (PST)
X-Received: by 2002:a17:902:e38b:b0:2f0:7707:227c with SMTP id d9443c01a7336-2f0770728c8mr126208405ad.4.1795611305033;
        Wed, 25 Nov 2026 04:55:05 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm31940575ad.45.2026.11.25.04.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:55:04 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 18:24:29 +0530
Subject: [PATCH 5/5] arm64: dts: qcom: monaco-draco-evk: Add LVDS AUO
 G133HAN01 panel overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-monaco_display_intf-v1-5-8a27d60b0d94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795611273; l=5520;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=6nbVHX+/Cq/YF01FFFGiP3B+WoYwWq3CUOhOIkIUo/E=;
 b=VBqXVsSUO37LRiyeV8Nc+EfLgdq+yzvhxbgppDKFeQQAUQ8vDtv5C+stmHjpOz0unnsMe1EUL
 6qVjA87F/JLCvq5DOiExvPtc/trAMp5rPrpF0FePyckWjWmtmGT157C
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX1zyE0lIJh+k/
 +Ogn9Vw5obn71/YQdLUvuzso8pFlbsBWsWME9LKYkff790Tex0YuSeeGX/NI72fwtFrMlbAiacU
 NyaR6XTXiYf3G7Zpi+o6F5npKCI4RYV2JxR3m7KJrhNmVvxbmclPP0cfkKDATupZjzQu+cPspks
 PDLATzzRstpEge3duEyzlah3HmxhtaY5PaXL8ndkvNJ+RD+bBBVOySjmUhOGtYwLmzEx9ZmOPmj
 mv15/M5CvqmohpKhc1M2HSUbK3mFsrePyAeTAVKLi7HWVCtjex9Dq7veGjyIXB/FDR9EwggUbex
 sqZRBcO6VnpXrIThTqGBizrHeg4U6H2Bq7k3fB2s7/rVKYAoZIN/ei977+FJ9y0HEW9o2YqXREk
 MFXWacHsGuf/3iVSrjE6cMsJh2fUEASBRbJWMlbgb3SIip9/WMn/b/WOw+VFzVi3OfBUypEzKjn
 cTSjkM7wUYErWTJWo6A==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06daaa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=y427l31XdlkixRcQg0gA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: LQHPC3cJG89hUAUsIUB7LVHNWlnEpmpv
X-Proofpoint-ORIG-GUID: LQHPC3cJG89hUAUsIUB7LVHNWlnEpmpv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX7vfz5whqB5J+
 T2xg1/fC4JPtv328fsXOcyJPYYw7JdfvHeHU+RfNTYlB0yfAozmY9tTsrqDMmpD2OpnjW7/AQDn
 PxYSYr2FMnH/BSBrZqM4VNkvx3dnf/M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_045506_762939_BA1EDA27 
X-CRM114-Status: GOOD (  19.98  )
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

Add a DT overlay to enable the AUO G133HAN01 dual-channel LVDS panel on
the Monaco Draco EVK. DSI0 is routed to the panel through the TI
SN65DSI84 DSI-to-LVDS bridge on channel 1 of the I2C mux, with enable
on GPIO3 and interrupt on GPIO76. The panel backlight is driven by the
PCA9685 PWM controller on i2c13.

DSI0 is shared with the LT9611UXD HDMI bridge on the base board, so
disable the default HDMI bridge and connector in favour of the LVDS
panel.

Also add an alias for i2c13 to keep the I2C bus numbering stable.

DIPSW2.4 needs to be ON on the board for this configuration.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +
 .../qcom/monaco-draco-evk-lvds-auo,g133han01.dtso  | 147 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-draco-evk.dts      |   1 +
 3 files changed, 151 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 99c733c480ce..83dd2bb6e04e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -102,6 +102,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-raspberrypi-dsi-7inch.dtbo
 monaco-draco-evk-waveshare-dsi-8inch-dtbs := monaco-draco-evk.dtb monaco-draco-evk-waveshare-dsi-8inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-waveshare-dsi-8inch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-waveshare-dsi-8inch.dtbo
+monaco-draco-evk-lvds-auo,g133han01-dtbs := monaco-draco-evk.dtb monaco-draco-evk-lvds-auo,g133han01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-lvds-auo,g133han01.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-lvds-auo,g133han01.dtbo
 
 monaco-draco-evk-el2-dtbs := monaco-draco-evk.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/monaco-draco-evk-lvds-auo,g133han01.dtso
new file mode 100644
index 000000000000..17f1ef00829a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-draco-evk-lvds-auo,g133han01.dtso
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	backlight_lvds: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pca9685 2 1000000>;
+		power-supply = <&vreg_disp0_bl_en>;
+	};
+
+	panel-lvds {
+		compatible = "auo,g133han01";
+		power-supply = <&vreg_lvds_3p3>;
+		backlight = <&backlight_lvds>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* LVDS Channel A - odd pixels */
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				lvds_panel_out_a: endpoint {
+					remote-endpoint = <&sn65dsi84_out_a>;
+				};
+			};
+
+			/* LVDS Channel B - even pixels */
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				lvds_panel_out_b: endpoint {
+					remote-endpoint = <&sn65dsi84_out_b>;
+				};
+			};
+		};
+	};
+
+	vreg_disp0_bl_en: regulator-disp0-bl-en {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp0_bl_en";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&expander2 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_lvds_3p3: regulator-lvds-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_lvds_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
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
+&i2c13 {
+	clock-frequency = <100000>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	pca9685: pwm@42 {
+		compatible = "nxp,pca9685-pwm";
+		reg = <0x42>;
+		#pwm-cells = <2>;
+	};
+};
+
+&i2c_mux {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	i2c@1 {
+		reg = <1>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sn65dsi84: bridge@2c {
+			compatible = "ti,sn65dsi84";
+			reg = <0x2c>;
+
+			enable-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+			interrupts-extended = <&tlmm 76 IRQ_TYPE_EDGE_FALLING>;
+			vcc-supply = <&vreg_bridge_3p3>;
+			pinctrl-0 = <&bridge_rst_pin &bridge_irq_pin>;
+			pinctrl-names = "default";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					sn65dsi84_in: endpoint {
+						data-lanes = <1 2 3 4>;
+						remote-endpoint = <&mdss_dsi0_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					sn65dsi84_out_a: endpoint {
+						data-lanes = <1 2 3 4>;
+						remote-endpoint = <&lvds_panel_out_a>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					sn65dsi84_out_b: endpoint {
+						data-lanes = <1 2 3 4>;
+						remote-endpoint = <&lvds_panel_out_b>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&sn65dsi84_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts
index 3e1b18de8920..a576159933b1 100644
--- a/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts
@@ -20,6 +20,7 @@ / {
 	aliases {
 		ethernet0 = &ethernet0;
 		i2c8 = &i2c8;
+		i2c13 = &i2c13;
 		i2c14 = &i2c14;
 		serial1 = &uart2;
 	};

-- 
2.34.1


