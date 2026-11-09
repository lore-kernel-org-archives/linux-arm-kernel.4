Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182B7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 06:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GWk9yalS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPWjwc6c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=c0Q1lb4Qqoljlh+F9k2cVtvGnbnmDGMBxQf3ZK0rUb8=; b=GWk9yalSVJRmXf
	1ahX7/jZg8MgkKMq6Slo0wgw60Hw/dwDs+c0xIdFXPxiK+03Ar1zvv+5Q/K0/+6pywQlGS8GdHUTi
	uOTzdhBVcfpKO54XKrtCBQ6MH8NRRZbLV6tmOxvKfFmKkBEp2RBSNqB9G+xpchYJ8FOk7VBetxT9j
	2hpDGoGovOlgK8KQYyZaFiPXM9EnHFsIW0kNHgcZRISC/+HTqhheKnLJKs2XIVVQz3E6E3K7mQov0
	IkjWOtRVzWT94r+fo3QCNDnCT7VqJuB9gDz72EUIJfnv1wI3miiFbRMstFj7H+4LS9uATMqrrTBU4
	WWW4pqBIqeYYNkwM6V2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJIp-0000000HX3T-2258;
	Mon, 09 Nov 2026 06:56:27 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJIm-0000000HX0s-2D1m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 06:56:25 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso844969c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 22:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794207383; x=1794812183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c0Q1lb4Qqoljlh+F9k2cVtvGnbnmDGMBxQf3ZK0rUb8=;
        b=xPWjwc6cU7ZpN/Fqi5EPdWACeLq6+MGoRXvQVubvJBV9Q/leQtk23bP9nT2svHVwm1
         jQPhWhQtLwLDk3us+GSOl1V+sFSyJoxlgJYENlc+5+ScXQyMA1O+0n6cUfkzcFVR/nu8
         vTfESKkDdh7mc1Pf62pfS/o4XjUXSVlkkUmW5B5A8uw0jUDaBcI1cTbiFkA2ypjXlXIz
         9qP8mgIUPIL6Uh3ydjNEQ19kk76dynXzSfXhDrKZumZEHo642S/Xna8ghXbmvcQ+8IYa
         0teFu9FvtoIrvcT4jEQZp4j6u6Dxn/OxN8v8I/DhBnDvHSC3ttDMEBC22lp5jzZVXuA5
         N7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794207383; x=1794812183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c0Q1lb4Qqoljlh+F9k2cVtvGnbnmDGMBxQf3ZK0rUb8=;
        b=TMQZeDtgtMyAms0NcLM3MyO+tgcH0UsZXGCKV33nxfcZpbs/bQ6jHThmlW4I12M0qY
         WC7hJYhNp5TUdiejAkPbmHTMH7WVYWvwfl4Sez5XDUjImxSyYmP/L4PhorMn18wAjcQt
         vPvoQvCHhatKYW3mBzgFKZTipP47aSaeg/FVukF+zUqnYQQCG7KN4r9zrjrNIsf2uqB/
         TfhCCnUya+TjRYQy5lMkNYR3p90xxeALBjVrW17CrcKwdGTTEWL5+g09avAYn6iTfa6H
         D9qLISfn23xV0tRwd92bHKDMpNyV6bjxbrbzPjwxsl/t9+MrRbQx+HADajXN3WnQTcaS
         D2pA==
X-Forwarded-Encrypted: i=1; AL+hErG+As1VFE1Mw/iw7MOueYi1hlQCZBJM5yPZUA5r6QcdG/gXWeBVc+0bAtNYmDachB4TU/ZY046Az/8NpRaAzdXD@lists.infradead.org
X-Gm-Message-State: APuU4Z//pVXEYcks77Hf7GnbC7Eba60KryoiNi8aWdIkXp5RA7iGZw4a
	FuPa4J3vxf3l4Kvz2ujP2bycUHUFf7PL/Dh9X1yihZKvdDafKwKUA/WU
X-Gm-Gg: AYBFou3yYgjO6VYelJPBmkaW/nQvSMXNIU1JKLYPbOwno/abM2EfC/SPU/RBMDnEmte
	FNro161+052BmSIIbx4D/hw460N5ZSxU+RcW4oxDSNg312YxC3oytNa+GEIhqy2gjPFqF9QIouM
	Z8Ap7+LK+gp/j4Sk12kuWhmsRMpIFo3LOY8b49jWeJ8D4GzjtcT75D8qPxNnzXtEKsQQzcrrtRe
	PWL6EEzbLbCmM7HfMPXZL1HiKuGP+gQSMjJtVJZo/XBYg1+RExFgBKJNOE/S3sSAXBPkV9K+M4Q
	cunLlb24L8+8pGcf+SvsqNxUfmJuKWZUSyypQyGSv23dasQgMKXJQO5Nv80enZq8VEPXLAXGDp5
	6VH8tJBO7uT9CPK/LMELunsynxvtKIpxMEzefw9XZ9bYxLbiPNw2HZPadecX4qQafLwRsTA6H2h
	JyG9VkPylZdGpw2QKMEVIMwlbVH1G66ZNeRYyzYGUjmQPbbInMLE0WEoPzfl03qNdU2zCywjS+C
	e5DUvzD1q99PgFpq9+7sPKnjpnDJRdKE80sWpBA4jvPfGt/rqvBYSEcTO8QZ3RmtKCm219LS3cY
	e/SVoU7HSj2Q7lb5GW6qFCtPIzMJEbWQ4iAmHxjfPw+iHfY0aiC/iUqhW2d9r/pZQdCMi3mOAwr
	uiZqYQGcZNYtHtFez0w==
