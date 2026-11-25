Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880BA606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LeV2AOu1;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dCHECYQB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NzKwIjc4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tkiqVhXLscb2eWEG4IKitimjTufpxvT32Prf+F5vybs=; b=LeV2AOu1ZdkmC8
	kWzycIalFUrovAbf05Ru350hNZqZBqJKE384Qj9abT+uLt4EjzADzPR9jCxdoDKll0fl6CLiZG+MW
	iK311r06ZyyrlkepjwtoSC4YO6FUH9u8IIyyLpPCCwBJm67Lo34Beham2KGkN0KMLc4qFJsIg5zdv
	OEtPy5u9J06mqVR26E4suXZoB+jVGQHl3VkTqZzfdnr3F3pVWsuT86FZ7gy7PUcSiJGQM+RzhasbT
	Wep45JjrICjbXhLrd/dRTxLa1nMCPfmQXNYcZBuKqmwMDRgsJF7cQ/OYgbENl2UdoL95Jzksq2C7T
	NwAI+0vthpOBScAEr5Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCWc-00000009u4g-2QGj;
	Wed, 25 Nov 2026 12:55:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCWQ-00000009tzZ-3rFO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:54:53 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mMZG2356516
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tkiqVhXLscb2eWEG4IKitimjTufpxvT32Prf+F5vybs=; b=dCHECYQB06RUWabM
	jKwN6HRHf/HY33l6IQYKwI/06ohw28hfrRMGfTv2KxihV3fVhK7QsagJ2KeRolEh
	a2GrTzjR1iHm+F6w1F5p5/bd7yomWCdTi4NKUpoSmPkG9j6wnikEO8Vrv6APVpAC
	PT828TrdaBxJZZlQXKxp7MV1sOt9FK0fG50rE2PemtBEThMT7U/Z7dtIvo0WAWQb
	CtxznSqVW8CNqSsTAqNTkFp26z/kCnS2DuAKmDilzSO+S68GJSqtshXlG/cgsPZd
	PRXaEt9NaoDQhSlkWqAMX9QBEedJvT33goPRhw36+vPJA7wLM0SQNB4NzBgkCbuM
	M/+EIQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu6akmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:54:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f02547a462so10023455ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 04:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795611290; x=1796216090; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tkiqVhXLscb2eWEG4IKitimjTufpxvT32Prf+F5vybs=;
        b=NzKwIjc4qmxI6bPcVPc0In4vEDg7RzKPh0G0EecTKLhfZ61GJMOGwxPpkwbAVl1mcM
         PUCnmfG6WeX+wickF+6LQZfaTEHxng63TAQ2fvIYvKw6OhWwfIGESP2Zm5i3rrux1Ten
         3V1RnkUiwVhUi8cz+zZLrjs/oT+Pg11W4TIk7D4/7qw5taMCYHppeigjOwKNYl4BoiP1
         nHMA4FGq5/cUzOYZcBCywIQnKR2cOQq3OdPnaWEPFGyipp1UGzn1KIsT8DERUs1Ksa4y
         1UmHHC9BhlznaNtWwUnfBoJ0pJ99w+mUBbULlNHGmhgFAjmAtnEj/esd5dnyFZ8atB02
         s94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611290; x=1796216090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tkiqVhXLscb2eWEG4IKitimjTufpxvT32Prf+F5vybs=;
        b=KjGiKBNSpUnO2EQC67iGHT6bTsCEAuQUGgXwHm86iNSsTF+sQXhU1bTHcPT9Vj8Tus
         BWKI5psfimReGnA6Zxd90ZFYbZUIVoi/1m3pl7lItAegGXgo2d/ho43HpsqqQ5rCKxjr
         pGFf8n4+hgh26leaBFAe/jUy66SoT5f8/5NrkS/ncAXzwiVuOMm5y0WxvLS6K+u1Yg82
         OOUbPM+xLe7q80ghBLPgrP5c3z2N0CR/YjHupV9hAw61IIQyZMwc1vSXwmVNyGhFeq2h
         3lYj8Je/CaCueOcVhOidpkoxYPBIVoCUMatHO7QcF+SOBV7p82I5KL3e2U3FyvDd9Bxp
         PJcA==
