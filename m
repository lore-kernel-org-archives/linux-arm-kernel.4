Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2A2606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LZvicyJJ;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BHEjngSj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fCaiiusRdlicCo6MECTM+2JnaQvvuMfb57eq/XpLE10=; b=LZvicyJJnbJy2z
	6pd6P/7wan/gKBZMoE29/TO3SpTeSpfIpNXPsR5cCgLVkSDdqYdEIcBOiXwGPnairaYsAp7b3Czr6
	sOnSUuFT3HEugTVhhrvRWFSCmTrRlh8rg4L1k/VGIChPP/+z/OQa0ZCgFiAofVX31a3eJbTxXnnTs
	nMwTUFV31nXWKeujyQjbIvF51KTZSz5oKaxgc58Za4d8tUml/WH3D4cN5RWfg8jrAK4jvJPXbfaVb
	fifbYG0GsmHjUQtcDvsVWUftji+8TK0OtwQK+NCzJLm3OhC0J6F3npWBfYcNsIyZeJypgdq/jRjyM
	wXQIPO8rrYGWEurh3YDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtZ5-0000000FgvF-464P;
	Fri, 27 Nov 2026 10:52:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtYY-0000000FgSk-1rx3;
	Fri, 27 Nov 2026 10:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795776708;
	bh=CB0vsMUuxXRz18p3cWYnUmFn+FTPu9FT98Oo9ipqsZg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BHEjngSjZ92TmZMFfl+uVy+tpCmv7II3QFzu2I6oTwp5J3F6eayyyVxtNgr909N3Q
	 X0IIAzEBxmxp0z3jYB9eYZnZe8jy5BB8C2yp8qP1By27zg3NtEsK2cP0KUD8Ssq5sT
	 fG8g/IOHkeCr8HBES5N0Eqh+7dGCO7bcyZQGJy7qpmv6evr5W8V40EuhPl3kjY9wfh
	 m8HZwkOMUZAoXQ2uoME34NlxARSo0jRitlnMggZFJVk15Bd9rJjeudgFMkVDRXpspa
	 OFBm2b0aSnSstP7+46JimOgRU5PDc7a2344u5107K1mw79RZa1VZ1VCP3WJLmZRfWm
	 EzQNqy/Mxj47A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9FA8317E08C6;
	Fri, 27 Nov 2026 11:51:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 111CE48003F; Fri, 27 Nov 2026 11:51:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 27 Nov 2026 11:51:44 +0100
Subject: [PATCH v2 07/11] arm64: dts: rockchip: Add USB-C DP AltMode for
 Gameforce Ace
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-rockchip-usb-c-dp-altmode-v2-7-77ee78869307@collabora.com>
References: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
In-Reply-To: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Cunhao Lu <1579567540@qq.com>, Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3993;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=CB0vsMUuxXRz18p3cWYnUmFn+FTPu9FT98Oo9ipqsZg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsJYMMJtnUOwJZpbew3/YAMF1TlphH9YjTza
 1H3llBAayr//okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCWDDAAoJENju1/PI
 O/qaOWEQAISirkxFWyJip91NS54k8qrFMOOmNnz1Ax3E8dKnfNpwkhgW/J30oWSTZRiXxS+mslk
 2v+EwFGQ1woSZ2WfnH3IE2b+eIYeSkn6zlFkFviFC1FRRt8YPoJB88d0efOWs8Sdtc6BKciq+Nb
 P2eWaSVf2uVoOvlsAoUgLZzOWYcvmA2fKThgciWLLTTYCR9Cmv4YPxOlZlPGyd1R4Xwq6oqloLw
 l1tXt+t0qyGBuJPmFqLtViYpzdwHMYdBZzpPBEoAKCAznqsHO3Rp48buDU85QD05rDd/JPVtrQe
 8Af9KrmWWkPVeSmNBlhbUd/n3oXBhzcLiVz8hvZ2EyZGntQR+SdQCpQlTEpDZb313fhkFe6OnhJ
 meNjGMZVmet2VHs5wa3xmM0Im6lGXG6vzRLV5BkyHN0i1CWCu8LZhtsSMIe0Nm9mdBNUBIlLbZA
 w93g+i4uaeOg95KtRWPWSOA/zif+DvvwZibSIPmIf+xxuLmo0PQ61+t2q27G5eJCARaqh3vq2k2
 EHt+Uzv4OdBks5fmyQy5Fp+QYioNyYBTqB7f/567ax/69uqiOc8Zh3qAOjz1r3Y/LikdngfhwhE
 igrBMDFErIg4D++/d3ygawAOuat/XY3OX/dey4r+lB3tOoqbiXtI9IOJOHF5ZZ9jlodmM4RrqQJ
 70JpF9znnuxvx4gG8sHsy/A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_025154_670567_0C92EEF2 
X-CRM114-Status: GOOD (  11.96  )
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

Fix the USBDP PHY ports description for the Gameforce Ace, so that it
follows the documented ABI. The current binding confuses endpoints with
ports and makes no sense at all.

While at it drop the rockchip,dp-lane-mux property, which makes no sense
for USB-C as the DP lanes are routed dynamically based on negotiation
via the USB-PD protocol.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    | 94 ++++++++++++++++++----
 1 file changed, 79 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
index 5ffc94b70813..27b696b4b945 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
@@ -504,6 +504,22 @@ dsi0_out_panel: endpoint {
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
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
 	status = "okay";
@@ -679,28 +695,35 @@ PDO_FIXED(9000, 3000, PDO_FIXED_USB_COMM)
 			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
 			try-power-role = "sink";
 
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
@@ -1466,12 +1489,24 @@ &usb_host0_xhci {
 	usb-role-switch;
 	status = "okay";
 
-	port {
+	ports {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		dwc3_0_role_switch: endpoint@0 {
+
+		port@0 {
 			reg = <0>;
-			remote-endpoint = <&usbc0_role_sw>;
+
+			usb_host0_xhci_hs: endpoint {
+				remote-endpoint = <&usbc0_hs>;
+			};
+		};
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
@@ -1483,23 +1518,45 @@ &usbdp_phy0 {
 	pinctrl-names = "default";
 	sbu1-dc-gpios = <&gpio4 RK_PA0 GPIO_ACTIVE_HIGH>;
 	sbu2-dc-gpios = <&gpio4 RK_PA1 GPIO_ACTIVE_HIGH>;
-	rockchip,dp-lane-mux = <2 3>;
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
+
 };
 
 &vop {
@@ -1520,6 +1577,13 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
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


