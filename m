Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D57606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ngLM/Vry;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ek6yrIXA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HxtcBWZWgvzHdXMP1bP5jHFPX3eEJlRCwg5hvnUv5Yg=; b=ngLM/VryMy0+i8
	wHARL8j4ArzaIgg845vfO5Jjm0QGZJjK8KQBVNARw8eLcmFj/6dIlGhw9MQ4O+A+VYosYa+fS0S+I
	TfnnGBvllqkn2/7aqUnb9VYfzmkil4fyMmtO76/frcC8W0bfu8Un4yFHGxZUpE1YCTZr5TYUit/iJ
	DzG94LWFoOuy92nh96QwC85bAWeut2JGVaOIKxY3OSA7LclnJ/28E8SsxcDNnHflR7M7iu3tApyMl
	8deCkogbZKPNC0geyhkYcBK5Z6bC+Fv9Ioqrth82F4/wOriTeDOqvstRqAzlewXVHBdpuP/82zInp
	rpbzjNGfEkkXrlmDRY1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtZ6-0000000Fgy3-3m4M;
	Fri, 27 Nov 2026 10:52:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtYZ-0000000FgTF-0OLQ;
	Fri, 27 Nov 2026 10:51:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795776708;
	bh=bLT7/p31yej9A0BHu5GC1yHX78QpVwmRd/Nbhy5mNqM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ek6yrIXA0e4f6+bExFdDCycDhUaQfsFcpY0hcd/dRMuVDEfhD9hYdYs6pdZLeCzGY
	 rd+HL694qVdPJEw3R7pCKL2ckbdRr3zyIDDPDuuOsNE/Lp4rak4N7EALAnyrno3Hni
	 +04nEjEH2K7H8+PHzoP7VIr0Ieg8/2Wes6tT9v6I5G6wmxBXXCQDzTDKeOlpHeB+RI
	 XnLFjXPr8RJGwlYIyvhr/vwddxvu68pPou2+lvUP8SacrItNdBViKwwwc1IrKEyMgI
	 qqHcnoY8Cl9U+qEjKJg2IMN2HbXbzCarW2NU0qEDkNE9E1rGt5LrnEMS/2CFRqfaqI
	 vSCTKflRrQM+Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B47EC17E0CA0;
	Fri, 27 Nov 2026 11:51:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1821D48004C; Fri, 27 Nov 2026 11:51:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 27 Nov 2026 11:51:48 +0100
Subject: [PATCH v2 11/11] arm64: dts: rockchip: Add USB-C DP AltMode for
 RK3588 Jaguar
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-rockchip-usb-c-dp-altmode-v2-11-77ee78869307@collabora.com>
References: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
In-Reply-To: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Cunhao Lu <1579567540@qq.com>, Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6620;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=bLT7/p31yej9A0BHu5GC1yHX78QpVwmRd/Nbhy5mNqM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsJYMMJkVvjMfEuH8ZfMm8jbU72lJctpKqU2
 EFWGamhQMIMPokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCWDDAAoJENju1/PI
 O/qamaEP/0K6F8xXgDDvsTHjpdykIu7pn0+oOaJFYIl8v8aYy5jUines4Mfj9jaGJ8N5qBaZ5ch
 650RaBDuBVMFC9FTHMaq6piGBQu7jkglI0OHUTMYg5SMvreMgL0p3T+jMo1bWehWV0br/YFaoHh
 HUsAJmrCOaM0GdzS2YWMUdguKIWOkK65Mx+KL41mH7Bl6JjUuvFQPvUvIcicj710EY+w51g9kg/
 s/7SI2SqpwqW5NoUB6szM+9iIffdVNd9lq5v0aaO1vsTG//eYEuRRGiJ73Omq6hrxLWL3DxFeHp
 L0Oodbzo/ES1tCi+oJiYJbkqYrugzH31rV8YFVt+pHxJg+LouTZKm/hyhTc1jiYWWExR8QxAwP2
 HqYp50CD/8nKfcRp2TyUStIckMniS2vDppAJw7Mrw8+iPiivuPyVKNB9/mg/65R802vWfIUa7tR
 b2xmdDMptVPXJryTtv6EIIoQMSKRfXIVCeBB+km3WMyi1YKwV6zQzJpNamZQbxUzwonlpHFmu4f
 5jaUu2Iw/89Fg/vGn8xYMrsXjCHOLw4vJiiXPKJ2ksY7wtNnF2W+paaugRVaaUpj726+QOKAoOf
 0cpU1vAS8oCX7DFYo/5J+qhsgGQqhW60Kmx+SG5OITuPq79TnNbMa5UZUrN9Tw+6oG61lHzsIOO
 jU9Q5EDW6MRkxMbeKQTsx2w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_025155_397369_2649155F 
