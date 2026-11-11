Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD27160A6F59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 07:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jNAgnhkP;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v5UaCm/c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=U35AzZ/XWEKZdjjiv348TI/fLy1BVLDjtqngJWn8/1k=; b=jNAgnhkPj9Hxyj
	9M+/lGbTImr2akhQctO4vu7BrMW/2kXYuzlTV/DKQxkWE1FWg01CERwU8H4DJ2FArGYKp5dNHdLGD
	4NUBlXviVj1XF982qdLj3J+X/DbswiRfY1MPX0mW76Q7U2oBo3crCaewbYvCdl5VM2XAQ2stovEgq
	LPqFTcvCsnWLkIpSP/PfLcMBB6BlMQZhUCj+u8lFKYeFwOzBW8d9BznrXAQG2txTBrYGaEMhZAnbw
	VkYv7neIuyo2Li0FQNCU0d4toayPtA5qo6XcIavdg71n23gADnal9hEiGbJEy/B+WADQC+GxPa/ix
	7nxXfhHxPMPW0W1T4muA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2oG-00000005ufb-2Ny1;
	Wed, 11 Nov 2026 07:31:56 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2oB-00000005ucJ-3bS0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 07:31:53 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-37600b0db49so1014455eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 23:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382311; x=1794987111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U35AzZ/XWEKZdjjiv348TI/fLy1BVLDjtqngJWn8/1k=;
        b=v5UaCm/cewTUoC+BzSEGPUXpCucNl8CcF4w+2Gd+cciSAv69I3whZZwfAagkxqmycV
         DmxwZXQB/u9YKDnvMj/WwiAxmseBzF/smo4vlMUGiQn3xH9vYFRpmGoX8jhW6R8YLuU8
         7vcxffrCQiYi58EsS1wxace9RXtgFM0RGEeDk3z+blcKr7vCKgZvW8ZYG61d2Jy0+88z
         UzXjD2DAxAqqXNYK8d5aZUt7eVLdy/AtPqUnBjsBT5sYool64dZGkMvb2QYvHWKb+0Ra
         hWJKbke2iFlphp1gSvunHA981i70jYuGXnnsYlDGK0Iuq/XtAlDVY6vjwtYEo/dJXfXw
         lX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382311; x=1794987111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U35AzZ/XWEKZdjjiv348TI/fLy1BVLDjtqngJWn8/1k=;
        b=K2Nn5nhDDbj3mUHpu8IouLtIKzWbcbHb9D2qBlI5uLaTExc8efIx9R47+kGLx55OLe
         laZabwIkCSAoYzkypVljRZgjZkl6evHZvJLeB/O4Pu9caz4O2TkrVFJtBZlXmRpb5QWI
         90MLgz4xiMJIjYe49fkIEh+pf8uEsE/2gliUiGqQS4xjoA9X+QYTFlts8kC5LwscV7NE
         MDyuk2mdJdGHRKJwti4HceLTEgXdqeeczy9HRkiO8z3T3K4ngwId8NXaU7HFu1e7sXti
         09v7UhstnmPL9IxGLLpFSiD0zaiRq/KBdjZSxrququ8S4JJolBYaXGzQbx73GDrB0CUo
         XlCg==
X-Forwarded-Encrypted: i=1; AL+hErGidigrtp3Oj8ycvDT0fVhRAzEuwZKfWTv0k0mcTUoWhuDhDnN9VG6wyZna+0syz50H3CoY6KGHT496K6kKDNFe@lists.infradead.org
X-Gm-Message-State: APuU4Z8avKaifBlJEVlM15kuBxavdo7GwWEc2t5NuDrZHO61sTgewixm
	5YC1fG6MzM0jQByNt/NZ/8Iz28t7vqrKue62GebMBJrJS4YJBR0lDjq8Xa5MEA==
X-Gm-Gg: AYBFou3sPNVYrzal9Vx+lSnuw1Lt6x20drhWCda0v0rWIAMeEctkDwFfaa80vI0uLEn
	U16lRyDmnaaDpiR4rupwMDWn+66W9iTZNys0bGtsfzRBKGt6RAM4RjQsdlbdralJVTE74IrS7+J
	BMFuo/u7Owy3+l8MRerPXiNGh0rpsuMrlXT1Ef4scW74nBlJ/SAzXbLZ8fKj4kTvrXslPh7+py3
	tV0x41uWpNa/eR0Y0wSGu8ACXwN8RZRgW/YXbucYkT9NDjgFf84LVX6Wu9mQtsfGXBPgsi7CwI4
	H49fNom5/MhKrKXUwna0HIdQfnMf6VfTIbzixD/CG03msMQ9sL31FjiaL8XXgGEF+3NtXkqOlyE
	EXgHcGQ29qIuPKq9cB84B6yfnmcbIkCOI7OzyBk41EhGeps8BN3Pc5aX7oiWr/d4NFeH+M3B0x+
	MRWCeNapOEfVty+WLJ7/GUMn1w+XhrOPN+3+Lr0SVCU7VeOYst9E45cvU0RZRpHrRNAL5udUWNH
	Nh20j400pjL40YL9M/c58yn2CV5VZmW9s+ycie0MHMkNlYCdeIxBYSFEwp3xdXut3K1Ts/yk/lW
	GO54ViBlffapXWcT2jLtjxRohSwfWqFjJLVRpHhttCWHzJ0OgD57dBouGttvmvPVLwhb8YIMZCT
	X4O3Ihlq2MA/sWXO75Q==
X-Received: by 2002:a05:7300:dd08:b0:376:c9de:ec3f with SMTP id 5a478bee46e88-376c9df08e9mr1172019eec.7.1794382310760;
        Tue, 10 Nov 2026 23:31:50 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm12640655eec.8.2026.11.10.23.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:50 -0800 (PST)
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
Subject: [PATCH v9 2/4] arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node
Date: Wed, 11 Nov 2026 15:31:35 +0800
Message-ID: <20261111073137.381966-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111073137.381966-1-a0987203069@gmail.com>
References: <20261111073137.381966-1-a0987203069@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_233152_242663_3391B693 
X-CRM114-Status: GOOD (  11.50  )
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
index 7228ad4735b5..ede0d42d2d78 100644
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
+			reg = <0x0 0x40200000 0x0 0x40000>;
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


