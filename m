Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964B660A5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 13:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vfklY59w;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g/j9V9aF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YE3vXI9trThRKlTPUxAcuUZZSJoH5FvS/IfvvJzaeh8=; b=vfklY59ww5f+B21rb8gd/I5nEv
	xiYP47ld417yXMrmjw9KMU3M3X/+Mgr7/oDkQrtN4B6ho5CCi8JztSOTZfP0C/tWtavq3SGBoUrwv
	SMcFMHzgLAphzJkp0vot7emVBu2/9eMIZRTAbliSyuFBp3A5Lssa21T8nR8mPRBJEbSRxlUJfltvo
	UuWQP8/5TaLTB3cuogYK+o0en/br0/Y5RPmtOHIeB0AIyJU7DLPPsu99k6mWvkIxjoQplhcgVh94c
	hDT3AmigvF0yXJKry5+wN33C2pZ7rZonDyGQQOXUmq3sHTMON4jpB4pt9ClNxgVpi6gta/wm96NkH
	GOf9oxmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSE0N-0000000G8s5-3LTx;
	Sat, 14 Nov 2026 13:41:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSE0I-0000000G8lV-2RPp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 13:41:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E6C5E62819;
	Sat, 14 Nov 2026 13:41:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794663673;
	b=V7PF0UTKBF7K+xFlUH1C7nIgP6U8EvffoyxDhoEWXcsr1CjAInKOZ9cZMeFV2/MCNivn
	 NRzqnfE4GXNaXCLatmWcg4qx+km5Ve6dkJkqiGZtlKH0FOLXpMszyT2QHLGWF2TsAi9JG
	 9/pt2LSGwjM+KGZu1Zudqh9sX5no2cOFhYjZ2BE6o27sY+fVVevXh6dK9ofqMuk8mqNwP
	 BaB9/p9s7xzUpC8xVvvBiUmG07CJx+1nnr5mV4cjiqO50ddyPprLe4Lt7FlD9qgN8rUJU
	 7SAoz3At+J4cTBppZEuqCsz/SKxLws0E1Ke3zUBEuAt62O3/l2pg5clRTG6AY1/6CeQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794663673;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YE3vXI9trThRKlTPUxAcuUZZSJoH5FvS/IfvvJzaeh8=;
	b=h27EDYQ2TeFDYQqvUYn8XV4BSbiJGI+UIi/pFbmZuVu2Hq+vgA3o87abgjLxFU7Ltgp1
	 L9qrzVUiQilXJNX1Rn+er8L9vUTf/QrB/HgLb7HJYwS4OE890PpZw5FSMXmJs0FvC2oOY
	 JdQhYu8ConmJ2aQm6/f2Qq6MnsYkm3danibo4VPc3c9WCUKl9vOOuAGxT9bMkv+Sb5CHT
	 6cYhYXON/7H5PVEcF0O+DEKTpVX0Zo8xXbf3Rn60WYQpap/T8hL9ezqlBY9Os3/v2/Byk
	 +7n2NARd6SN32TsriAp6khRAXCB5jM3IurDiC+GG1H9YNR/sHyVxNXnkG5M5aUIdsmQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4BE1A1F000D1;
	Sat, 14 Nov 2026 13:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794663673;
	bh=YE3vXI9trThRKlTPUxAcuUZZSJoH5FvS/IfvvJzaeh8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=g/j9V9aFyH1igPqYYUVkmUAGq1Exxol0TiHcslH+ereScnJ94cpTOqv4fVVsE394L
	 UztvDMrHnSdnFmqIkRE8u985hKrFvV63exsCQ1NxYe2Yu3FmznI55bQm1AtYMVtFGR
	 /t+8pS12LCfovEeV9QSv8KOG33+jTy0F4MiAKyt3r9/iRa7jPOFFT/vOphYOKQiBIg
	 q3wMxEoTyD7M1T4ULqTwQIMkph5/wdn4oHiZH1VGF6sLJquZTKHop2TH0zk7luMXQQ
	 Xs+zNAG9tG6Smb6DOKTWCIYpb7chTVRdC7hjmmVfH57JlOvMF7brXvEEWfhVNLS0qu
	 2ZJkiGm8C8ILw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B355A49DDA;
	Sat, 14 Nov 2026 13:41:09 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sat, 14 Nov 2026 16:41:13 +0300
Subject: [PATCH v7 08/10] ARM: dts: cortina: Add CS7542 SoC and Securifi
 Almond+ board
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261114-b4-cs75xx-v7-8-8f17f38821b4@gmail.com>
References: <20261114-b4-cs75xx-v7-0-8f17f38821b4@gmail.com>
In-Reply-To: <20261114-b4-cs75xx-v7-0-8f17f38821b4@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Drew Fustini <fustini@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 Jason Li <jason.li@cortina-access.com>, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794663665; l=6235;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=n/Dq4py/0eGRBnmQUzS6IOXN56dx/13Os1x5nNKfay0=;
 b=fq2JIa474ARBkTYrUpi/6SUkTPx9EkieRQk4ocvQ+6BQYH2CimOsg945UXP+Emv1vwdR8rhau
 mQMNh8++legDTnfDt5kV5TtrTOU1GW5JcoMHbN+fIBtsxTP8wpZkMNM
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fil Dunsky <filipp.dunsky@gmail.com>

