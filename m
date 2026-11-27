Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B4B606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ovxe9go8;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV3Y+o1n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IqLMl+u7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=w/C0LqnSjcFwHR9wZhUlOB6p3A2W1rdv7Pn2rc2Yz34=; b=Ovxe9go8RqrUeg
	lfcM/zpGXjqHv0+B3HlOhMPjX7fGZkTgWqtnmCeaaAfqJoc/FoqcQBmoSg4ya9kTgeU32hj7EggQ/
	MBKL6N/9AlOK3GAAoMXPjVbYHyzy84IRAuP8Woa9vXugrpZQ1f3L4tDluwkKuxDq5YHzO6BW+dDgQ
	Orc4C29UPc85r0OjMkIx06EGOrLqybe8XT7DFFRxzCS05Lob3ErkrA1PLLhlcuj+ZOBtzZeU2rQzU
	hdiqenWep6F417ZbRZXjJWc78UI3pnOwLpBQGHMzDXrKJS2aV5s5PJAvnJPDMyL+em5TDBvb8tSn+
	dppRqFUsRYy9mqbaBctQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrfh-0000000FJoS-2n9r;
	Fri, 27 Nov 2026 08:51:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrei-0000000FJJo-11v6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 08:50:12 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GQY91197178
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 08:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w/C0LqnSjcFwHR9wZhUlOB6p3A2W1rdv7Pn2rc2Yz34=; b=PV3Y+o1n5z2Gf2Wt
	AiYgFCVzspVXaVobnxxnOC19ws5FF4dRYulmU14K2gImSh4LcalWw4NhAUDPUYz+
	L+Gq9fqTN71Yb0uxXun4OLQ3YzSZCnvRyU75J4wexECRMMKYwzOZyeeGUNrXeUGG
	fFpRWjDWb48OYm+qFaGAgZgOWkKJU1hX9ILbGxiOOFUtpJTJsJiUj8nWlStmgooW
	qVH+QKCNpSjQ1V1tvT6q86HfbK7yh6N+OOJteGt0USAjPVEK3kle4Qf6xRHCv2py
	u/0oE2FFuYlLy9EjcOGB1AxV5qm3KRkBcXY0U/yfYp68oTK1hPOB8l2jAIhs783T
	y4jdhg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k8cdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 08:50:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb8aa9c270so237674a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 00:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769406; x=1796374206; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/C0LqnSjcFwHR9wZhUlOB6p3A2W1rdv7Pn2rc2Yz34=;
        b=IqLMl+u7LEgu8xPWs4aH2jcEa2tsTT/6jlbu6SjhTMsQwsDJ+e4etMVj8tN4fTzKY3
         ziWNoNqOqiL64+R0EfwftZXoFSs69V9FHtKhvJ71gZj/h22Am25SEYBUP35aXlqYvxcu
         YQOwfDbOrfXdftnRSTUhw7fZ0KZwM/MZLzxPyVCFl3L31KZkdgCvhBqTyzIHGwykIno4
         qauCI6gghHTa5WiK1Rt5PNeO07G18eyxgBOJiUpRIhEBHl84Fdnn/ygGO165crPko4Ce
         bRgzqnH2BC63P5Guq6JwPkIgt9BwDU/urfVgiGW8zuVktbQEpj5pLIzC9h7kmXYQ4RtU
         L2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769406; x=1796374206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/C0LqnSjcFwHR9wZhUlOB6p3A2W1rdv7Pn2rc2Yz34=;
        b=czXBRXZKoQNND7nPP+tICBP/vukchxWzMnF3IhbC98MR7IdHh7XiyH8YrH7/9kkrXR
         b485BK7TKz+bcDXZyF787NOOR5dfGMzmaveX0HNXBuFyNn6c7B92Wf4WePNwdSWI2xTc
         d+xNU7v6fC7eR+Ht5C0RZmJvq2WF2FiAjQYjnoWOBV1mg6bhXi1b/mLUjwXBYiOqmQta
         UqS4RsYQ0fxSGQ6sEkYxVq5vR04F6BJ1p/bTn6/KJ8fg3+gufrU59JtjnUNtsVusCpIj
         2iff1y7HX8v/HzjgzC8NgFZaETt8w8Tkf58TZp5rcpqjZn9iSyylaJtW3wl7mzhgIxa8
         cJ3Q==
