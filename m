Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A31606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 01:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WEyuVYvL;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=NYg1LOrC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WkHN9A3Y86juNKLrEVQSy/VEql3aXHqCYmFvIrSVDmo=; b=WEyuVYvLqr04a/
	oMW+LPORkUjK1Hkv30Ois9o5wTXvA7prjuk6gLb2OxGl5Nfo939tZ1vqJarYAQG0Bsnll30U6PPpf
	Dq6rF89eGPDubAdzh1tLTVSdLhTwoIdC1WVvWTDI8cXuVsV7ZZwVl0PZ+TkkCAc7GMG35HKKzsS5C
	uGGinmQT2BOoDt/yykv5fVyxv7i0GpRxiDQoO63fCyB4GopbuCXZRVi/tDaqOBDv305sdBGKsbEu2
	XpZPaweFXqL6MvtTTiCrtMCIETgVSfKfnlmqJJsA+hFcGfWsfxXvN01I/aP0jArYejHU1YVPQLsjp
	6/EO0/aJXTvIIjKW6tOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWO6t-0000000Bmtf-1WJc;
	Thu, 26 Nov 2026 01:17:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWO5N-0000000Blgb-04Ft;
	Thu, 26 Nov 2026 01:15:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795655734;
	bh=TReSjAabIH0w5Lp+llK+KbrOfk2KHaTLEr6xiB4QYtw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NYg1LOrCSTei0r9BiVMobgCs4/RupeRK9GY1Tt/Hj54AEJLw4bh9YwjoXOGCmG/JV
	 nCVRp8rFrrB1F7AIXfb3ADVD9+wmzbDiEQE9/GNYkaJqIbqruokCWrV0OBRgvmu4SJ
	 qguOaFPFUHJT3+jF0iekIj22FxpiyQR6pHEywM/+bFVA3ksXFbAkfOpeBE3DVZ4/dz
	 WL9UnSeYHBo+fQBevUYVIRunpRBtIY/E1hJTXNa5X4TUkNBxtEI+7iizuMFlafNjrP
	 r10CfEy9EIjqJRZ4od69NxKifKY6a5r0Opcso6w4QQnOcVyf0FipZi7fA3EN7f4ZAc
	 WZ1Cc1+D2+LgA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B6DB17E12EB;
	Thu, 26 Nov 2026 02:15:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CAD2F480041; Thu, 26 Nov 2026 02:15:33 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Nov 2026 02:14:36 +0100
Subject: [PATCH 08/11] arm64: dts: rockchip: Add USB-C DP AltMode for
 RG-Vita-Pro
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-rockchip-usb-c-dp-altmode-v1-8-7991eb5bb426@collabora.com>
References: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
In-Reply-To: <20261126-rockchip-usb-c-dp-altmode-v1-0-7991eb5bb426@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Cunhao Lu <1579567540@qq.com>, Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3047;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=TReSjAabIH0w5Lp+llK+KbrOfk2KHaTLEr6xiB4QYtw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsHiDVHBf/7Z0cjKNlvICvyct4R2IeoVQJIe
 nBcZ/Vd4hxj7IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrB4g1AAoJENju1/PI
 O/qar3sP/2dGaRUH/H/vMuhjMk7X2iJZT3+qyME4NWYuAzLVDrehc0+zLt4+G7mFPKWo5uMRxbN
 C5Ii1HDZABNGSqU7Z1ZRTq9lMc0lWdDTR9nnGC4ozM6pAdr8RcfXSAiyNXqe3xikIGgqMwSMMRI
 HuW9loHRmgLIi/Wf4/+vUKLNpMOZlmAvpTjYs2hUKFnJyVerrvuJXP8/V41bVQEwonsH77vF4U9
 WhSY1uTtBUVTg1bjlLJEITAa6W56HJczIp1gA/mu26MSkCi8rpMJKXctMKjsJXsgL6fvn/Byljd
 bAntLIsg2XX0gQ1OG5LiBPttBxbXIvxkWHlvwhuVqSE2A0W+OninjxHhmG6/T3kgiauixyH2WVo
 Yq7amQ1lALH0UrGxruqRBtzD45Ej6mRTok/m5ByCaAl23MOuOuQBkt8gDPmHPfWOv6fDjHR4EXq
 YlxNPXh4QAMM7zt2XKj1FGBfEfl3FzItSzmZF7zhewSvYTD8b9jncFDSRs5ErUeCyNKAu6/TL7d
 HO8knERt1UB7r/Em9WVHsOF0LMlGE1DA9Xf84Pgnb2h/o6qafPSsOHcNRC0y4mPDFV2M1aOoGtW
 o9dsjD0yFDbip9JoLdk3GpzS2Avd8oxsbDExfhdbVCb4bnwVuIFEoQCK5YUP84hQmeLJtYd4sSd
 ZeuXh7NcLrI5XGYEc/vorhQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_171541_246928_D64C0D8F 