X-Forwarded-Encrypted: i=1; AL+hErGbIOK/QB3rlnoVXg3W2pGFfBDxpWLW6F+b1dL8gS2MYbcCDCDMS0pqWMYzavYlf5nxwxDKg5CO8/Kx6Varr2Li@lists.infradead.org
X-Gm-Message-State: APuU4Z/ooTvaAbc3fuRtd/9yfzikp1eLebqpYeyumMCvUBRFVc5W+Y3t
	8iLdiy15VEXX3jsDoCD+9DCCVY7W18BLx5/BTe4GvIzWYCpHLmBMEAq/FQnrtSkoKpHM6Ux2b4q
	Jdt0KzOhrKWUvV4icA/KohQb98mLqIU5V/OFtx9fp8ru6quNBDyIrwX8w5IsIeFPzN3cU2FQ84D
	Q8rw==
X-Gm-Gg: AZFdTZfFnhmeO6j7bLlJ1vKb9Shxj0IpwqAt2EX1mgN/XR18XwXeEj91BOvj2cIVKhU
	zIJRLLiIOSv16hR8DtoxHz249/xyMlH1gcMeH30+RL2WzmL9uGukCeApyAzcuQ5Oc6PqQIg4eo6
	oE1a7VEWqvBRv5ytaT1hUDibmjSVE9YuglPeDRninCDaqU02mzemCerPerNWzt73n1yjCZpCNjU
	A9EoK/FM/UrMA1p70hkGqKMmJhg/2kXBZDxP+h+LjQhvkgD26HRPmfYppQQxra/HdN6/90h9Bic
	5pITmvQJxKmgGYVHQHWdr30UV+oV+LFVdoK8tkDpCHpDhJ3HgJJKH8rSbJznv8F232x4+kS0CLx
	wS64ai+wrECss+QGfcf7JOl65ek+tx5Fy3KsGhIJOEcFv9WUwsOLqzi3mhecm0SQZnwcugv3/P3
	q86vBV5xGs2AtaOiCj/x/jicsLBx8VPlVPy275wse7/5jAW04znTz8A+3lQ0UU3KrU8YOt7oT+H
	kQ3f0FiUvVJUr7knHkohuUN/Qs6
X-Received: by 2002:a17:903:298c:b0:2ef:ee1a:1383 with SMTP id d9443c01a7336-2f03f1b9c1fmr286896585ad.3.1795611289644;
        Wed, 25 Nov 2026 04:54:49 -0800 (PST)
X-Received: by 2002:a17:903:298c:b0:2ef:ee1a:1383 with SMTP id d9443c01a7336-2f03f1b9c1fmr286896245ad.3.1795611289135;
        Wed, 25 Nov 2026 04:54:49 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm31940575ad.45.2026.11.25.04.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:54:48 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 18:24:26 +0530
Subject: [PATCH 2/5] arm64: dts: qcom: monaco-draco-evk: Add DLC0697 DSI
 panel overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-monaco_display_intf-v1-2-8a27d60b0d94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795611273; l=3306;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=t1iu/UukmUP1rPeoRLohY7HCiIH/GOHJHLLPgekQYRM=;
 b=tkflfCrwrIGgFE7FumuwrZqRHChbs5A/41RNQEztvAWQMK8JxpOnX6R7u07yKTDc0t8hC1acH
 TIjGCG7ayAODEDbaUZ/lyZQR1XB2aO5MmBAf1EOu/sCMTk4xCq/8A8G
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: wXU-8KFN0QZQ2TLBZtrJ7GQdHso5Xm0k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfXw+C8Bpb4SkD8
 Lko0JntEtMdYQduek4Isy215gBD/SeA9bQq1heIBISqrMhPhjV0mFSSjxP09KplngIh8r6BVqSs
 Ty7UDN6j4i/BbCYBGkz2jZpgGcEjjzE=
