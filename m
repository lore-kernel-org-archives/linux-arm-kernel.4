Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9214606A692
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2cQA7Bd8;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=esalqPlP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CzXXkxWY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m0qvppSArZkbASP9QAvO28LtZ1jSmhVi2ETMvHqOGT4=; b=2cQA7Bd8xLEWBP
	iUcBxC/EJmvWVYy4KVwz2axZuL6aVkaWMffEjAykfoNbOCQK/upcOPAz6juAkhpB16oT8CavBqKgP
	2AALf8AC9B5SDPgBUwfzo1FznGPeV9K9vxb0mgzFFIoMLlNC6hB70SJWm1nUo6zv4+/yAzx37s7dQ
	x+QiWkps7YFsM4lw0uiOw/GINMVURuuj9OgS3m758UUvz6V8MVcMmbIY3Sea/eaD/tlOhsORUEovx
	L0O/DBIXroTRCkF+1JvZ/r3MQtch1pJqKuB6dsKbyyIdbVy5uHrsdZtklhWtAc3GivPDoFUXcG4QK
	SatFmB0v5Y6H5bW1DPbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCWT-00000009u0S-1mMh;
	Wed, 25 Nov 2026 12:54:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCWL-00000009txk-3eAq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:54:47 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mMJ42356506
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m0qvppSArZkbASP9QAvO28LtZ1jSmhVi2ETMvHqOGT4=; b=esalqPlPWxzP/g0J
	k4HZQD5ZVf0eKZcbhHw1/oEYiVEXXVs7XWeTqOWRsacrAZTMtPa6J1RuOM5t8fJ2
	bV6dkjzARDZtDaZvEgHdTWspQJZrdS3w/7O4f2bfBcpXeRob4GR+aIKy2WruZnLs
	n0FNr1RWA6oiT4/yUq5bX7j14c91IgJAIri8set26o9uCZFCCPg3znFb40urcUDB
	A+BbTQDLIJo4oM9ee7XZQ1O3Ekov+qJcDFOkNwcH31BTWqv6xM2fnUYDlpny90h3
	LKo9X2GV0NK5Q0KF7cBjBtCxwNRXnf0BDtoD8pytwK/j/H7s3dncgD/HEVzyzSn9
	Y+D6ig==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu6akkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:54:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f01caa8ab9so6289055ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 04:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795611284; x=1796216084; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m0qvppSArZkbASP9QAvO28LtZ1jSmhVi2ETMvHqOGT4=;
        b=CzXXkxWYTNm+kZjEJvOvL10HUJdk/R9iroXMvv4weZtY0PbKjG6ZMB6MN9PkH99gCm
         oG+33l7kw+iwZEA7d4pWntDvpaHuDE3H3xsklzyKMQM0ckhRuHVSVwaTRVkzbVL2pKMJ
         mVwCNNZKrInSNGsHz0/V5ts4gPNK1p+zU3pt5VcshPfTUNtMSiwpYF5orq08IsRrghhE
         PmfKKT+3KXVE4q8nuyFlRJYIEubzCcBsan6xuxdXOFsZ1lMH1LPITEvl9KUeRub72YoA
         OtIHMol5MgQEeEUP1n/mWT1bup+4+T6vdD4+u4u302QguR9XzdDUODQGmNKj8Ej7eqcx
         pQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611284; x=1796216084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m0qvppSArZkbASP9QAvO28LtZ1jSmhVi2ETMvHqOGT4=;
        b=PAkdvGGj1Dllv+XynINOJZ4iwbCbfgMKg4IsMfhYPfpGNI9HEBHKavB7ApVH5OIHr+
         xYGyVq1iZSDm1kCYgJVCLftQzmfVONg+7X2FQfF3UB2Dl6dPrHKvcS6AkcgOqFOGUsnC
         of2TAGgiK51WuCEQP0qkJbYxqnJ5idNsz+N4+c4RnfP3y/t6VXui0qLcCvlRDrugEraj
         CHMzRMx53pePZtquCljJ1Ve63HEMojESNHDNiXCrMUPy4ewc5Cncu3QYiyRcvjKBtDrO
         twRB0w0E5Rz7PS6ZIw6uzCCfFtekDpw2jP0WVsGYKG2bmsHhAsfLaKcyf0OW7x4o/HJU
         kBnA==