X-CRM114-Status: GOOD (  11.72  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Properly describe the USB-C setup incl. DP AltMode support, which also
fixes the USBDP PHY ports description for the RK3588 Jaguar, so that it
follows the documented ABI.

This also adds the missing mode-switch property to the usbdp PHYs.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts | 182 ++++++++++++++++++++++---
 1 file changed, 160 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index 0446834e84d5..f79b2281ff4c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -247,6 +247,38 @@ &cpu_l3 {
 	cpu-supply = <&vdd_cpu_lit_s0>;
 };
 
+&dp0 {
+	status = "okay";
+};
+
+&dp0_in {
+	dp0_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_dp0>;
+	};
+};
+
+&dp0_out {
+	dp0_out_con: endpoint {
+		remote-endpoint = <&usbdp_phy0_dp_in>;
+	};
+};
+
+&dp1 {
+	status = "okay";
+};
+
+&dp1_in {
+	dp1_in_vp2: endpoint {
+		remote-endpoint = <&vp2_out_dp1>;
+	};
+};
+
+&dp1_out {
+	dp1_out_con: endpoint {
+		remote-endpoint = <&usbdp_phy1_dp_in>;
+	};
+};
+
 &gmac0 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy>;
@@ -367,6 +399,13 @@ connector {
 				<PDO_FIXED(5000, 1500, PDO_FIXED_DATA_SWAP | PDO_FIXED_USB_COMM)>;
 			vbus-supply = <&vcc_5v0_usb_c1>;
 
+			altmodes {
+				displayport {
+					svid = /bits/ 16 <0xff01>;
+					vdo = <0x00001c46>;
+				};
+			};
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -375,7 +414,7 @@ port@0 {
 					reg = <0>;
 
 					usbc0_hs: endpoint {
-						remote-endpoint = <&usb_host0_xhci_drd_sw>;
+						remote-endpoint = <&usb_host0_xhci_hs>;
 					};
 				};
 
@@ -383,7 +422,7 @@ port@1 {
 					reg = <1>;
 
 					usbc0_ss: endpoint {
-						remote-endpoint = <&usbdp_phy0_typec_ss>;
+						remote-endpoint = <&usbdp_phy0_ss_out>;
 					};
 				};
 
@@ -391,7 +430,7 @@ port@2 {
 					reg = <2>;
 
 					usbc0_sbu: endpoint {
-						remote-endpoint = <&usbdp_phy0_typec_sbu>;
+						remote-endpoint = <&usbdp_phy0_dp_out>;
 					};
 				};
 			};
@@ -480,6 +519,13 @@ connector {
 				<PDO_FIXED(5000, 1500, PDO_FIXED_DATA_SWAP | PDO_FIXED_USB_COMM)>;
 			vbus-supply = <&vcc_5v0_usb_c2>;
 
+			altmodes {
+				displayport {
+					svid = /bits/ 16 <0xff01>;
+					vdo = <0x00001c46>;
+				};
+			};
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -488,7 +534,7 @@ port@0 {
 					reg = <0>;
 
 					usbc1_hs: endpoint {
-						remote-endpoint = <&usb_host1_xhci_drd_sw>;
+						remote-endpoint = <&usb_host1_xhci_hs>;
 					};
 				};
 
@@ -496,7 +542,7 @@ port@1 {
 					reg = <1>;
 
 					usbc1_ss: endpoint {
-						remote-endpoint = <&usbdp_phy1_typec_ss>;
+						remote-endpoint = <&usbdp_phy1_ss_out>;
 					};
 				};
 
@@ -504,7 +550,7 @@ port@2 {
 					reg = <2>;
 
 					usbc1_sbu: endpoint {
-						remote-endpoint = <&usbdp_phy1_typec_sbu>;
+						remote-endpoint = <&usbdp_phy1_dp_out>;
 					};
 				};
 			};
