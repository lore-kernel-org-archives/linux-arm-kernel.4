Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B173606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y6sETd16;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XbNxvnWh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PiUBMUOs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ROlTQJTZQ9QnDDl9LWG3ZjMqcYuTf5tNI8Ms1jzAQAM=; b=Y6sETd164SzcNU
	paMT1j30qHIbsr6l8uWte6q40I1P/tp/644OQoBjJdFWf2xgcy2alOwI3I9iMWWX6ieuDhp8iDLrk
	FQC6GCYgDGob2DWulKoMlHYRf03+5xAsgj6I+vJJS1IoDlcFcoaFFTYcOwFZ0fYDK5PjaVa9FGN+4
	ZFjc+CuFG4RhvKzXmsWRumg0r/YIEo07x0UrVRwzIEVIZNmngGDU+tYy5jvIMOqPHNN3zu7anIIBv
	9SPIZ+kMnKIp2imgNO3ODdPhTwr5W2SCigVjRSYJLC40XctgDqEHiu9DIeiHkEvkVESoSGD1RN77S
	W1kQcL/dBTH78W4yY2+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrfh-0000000FJof-3nnC;
	Fri, 27 Nov 2026 08:51:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWreo-0000000FJNP-15ef
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 08:50:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Hu0X3118076
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 08:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ROlTQJTZQ9QnDDl9LWG3ZjMqcYuTf5tNI8Ms1jzAQAM=; b=XbNxvnWhk/MWVuzp
	RMhH+S6HgWWmPceiFqprC5hnUSrMXnUtQDzWw/QvliurzXrrQ9fu7Ov62v1I5PPN
	3BOlYDjrDqIXfnhXQTl6p/SFqk54PHdgilW9VQty29ZClP3OoN2+vrHgJMMWxWo6
	78t6DbvvCYBQLVWxxoZOeFSCQCPVfUFIesKBMXFIYNBn2bv3+DyiFujv1jPVHdp1
	b6C6oxyKebjH3NkuNd1Q04Fk7Z6H5hW5ylKAoou5PvWKHEq+gg6rCKeRx+4PhX0f
	yvWwwLB2q/LOsNfD6xIbpKF/7XAEmBWpkGDf7mgBM1YAH7rc30OiDqWKgpUHkfwC
	TxibyQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh8s5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 08:50:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdeb1f93b63so117131a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 00:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769412; x=1796374212; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROlTQJTZQ9QnDDl9LWG3ZjMqcYuTf5tNI8Ms1jzAQAM=;
        b=PiUBMUOslexaYuKdMckObFkjJxbFc6cwShfisueqgtfU6ICSqV6zA1F2tNqAxgv4WU
         CsUM5TIHNDBFblFePnAFrPOYcWWxrOcAw6gr2TpjsTYCB6dXCT1AlTAcl92JyF5yqdti
         jjlTMqX0AtsTw/Oo7o5sLevcaVZFt4oZWdkvVwXfGR50DnmiOY0klOp5EI0HEqns5q7a
         67TrxCzHD0TBORuBvt8A8WU0DjnVuM/EFUoXKxEvib/Vop4r3qoWr8TuCmpwVSBJ86MO
         ejtq3Hbv5UtKah890yuzWVjK0CKr5MQcUceXFaaJ11oSQca1zjvxgM3TyikgdLpIneQ/
         kWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769412; x=1796374212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROlTQJTZQ9QnDDl9LWG3ZjMqcYuTf5tNI8Ms1jzAQAM=;
        b=dNo5ho5Lwb+vosAGrFvHRhjyn1Eu8otFThBV2avMyFyUDIO0xe0P0V0j3AA0nOsR/U
         0qn8j4xzLafmJc8PqkC+p2MaP9EGNoSneKe+Z1olnwOaRMa+jXKhiODcCUqCIAwrjn1F
         QiMJJ/iJ+oxKGjF2R7MA+CoJMzVEnl53gr2MV5z8BMV9udKjY6fdCP/2OGaZx2MKUF1x
         Bla/4MJE5exw6XrZ0fWmyyaYIZ9377BshmbB6aTt9DBAC+yM9R+lbhFLKEfgNnt8lGMD
         q396sxr/F4IUkrQy8KEvaqwm/36qJ0dCFSQJ+U2OyQ5u8A5Li0LbBdWS5ZkIa2IJPeQL
         u9QQ==
