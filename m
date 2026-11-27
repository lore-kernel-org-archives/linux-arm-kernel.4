Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEDF606A338
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UK2Ii0gU;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fiocv4r3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N5uloL85
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DGbAE/320GNzPEcrHnbIjRGXx1fYivBklJt4FL24AF0=; b=UK2Ii0gUSxZreV
	5TFC2WZKHyRIMUKVZ59utri7CLxIv1DRTwMa2NjxBIbP766AQVJakiogMugxdWts9f6PKIH+3tNTj
	V93IiXJR9E8xHWlr7UFUgnVPsyX7Uwcc9UkSfCGF1b7h9pGsWwQ8MLiUoD8JJ4RMt5l+UOQKk7MRx
	buglp/pcBf847Kfg2UOlWVk7Dgp9RpdyQcaSfKeWuRZWhzf0ixEuYZFvViwkwZQLsPYMoUKLiGeCN
	LOKBiyrkuLQ88WJRVOh91WldVLD8dE+kpV6vD/W+VyGmKToLVfsebpx483hTQVBw4ZOLox5xZaldo
	WR1Kit4HOFHpt10Zgdbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWreq-0000000FJOy-0vKc;
	Fri, 27 Nov 2026 08:50:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWreM-0000000FJ9D-3lUo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 08:49:48 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GdRh905161
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 08:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DGbAE/320GNzPEcrHnbIjRGXx1fYivBklJt4FL24AF0=; b=Fiocv4r3+WrYzRgR
	ylvaa1j1Y4nn0x5m4z/PrPipQnhkhVj8NrAj12ZxAAM1UOzTmymp06SQluXMUIHB
	bsTUA6DD4E1dhSORqk9vKqN9mymsi2/f1rPiFWtJ3vDY4tTwSQKmYuYhu8HipMBK
	oq5VTyYcUtoOgHAJJ9qRMISBtSvCj952DB/T7TPoU+pXlSoO1yWNUqIzZ/jVXaSf
	QSBXXkaQJ8aR75rpZUXqNmrt/DxEl+bT8kvBDO/Rw4PeK3FHZm37MKuusnV2uCeV
	N/D/yQEOp2vZoCJhC7VXdEVPCAZrjHqC4YwuAjkXfBJVdn7nv5da05fvhXK8VUNm
	ldCS/g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru39qym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 08:49:44 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb8aa9c270so237631a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 00:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769380; x=1796374180; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGbAE/320GNzPEcrHnbIjRGXx1fYivBklJt4FL24AF0=;
        b=N5uloL85GS3zJYecUWL7B8miiRpMWqg+YN5/Ic7IQSdcP5hnPUs+osyUt4hKwVcaxC
         Z9d+SN2fkT+h53eHq8wGMwFY0K/68ZPz/Mh0JQJLMLw9/HQYWpfwaDInJB8HnZ6RSBBm
         a+eCFW1z5FyEkxV2aZ4CO9hXZkB4Ei33/T0w77eWlGFwS9h7mOSqB7yncJF4vc+HTrlY
         6N5v4MkmcJa53WTtaOK0GhUfHnpDeu1oUitHlvPTTlLngciEqDns+f78vxqqqLTB6g+J
         Sw0n0nJ6ZNQ6MQD4ZMZnPAG6fDIQ89+uqLdnXiS6wD9L27j2f7vdQGsilZylQGOlIw5o
         ATMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769380; x=1796374180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGbAE/320GNzPEcrHnbIjRGXx1fYivBklJt4FL24AF0=;
        b=JmzfY85X/hCayyf+9x9A72Gyo3wM1jCVltilGP+05/nFLu4YxPUevI8BvOFC0dJoX9
         63BaREC2RJlQ+LHuQxMqZ50Gk51/KE2gGK5BbMJqsLE+X+2vdotB/kSVw+E67FHgUTmG
         9SCi23PpigXNUHHc3teveOnnVo2vlRkMBax29CdQq1KirpJrAs+QA1UvsFSmPXvnn3tO
         PSFz3uXfnCeGDx/vm4ub37NRUe3mEzBxoxi84Lg2T11idN4U5lKtNLUVS7ExJW4b4yQt
         mPobX0HVFIm2Qt9p9Tk1B1mAETUEBCP+rNR40z/c8moXsw/VnHRBu4j1AZWwB5MmFD+T
         838w==