@@ -1102,6 +1148,7 @@ &uart7 {
 
 /* Type-C on P11 */
 &usbdp_phy0 {
+	mode-switch;
 	orientation-switch;
 	pinctrl-names = "default";
 	pinctrl-0 = <&typec0_sbu_dc_pins>;
@@ -1109,24 +1156,47 @@ &usbdp_phy0 {
 	sbu2-dc-gpios = <&gpio1 RK_PC3 GPIO_ACTIVE_HIGH>; /* Q7_USB_C0_SBU2_DC */
 	status = "okay";
 
-	port {
+	ports {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		usbdp_phy0_typec_ss: endpoint@0 {
+		port@0 {
 			reg = <0>;
-			remote-endpoint = <&usbc0_ss>;
+
+			usbdp_phy0_ss_out: endpoint {
+				remote-endpoint = <&usbc0_ss>;
+			};
 		};
 
-		usbdp_phy0_typec_sbu: endpoint@1 {
+		port@1 {
 			reg = <1>;
-			remote-endpoint = <&usbc0_sbu>;
+
+			usbdp_phy0_ss_in: endpoint {
+				remote-endpoint = <&usb_host0_xhci_ss>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			usbdp_phy0_dp_in: endpoint {
+				remote-endpoint = <&dp0_out_con>;
+			};
+		};
+
+		port@3 {
+			reg = <3>;
+
+			usbdp_phy0_dp_out: endpoint {
+				remote-endpoint = <&usbc0_sbu>;
+			};
 		};
 	};
 };
 
 /* Type-C on P12 */
 &usbdp_phy1 {
+	mode-switch;
 	orientation-switch;
 	pinctrl-names = "default";
 	pinctrl-0 = <&typec1_sbu_dc_pins>;
@@ -1134,18 +1204,40 @@ &usbdp_phy1 {
 	sbu2-dc-gpios = <&gpio1 RK_PB5 GPIO_ACTIVE_HIGH>; /* Q7_USB_C1_SBU2_DC */
 	status = "okay";
 
-	port {
+	ports {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		usbdp_phy1_typec_ss: endpoint@0 {
+		port@0 {
 			reg = <0>;
-			remote-endpoint = <&usbc1_ss>;
+
+			usbdp_phy1_ss_out: endpoint {
+				remote-endpoint = <&usbc1_ss>;
+			};
 		};
 
-		usbdp_phy1_typec_sbu: endpoint@1 {
+		port@1 {
 			reg = <1>;
-			remote-endpoint = <&usbc1_sbu>;
+
+			usbdp_phy1_ss_in: endpoint {
+				remote-endpoint = <&usb_host1_xhci_ss>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			usbdp_phy1_dp_in: endpoint {
+				remote-endpoint = <&dp1_out_con>;
+			};
+		};
+
+		port@3 {
+			reg = <3>;
+
+			usbdp_phy1_dp_out: endpoint {
+				remote-endpoint = <&usbc1_sbu>;
+			};
 		};
 	};
 };
@@ -1165,9 +1257,25 @@ &usb_host0_xhci {
 	usb-role-switch;
 	status = "okay";
 
-	port {
-		usb_host0_xhci_drd_sw: endpoint {
-			remote-endpoint = <&usbc0_hs>;
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb_host0_xhci_hs: endpoint {
+				remote-endpoint = <&usbc0_hs>;
+			};
+		};
+
+
+		port@1 {
+			reg = <1>;
+
+			usb_host0_xhci_ss: endpoint {
+				remote-endpoint = <&usbdp_phy0_ss_in>;
+			};
 		};
 	};
 };
@@ -1177,9 +1285,25 @@ &usb_host1_xhci {
 	usb-role-switch;
 	status = "okay";
 
-	port {
-		usb_host1_xhci_drd_sw: endpoint {
-			remote-endpoint = <&usbc1_hs>;
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb_host1_xhci_hs: endpoint {
+				remote-endpoint = <&usbc1_hs>;
+			};
+		};
+
+
+		port@1 {
+			reg = <1>;
+
+			usb_host1_xhci_ss: endpoint {
+				remote-endpoint = <&usbdp_phy1_ss_in>;
+			};
 		};
 	};
 };
@@ -1208,3 +1332,17 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi0_in_vp0>;
 	};
 };
+
+&vp1 {
+	vp1_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp1>;
+	};
+};
+
+&vp2 {
+	vp2_out_dp1: endpoint@b {
+		reg = <ROCKCHIP_VOP2_EP_DP1>;
+		remote-endpoint = <&dp1_in_vp2>;
+	};
+};

-- 
2.53.0


