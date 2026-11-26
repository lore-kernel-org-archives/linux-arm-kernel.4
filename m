Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3CD606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 01:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=324FmFB8;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=A4hjAcWH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3BoSfm7/XQ1CSDARi6b2bNwWVNKlNVvQ1AJ7WPFNqcQ=; b=324FmFB8kN6zh2
	Yz3OaXJutgR24JKEV7A3PFSRrz7omDRfrSPtjcEQOuExqvZ42hUKx4VapzIbAmAXDfhNKeyovoJEM
	/1j+hKJc711L8egzG0m/euypPaolTE1xEd5bMQ6NVMapIO2rUu1ucKFD2vMULYfKlh4PjbXXR/8zc
	lcL/IAhTCzNIdMz4XejDvQorK5ap9SWpCiOn0kh0MZVL+8JlNlSaeustGchuk2KBZzWjVK21o2Wxk
	zfX3+jo9evoX+fUBTWh7Gx1IZamMVnDUL3LXySlL6ygpAuJouBZTQur58kp7BAeRh6om05b48UCwd
	RyXbycwV/WJDZi13146A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWO6Z-0000000BmjE-0Yau;
	Thu, 26 Nov 2026 01:16:57 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWO5N-0000000Blgs-1Blt;
	Thu, 26 Nov 2026 01:15:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795655734;
	bh=wtCH3syYAKk2d4XryHe2hVDbNwcRc1QPlwDTk7hxaVk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A4hjAcWHc5/XZcw5QWt1MtuFYuKuqbqU1ehmuuvPZgxFzkP8STJN0l+KUdwpn+5tz
	 VhLlHAALoVALOROKtCUVkOv2j6XNN5DIpPRav93EH03kUbtBOdtB86CzZS9GZG+jVe
	 nhf/Xg8leX9e2dy/g5PoUjJ8E9qA4wq6aKLt6t5+dKVybkDwk/n43NmZscRjz+RLzi
	 Izba3CUTs4w5yHcG77hAQYR/NcicVQBwhHqozac8P2KU8MtWEK9IwWYtgLQ7NbDbSJ
	 D+td+CnStzraIpBDElrvO16bIo9w2xX+4sJW5Ne/M5vGe11/vNJNUYPJ9rcSU5wgPA
	 4TVtPHftgO35Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7DDC617E1550;
	Thu, 26 Nov 2026 02:15:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D019848004C; Thu, 26 Nov 2026 02:15:33 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Nov 2026 02:14:39 +0100
Subject: [PATCH 11/11] arm64: dts: rockchip: Add USB-C DP AltMode for
 RK3588 Jaguar
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-rockchip-usb-c-dp-altmode-v1-11-7991eb5bb426@collabora.com>
References: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
In-Reply-To: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Cunhao Lu <1579567540@qq.com>, Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5958;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=wtCH3syYAKk2d4XryHe2hVDbNwcRc1QPlwDTk7hxaVk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsHiDVe8nGuG88cfnqL6hsfwDsjsQh7G1LWp
 c4PJeTiE9/YNIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrB4g1AAoJENju1/PI
 O/qaVO8QAID7VFjhQr9OAuJGAnTIZjQnTOaVCPyyoBTPgveY0nc+BBPUTzbl/O/l8O2xHuaDBhX
 udSKrYSf9veE+FmxDkzIxx4YNdQH8zrWTszuq6VpfLGlykc+9Ql8n8DwVW052VCY3wf5dldxNvp
 jE0cVMnGWnUirsOldd2vTnwEOmoC8IFXXhcJjwJG0obML9TXi62E2mityijdQ6253noinYI2+SN
 n9YCYlBclj0IiqzdqWp7N0zfYunVds8K+vxM8gY0f8B9ILcVy+zrwmW+QPicNVhzi/M1Z6bdsHM
 eNEvCxTK1gM52EGzLnqq2ynWRoUZQnSlsMsIFYwARUwddeZe2BFMLk7Ax/0qI1yfh4t48Mma9p7
 Q1nYmXWlQYjoABnBAEO5ZYJXvTrwDjbl17FwdKSyetv1ObvqVefX3lo57VOiqjSC4i+FKbGOLrw
 EWxiMH6rYNijeBan8tNjlFE9goGW8mIQbO6q2PTtQTxv6sk2ZaWHYBVjTHfmIM/s9WQQ2oQ/6Ia
 CLhikMHSRzOjnpkZvJ6wEyBo8OqraJJoF1Hcz/MbKYJodcDezeDT6uWZFppUMiVwaeVbl6eZ0lp
 v9RoaCNHfCbWPVk59rrcOH720Qj8LezjZz8yXmrC9AzfMJRSvA4CMpj5K5xtvW+4DwSK9I9obKw
 zVpeOSRCekBbUQ+HgZuYpjg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_171543_009104_9DC5213D 
X-CRM114-Status: GOOD (  11.88  )
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
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts | 168 +++++++++++++++++++++----
 1 file changed, 146 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index 0446834e84d5..fcc4a043b299 100644
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
@@ -375,7 +407,7 @@ port@0 {
 					reg = <0>;
 
 					usbc0_hs: endpoint {
-						remote-endpoint = <&usb_host0_xhci_drd_sw>;
+						remote-endpoint = <&usb_host0_xhci_hs>;
 					};
 				};
 
@@ -383,7 +415,7 @@ port@1 {
 					reg = <1>;
 
 					usbc0_ss: endpoint {
-						remote-endpoint = <&usbdp_phy0_typec_ss>;
+						remote-endpoint = <&usbdp_phy0_ss_out>;
 					};
 				};
 
@@ -391,7 +423,7 @@ port@2 {
 					reg = <2>;
 
 					usbc0_sbu: endpoint {
-						remote-endpoint = <&usbdp_phy0_typec_sbu>;
+						remote-endpoint = <&usbdp_phy0_dp_out>;
 					};
 				};
 			};
@@ -488,7 +520,7 @@ port@0 {
 					reg = <0>;
 
 					usbc1_hs: endpoint {
-						remote-endpoint = <&usb_host1_xhci_drd_sw>;
+						remote-endpoint = <&usb_host1_xhci_hs>;
 					};
 				};
 
@@ -496,7 +528,7 @@ port@1 {
 					reg = <1>;
 
 					usbc1_ss: endpoint {
-						remote-endpoint = <&usbdp_phy1_typec_ss>;
+						remote-endpoint = <&usbdp_phy1_ss_out>;
 					};
 				};
 
@@ -504,7 +536,7 @@ port@2 {
 					reg = <2>;
 
 					usbc1_sbu: endpoint {
-						remote-endpoint = <&usbdp_phy1_typec_sbu>;
+						remote-endpoint = <&usbdp_phy1_dp_out>;
 					};
 				};
 			};
@@ -1102,6 +1134,7 @@ &uart7 {
 
 /* Type-C on P11 */
 &usbdp_phy0 {
+	mode-switch;
 	orientation-switch;
 	pinctrl-names = "default";
 	pinctrl-0 = <&typec0_sbu_dc_pins>;
@@ -1109,24 +1142,47 @@ &usbdp_phy0 {
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
@@ -1134,18 +1190,40 @@ &usbdp_phy1 {
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
@@ -1165,9 +1243,25 @@ &usb_host0_xhci {
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
@@ -1177,9 +1271,25 @@ &usb_host1_xhci {
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
@@ -1208,3 +1318,17 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
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


