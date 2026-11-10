Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D28A606A841
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EYrtfnmS;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XilKn/TZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YwK7+1UqWk4ojkj/WS9d6dJgOXvbwrx78qaJQutBsIc=; b=EYrtfnmSeWeACxnmb+Lapkt0Yu
	nNcrzSNHURK12aEFqG3twDFdR3U0s0cTCAdydWEjZbYvn2v8iH9cIcLQsljifoAwWSbnPlEjF8vOc
	2/wug3t99E6r0ucTx3TwLdeJJp8MOY9yGenrMWay0oDv19GdolCG/1WMTCQ8YL9e2Ofz7kPQXpNPc
	22ZEyLxZ5gVEn28JENLEvXYFO1a/xtXLpMZyg5bHM1vJzht0I7dGKQ73T/c8jamBcCbD9op42jpDL
	yUjC3SaEa8D6IPgCQkbSXGf8eqSecghKgdP5f7LEZdZsFpAkGLQHmbbi35Jx2lfth32PrSjqAnRGx
	XTNMJ6fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg9B-00000002sHo-3hey;
	Tue, 10 Nov 2026 07:20:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg8l-00000002rMD-0Jr9;
	Tue, 10 Nov 2026 07:19:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B8D1C43D2F;
	Tue, 10 Nov 2026 07:19:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295174;
	b=rn0V2hvDmSsKQOQtvLEM2ULoenMydYReGqQW4olXKWO+7w93zMSapuvGhvXRGdrj2DTa
	 3XFwLwUZeSChTkoOl5zEe+FqJpVf2cB1OpdllgUUrq7juWJ8JxMiqw10fLIm+Ei2Gqjl4
	 EFmJVPnCD3NlukzGstdmrKzm75R3ishE5YHfwg3ud9m0pVcyPbUbgLX7bXvYCKYMnZuJO
	 IIJuEi9vuu4gdvSlKpaDmvj6lys9384ZgY7/fhshEUlSTJSDD53ZoFPk13eAH6/WSJ+K4
	 ungD6CX207ZEsSFESpm1OvVwrYGlU/EQ4GO52PVLNTLgUGYb1Ok3zoUz9+MJYWNAv8g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295174;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YwK7+1UqWk4ojkj/WS9d6dJgOXvbwrx78qaJQutBsIc=;
	b=wHaCKCLIdYQqlSdcAR7M/V5j5YhV8HMaxrCe9Fax53Z/zrw/AAb+98wL0ahJXc6/raZJ
	 WBA2TAgSc4+dV2UD/Yxu56m00atgFWSWbRMvkAu2RxB+xK5Z/SeXP3rwofa/qIlRHGF4e
	 zPXlPD1WnrCKxfLxylsguUdsFRUG3GdabThiMBtKrta766k3VdHoBUtusw/EWa4/zQj8w
	 B5HqVyXZbd4y5qioey6538D2ywZhMJoXD4jJS++P25xiopvtxF3EgbeoNcO4eNK3o6oS7
	 t0b4a3i7D2VGv4bES3GhvnRCAL4/BrY3fnN/dHNFd582Kx5uCDh8Nebo4yHqErlW4Hg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B3AB71F008BD;
	Tue, 10 Nov 2026 07:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295174;
	bh=YwK7+1UqWk4ojkj/WS9d6dJgOXvbwrx78qaJQutBsIc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XilKn/TZnYBx1GZ4KVzD5spU3MiHGBES8YEwY7u8bRc0Ftik+UCgyPXxbhA3latE3
	 rpLUoPrKK4aJk0N9SJTdOTA0kHCHrFnkB0a7rotNZ0zcOImDCfZ0eTAf7y0ElKxhld
	 r6tLtGs/BvEcXLjUYhiltzmUqulxp9MGJ4ADaVuhQEe+ButFe6ECIzxu69tsnFYN7r
	 BGo+JNYELrChyt2TbAQO7vW5UAhEr0njAeWXLLtMQ8ngdcNZWC+7ZOs+jNTz4Mwjt7
	 EKlv0Z7uusuJNdgF6v/zSgW3Jy2VI9Zmcoq7u6R39YikqjYkwUaZY1Z3C2r1o/T4jt
	 0WszHmVfGOANg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 42E1D489DB;
	Tue, 10 Nov 2026 07:19:33 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:19:35 +0000