X-Received: by 2002:a05:701b:2214:b0:1a6:4679:6cf4 with SMTP id a92af1059eb24-1b39feb9511mr5037784c88.36.1794207383471;
        Sun, 08 Nov 2026 22:56:23 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm10120176c88.13.2026.11.08.22.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:56:23 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v8 2/4] arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node
Date: Mon,  9 Nov 2026 14:56:04 +0800
Message-ID: <20261109065606.62641-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109065606.62641-1-a0987203069@gmail.com>
References: <20261109065606.62641-1-a0987203069@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_225624_581406_E1642976 
X-CRM114-Status: GOOD (  11.68  )
X-Spam-Score: -1.8 (-)
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
	FREEMAIL_FROM,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the USB subsystem nodes for the MA35D1 SoC and boards:

  - usb_phy: standalone PHY node with #phy-cells = <1>, covering both
    the OTG port (PHY0, index 0) and the host-only port (PHY1, index 1).
    Uses nuvoton,sys phandle and HUSBH0_GATE clock per the binding.

  - usb (DWC2 gadget, USB0): phys = <&usb_phy 0>, dr_mode = peripheral.
  - ehci0/ohci0 (USB0 host): phys = <&usb_phy 0>, companion pairing.
  - ehci1/ohci1 (USB1 host): phys = <&usb_phy 1>.

Board files (ma35d1-som-256m.dts, ma35d1-iot-512m.dts) add pinctrl for
VBUSVLD, PWREN and OVC signals and enable all USB nodes.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 36 ++++++++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 36 ++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 65 +++++++++++++++++++
 3 files changed, 137 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 78534d613486..b2f25de2ae44 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -97,6 +97,16 @@ pinctrl_uart14: uart14-pins {
 			power-source = <1>;
 		};
 	};
+
+	hsusb-grp {
+		pinctrl_hsusb: hsusb-pins {
+			nuvoton,pins = <5 15 1>, /* VBUSVLD */
+				       <11 12 9>, /* PWREN */
+				       <11 13 9>; /* OVC */
+			bias-disable;
+			power-source = <1>;
+		};
+	};
 };
 
 &uart0 {
@@ -151,3 +161,29 @@ eth_phy1: ethernet-phy@1 {
 		reg = <1>;
 	};
 };
+
+&usb_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hsusb>;
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index a029b660e8dc..58349470bc64 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -100,6 +100,16 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+
+	hsusb-grp {
+		pinctrl_hsusb: hsusb-pins {
+			nuvoton,pins = <5 15 1>, /* VBUSVLD */
+				       <11 12 9>, /* PWREN */
+				       <11 13 9>; /* OVC */
+			bias-disable;
+			power-source = <1>;
+		};
+	};
 };
 
 &uart0 {
@@ -153,3 +163,29 @@ eth_phy1: ethernet-phy@1 {
 		reg = <1>;
 	};
 };
+
+&usb_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hsusb>;
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..72a1659207fa 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -76,6 +76,14 @@ IRQ_TYPE_LEVEL_LOW)>, /* Virtual */
 		interrupt-parent = <&gic>;
 	};
 
+	usb_phy: usb-phy {
+		compatible = "nuvoton,ma35d1-usb2-phy";
+		clocks = <&clk HUSBH0_GATE>;
+		nuvoton,sys = <&sys>;
+		#phy-cells = <1>;
+		status = "disabled";
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -431,5 +439,62 @@ mdio1: mdio {
 				#size-cells = <0>;
 			};
 		};
+
+		usb: usb@40200000 {
+			compatible = "snps,dwc2";
+			reg = <0x0 0x40200000 0x0 0x1000>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk USBD_GATE>;
+			clock-names = "otg";
+			phys = <&usb_phy 0>;
+			phy-names = "usb2-phy";
+			dr_mode = "peripheral";
+			g-np-tx-fifo-size = <16>;
+			g-rx-fifo-size = <0x100>;
+			g-tx-fifo-size = <256 256 64 64 64 32 32 32>;
+			status = "disabled";
+		};
+
+		ehci0: usb@40140000 {
+			compatible = "generic-ehci";
+			reg = <0x0 0x40140000 0x0 0x1000>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk HUSBH0_GATE>;
+			phys = <&usb_phy 0>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			status = "disabled";
+		};
+
+		ehci1: usb@401c0000 {
+			compatible = "generic-ehci";
+			reg = <0x0 0x401c0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk HUSBH1_GATE>;
+			phys = <&usb_phy 1>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			status = "disabled";
+		};
+
+		ohci0: usb@40150000 {
+			compatible = "generic-ohci";
+			reg = <0x0 0x40150000 0x0 0x1000>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk HUSBH0_GATE>;
+			phys = <&usb_phy 0>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ohci1: usb@401d0000 {
+			compatible = "generic-ohci";
+			reg = <0x0 0x401d0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk HUSBH1_GATE>;
+			phys = <&usb_phy 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
 	};
 };
-- 
2.43.0