X-Forwarded-Encrypted: i=1; AL+hErFJwDPTGm90RXLbnEofrs1zF3a0i0ccoCPkMtyk9wed3BRQUVtoXOGx4YYCrgr0jhvmkXu1SWDy8eDY3EiQnW4/@lists.infradead.org
X-Gm-Message-State: APuU4Z9ikbLFUaOcdggKY66YrcWWDj5ZefMBrGAPxlrXFOhQWe2KOioI
	USoLNxp/P5fSKLuQy5rrJDqQiSgYIKQzbupFyqvhGUpo/3eVsYkgFChDcmmcPE6wQgSAYtZ18Pm
	WjsGi9mzcOUICuCteEiEVACIPHAcRdr9KaZayHKum4C8Tq/5i6urcs/DdMYgxZrqTD0wdx6NhzC
	qw3w==
X-Gm-Gg: AZFdTZcKsaM/Ji4+wGWWGoe0Ac5DdxUmY0zOo3XjT6k6LG8jtOvr+LbbP9cyIkY/4K9
	4z5bvXIeL7WCO6rO4YlCeBSBU4q1rEqFv9gWKb4x7P/qp8aCJKrmOCJNL70MyT7WY9eIoP6fpSf
	Hr+m9X/fweDknq2sAuFWW4Do9aFRWMfxD1b41mb1ye6+RqtW7pQE0dK0vn0cQu4jUUESQEqIk2i
	EhYvHfYoukYwO0MwSnCSUX8lndzgyMtJOVpRjcIn6kUhZH9OBO74NnDmdZFpJK20iXhWpJgwBqv
	lfYvc+Wd90loJzxtazWEGLIc6wlk2dp//BgtfoYUNm8amfz5O4k7Pu81PVLV2lqRHmC/FvxJ1BQ
	mCzRIoF2MZzBTn/BSnEmXv+tO7z3dOgW1ThLQEuZKeOdAFELN/esgLWnHoxEq6sl4XlfmLa/DM1
	uxfC33F8cK5ejLCVWC21CqtHH9M/beoGY82jMDbIWi39zfSRkfNdHse+Qj8vqIECAKHYir8ZrLx
	uwMK9U1mq0bpPrNnST8xbvb5AW4QA==
X-Received: by 2002:a17:902:e847:b0:2e9:6468:2005 with SMTP id d9443c01a7336-2f03f117acfmr379202315ad.2.1795769412228;
        Fri, 27 Nov 2026 00:50:12 -0800 (PST)
X-Received: by 2002:a17:902:e847:b0:2e9:6468:2005 with SMTP id d9443c01a7336-2f03f117acfmr379201855ad.2.1795769411765;
        Fri, 27 Nov 2026 00:50:11 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:50:11 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:28 +0530