X-Forwarded-Encrypted: i=1; AL+hErF86N5Dol59MYzOIFKUlIedCeaRgUICc+lYnC0rBkOG6QrVtvVAm8tBtjhHK5uke93r4HMn8CEhukznk60d7mih@lists.infradead.org
X-Gm-Message-State: APuU4Z/cGTStVS/RlOxaBys9cRQbdbW+gojfPyKAmNsQAmjS8k/cgDVS
	n+G9eUb5LGHHrEm/THrpKMAA/uNHK7e31E0hhRPqYjMmFwHzYS/g1kwOSk7eT8s1d91uzC+nefG
	Q4mbp8ExEeXTntNkeIYu9dKSs0kkq2DIqM4bfRkrDZ8NxQTu8uxcZHuv+h9MYhCYhY5Q1aP2sd8
	S3Xw==
X-Gm-Gg: AZFdTZc6w7g9YdS8hcCxlok+w8WM1begazNGvVQIDl6p3dFLbSWKZxirBBpvWH98zdK
	mEU1FSJzGEHvqlmRZpVzmeav3HOyOAuW65Lr6dFvzFxvM0945w7UUvmlka2KRPLx9qipOzvY5Ej
	F/dKM9xOTahuPQ/IKqCS5Mfku9+mVdbop7hsK1z93RsHvyUJ10B07QduDHWRr30WB9y4eJLQ4ND
	cOSFnrrF4/lyt0Uz9YGqkNc+K1iBuD580as/bv8drXayMOiU+OW2zHqWNJy6Pzg8w/O0OiXi+JK
	wuyRYs8+Gr3BlBo7H5y8MH22z7WfWcZE/uWRDSAC4yiQNUgBNjSn3R/kT1S+FfsHFgOSqooaGtw
	kC4txykCdcGKod9xFJZEtXtVsXfQbtUsOLMvEL7+e01yHnm5qdsH3A2Lq9QpXMvyMYsKdidFZ0f
	M4mnNb0/qQlIoaajNoUREX0oA8uEKbLyjOjcWSuqQSWXlTDwDguVEq0ORqwc/71OvmjLsuM/1Pd
	4xWxB4LdVcJ351vVA9SmB9cHJ3OGw==
X-Received: by 2002:a17:903:1c9:b0:2e9:5714:607b with SMTP id d9443c01a7336-2f03ee6aec7mr398245425ad.0.1795769405979;
        Fri, 27 Nov 2026 00:50:05 -0800 (PST)
X-Received: by 2002:a17:903:1c9:b0:2e9:5714:607b with SMTP id d9443c01a7336-2f03ee6aec7mr398244895ad.0.1795769405440;
        Fri, 27 Nov 2026 00:50:05 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:50:05 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:27 +0530
Subject: [PATCH 5/7] arm64: dts: qcom: eliza-evk: Add AUO G133HAN01 LVDS
 overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-eliza_disp_all-v1-5-a18be7f65fd4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=5655;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=eIY48vZ7AT+BiCP/Hi//wkMEMZbw2o96jA/Lj+/JdQs=;
 b=3Wx5o30bdmAjMhLK581iqYyYklmpBDQPPsWobX4h/zj9x0twIQ0DBQVdmRIXJ9nSZUQKbIA5m
 g6neDUhEPFlBgOD1GaNZnDRaNDZ2j29kSLRcZGNm5zkaO19aQXh5BHZ
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfXyQeiy+K0fj8a
 VQycONyHAptcaDxjuYgC7/h9U/lMQfhFPVQ5IsZJm2D41RlIWN5Hl0KB7DSNKJXIz8fttZ/iX60
 7B0Rq9BKKBpf73gRB6BszH/hPRG4hYYK+iVatwIwJtczdKPaBI8eQ1uWp5yqPFVyyIamHDrUGC+
 W+mfmAKN2d7JC+E2STGphvXwiVglAXGPrCQisxMcHfS/8bUxJ6fdXcu6Vv3o14Xka+Sfrndis2C
 b0gQhvIWgEe6ra33y36rbIyYpPVIuLwkmLM7ACun3d65OqJ6sGn3+zurGW+lMxQi0NVgJXNEEsp
 69qxmGWJ1dhlnG6kf/MzlWTT8Ny2fwj3PUqvBpFzoWmuVj94FmKBgEMsD9PhHOKSrEqxGNA+49P
 rQcqNIB5yQT3ixDilVJymIvfM4lm9U4ySwGp9gMWQtJX1mr6PV6H7UVuwmuryUJEofDUgOx9Dhs
 lu4PxZWcBsfStXYzV7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfXwrcV6WkqQGxO
 x18K5CSzDn9ANPCaJBb+/61movMXofwwP6sff6QOX92rvWGgyLC98KZgaDItPzbEuKoIq9Ik9dh
 a2Bh0zu4+BiCfFrX6p6tXAecCCCIUnc=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b09443f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=X38TW9RF5Lljsf8P90YA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: ZuH50VzMyN3_wFu0ntTGb82-3oCVy41h