Add a minimal description of the Cortina Systems CS7542 SoC: the two
Cortex-A9 cores, SCU, GIC, global timer, private timer and watchdog,
PL310 L2 cache controller and the four on-chip UARTs.

The peripheral clock (APB) runs at 100, 150 or 170 MHz depending on the
boot strap pins. Until there is a driver for the global control block
that reads the straps, model it as a fixed clock whose rate is provided
by the board.

The Securifi Almond+ is a touchscreen Wi-Fi router with 512 MiB of DDR3,
512 MiB of NAND flash, a QCA8337 switch, QCA9880 and AR9580 Wi-Fi and an
ASM1042 USB 3.0 controller behind the SoC PCIe root ports. For now,
describe the memory and the console UART, and reserve the top 64 MiB
of RAM which the vendor firmware hands to the packet engine queue
manager.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/cortina/Makefile                 |   3 +
 .../dts/cortina/cs7542-securifi-almondplus.dts     |  46 ++++++++
 arch/arm/boot/dts/cortina/cs7542.dtsi              | 127 +++++++++++++++++++++
 4 files changed, 177 insertions(+)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 28fba538d..cf4433001 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -12,6 +12,7 @@ subdir-y += broadcom
 subdir-y += calxeda
 subdir-y += cirrus
 subdir-y += cnxt
+subdir-y += cortina
 subdir-y += gemini
 subdir-y += hisilicon
 subdir-y += hpe
diff --git a/arch/arm/boot/dts/cortina/Makefile b/arch/arm/boot/dts/cortina/Makefile
new file mode 100644
index 000000000..93be6c9ae
--- /dev/null
+++ b/arch/arm/boot/dts/cortina/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_CORTINA_ACCESS) += \
+	cs7542-securifi-almondplus.dtb
diff --git a/arch/arm/boot/dts/cortina/cs7542-securifi-almondplus.dts b/arch/arm/boot/dts/cortina/cs7542-securifi-almondplus.dts
new file mode 100644
index 000000000..e3152fd1d
--- /dev/null
+++ b/arch/arm/boot/dts/cortina/cs7542-securifi-almondplus.dts
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Device Tree Source for the Securifi Almond+ router
+ */
+
+/dts-v1/;
+
+#include "cs7542.dtsi"
+
+/ {
+	model = "Securifi Almond+";
+	compatible = "securifi,almondplus", "cortina,cs7542";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x20000000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		/* Reserved for the packet engine queue manager */
+		qm-buffer@1c000000 {
+			reg = <0x1c000000 0x4000000>;
+			no-map;
+		};
+	};
+};
+
+&apb_clk {
+	clock-frequency = <150000000>;
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/cortina/cs7542.dtsi b/arch/arm/boot/dts/cortina/cs7542.dtsi
new file mode 100644
index 000000000..29b0b7da8
--- /dev/null
+++ b/arch/arm/boot/dts/cortina/cs7542.dtsi
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Device Tree Source for the Cortina Systems CS7542 SoC
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&gic>;
+
+	/* Rate is selected by the boot strap pins, set by the board */
+	apb_clk: clock-apb {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "apb";
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			reg = <0>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			reg = <1>;
+			enable-method = "cortina,cs7542-smp";
+			cpu-release-addr = <0 0xf00000b8>;
+			next-level-cache = <&l2>;
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		uart0: serial@f0070110 {
+			compatible = "cortina,cs7542-uart";
+			reg = <0xf0070110 0x30>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&apb_clk>;
+
+			status = "disabled";
+		};
+
+		uart1: serial@f0070140 {
+			compatible = "cortina,cs7542-uart";
+			reg = <0xf0070140 0x30>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&apb_clk>;
+
+			status = "disabled";
+		};
+
+		uart2: serial@f0070170 {
+			compatible = "cortina,cs7542-uart";
+			reg = <0xf0070170 0x30>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&apb_clk>;
+
+			status = "disabled";
+		};
+
+		uart3: serial@f00701a0 {
+			compatible = "cortina,cs7542-uart";
+			reg = <0xf00701a0 0x30>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&apb_clk>;
+
+			status = "disabled";
+		};
+
+		l2: cache-controller@f5010000 {
+			compatible = "arm,pl310-cache";
+			reg = <0xf5010000 0x1000>;
+			cache-unified;
+			cache-level = <2>;
+			arm,shared-override;
+			arm,tag-latency = <1 1 1>;
+			arm,data-latency = <1 1 2>;
+		};
+
+		scu@f8000000 {
+			compatible = "arm,cortex-a9-scu";
+			reg = <0xf8000000 0x100>;
+		};
+
+		timer@f8000200 {
+			compatible = "arm,cortex-a9-global-timer";
+			reg = <0xf8000200 0x20>;
+			interrupts = <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
+			clocks = <&apb_clk>;
+		};
+
+		timer@f8000600 {
+			compatible = "arm,cortex-a9-twd-timer";
+			reg = <0xf8000600 0x20>;
+			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
+			clocks = <&apb_clk>;
+		};
+
+		watchdog@f8000620 {
+			compatible = "arm,cortex-a9-twd-wdt";
+			reg = <0xf8000620 0x20>;
+			interrupts = <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
+			clocks = <&apb_clk>;
+		};
+
+		gic: interrupt-controller@f8001000 {
+			compatible = "arm,cortex-a9-gic";
+			reg = <0xf8001000 0x1000>,
+			      <0xf8000100 0x100>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+		};
+	};
+};

-- 
2.53.0