X-Forwarded-Encrypted: i=1; AL+hErFvTpEQwkQgYz+Xp6ai/KKwMoWha/ODIShHSycx8n9SXh+fRHt1NM74DaMB4MzDaQR5rLZo/khQcton6VbYyeMG@lists.infradead.org
X-Gm-Message-State: APuU4Z/+5uSX/ExyNZNZshAn0lNtxRv8yVZnHzmdTsMTvTkylFMv6Rpr
	iPhY218tjHR4yG/j5t6lqXWXwVDXpAjHouASXWBloCC3jO0rJqf34E36V+DdVu7e21VhsZ4lfKJ
	1YhTOPKmpQTe+no1ReZxXD++i6pmV+CSwzTRONbVMcsqLn+gZq+oeapDaDLfXydR8CTQwePJxcf
	0woQ==
X-Gm-Gg: AZFdTZdyZrEJHMc3Jux6NEAN6xX/3zyAw8jsTDnX9BsA6T455Wg96/glfOG16ACKIlD
	EdFrOvi1eaAaw3ynjQIiRdwkVHuFNRy0bXYjIbmhb6XIqr78j3gk5l/aIz9dhwM12oVln8xko1A
	KIK/Rg1ydnor5oV3JCiAi4WmA9WAsvf9IS+qUppAnbhdxufIXXADFp6QA5wPUGCX87A6p7THcEV
	sxhAfUSGRNcbBUFYUDbOxtqh3N9fnhnmeOkadcn2jTzDtiSToCQf8I1PIWoCCgFkLxwIHGO+il+
	oeIEBleqfVlygd3SnhwBkc8hG6MRHfdFZHt4w+50Ei4vhy5XrZvyT2mdcHMcbLPTVOzRQq7rgU5
	IP2D9OE/YUS5abPEX0lOkL2SRy3ueCvu1GG2rSSnF1IoHk4rlvRyd+Ica0aU34H1Uj0j9JHB4a2
	OaDdrt+S2+0mzWhebJ4wCd/uVfXnR8y3Qey6sUY5RRiIM5PZOWbVVqjyb1u8KcbtI3Vn3l90vE/
	BxNgkP/v4c1/k65zTErIa1mpItN
X-Received: by 2002:a17:902:e948:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2f03ee6a938mr277094705ad.0.1795611284312;
        Wed, 25 Nov 2026 04:54:44 -0800 (PST)
X-Received: by 2002:a17:902:e948:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2f03ee6a938mr277094355ad.0.1795611283782;
        Wed, 25 Nov 2026 04:54:43 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm31940575ad.45.2026.11.25.04.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:54:43 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 18:24:25 +0530
Subject: [PATCH 1/5] arm64: dts: qcom: monaco-draco-evk: Enable DSI to HDMI
 output
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-monaco_display_intf-v1-1-8a27d60b0d94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795611273; l=4094;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=wukGK8SFYBcyix28xgtPVXDGmh1LmddhG/WWF4guGB8=;
 b=IvIHPijtCs8lIqvB+7dTACq31qISg1IFESAERxJibCntNxbGAlDhqyzXs/QzmB2Ky2r+4jhPF
 eEbPILGueAvDidyx232V6Brpo9BmBZTFk/BXnLFHqbk2LhlCmB+CEpw
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: W8vmO-sPs3GPQsHxIMXOHHJB0JW5uTep
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX0oU9qFW1oOcC
 q/B88S/vNX+co2qpY7GjlNSaKzkwUeT3FN6nfJPcM11xjWYVTybTC/tzx5oBb9XhIjiZG+g/zwP
 OI7lc6RZqWJ/3n0WlY3wZeDYsqO60MI=
