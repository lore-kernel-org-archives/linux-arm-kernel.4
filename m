Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13151606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 01:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zx/Eqjm9;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=diVSXvT8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GtQ4UBpMkBpOgtE+AL8S5LyVQsUQzIsf6QgCsx3ULRY=; b=Zx/Eqjm9srvjIz
	CGA/E/pa3O6dJtB5BYgZwVgDrpK/ogutX0QMP4v9HVTf1CSSUcHeT8uCRPQWElR9u0cpcuvUkymZU
	LeoPTign66VjzCIwAXZPa3+/J2QxIfWSjt/rZiXRQp+69TQS5R9EWvYceiDwHhYRpw5ii3+pJ0lOQ
	ZTSP30mZ2ykJ6zeqsDQ8ZtKwrEk10SEqU5Y55yQYHG2Ma2Woj2YriZtOA4VcRs9mm284eKkl9JhMI
	0RSm3FqMEY3HnefjfS4/edl14fA9kW/GQrmJeXPFfzILze7MPNEDZi3/nTlrSTb7ocRp5NWBRdXC5
	gaLnhH5rFP7aKg/c3JsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWO6L-0000000Bma5-2Ojf;
	Thu, 26 Nov 2026 01:16:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWO5N-0000000Blgy-2Md6;
	Thu, 26 Nov 2026 01:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795655734;
	bh=5grVQOV18rMjWjaQKETYB4amImegESgijOC1OKMenMI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=diVSXvT8w76akXka81DhEMg8cidnEfRGaE7gwgWg9Ris9Pu+GwnDl5ndzkrQ56aPd
	 Kus/+2cGK9H2thGRZqjfa4shfxemgvq+B7fYlt5F5HayFt9S2pIxENEb/pnM0/tdY7
	 OXvNZ2FSJfDtnJbUxj85xyGqOaKZjGYfD5DwphB0lS5n3KCtX2uyq6fkkRd7V767l+
	 iey57/QH4YpOSygNr9JUo4fBbTcgGrap/maV+prXgMWjOmKPCbcVjn5fzMdQ3B2YT1
	 42x+eqTqikjoyhGrgXpzc5NjqOaAaJSYq974DxCaSB/2A64Uayx8evd1L7Fal9NLLW
	 xF8fDvjdmhZvA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B2B517E1297;
	Thu, 26 Nov 2026 02:15:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C909A48003F; Thu, 26 Nov 2026 02:15:33 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Nov 2026 02:14:35 +0100
Subject: [PATCH 07/11] arm64: dts: rockchip: Add USB-C DP AltMode for
 Gameforce Ace
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-rockchip-usb-c-dp-altmode-v1-7-7991eb5bb426@collabora.com>
References: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
In-Reply-To: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Cunhao Lu <1579567540@qq.com>, Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3679;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=5grVQOV18rMjWjaQKETYB4amImegESgijOC1OKMenMI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsHiDX0qRV4Kr42d52lIszdruYG7KknO8LZc
 lyEG7DZEYL1QokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrB4g1AAoJENju1/PI
 O/qailQP/2Ez6EiqTv++ojoZqHx85BKJFLpD82S9D8HxpQOmyXa7HS5TFD8BQ6ZSOf83jzjr6BQ
 Zn89c0qwF1IDgaw54OlpCLs8xr7MTN5f3TgG8P7Q+SwCTA+MocHnw9eSy3Fjxk2vLcUd32WwRah
 ypm5GUlEcS6py2M/xiDuznuYk+LgeHvehDwwbGWEkkb19BqR835EsFuWYFnRrhbCNK1XDTpOr7e
 raZQmWdfTW2Ya0aUDvylBfVTPm0402XuO/IBdqzilcEEKr3hBD/cU9JKuUpOHvxQ2C2HDtQW+KG
 M8uqEeJ4ksD/RehLtC0vFrlCbAxwzv0v/wHlelzT3/eSveXTPGtRB+2wtrbBT0Kv/hsKhu6NYbE
 gA1Y2mzy2w7Uiwj2JQfKgzCoRRVxBADr9pDa4OazvPavTg7jS4wPgFDxOty93iaTUEOBcuPxVyc
 wCNjtvNpVgBXX2ram7HuOJukcEwHdlR3BTr+dNSNVCfWdzN645neFl5RvFAeTx/KlxDrdoE2o5P
 aQRug1n7VrQNoS+CA8hMOC4tVPQESQ+2Ei8yxWTxSUw32GKD4Jou3HIw87XrXts0sNzPJxr+n+1
 e/Eh+V8eZzDNYW6IFej3V8DndVpHRo7jZnXSoDb7FOTEUA+9ExeOgS/GcEifdTe9+f5eB6JOyT5
 /EYbytAdEhWb3keVVYZkseQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_171542_997500_705B7BA6 
X-CRM114-Status: GOOD (  12.37  )
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
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    | 87 ++++++++++++++++++----
 1 file changed, 72 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
index 5ffc94b70813..4bfa442d762c 100644
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
@@ -685,22 +701,22 @@ ports {
 
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
@@ -1466,12 +1482,24 @@ &usb_host0_xhci {
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
@@ -1483,23 +1511,45 @@ &usbdp_phy0 {
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
@@ -1520,6 +1570,13 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
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


