Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6905E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 01:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kLpZPUx9;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=PhmIRj+t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AftxNf3tYTBwIKs+kkGfCDejnDzmlWG/RiMVlQShfiE=; b=kLpZPUx9jj/pi/
	iZ8c+NgVkcGv3XQA5GbPPKob/K51A91j634CAY3An5iJQUat/5ZnNd95wqI1fTJ2CBV6jsIV1wijM
	vax8sJGHwj8wO577kUkTmPF3mGVnEZ1fFyr/tetV7UrJfNq0U2ZC5T7mX+CF8ERw50jMPmD5oWwWU
	wVPV0vNSuu54CBUR4GsGa3U5obNDaCFVYktpXmmRTW/VpPPl+xW2ZXHCXyg6JUDK7xGOlWT/Kqj67
	Y6TogpGFEpoktkgUODuEBVuCJsBYeB9ShVzbJacOOg/dDOnDh+8Yw02r4Sp8CWIMzw3rTE68YLF0C
	A0nBPNh0V/Xcnq2Pbsqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWO5M-0000000Blhb-2h17;
	Thu, 26 Nov 2026 01:15:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWO5I-0000000Bley-3X29;
	Thu, 26 Nov 2026 01:15:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795655734;
	bh=Gv+cLHwgunqeMtyO4yiB1Qcbps2qbpKw8xllMJNDfgk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PhmIRj+tayfWkquZlQDMcqaM8ruhri6O2jP038nGMANl8gt8YdmHAnx/wODrdesc9
	 wiTBK8ub5tfoh0jEZ/ImfNM64N4GIe6+7q4AF9EEWG+n/8QNxDi3yz/RAYkCcuWLFS
	 Lbx6vqo015qwcnS/zCn0pYam0/8rdo5SU6+WSBOTGHgFrKig+NkZzsrg2iHgWC2w2M
	 jQ0Hd4i0cKnSdOh6xTnAf3cm/96+vSt/ZgWAcK79cPsBuXTUV9pHtHvZGpHH4Nl3+J
	 JQF5Oy8GD03WVVNv7n6NR5GjFprus5jasa27Ra5/qDekif0W3Ic3XLQWDBWrCl4Jhk
	 r8NRcQ6r2dk5Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 15B8D17E1202;
	Thu, 26 Nov 2026 02:15:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C3CBE480035; Thu, 26 Nov 2026 02:15:33 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Nov 2026 02:14:32 +0100
Subject: [PATCH 04/11] arm64: dts: rockchip: Add USB-C DP AltMode for
 RK3588 EVB1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-rockchip-usb-c-dp-altmode-v1-4-7991eb5bb426@collabora.com>
References: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
In-Reply-To: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Cunhao Lu <1579567540@qq.com>, Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4022;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Gv+cLHwgunqeMtyO4yiB1Qcbps2qbpKw8xllMJNDfgk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsHiDWueIsDrMe+lHEbGUxJwYoSWVBn8y0Y1
 RRYjYyJzK3eiokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrB4g1AAoJENju1/PI
 O/qaKNIP/jYaTmu+F2/3JDaIdBTK4jCrJKwmqy3jvt1tL8TJujWd7OOxv6q2EQ3opFtN/Wcu9z7
 QPW6ilQPhHmfG34SPMOflw+L84OJOHf+jqygkQDlY3mg8YKWj1/RCa43YVgURmQK24nRdA/Meaq
 Tv+m6u9XS78wlVXY/Bas1HSqlozUFDc8wVN+hza8LzscUsd7hUowLKIZCiIWb7Lt87M95ljXWT0
 tNT3jz8zHPgExUjSBKMZ89awPzaploVrl53RKcRBxsxf5np1w1aeSVa8+9Ddwq6tjckB6fWwalI
 dnrtyZAy/h7uS9B5D3gId8FnsFa0BCYctHshxCcpdcs8GlgGO6Wf0OiRVVgbSg91v8WgGhPG9tj
 8kcqQVbxuEf2osmctKfrsnzb3wjerDpxNHfdx+9uAhwojQKy0vpsImnM/qG+FviZ7T1zCsRfp1F
 DbJ8VlIzORT3suNrL+BOxdVOx0Gv0WXn6R+/odNmb1fqVTLoVFv17TRbBqFUK9IFSgZECH7KurU
 PPNq6ppeI7bJVZuclmaWShv6u3pm+c9U47wUy5OYipFYd8vfLhXXan/p3+201D9J2EKdybywoZ8
 9GTw12Zse2kOJcDgWHmnxPHolWqE+b/avGYCyF5vwIlmVZoLVqT40/rOWJZmVJq7HQ6zm1umiIO
 IwFxmHXxj2bxfGxVfY1QxPQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_171537_256673_3B39DF5A 