X-CRM114-Status: GOOD (  10.84  )
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
fixes the USBDP PHY ports description for the RG-Vita-Pro, so that it
follows the documented ABI.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../dts/rockchip/rk3576-anbernic-rg-vita-pro.dts   | 78 +++++++++++++++++++---
 1 file changed, 68 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
index 85576a437f7b..5da90f3792a1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
@@ -469,6 +469,22 @@ mipi_out_panel: endpoint {
 	};
 };
 
+&dp {
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
+		remote-endpoint = <&usbdp_phy_dp_in>;
+	};
+};
+
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
 	status = "okay";
@@ -932,22 +948,25 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					usbc0_hs_ep: endpoint {
+					usbc0_hs: endpoint {
 						remote-endpoint = <&usb_drd0_hs_ep>;
 					};
 				};
+
 				port@1 {
 					reg = <1>;
-					usbc0_ss_ep: endpoint {
-						remote-endpoint = <&usb_drd0_ss_ep>;
+					usbc0_ss: endpoint {
+						remote-endpoint = <&usbdp_phy_ss_out>;
 					};
 				};
+
 				port@2 {
 					reg = <2>;
-					usbc0_dp_ep: endpoint {
-						remote-endpoint = <&usbdp_phy_ep>;
+					usbc0_sbu: endpoint {
+						remote-endpoint = <&usbdp_phy0_dp_out>;
 					};
 				};
+
 			};
 		};
 	};
@@ -1221,6 +1240,13 @@ vp1_out_dsi: endpoint@ROCKCHIP_VOP2_EP_MIPI0 {
 	};
 };
 
+&vp2 {
+	vp2_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp2>;
+	};
+};
+
 &u2phy0 {
 	status = "okay";
 };
@@ -1258,9 +1284,40 @@ &usbdp_phy {
 	sbu2-dc-gpios = <&gpio4 RK_PB7 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
-	port {
-		usbdp_phy_ep: endpoint {
-			remote-endpoint = <&usbc0_dp_ep>;
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usbdp_phy_ss_out: endpoint {
+				remote-endpoint = <&usbc0_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usbdp_phy_ss_in: endpoint {
+				remote-endpoint = <&usb_drd0_ss_ep>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			usbdp_phy_dp_in: endpoint {
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
@@ -1277,15 +1334,16 @@ ports {
 		port@0 {
 			reg = <0>;
 			usb_drd0_hs_ep: endpoint {
-				remote-endpoint = <&usbc0_hs_ep>;
+				remote-endpoint = <&usbc0_hs>;
 			};
 		};
 
 		port@1 {
 			reg = <1>;
 			usb_drd0_ss_ep: endpoint {
-				remote-endpoint = <&usbc0_ss_ep>;
+				remote-endpoint = <&usbdp_phy_ss_in>;
 			};
 		};
 	};
+
 };

-- 
2.53.0


