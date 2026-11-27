Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D870606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R7jJxqfW;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=a2GVDIqu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AftxNf3tYTBwIKs+kkGfCDejnDzmlWG/RiMVlQShfiE=; b=R7jJxqfW5uAV0l
	q5IlkQmsNdB3FxSI3H99aBEcFje8YYF2KvrvOrJESlJwu24XahJFj6qD6P6i9PJsGfnS1BTqNnIET
	bzV3NAxlLbZrt16o3bGX4KKgM4bersBL+KX9xW3hZMAc//S+T7tRux8dxtqfjkKo1e4YI0T8m/+uC
	CsXiJAiOp9RaJiy8CBf0iZi7c8jB1tATzGLiabfWup6BooYY/HyP+z+MDoJOqq4PVpm3C/3IavKTo
	3Dfi38csVe8FrrpAUNkXeMqSsHwrDcrakghkct5ezZFApjMGZuXpXIPULeDdLuyhx1/icSUeXA6z6
	8AoelpQP3qUgUj+bO8ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtYW-0000000FgSj-3TiH;
	Fri, 27 Nov 2026 10:51:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtYU-0000000FgQf-1cE7;
	Fri, 27 Nov 2026 10:51:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795776708;
	bh=Gv+cLHwgunqeMtyO4yiB1Qcbps2qbpKw8xllMJNDfgk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a2GVDIquWI7UHJLazdtwmlN0Mre37c/BEaZUuuh6ttm6Qwb0e4sh6hFVfzLzvA4hl
	 ay/1KAHcYUibsQNZIk1F4EWtXPyaEIc11f+8CCbL5YXnusU6MgPK2+FZQmd6WC81nP
	 +u3pHsAoBkwlYFejUaPG3R7uCZ1JkbvLoOb/7xiA5lTGnL5V5ZxWxoo2eHYktSvq+4
	 LJ0tEs0v55sUzDgxVwazve7Vqb6FVjAhhwOue2wRD0e7XCnR00QB3Y0b90M7BHVDom
	 rtrg7guKe0SBHopBZaSP8fps7IDZkSqpJGSOry3i6u0B8gqYXXyE201ZTHYAHsQ+Sj
	 mgXS3vjHRQC8Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 49D5B17E07FF;
	Fri, 27 Nov 2026 11:51:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0BC80480035; Fri, 27 Nov 2026 11:51:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 27 Nov 2026 11:51:41 +0100
Subject: [PATCH v2 04/11] arm64: dts: rockchip: Add USB-C DP AltMode for
 RK3588 EVB1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-rockchip-usb-c-dp-altmode-v2-4-77ee78869307@collabora.com>
References: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
In-Reply-To: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsJYMOqz88dDNIZZYpOiGFjs4/QzCbiiueQI
 4b5XFLkUkVF4YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCWDDAAoJENju1/PI
 O/qagB8QAIJTe8jG2e5l34BGUCYSSDUhRvSRntaERhs8UVZEanshJFxO7cQdVVeuK9At6IdiSNZ
 mWviiiRLj81zw4fTKAtEdVxrkB/WFwEEvzmQgjr81AfVd1zcnXC5NYgQxi01ETXk66l8+Ed1atY
 QSiNHNLNymGjqNrV54yGpLa5dxf82G4Gq25EoPw1P4N4IHrsUEhWm3QzX5Q+/rIjfrMijdKNiS0
 NqUHFQEDvUaWidWZAC2rw2/XWlpj+vL47ACJZBKfLqOujgvXZGtMEaI9/illV06yO4ENrSg6n7z
 ORwPHPQBiSnSCLhLhTvfPrF2yUb/oFUOx1oh3rk8E9XS2Hip2QGzYSwuk+3qk5FBMLJGCO26dtn
 +YWL71eyvp8w/QI/cY58OJ4bYulOKwsk+YFs8ksaLnEMzDqZowrWluV2QcANnK5LTJXsGcs6QwN
 08R4SoMWRukFP48oaVY61YZDaa79+utXPfr8z4xXOA3iKp23uxiDxjGXvXepYUTjH7VS5D/ouA7
 CTiBF4n5LHfESywgWJKZUSyhlCMkdXscGwrvoD09KbinwtKIv4Gvc/RbscvIbqXbwePYVf+Qv4l
 tm8Y74gyR4KvUIo7S8GKwjlWYG8Nu1W724ngaCe/DM/4LNZwsh87iBNsQnRHQNGIpdBYvVErU0e
 qdFZdqApjcHUAwmH7pBUrFw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_025150_587843_BA3B5B30 
X-CRM114-Status: GOOD (  14.15  )
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


