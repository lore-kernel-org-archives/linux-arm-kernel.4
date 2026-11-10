Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4330606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XyDVGunc;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n/aJuBV+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kuAiQI4lcw5dv1mN4Mus2skpcDshlqATJhz9fxIsZo8=; b=XyDVGuncWTvENWVXrZz+8I3wW0
	1v0XgsWbT13vtQFKGZQydcWpq8RPCLtGc7hiHftLpwjY2a0h5th1kwyRlSs1WtUCycfzRwHi5pL8m
	ScqTMiFPdxzfF+fYLduN5qbL9LToWYTYVlAGRHjnX0csrgghoDfULd72PyKKPNPKrNQqHm/YF0X+W
	3+2TNJYXIWQLBhqOaVc0gA/FqdmAajiK2T2v3keBIW0ErZm4oNuwW1RGAOEW7Zba4wefIayMu9RjP
	+KxI3jwYJvL61DKGc4LsFifTLT/hYq+v+E1Y79T+ajpNGxUjhgMIaXN3CItw2216PDlWppnjm1qnO
	X9S88ysQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgA7-00000002tPp-3pDr;
	Tue, 10 Nov 2026 07:20:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg9K-00000002sZr-3ojl;
	Tue, 10 Nov 2026 07:20:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 43072637D1;
	Tue, 10 Nov 2026 07:20:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295210;
	b=Gv9B6nnLWyKZ9VkVjGEl/+oT27+eHcAhOmw7oLTzT26joD+8yhdMH9MVPn6WHO++VOUV
	 EdsPCCVgV4aRipfZTMEuZ+QProo4mdG5pFtERGHsk2rCW92qXs9Z8+7VY53xJtfiXntsV
	 AjcZtVVEt4jZTOZhQZ7b5AQYwbhm1T9+nvkDv9DLISbngUVW0uGFknLJx4MZ1ruoJqFBJ
	 B4P9ufZOZdHZAS+fdo/9bcwC3p3+yYHPaVcdli43g93wo14HUqgZw4xgCH+ZXolj1UPLV
	 dQfFm+kKQ+PedpQBZ9b0285Y+90IltJTFJmyqQusfoJSIYrxzcRGlGwsgi4Q1xHx8mw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295210;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kuAiQI4lcw5dv1mN4Mus2skpcDshlqATJhz9fxIsZo8=;
	b=GK9f8re9JlvmYPLs0aBnx6FWA6fpuGRvifmBMTckuos8j8iZZl5bc2nKL6JgRn5NMDCx
	 kxkxJgFNM8zkNMuwPj2Tr8YMDa+26DXqGTOQ9BN7tU3GHYtFszpjvN+eVGTjaI5i31/aU
	 gJPKZv3bYMUYwxDojde6UDk6y5Xr+TBT+4A0VTDPVekIc6sXRiTH5C6/69ozGihgouGgw
	 CxSNifUh41LS9/UBujCgNM56+4Tv8UjqUBHgoqympWhlFZVhTTepbcw32w/nLv+kOTZed
	 3f6MAsbfUyDA/XekRvCWtUJzR3SU+y+3d/V/nturOGRAox/bg1yLagYMTOwoBQ+5rwQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 49D711F008A5;
	Tue, 10 Nov 2026 07:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295209;
	bh=kuAiQI4lcw5dv1mN4Mus2skpcDshlqATJhz9fxIsZo8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=n/aJuBV+AvxgUkLZm2BKP0S985+k8lSCGBwesGEKVCOhc3t+yCUgLDfWmdB0tHOd9
	 8CG58voZzcl93+h+F9Kmw2wIHlrGa5xMGS0IXLdknUDaV8tPniF6XwDsjTv/F1942g
	 Y8Jz2MAB4pvj7hTZvgtUoYFkLPSaSsMCC1e8J9twszPGA7yCciF2iWdIpcR1ZGM09x
	 BfLKySBetB8xNcABteDJO83QKrlVE7wATGX04Gt0fL2LkwUI49cbRCzFwoqWmXsgrt
	 D989lVDTtjVeqGUYl4yk7RUWiRzweL98HmfaT7iwWaETnCEZSITL5UbTu80EhXEr0G
	 xZJjo50ffZrHQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D0E40489EC;
	Tue, 10 Nov 2026 07:20:06 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:20:09 +0000
Subject: [PATCH 4/4] arm64: dts: rockchip: Describe the USB3 Type-A
 connector on Orange Pi 5/5B
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-usb-port-pairing-v1-4-9307e29d2ed2@gmail.com>
References: <20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com>
In-Reply-To: <20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295206; l=2457;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=IakzDRMMsFFpDM3Pul0+4jHnnMQtQ7ZuE6Fs1yH1Zm0=;
 b=OC5rK3ua1Qy61UygXep+9kHnO/LjV0yc7VK/6IzFLGy4eDROvGHeMgLZVAzetF4NpO4zIsFsu
 APSMfEOXhHYCanl/ineaEsILKjg1A+WWtbUbBnyJ14hejnch1PTuXCi
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

The upper Type-A port of the Orange Pi 5 and 5B has its USB 2.0 lines
on USB 2.0 host 1 (EHCI/OHCI) and its SuperSpeed lanes on the
SuperSpeed-only USB 3.0 host 2 (xHCI). The lower Type-A port is USB 2.0
only, on host 0.

Describe the upper port as a usb-a-connector linked to both
controllers, so that the USB core pairs the EHCI root hub port with the
xHCI SuperSpeed port. Without that, a USB 3 device plugged in at boot
is enumerated by the EHCI before the xHCI is up and stays at high
speed.

VBUS of the port is not switched (the vendor DT has it on an always-on
5 V rail), so it is described as coming from vcc5v0_sys.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi   | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
index 6e081bc06cfe..2049adc9be62 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
@@ -56,6 +56,38 @@ led {
 		};
 	};
 
+	/*
+	 * The upper Type-A port: its USB 2.0 lines go to USB 2.0 host 1
+	 * (EHCI/OHCI), its SuperSpeed lanes to the SuperSpeed-only USB 3.0
+	 * host 2 (xHCI).
+	 */
+	usb3_con: connector-usb3 {
+		compatible = "usb-a-connector";
+		label = "USB3";
+		vbus-supply = <&vcc5v0_sys>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb3_con_hs: endpoint {
+					remote-endpoint = <&usb_host1_ehci_port1>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb3_con_ss: endpoint {
+					remote-endpoint = <&usb_host2_xhci_ss>;
+				};
+			};
+		};
+	};
+
 	vbus_typec: regulator-vbus-typec {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -229,8 +261,36 @@ usb_host0_xhci_drd_sw: endpoint {
 	};
 };
 
+&usb_host1_ehci {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			usb_host1_ehci_port1: endpoint {
+				remote-endpoint = <&usb3_con_hs>;
+			};
+		};
+	};
+};
+
 &usb_host2_xhci {
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			usb_host2_xhci_ss: endpoint {
+				remote-endpoint = <&usb3_con_ss>;
+			};
+		};
+	};
 };
 
 &usbdp_phy0 {

-- 
2.55.0