Subject: [PATCH 6/7] arm64: dts: qcom: eliza-evk: Add RPi 7-inch DSI0
 overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-eliza_disp_all-v1-6-a18be7f65fd4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=4093;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=ozVFPvwCToClH6aGgrZS4PFCY5hY/HUAi50iI0h5UIU=;
 b=bcCqAp1av8GYBVUZt3ZQMJaV/hca+QKvXb7Ri69R/DLBEYBMQewIoYf3EAnc1BRkZkfgKj1sO
 RQoycvFYi60BdhzoBEqIzQlx9FqEX1KYH2t9RE1uUJ/+ov0lylpTqSg
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX72B+NvQBJTg+
 QTYfXOnSvmL0DNCr8JkJ+clxlf0zA5qXBhs8y3M5ZG/I0wHFW7ErIU9/jq5lHM+yIMvdEzbgGOm
 AWgBGvzo4OUh/YYKixkDzU0qmtAmVIfqLRLwLqeIEDnxcBWNy92StOQdguI8YGMDtoNJHiNqzZ1
 0u8GbubzTa/CTkh4np4iz9bi/Of5hGehpMXqOBQmnjV464RLgr+toDm9a25ZALAN8LzD+m33Obm
 jRgSNBbMm9DuiQKoLLHulOqnujBjv891SqFVjNriLZPnoJcJxVnxvCa3ZvrEoUZlkkDb4v3sZ1q
 FzWRgBnOYaVdtoubPLLbVpjmd+MtMYfJZup0oFPId76xY4/VFPPMoOq3T2ZZUDdELrc9yfsFEQB
 3D9w17Ka26gAqOd8P0sRCKv0ZUAnk2RsLO/ZyUuzu8L24luGQqyCLshmpjKQavDOTrpRLdCvX6K
 VK/6+pQqgrHR6dNMD7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfXwj43fh1MnTdR
 HujOvaGNGH4VPpzMnJhya9eBFwGvdVAerI8fjoLs2swLpQB+mS5uDmYt7lluIOgOJlBI+7q6WpQ
 NoG/0lZIzlSZmDdGObQvd1HFzfnl+1E=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b094445 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=fr-BqTdB3QoRZjYE0SAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Cvd2BGygOF-xa6ztYpfAix5Zzx4Cy6Xm
X-Proofpoint-ORIG-GUID: Cvd2BGygOF-xa6ztYpfAix5Zzx4Cy6Xm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_005014_428416_DD29D5B6 
X-CRM114-Status: GOOD (  16.77  )
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

Add a DT overlay for Qualcomm Eliza EVK to enable the Raspberry Pi
7-inch DSI panel on the DSI0 22-pin connector.

The overlay disables the default HDMI bridge path, routes DSI0 to the
panel and describes the panel regulator/backlight controller and Goodix
touch controller on I2C8.

The Raspberry Pi DSI0 22-pin connector path expects SW3.5 to be on.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +
 .../dts/qcom/eliza-evk-raspberrypi-dsi0-7inch.dtso | 87 ++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d8cac5322a19..9183f7c608c2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -16,11 +16,14 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 eliza-cqs-evk-emmc-dlc0697-dsi0-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-dlc0697-dsi0.dtbo
 eliza-cqs-evk-emmc-lvds-auo,g133han01-dsi0-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-lvds-auo,g133han01-dsi0.dtbo
+eliza-cqs-evk-emmc-raspberrypi-dsi0-7inch-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-raspberrypi-dsi0-7inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-dlc0697-dsi0.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-lvds-auo,g133han01-dsi0.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-raspberrypi-dsi0-7inch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-dlc0697-dsi0.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-lvds-auo,g133han01-dsi0.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-raspberrypi-dsi0-7inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-ufs.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-nothing-froggerpro.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk-raspberrypi-dsi0-7inch.dtso b/arch/arm64/boot/dts/qcom/eliza-evk-raspberrypi-dsi0-7inch.dtso
new file mode 100644
index 000000000000..33cb9947f463
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-evk-raspberrypi-dsi0-7inch.dtso
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
+	display_bl_dsi0: backlight-dsi0 {
+		compatible = "pwm-backlight";
+		power-supply = <&reg_display_dsi0>;
+		pwms = <&rpi_mcu_dsi0 0 255 0>;
+	};
+
+	reg_display_dsi0: regulator-display-dsi0 {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-display-dsi0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_touch_dsi0: regulator-touch-dsi0 {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-touch-dsi0";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&rpi_mcu_dsi0 1 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <50000>;
+		enable-active-high;
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
+	rpi_mcu_dsi0: gpio@45 {
+		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#pwm-cells = <3>;
+	};
+
+	touchscreen0@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		AVDD28-supply = <&reg_touch_dsi0>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
+		reg = <0>;
+		reset-gpios = <&rpi_mcu_dsi0 0 GPIO_ACTIVE_LOW>;
+		power-supply = <&reg_display_dsi0>;
+		backlight = <&display_bl_dsi0>;
+
+		port {
+			panel_in_dsi0: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in_dsi0>;
+	data-lanes = <0 1>;
+};

-- 
2.34.1