X-Forwarded-Encrypted: i=1; AL+hErFbl4OcUVLsrqlgmwEcaXxs73/7A4tnyADpI6FZDddhFmQ/5pjy8+4XvBtaqXr7cenpb7QCZIRHF398cSYbPug0@lists.infradead.org
X-Gm-Message-State: APuU4Z/WpHLKZiMUlAph/YFCCGq+H2wiMU+ir9JUBC0yI2MmFVXfBsYx
	UkicsFN0rgqaR5OJPGUEH+MISlK1z9+LiAytnTg6v/fWzhHj4Z9wauApQwwn334HnQ9Qa1ivMy0
	94ZHay0dza8D6/TGovhGh++kE65yFXKW5CvPeeP+upmhHMljDBPVK469Z/FeEu2P74IPWUjpwEi
	pqsw==
X-Gm-Gg: AZFdTZeX6rNL+yj/rruBA4F3QNQPoeoM4+2xi8twu3RA+AfcflJxzYzMiLlLXjFwm7H
	s7zztdhg/nabdIfbqcgmjzFhPXu2pKwEJwx8kDY5vChDanwfTTEZ2jdNdJL0gc9rIQzZ68YjLzk
	grPWmDx7Ur2JJvMhlntxgXGbemHZxTgECjwDBaytPs5yfDaRWk/NZdv8Xi7iQhKQtD6iBMOhZaI
	CFIxdgunaoz3ymLD8tnKX0sLyxiVHYw1McrBbY9ZmN5L6ZjpRW7neyY05f6QJthrwOu+hgKNy3K
	3t8bX/8NoIEQw1jTNhX1ATRscoBe1Pn8I66VykiUDbS9r3hHdegL6eXgrmDdSFfl5uza6yPpqVJ
	HEnMnl2NVRq0liz1hN2Zm0Dj6kYygxXy8MQ8wJ3l5/irpdxJz9PAi/kQjL71KWwQObupEkGoLSx
	aMYj8cVlJahaNylYkSzCfVPDAYqip75xErWVR3450mVfkNK+5r7ZrAt2UhvNzrHaAiBjowpT3X6
	XFTjSrCiV+NDLdRf9TNnAby/LHUjg==
X-Received: by 2002:a17:902:e38b:b0:2f0:7707:227c with SMTP id d9443c01a7336-2f0770728c8mr194869725ad.4.1795769380465;
        Fri, 27 Nov 2026 00:49:40 -0800 (PST)
X-Received: by 2002:a17:902:e38b:b0:2f0:7707:227c with SMTP id d9443c01a7336-2f0770728c8mr194869475ad.4.1795769379993;
        Fri, 27 Nov 2026 00:49:39 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:49:39 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:23 +0530