X-CRM114-Status: GOOD (  14.36  )
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

Fix the USB-C connector description, so that it follows the binding:

port@0 is the high-speed lanes
port@1 is the super-speed lanes
port@2 is the SBU lanes

This also updates the port naming, so that it describes the hardware
instead of how the drivers are using the information. These are
effectively the same, but the DT should describe hardware and not
software.

Last but not least it now correctly describes the DP side of things,
so that DP AltMode starts working once the kernel has support for it.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 92 ++++++++++++++++++++----
 1 file changed, 78 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
index f578e7dd5aa1..2c560d376f46 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
@@ -384,6 +384,22 @@ dsi0_out_panel: endpoint {
 	};
 };
 
+&dp0 {
+	status = "okay";
+};
+
+&dp0_in {
+	dp0_in_vp2: endpoint {
+		remote-endpoint = <&vp2_out_dp0>;
+	};
+};
+
+&dp0_out {
+	dp0_out_con: endpoint {
+		remote-endpoint = <&usbdp_phy0_dp_in>;
+	};
+};
+
 &gmac0 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy>;
@@ -497,6 +513,13 @@ usb_con: connector {
 				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
 			try-power-role = "source";
 
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
@@ -504,24 +527,24 @@ ports {
 				port@0 {
 					reg = <0>;
 
-					usbc0_orien_sw: endpoint {
-						remote-endpoint = <&usbdp_phy0_orientation_switch>;
+					usbc0_hs: endpoint {
+						remote-endpoint = <&usb_host0_xhci_hs>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
 
-					usbc0_role_sw: endpoint {
-						remote-endpoint = <&dwc3_0_role_switch>;
+					usbc0_ss: endpoint {
+						remote-endpoint = <&usbdp_phy0_ss_out>;
 					};
 				};
 
 				port@2 {
 					reg = <2>;
 
-					dp_altmode_mux: endpoint {
-						remote-endpoint = <&usbdp_phy0_dp_altmode_mux>;
+					usbc0_sbu: endpoint {
+						remote-endpoint = <&usbdp_phy0_dp_out>;
 					};
 				};
 			};
@@ -1582,18 +1605,40 @@ &usbdp_phy0 {
 	sbu2-dc-gpios = <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
-	port {
+	ports {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		usbdp_phy0_orientation_switch: endpoint@0 {
+		port@0 {
 			reg = <0>;
-			remote-endpoint = <&usbc0_orien_sw>;
+
+			usbdp_phy0_ss_out: endpoint {
+				remote-endpoint = <&usbc0_ss>;
+			};
 		};
 
-		usbdp_phy0_dp_altmode_mux: endpoint@1 {
+		port@1 {
 			reg = <1>;
-			remote-endpoint = <&dp_altmode_mux>;
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
@@ -1614,13 +1659,25 @@ &usb_host0_xhci {
 	usb-role-switch;
 	status = "okay";
 
-	port {
+	ports {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		dwc3_0_role_switch: endpoint@0 {
+		port@0 {
 			reg = <0>;
-			remote-endpoint = <&usbc0_role_sw>;
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
@@ -1652,6 +1709,13 @@ vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
 	};
 };
 
+&vp2 {
+	vp2_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp2>;
+	};
+};
+
 &vp3 {
 	#address-cells = <1>;
 	#size-cells = <0>;

-- 
2.53.0