X-Proofpoint-GUID: wXU-8KFN0QZQ2TLBZtrJ7GQdHso5Xm0k
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b06da9a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=yVliWmkVY6MumjAL1JAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX0qspXeQU0a1E
 AKeI04EHXocYmqd9wfpvT+dYW97MMUlV4vpTwK9wBGSbwAosNFKpCl5VG1/Q2ToreOtJhgCvh+q
 RxZA0PdWWPDMWhHMkBYoWweY6kgU5oEdT6Ob2ztRJGgFXRit5//HAp/tCaJXmg6w66EdY+MDo0u
 MUxvp0TMhBFD5rqI6Hm8DEive8LQ0c0kDnCxGKpwutr50NLvaPNTyHel+RymGl/STtz5jNnZqxy
 S3E1TKidRrbqT3bKzw3nT9sWe5A51QYQ3px8JPtadYpPvxUYq8IJdqHLEjpNolqfi+fMH8KzQWo
 J9MpmdITWbaZkKGerry33d1ypRGz4Q+bygIC/Nbg2WH3yGwyWO7OLJkVGhhtJ/HDPSEmh2kP08U
 yUyLtUAKiMUKaCVXfL9inEQLI7ImNF1gw1n438dOJM8lBgZK8xAjDnzA3sGShR3Q28qd3eFI9K3
 bkaHX961dH6ysPfjTxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_045452_358973_5AC7D023 
X-CRM114-Status: GOOD (  18.25  )
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

Add a DT overlay to enable the DLC0697 DSI panel, based on the ILI7807S
controller, connected to DSI0 on the Monaco Draco EVK. The panel uses
four DSI lanes, its reset is on GPIO66 and the backlight is a
GPIO-controlled backlight on the I/O expander.

DSI0 is shared with the LT9611UXD HDMI bridge on the base board, so
disable the default HDMI bridge and connector in favour of the DLC0697
panel.

DIPSW2.4 needs to be ON on the board for this configuration.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
 .../dts/qcom/monaco-draco-evk-dlc0697-dsi.dtso     | 79 ++++++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 079e041af2d6..348ab62ddece 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -93,6 +93,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk.dtb
 
+monaco-draco-evk-dlc0697-dsi-dtbs := monaco-draco-evk.dtb monaco-draco-evk-dlc0697-dsi.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-dlc0697-dsi.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-dlc0697-dsi.dtbo
+
 monaco-draco-evk-el2-dtbs := monaco-draco-evk.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-el2.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-evk-dlc0697-dsi.dtso b/arch/arm64/boot/dts/qcom/monaco-draco-evk-dlc0697-dsi.dtso
new file mode 100644
index 000000000000..5e1aaf5376dc
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-draco-evk-dlc0697-dsi.dtso
@@ -0,0 +1,79 @@
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
+	dlc_backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&expander2 2 GPIO_ACTIVE_HIGH>;
+		default-on;
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
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+
+		avdd-supply = <&vreg_bridge_3p3>;
+		avee-supply = <&vreg_bridge_3p3>;
+		backlight = <&dlc_backlight>;
+		reset-gpios = <&tlmm 66 GPIO_ACTIVE_LOW>;
+		vddi-supply = <&vreg_s4a>;
+
+		pinctrl-0 = <&panel_rst_n &panel_te_pin>;
+		pinctrl-1 = <&panel_rst_n_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			dlc_panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&dlc_panel_in>;
+};
+
+&tlmm {
+	panel_te_pin: panel-te-pin-state {
+		pins = "gpio52";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_rst_n: panel-rst-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_rst_n_suspend: panel-rst-n-suspend-state {
+		pins = "gpio66";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};

-- 
2.34.1