Subject: [PATCH 1/7] arm64: dts: qcom: eliza-evk: Enable HDMI output
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-eliza_disp_all-v1-1-a18be7f65fd4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=3172;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=Tc4IF8QhApcJLjNKZX1uGI6mMT6TCVFK65N6fccSJGI=;
 b=DUR+qCC7na9KJSaIm53BA7ckVADIAExITbGXHQEnEBNeAp+YuPPK0eKm5sSQEhyYEb8hfMPF/
 QiVLFhHJBQwC4r1tpMLczv3Dk0BKy5sTxaza0+wpFI5uU0WbesBAbK1
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b094428 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=sRTJwmOA1GI60g-zRKgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: loZ2pFruR3KhcQ6WnJOEYMVA1AYgK__Q
X-Proofpoint-ORIG-GUID: loZ2pFruR3KhcQ6WnJOEYMVA1AYgK__Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX9MJ9B3SXnz/N
 oFscRpxm9ofAn0IOEXWonB6O3mnTaEIbuu87muMBOb+21KlvrftmyG2exdPrvKp8ugOEVdkUSCg
 eNBBYqF2w2FhMBParkaTh1Q+Eywb6y7wBExOlOlctKvwyShjVh71ur9DqrWs7iPnYBtxiz1Txst
 eRBqeQDb8AGDsZJ5tj1dsRk+I2v3KQWYDmg+X6JN5S80/kKYARzYlQByH+nRfyHcxYju19by4Ok
 pmJL1rL1GPl+hWH78AcUWmXHtjyud5W7kZKEs4r4KYKB7spsgn6FObJwnpA0avhty7DU5yfqHNU
 KmYnOcp6Iv9uSG92BqxTf6YXd6TsHCXvxZk0isbZDWcGtU4B4sS7CzPWO8cJerdE5Td36GtBjuU
 L35WOD79jEzLUNJC/HgVlUHHwPIYUrND/Rh9YAi2Y1cFv2oltShz7UspyFWgAgH2z/lkY/il8gP
 IEAateXR8bUHLlka3RA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX2unso02Ltbng
 XJtxXzhh4VJseioEASZOFh1uRpS38gFhzoIn7Y8r+hnatdlMxqh2vSH1IYYT7FJghbP4PXIjZ6+
 kT5UhpYkUDJkoy1y3aAa67vZOVr+zcM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_004946_960211_CC74B2EB 
X-CRM114-Status: GOOD (  14.69  )
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

Enable HDMI output on Qualcomm Eliza EVK through the LT9611UXD
DSI-to-HDMI bridge connected to the DSI0 B2B connector. The bridge is on
I2C8, with reset and interrupt lines wired to TLMM GPIO16 and GPIO13.

Add the HDMI connector, fixed 3.3 V display regulator, bridge node and
DSI0 endpoint wiring needed for the HDMI DSI0 B2B connector path.

The HDMI DSI0 B2B connector path expects SW3.5 to be off.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 90 +++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 8c663ef6718d..734bea47855c 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -7,6 +7,7 @@
 
 / {
 	aliases {
+		i2c8 = &i2c8;
 		serial0 = &uart13;
 	};
 
@@ -220,6 +221,27 @@ m2_e_uart_ep: endpoint@0 {
 			};
 		};
 	};
+
+	hdmi_0_connector: hdmi-0-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_0_connector_out: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+
+	vreg_disp_3p3: regulator-disp-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8550vs_g_gpios 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
 };
 
 &i2c4 {
@@ -238,6 +260,45 @@ gpio_expander1: gpio@3c {
 	};
 };
 
+&i2c8 {
+	status = "okay";
+
+	hdmi_bridge: hdmi-bridge@41 {
+		compatible = "lontium,lt9611uxd";
+		reg = <0x41>;
+
+		interrupts-extended = <&tlmm 13 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 16 GPIO_ACTIVE_LOW>;
+
+		vcc-supply = <&vreg_disp_3p3>;
+		vdd-supply = <&vreg_l8b>;
+
+		pinctrl-0 = <&bridge_irq_pin>, <&bridge_rst_pin>;
+		pinctrl-names = "default";
+
+		hdmi_bridge_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_bridge_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_0_connector_out>;
+				};
+			};
+		};
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>,
 		    <&dmic45_default>, <&dmic67_default>;
@@ -514,6 +575,18 @@ m2_w_disable2: m2-w-disable2-state {
 };
 
 &tlmm {
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio13";
+		function = "gpio";
+		bias-disable;
+	};
+
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio16";
+		function = "gpio";
+		bias-disable;
+	};
+
 	m2_w_disable1: m2-w-disable1-state {
 		pins = "gpio35";
 		function = "gpio";
@@ -541,3 +614,20 @@ &mdss {
 &mdss_dp0 {
 	status = "okay";
 };
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l4b>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&hdmi_bridge_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l2b>;
+
+	status = "okay";
+};

-- 
2.34.1