X-Proofpoint-ORIG-GUID: ZuH50VzMyN3_wFu0ntTGb82-3oCVy41h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_005008_408771_CE0257D4 
X-CRM114-Status: GOOD (  18.15  )
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

Add a DT overlay for Qualcomm Eliza EVK to enable the AUO G133HAN01
LVDS panel on the DSI0 B2B connector.

The LVDS daughter card uses an SN65DSI84 DSI-to-LVDS bridge on I2C4 and
shares the display bias, reset and interrupt lines with the base HDMI
path, so the overlay disables HDMI and connects DSI0 to the bridge.

Add the PM7550 PWM node used for the LVDS backlight PWM output.

The LVDS DSI0 B2B connector path expects SW3.5 to be off.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +
 .../qcom/eliza-evk-lvds-auo,g133han01-dsi0.dtso    | 126 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi            |   1 +
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi         |   7 ++
 4 files changed, 137 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 64c61aa9cd8c..d8cac5322a19 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -15,9 +15,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 eliza-cqs-evk-emmc-dlc0697-dsi0-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-dlc0697-dsi0.dtbo
+eliza-cqs-evk-emmc-lvds-auo,g133han01-dsi0-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-lvds-auo,g133han01-dsi0.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-dlc0697-dsi0.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-lvds-auo,g133han01-dsi0.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-dlc0697-dsi0.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-lvds-auo,g133han01-dsi0.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-ufs.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-nothing-froggerpro.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk-lvds-auo,g133han01-dsi0.dtso b/arch/arm64/boot/dts/qcom/eliza-evk-lvds-auo,g133han01-dsi0.dtso
new file mode 100644
index 000000000000..3da0dc3c0de8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-evk-lvds-auo,g133han01-dsi0.dtso
@@ -0,0 +1,126 @@
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
+	backlight_lvds: backlight-lvds {
+		compatible = "pwm-backlight";
+		pwms = <&pm7550_pwm 3 100000>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <153>;
+		enable-gpios = <&pm7550_gpios 2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&lvds_bl_pwm>;
+	};
+
+	panel_lvds: panel-lvds {
+		compatible = "auo,g133han01";
+		backlight = <&backlight_lvds>;
+		power-supply = <&vreg_disp_3p3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+				panel_lvds_in_odd: endpoint {
+					remote-endpoint = <&sn65dsi84_lvds_a>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+				panel_lvds_in_even: endpoint {
+					remote-endpoint = <&sn65dsi84_lvds_b>;
+				};
+			};
+		};
+	};
+
+	vreg_lvds_1p8: regulator-lvds-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_lvds_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vreg_disp_3p3>;
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
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi84";
+		reg = <0x2c>;
+		enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+		interrupts-extended = <&tlmm 13 IRQ_TYPE_EDGE_FALLING>;
+		vcc-supply = <&vreg_lvds_1p8>;
+		pinctrl-0 = <&bridge_irq_pin>, <&bridge_rst_pin>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				sn65dsi84_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+					data-lanes = <1 2 3 4>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				sn65dsi84_lvds_a: endpoint {
+					remote-endpoint = <&panel_lvds_in_odd>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				sn65dsi84_lvds_b: endpoint {
+					remote-endpoint = <&panel_lvds_in_even>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&sn65dsi84_in>;
+};
+
+&pm7550_gpios {
+	lvds_bl_pwm: lvds-bl-pwm-state {
+		pins = "gpio9";
+		function = "func1";
+		bias-disable;
+		output-low;
+		power-source = <0>;
+	};
+};
+
+&pm7550_pwm {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 734bea47855c..e3f3e3aeb089 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -7,6 +7,7 @@
 
 / {
 	aliases {
+		i2c4 = &i2c4;
 		i2c8 = &i2c8;
 		serial0 = &uart13;
 	};
diff --git a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
index 9b907f69264b..3a7dc47ced5a 100644
--- a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
@@ -57,5 +57,12 @@ pm7550_gpios: gpio@8800 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pm7550_pwm: pwm {
+			compatible = "qcom,pm7550-pwm", "qcom,pm8350c-pwm";
+			#pwm-cells = <2>;
+
+			status = "disabled";
+		};
 	};
 };

-- 
2.34.1