Subject: [PATCH 3/3] arm64: dts: rockchip: Add USB-C DP AltMode for Orange
 Pi 5/5B
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-opi5-dts-v1-3-582b63d074be@gmail.com>
References: <20261110-opi5-dts-v1-0-582b63d074be@gmail.com>
In-Reply-To: <20261110-opi5-dts-v1-0-582b63d074be@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295172; l=4241;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=+xmGbI4GlMgBmPGKtTKnBGXbYPlqe8bWAMPWV4cMo58=;
 b=3Jl0l/Hm3AzwagElH5K8zDZOTARddC/2ctTH7U2tgMLE8KpqBFi3pZrMhgnM4NH3zZJ1sbwJK
 z1g2+Rlm4cRA9des28Fu+HPG5hZFhvXc7gPwvnHrfUv50GMto/aWfzI
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

The USB-C port of the Orange Pi 5 and 5B is connected to the RK3588S
USBDP PHY0, which can mux two (pin assignment D) or all four (pin
assignment C/E) of its SuperSpeed lanes to the DisplayPort controller
DP0. The SBU lines are wired to the PHY's DP AUX channel through the
sbu1/sbu2 DC control GPIOs that are already described.

Enable DP0, route it from VOP2 video port 2 and describe the full
USB-C graph using the USBDP PHY ports scheme:

  port@0: SuperSpeed lanes to the USB-C connector
  port@1: from the DWC3 controller (SuperSpeed)
  port@2: from the DP controller
  port@3: DP AUX to the connector's SBU port

and advertise DisplayPort AltMode (DFP_D, HBR3, receptacle, pin
assignments C/D/E) on the connector, so TCPM enters DP AltMode with
DP capable sinks/adapters.

VP2 is used as on the ROCK 5B family, leaving VP0 for HDMI0 and VP1
free.

Modelled on Sebastian Reichel's ROCK 5B family DP Alt Mode support in
the Collabora rockchip-3588 tree.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi   | 89 +++++++++++++++++++---
 1 file changed, 78 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
index 7c1fd5905553..52f5005c738d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
@@ -94,6 +94,22 @@ vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
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
 &gmac1 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy1>;
@@ -143,6 +159,13 @@ usb_con: connector {
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
@@ -150,21 +173,21 @@ ports {
 				port@0 {
 					reg = <0>;
 					usbc0_hs: endpoint {
-						remote-endpoint = <&usb_host0_xhci_drd_sw>;
+						remote-endpoint = <&usb_host0_xhci_hs>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
 					usbc0_ss: endpoint {
-						remote-endpoint = <&usbdp_phy0_typec_ss>;
+						remote-endpoint = <&usbdp_phy0_ss_out>;
 					};
 				};
 
 				port@2 {
 					reg = <2>;
 					usbc0_sbu: endpoint {
-						remote-endpoint = <&usbdp_phy0_typec_sbu>;
+						remote-endpoint = <&usbdp_phy0_dp_out>;
 					};
 				};
 			};
@@ -250,9 +273,24 @@ &usb_host0_xhci {
 	dr_mode = "otg";
 	usb-role-switch;
 
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
+		port@1 {
+			reg = <1>;
+
+			usb_host0_xhci_ss: endpoint {
+				remote-endpoint = <&usbdp_phy0_ss_in>;
+			};
 		};
 	};
 };
@@ -267,18 +305,47 @@ &usbdp_phy0 {
 	sbu1-dc-gpios = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
 	sbu2-dc-gpios = <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
 
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
 		};
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
+		};
+	};
+};
+
+&vp2 {
+	vp2_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp2>;
 	};
 };

-- 
2.55.0



