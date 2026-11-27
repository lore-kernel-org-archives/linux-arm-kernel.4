Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F80C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KBPkOors;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=K8gQ6RCU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+Xe4r9mfQPCbyFu3QOO477Y4D97gSYmHYBgKShEOJMI=; b=KBPkOorsvaBGPE
	hTqrENuMaNUmuRvO4xp3YUqL60956bOJ1fLBVpnnInnXtS+DeUfKfIKUPvR2DKFr1JflYt3Kn+BN4
	hEBUlKP1mRh/NZEWvOEOnugiavVZjiA1YVm7i/u1KWL5MbUf6RkobZ3s9K0gxhGn37ANnAOHTlk9J
	/tLJkqHNzmSbmDXODOUPtMo0kzUCn64VO0Z/vWp8Yd5IlnglUl55DlaKVQfjBHa3K/s8UVwQiAifJ
	s13QIFVmaRiNlK0GjLZxytmerRpX7zbEHtB7te46tnQ2ZNFp8zkp4TUP/u4Lm7fbe2JQb0CfAy944
	5LztTv2cLL3Z9HjNqc7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtZ3-0000000Fgoq-2mHC;
	Fri, 27 Nov 2026 10:52:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtYX-0000000FgSI-2UVq;
	Fri, 27 Nov 2026 10:51:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795776708;
	bh=aYsZ8eyYV8PIHFjYMwJOXFXN3bt+tnRGzqaXMOZ6CSo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K8gQ6RCUVFwYBvNjOX8vko1tPsniM+6igcc7Wag8wGTb1rw8MhkcpwNhLYUHvLJ5/
	 TQksnsO7tSfoW4wyYO1ZMEpXMNDdrC2wd5LtfEBKyn3gyCDjHIfq59+dDmTZR+Cxrv
	 6pGa0blV/5VhWWJ74/bHWZLYOVXWCmN+8tprhFmCrw0aVPZQjHiG7EXvvjxm79pYlh
	 ThNUir2ptpXZcyR1qkx2aH+ahbBhOZXVY/AICWd+CDyLDrYcGzy2CAbd/Zy8Ayw7VL
	 d00qCUUABBY5GSGVXofZTDDrnZlQvE4CEEiR9ckE0a/7OsBqMnsLvRaFCTclyvIbVG
	 Qh5jXAgN9mUxg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 98BDE17E0887;
	Fri, 27 Nov 2026 11:51:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0F54C48003A; Fri, 27 Nov 2026 11:51:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 27 Nov 2026 11:51:43 +0100
Subject: [PATCH v2 06/11] arm64: dts: rockchip: Add USB-C DP AltMode for
 ArmSom Sige5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-rockchip-usb-c-dp-altmode-v2-6-77ee78869307@collabora.com>
References: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
In-Reply-To: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Cunhao Lu <1579567540@qq.com>, Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2880;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=aYsZ8eyYV8PIHFjYMwJOXFXN3bt+tnRGzqaXMOZ6CSo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsJYMNzKYa84zFBHVzZ9A483re0xGySRgMUA
 /Kjpg8TJL3QCYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCWDDAAoJENju1/PI
 O/qaWvsP/3GfnaJl4ZKXYTLBg0U3HMoD1xcGOBuf3y7kUjGNpcw8GF8zMjyPAWgtZg1WQA8tKUL
 O1QqbR1287l88AH6JFvmDS0xaSabebQr7PCenvrdoh736EWMBP0YmeClhEpL59Jer+9hUdCTqh+
 xif26LojiMCSdExDQPH+Ixb2MGLjMaIhQgBzjATbNvdzib8s1sKdfOqJjImdUi27qO5apqKSoYF
 bgIGgVjHxxpxmZaAT6WsdXTEOb7CIFckmetBnMv4QySW3e0fyvOjqoS/o8WqE8VdoK2Tfgj++xh
 ZV0PUOS4zx+zdIdqu1uCVjPpqczxNMt0Kgvt6qk2SbpJakwF5GWEqsguuE2eaqduRCrZFqihq10
 +wZGjKRCjcscO+i2H9QZHewsAtZjCW/QVa9r+9Jc8EsNySN2PR2BRLg9ESJSm2fJ1L1BjmrJTNC
 fhfCP5dSt0vvbPJXjgRnZk+xQf759AxMA+cnLdeTCHXn+4hPp9bsjAz5tzKzIc8sd3ABfZjFi0K
 LlFzaa1ru7az7Mk1oUkfwFZJ2zjJqMmppn3Ddak47KHt7gllP3NBS5HxM+uAs1ZBQSUVIBCObhS
 ewt8S/2bx8ILF+nJppSQyrFZqZbajNxaKUADwduv8diUs7AO+6vZ0UroflarsllFA6eh6FlxNeL
 JLBCSylxYEzslZhOMkjchsw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_025153_830007_DCA0CF94 
X-CRM114-Status: GOOD (  10.26  )
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

Enable USB-C DP AltMode for the ArmSom Sige5.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 76 +++++++++++++++++++---
 1 file changed, 66 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 48e5ad169722..047dd0def3e3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -272,6 +272,22 @@ &cpu_l3 {
 	cpu-supply = <&vdd_cpu_lit_s0>;
 };
 
+&dp {
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
+		remote-endpoint = <&usbdp_phy_dp_in>;
+	};
+};
+
 &gmac0 {
 	phy-mode = "rgmii-id";
 	clock_in_out = "output";
@@ -722,20 +738,22 @@ ports {
 
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
 			};
@@ -999,14 +1017,14 @@ ports {
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
@@ -1026,9 +1044,40 @@ &usbdp_phy {
 	sbu2-dc-gpios = <&gpio2 RK_PA7 GPIO_ACTIVE_HIGH>;
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
@@ -1047,3 +1096,10 @@ vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi_in_vp0>;
 	};
 };
+
+&vp1 {
+	vp1_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp1>;
+	};
+};

-- 
2.53.0