X-Proofpoint-GUID: W8vmO-sPs3GPQsHxIMXOHHJB0JW5uTep
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b06da95 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=u4DayWPH-NzsctlWCTgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX/0IzLmhmOYZt
 BAd0qe/DMf3Ma1fgh25GKNqAdN3mo/buxGZNiSBH5IFGhjJtYgKnXrwxXK1hVTeKqhJ62W06YKV
 WaQ4l5C6fChfNAJkEbsBOFhOUEebLhPucEqa2IBHEM18GbpZvpU2VHTKC9yQwMnB8VVr5IXYIUe
 VlWvVbY2sQMd8YQGLahaTYu9DVj678Ze9/4zJafNXID8TYouOesjbUcJLwxupPC13nf6w7SgpD3
 ostdpQMwoai6OZ258AFCxqHlMoo1DZwLO+oBTN3I9P0UYwZDnesIF/x4IzbCmlymD+TOETt4mA1
 M9I4MzJ/tCil3NrTbjvresRDqT1UOWtKXWU1xPQXpI8lu/d58BvZApHXkQYXGQUFCZqGxXgTXs2
 M09QYMTAUg/lcpFtGR17/zRvRt7edcN8caLRWwcIo5Wy4DZv4jzaQx66dKcYWVgcT3NXoTJBqY+
 6AB76Q2kg8Y4EbA32cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_045445_940416_5FF6C408 
X-CRM114-Status: GOOD (  17.98  )
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

Add support for the Lontium LT9611UXD DSI-to-HDMI bridge on the base
board DT to provide HDMI output.

The LT9611UXD is connected to DSI0 and sits on channel 0 of the PCA9548
I2C mux on i2c8, with reset and interrupt on GPIO3 and GPIO76
respectively. It is powered by a 3.3V fixed regulator enabled by a GPIO
of the I/O expander on i2c14, and a 1.2V fixed regulator derived from it.

Also add aliases for i2c8 and i2c14 to keep the I2C bus numbering
stable. i2c8 is used by the HDMI bridge directly and i2c14 indirectly,
through the I/O expander that controls the bridge supply.

DIPSW2.4 needs to be ON on the board for this configuration.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-draco-evk.dts | 113 ++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts
index ae34538e6fd3..3e1b18de8920 100644
--- a/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts
@@ -19,6 +19,8 @@ / {
 
 	aliases {
 		ethernet0 = &ethernet0;
+		i2c8 = &i2c8;
+		i2c14 = &i2c14;
 		serial1 = &uart2;
 	};
 
@@ -69,6 +71,34 @@ dp0_connector_in: endpoint {
 		};
 	};
 
+	hdmi_connector: hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_out: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+
+	vreg_bridge_1p2: regulator-bridge-1p2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_bridge_1p2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&vreg_bridge_3p3>;
+	};
+
+	vreg_bridge_3p3: regulator-bridge-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_bridge_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&expander2 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	wifi-bt-connector {
 		compatible = "pcie-m2-e-connector";
 		vpcie3v3-supply = <&vreg_keye_3p3>;
@@ -261,6 +291,57 @@ queue3 {
 	};
 };
 
+&i2c8 {
+	status = "okay";
+
+	i2c_mux: i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		vdd-supply = <&vreg_s4a>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			hdmi_bridge: hdmi-bridge@41 {
+				compatible = "lontium,lt9611uxd";
+				reg = <0x41>;
+
+				interrupts-extended = <&tlmm 76 IRQ_TYPE_EDGE_FALLING>;
+				reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+
+				vcc-supply = <&vreg_bridge_3p3>;
+				vdd-supply = <&vreg_bridge_1p2>;
+
+				pinctrl-0 = <&bridge_rst_pin &bridge_irq_pin>;
+				pinctrl-names = "default";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						hdmi_bridge_in: endpoint {
+							remote-endpoint = <&mdss_dsi0_out>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+						hdmi_bridge_out: endpoint {
+							remote-endpoint = <&hdmi_connector_out>;
+						};
+					};
+				};
+			};
+		};
+	};
+};
+
 &i2c12 {
 	status = "okay";
 
@@ -425,6 +506,23 @@ &mdss_dp0_out {
 	remote-endpoint = <&dp0_connector_in>;
 };
 
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&hdmi_bridge_in>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
 &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -624,6 +722,21 @@ tpm@0 {
 };
 
 &tlmm {
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	int_codec: gpio-irq-state {
 		pins = "gpio51";
 		function = "gpio";

-- 
2.34.1


