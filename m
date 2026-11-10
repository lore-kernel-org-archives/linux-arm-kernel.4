Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC0060A261A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 19:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yPyfRrP2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C0UnN1Xz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YVXKXdmO5pc+cT527r2SrlA5H/eJKB4pSKsUd9huCKU=; b=yPyfRrP2P2bjcS
	j8k0Fiqpn9n4mFYr6Pl6AF4msQ/+7qrs+OgSIAlUG4W1ule6Z4Ax/27FsctVAAGAWB0dJXK0m4oZ2
	+KGPJDezxpfa8f4UzxvYEPe+C0Gb+valTM/DVdh7J574mOJMi8Z13L+DJ27rSxCr7UQDSrgu3TAGd
	CWfvqeGG4gqe5Vr3PK6krqomgs2lPRfQJBOOX3ey5NW8Yr3JRB8VXQQqcVCcQl+77xK/TPWtS1x5+
	Czzlj9nL4LXLe8dBwUph2yUg7hn/SVQe4/O8q0f+z8yUocm1jUUQBsN4p6JTwPrsd/UjbNBYR1UNJ
	RRLk5glQIwTgoHyWRBKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrYN-00000004uZ3-3ZlJ;
	Tue, 10 Nov 2026 19:30:47 +0000
Received: from mail-dy2-x0b.google.com ([2607:f8b0:4864:36::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrYL-00000004uXc-1tkW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 19:30:46 +0000
Received: by mail-dy2-x0b.google.com with SMTP id 5a478bee46e88-36fe5944e9aso2455716eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 11:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794339044; x=1794943844; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVXKXdmO5pc+cT527r2SrlA5H/eJKB4pSKsUd9huCKU=;
        b=C0UnN1XzKAGElKckLpbXstSQNgH9I/0vSi3qqJET6dT1DurpXI/3AiJPLQbRJPoX+r
         QvfaZqeTgFKdTeh4JbHNeeM/Pm1tD+gv4OEQ09BZQKOYXPYjjdIa/D3ookS84BVLfJEG
         vW5h05icddIIXQ9Ilm7vn9T0Ue0kyKUWQ70n7/1og0n6HXn6jBH5NksxKLlc3FzgdNbq
         e69Gk5qRFbxtbucqfx/6PQzzg7E8fCq3jljnXYVwxrNF6JhUpBjbkCn+H4Rk3S44Kq2t
         IFVDzq0OUecz3cURAIbvVBgch4vo0kMKRN9bsBdFrWOk8OV2UmbvKaoYmt4cwlIVgdSA
         +EqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794339044; x=1794943844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVXKXdmO5pc+cT527r2SrlA5H/eJKB4pSKsUd9huCKU=;
        b=Fs4LkdwJ3HeyO8ERGfMPD4Ad0J1MOMQiEmagelsrKDcB3s5ekHJ1P3eMuHx43o7db9
         u9/9Np6HYPZs07y3WUAEClbu5+cDpJulfhijdkHcESLfpKfZRs1D2v6RE1JUVbHmyZYs
         mXuHL6VvdLCimanobvg/XU8aZpyWi3z6vTIdTKoBckZkLHjNlhPdNZK/WVH8FYC+YwwV
         UWgrcatkRxfRVr3s9sYDRxEXPhfsCCmz3raNvbQPVJRFb4+6J3cyLzZmXaJKCkvBcGCR
         oIx6hwGP401znK8Smrt3OLxc7phsp46Tkf4eW/wcvb3JrvOzOrO7SQAK4okkWoV23kCm
         QLcA==
X-Forwarded-Encrypted: i=1; AL+hErGkVC69wAV0ofRFkI7oRc0lMOyKcLb5KiTXnNO36mtoHTz7/ZEvqzCdU89dpgGzdmjQy9YJ8r65XEM+guLXINIe@lists.infradead.org
X-Gm-Message-State: APuU4Z8IQ3YPo95Q6+txsDBbsSXImqFkqgrv6j4m7V3FqwOg0k8GhRy9
	JC+WEvYK8FKh3oUxMIdmhGx+7QTy1n7y4hrfH134i/jmcO1Vgci/430Y
X-Gm-Gg: AYBFou0QjMBRTaXanqeIztmZxaiRQHmU1xrhu/pSt/8zknc8hZQFg8A5sFa3A+S8Q2c
	dNQcM69Z63G2pZStXF6Ta6xornK30d6rS2pyzokrcYGRjyBSD4xh2Abw8jSLNWuiTeirkTpy5ij
	Dn+SL48MAL3dYpQu2lqR2tQHu/FMOkxhVwswXfdIZxhdMBbYt4W5n4DrlNOFJJsSc8zFhMJvkPF
	wslHf3I53K9cWzU/Xt4hccAUm+hLqhacMw0It+vpoxQjQfQj1+04bkJv+Ahl0YuhkCxLVHuvMRA
	4IGO80FnpcTld2+WOEf2OrqKcXMThrH8iI2++nkW7IrUVVBIveke2wq+st+QcPGLgwWvG0vJhWb
	Mu7mzvvAxCqEcRhYZGQzjaPz1ebZUx1JBe2Q7nCTXISRFm5fnXCz7WX5gQjtZB4iXrwCLufSu1K
	77z4jT6OfT545A6qEJU4Vi3hJwD0vttfdlDKqEPkLLyCrApVWTtT7gcflmyCaM1uTRgMWcDDfd8
	NnC/NiFwOpV+9xPM3WZZQHxaqgdMcDs9/GziRwezfjmuUlSs26heHBZoLa5JwQBBfAV3a7fc9nJ
	74whnQ9Z4A3Ev3f3+C19GJ7pmzuMNiI2AVvNtKItf0Sqqbn8Cw==
X-Received: by 2002:a05:7301:d80b:b0:375:370e:f1ff with SMTP id 5a478bee46e88-37687214128mr374176eec.35.1794339043899;
        Tue, 10 Nov 2026 11:30:43 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ad6f11csm7730435eec.0.2026.11.10.11.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:30:43 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 1/2] arm64: dts: rockchip: add USB-C PD support to LubanCat 4
Date: Wed, 11 Nov 2026 03:30:27 +0800
Message-ID: <20261110193028.512456-2-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110193028.512456-1-cyan2254650260@gmail.com>
References: <20261110193028.512456-1-cyan2254650260@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_113045_496909_1AB910CE 
X-CRM114-Status: GOOD (  16.50  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The EmbedFire LubanCat 4 has a Type-C port on the front panel backed by
a Fairchild FUSB302 Type-C controller connected to I2C1 (at 0x22).
VBUS 5V power is supplied through a fixed regulator enabled by
GPIO1_C1 (active high), current-limited to 2A by an LPW5209 switch.

Add the FUSB302 node, the fixed VBUS regulator, and the USB-C connector
with dual-role power (source 5V/2A, sink 5V/1A) and dual-role data.
Wire the HighSpeed data endpoint to usb_host0_xhci and the SuperSpeed
data endpoint to usbdp_phy0.  Set usb_host0_xhci to OTG mode with
usb-role-switch enabled, and add orientation-switch on usbdp_phy0.

DisplayPort alternate mode support is added in a subsequent patch.

Tested on LubanCat 4 hardware:
- fusb302 and tcpm probe cleanly;
- USB host mode verified with USB 2.0 and USB 3.0 peripherals;
- USB 2.0 devices enumerate and transfer data in both orientations;
- USB 3.0 devices enumerate at SuperSpeed (5Gbps) in normal orientation;
  reverse-orientation SuperSpeed is subject to the known upstream
  phy-rockchip-usbdp driver reinit limitation;
- USB device mode verified via ConfigFS CDC ACM serial gadget connected
  to a host PC with successful high-speed enumeration and bidirectional
  data communication;
- VBUS switch (LPW5209) enables in source mode and remains disabled in
  sink mode with reverse current blocked.

Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
 .../boot/dts/rockchip/rk3588s-lubancat-4.dts  | 115 +++++++++++++++++-
 1 file changed, 114 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
index 0d28c6165..a94aaddb2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
@@ -8,9 +8,11 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
+#include <dt-bindings/usb/pd.h>
 #include "rk3588s.dtsi"
 
 / {
@@ -116,6 +118,18 @@ vcc5v0_usb30_host: regulator-vcc5v0-usb30-host {
 		vin-supply = <&vcc5v0_sys>;
 	};
 
+	vbus5v0_typec: regulator-vbus5v0-typec {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus5v0_typec";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&typec_vbus_en>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
 	fan: pwm-fan {
 		compatible = "pwm-fan";
 		cooling-levels = <0 100 150 200 255>;
@@ -286,6 +300,51 @@ regulator-state-mem {
 			regulator-off-in-suspend;
 		};
 	};
+
+	usbc0: usb-typec@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PC6 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&fusb302_int>;
+		vbus-supply = <&vbus5v0_typec>;
+		status = "okay";
+
+		usb_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+			try-power-role = "source";
+			op-sink-microwatt = <1000000>;
+			sink-pdos =
+				<PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM)>;
+			source-pdos =
+				<PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usbc0_hs: endpoint {
+						remote-endpoint = <&usb_host0_xhci_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usbc0_ss: endpoint {
+						remote-endpoint = <&usbdp_phy0_ss_out>;
+					};
+				};
+			};
+		};
+	};
 };
 
 &mdio1 {
@@ -346,6 +405,16 @@ usb30_host_pwr_en: usb30-host-pwr-en {
 			rockchip,pins = <1 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
+
+	usb-typec {
+		fusb302_int: fusb302-int {
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		typec_vbus_en: typec-vbus-en {
+			rockchip,pins = <1 RK_PC1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &pwm0 {
@@ -748,8 +817,30 @@ &usb_host0_ohci {
 };
 
 &usb_host0_xhci {
-	dr_mode = "host";
+	dr_mode = "otg";
+	usb-role-switch;
 	status = "okay";
+
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
+		};
+	};
 };
 
 &usb_host1_ehci {
@@ -765,7 +856,29 @@ &usb_host2_xhci {
 };
 
 &usbdp_phy0 {
+	orientation-switch;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usbdp_phy0_ss_out: endpoint {
+				remote-endpoint = <&usbc0_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usbdp_phy0_ss_in: endpoint {
+				remote-endpoint = <&usb_host0_xhci_ss>;
+			};
+		};
+	};
 };
 
 &vop {
-- 
2.56.0


