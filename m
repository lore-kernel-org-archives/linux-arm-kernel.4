Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9430A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cA5yje67;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EQBUDVUk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Vr3v17aViNh7saoNwUxlECD+D8aOcvcdxMhiM27kkmo=; b=cA5yje672o9wYT
	yhSqB7u7CVg6dfZo+aLItRO5fg/WYiO6ptQxspfWP9BLw9M9CClS/nZ0fifHncH1IMavXN0p8Ky3f
	gLp7V+KVo1dHuyoA1BZyYqVZNn9YLnTIbG6ZptMFkSxFkVdvwtzAEM2l0uh92+hklop8Uo4kOpmRO
	/5h/2FNq/kp0awdif8O49dAy/Sbwjt0sgMeigBtczq5qaxdHhekBIMs4BOjEYCjkFhi5VoT7vfvIT
	nbpgSlI81zxRb2z1YGHpmSXhErGdHsy+7ndb7kRzEOA8PaywJi+D/8ix6azQT7Q4tUFrVk8LrnNNM
	7yeYdN+3hSfp+rMGbrLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6Zl-0000000Cxpj-0oOG;
	Thu, 19 Nov 2026 18:09:37 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6ZY-0000000Cxgm-3cdG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:09:27 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-53ec2cc397aso93215b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111763; x=1795716563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vr3v17aViNh7saoNwUxlECD+D8aOcvcdxMhiM27kkmo=;
        b=EQBUDVUkuPiRbBwEHF9IWzVJRTlTU2pBurkogVa8RQpKJ8LM37yLiqHjv1eEP6CpgH
         Ys+Rr1mNDNC9JguR29HcJjxzpJ3eGX3VShLicv6RmvBz1nJoqt+UVyaC6UaBlUuK/KRp
         e1dd19WFQxSp2hBxSAwrPr6NZTr8zwMNHqmjxUB1yymoXITnSoF/WEujyBmi01cA1HNg
         ScoX3j3CjFblLhsZHQF+2JbEqWbBueA6Q6VaHq/JHsiBIDNZGrWTht4wy6TLDJc2Fw31
         S7ob/asbQcaRveMD3xLww3f/XRR+S6wY7dJdyGEcZFjgZ1to3QIbOZD0KZ9FNZWfYEKU
         8SUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111763; x=1795716563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vr3v17aViNh7saoNwUxlECD+D8aOcvcdxMhiM27kkmo=;
        b=uJrjvxXCP4XHTAjrcOiuj/G8xvAxpWTSxH6boDA55vNVuuEi0+duxfUw3M/OEfrxmx
         HLxNgRTmcd+GRrfLMFQV4YwmpBhNjNaHq+0mThPh0mp/v9FM1hCEZNNBtK66wRn8NOE5
         8Am1WLuqova4OR+RBfx6MJilhB0/xoZUGxNtf03rfzD7yyuc1tOjLvpqeCw4XZTs72Tk
         HEa0F/oWP12jluwAVCCn1tf4wvFvCIPTzxawQZh/vBpm3/bW2i79EpkPBJB8e1MWUG69
         wgFf3M1w9Je9sx+Ey9gKjFCLo8+hSAC250DatYBD3b5zH70QAWuXOp4Z4Yr97BktU1q0
         TZxw==
X-Forwarded-Encrypted: i=1; AL+hErEz7yJl2rDCU4k4o+yd8/JPwdJb7Yt9P3aDJAWqowCHpFiUd1popAvVs4umETIDpCBC8Bs4eXbDbd9PSle3qhQG@lists.infradead.org
X-Gm-Message-State: APuU4Z/DTDCaV5oIytU55wcJdMtBunsUzbfZg9YUuIf/3+cJXpFiwJwk
	Xyh8XlPDFeTf4+YezeP9seCn26EyNBLkNJInzI9h68/833pSn/g1nXFs
X-Gm-Gg: AYBFou1pv8l5fMNZISBTUwm99gZUN+nAc6Wx7RtKAyRgV5JNeNr+Fq4vClcZ9yjz2Qz
	FqZ74Cn7afHu/uHBYv+WP138AzqPWv+aHqXBT2dP1QdlT7RpO0Ju+Qmp6N9ksZ0ljKcaAKmli3l
	eW8X5sX/cvUPix/JthMZdAsN8xulLB2Y1UxlLdTz+bPvIg0AUooF7cYnXYqc0FNA+9ZNV8m0EbV
	N+PKpdHARCd1JaNAOQsw7g5U+4viTDQDqDQjuFFR+NRALxeo03WAPZAQzIxcfLXkuHQvtXreT00
	9qSLfFkJoc/vVtVUCwD5nJGyduXNenzJuF4oDQi+aSvORJ703Rv++lvlE8INQQD0DWHD/uHZxwG
	3X/IQ9+WqssprRn/YyCiEN9ot2bV/s9aMb0Vqsw2wD6vuTPMoFuunerR13NVsizd8KD8/PnSpU0
	hTK+IsXZ6kiXSbcIqasyl72UwmbFdVyOOyY5PJS/iUtMNRJo+xy07iFUboF5JHtaDRc1wDlBt98
	yQ6PMyzWEDVKdcIr0SrxrCSDG2gShsKs/I2bguAjtP7NaCah3cZ9CIog24f7xxwyiAYWQo11GAE
	8ctPQ+EZY84IpPbc62UcF56XPfWelap+/GOEs4Vwa470unQrl5yxR4BEd9Lu4AmZ7y4ikNR1gew
	2
X-Received: by 2002:a05:6808:3081:b0:4e8:e73e:e945 with SMTP id 5614622812f47-57a0c19fe4emr751928b6e.63.1795111763503;
        Thu, 19 Nov 2026 10:09:23 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a34252987sm107009b6e.4.2026.11.19.10.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:09:23 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: [PATCH v4 2/3] arm64: dts: allwinner: add A733 SoC description
Date: Thu, 19 Nov 2026 13:09:21 -0500
Message-ID: <dbfb7c5ea8b0ade2d48ef8e5cfd0b9e5a9946483.1795034153.git.enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795034153.git.enzo.adriano.code@gmail.com>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_100925_021889_8EC460B6 
X-CRM114-Status: GOOD (  13.29  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Provide the SoC description needed for the Cubie A7S console, PMIC and
microSD support. Describe the CPUs, PSCI, architectural timers, GIC,
RTC, main and always-on clock/reset and pin controllers. Include the
main and R-domain UART/I2C instances and MMC0-2 with their pin groups.

The GIC maintenance PPI 9 and ARMv8.2 EL2 virtual-timer PPI 12 follow
the A733 User Manual v1.00, section 12.2.3. The GICD/GICR/ITS windows
and noncoherent attributes follow Andre Przywara's public A733
reference and the A523 precedent. The CPUX interconnect diagram in
section 5.1.2 supports noncoherency as an integration inference. The
ITS stays disabled pending its clock/reset and MSI integration.

Describe one DynamIQ cluster sharing L3, as shown in the A733 User
Manual v1.00, section 5.1.2 (figure 5-1), and partition PPI 7
(section 12.2.3, table 12-1) between the Cortex-A55 and Cortex-A76
PMUs so each probes its own core type. Defer capacity-dmips-mhz
until it is measured on A733.

Link: https://gist.githubusercontent.com/apritzel/60fd7379b9560a15b8b352986b69d39f/raw/efd9cdf8f26ba5b0c7e138f093af44a1cf322469/sun60i-a733.dts
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---

The November 18 v4 RAM boot on Cubie A7S with vendor firmware exercised
console, R-I2C0/PMIC probe and MMC0 read-only transfers. CPUs 0-7 were
in one cluster, with the A55 PMU on CPUs 0-5 and the A76 PMU on CPUs
6-7 counting and receiving PPI 7 overflow interrupts on each CPU.
PMIC/NMI interrupt delivery, EL2 interrupt delivery and ITS/MSI were
not tested.

Dropped Vinicius Pedrosa's Tested-by because v4 changes the GIC
interrupt encoding.

 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 657 ++++++++++++++++++
 1 file changed, 657 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
new file mode 100644
index 000000000000..b0f642f37803
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
@@ -0,0 +1,657 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+
+#include <dt-bindings/clock/sun6i-rtc.h>
+#include <dt-bindings/clock/allwinner,sun60i-a733-ccu.h>
+#include <dt-bindings/clock/allwinner,sun60i-a733-r-ccu.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/allwinner,sun60i-a733-ccu.h>
+#include <dt-bindings/reset/allwinner,sun60i-a733-r-ccu.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+
+				core4 {
+					cpu = <&cpu4>;
+				};
+
+				core5 {
+					cpu = <&cpu5>;
+				};
+
+				core6 {
+					cpu = <&cpu6>;
+				};
+
+				core7 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x0>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@100 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x100>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@200 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x200>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@300 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x300>;
+			enable-method = "psci";
+		};
+
+		cpu4: cpu@400 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x400>;
+			enable-method = "psci";
+		};
+
+		cpu5: cpu@500 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x500>;
+			enable-method = "psci";
+		};
+
+		cpu6: cpu@600 {
+			compatible = "arm,cortex-a76";
+			device_type = "cpu";
+			reg = <0x600>;
+			enable-method = "psci";
+		};
+
+		cpu7: cpu@700 {
+			compatible = "arm,cortex-a76";
+			device_type = "cpu";
+			reg = <0x700>;
+			enable-method = "psci";
+		};
+	};
+
+	osc: osc-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	pmu-a55 {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_a55>;
+	};
+
+	pmu-a76 {
+		compatible = "arm,cortex-a76-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_a76>;
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_HIGH 0>;
+		arm,no-tick-in-suspend;
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x0 0x40000000>;
+
+		pio: pinctrl@2000000 {
+			compatible = "allwinner,sun60i-a733-pinctrl";
+			reg = <0x02000000 0x800>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_APB1>, <&osc>, <&rtc CLK_OSC32K>;
+			clock-names = "apb", "hosc", "losc";
+			gpio-controller;
+			#gpio-cells = <3>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+
+			mmc0_pins: mmc0-pins {
+				pins = "PF0", "PF1", "PF2", "PF3", "PF4", "PF5";
+				function = "mmc0";
+				allwinner,pinmux = <2>;
+				drive-strength = <30>;
+				bias-pull-up;
+			};
+
+			mmc1_pins: mmc1-pins {
+				pins = "PG0", "PG1", "PG2", "PG3", "PG4", "PG5";
+				function = "mmc1";
+				allwinner,pinmux = <2>;
+				drive-strength = <30>;
+				bias-pull-up;
+			};
+
+			mmc2_pins: mmc2-pins {
+				pins = "PC5", "PC6", "PC8", "PC9", "PC10", "PC11",
+				       "PC13", "PC14", "PC15", "PC16";
+				function = "mmc2";
+				allwinner,pinmux = <3>;
+				drive-strength = <30>;
+				bias-pull-up;
+			};
+
+			uart0_pb_pins: uart0-pb-pins {
+				pins = "PB9", "PB10";
+				function = "uart0";
+				allwinner,pinmux = <2>;
+			};
+		};
+
+		ccu: clock-controller@2002000 {
+			compatible = "allwinner,sun60i-a733-ccu";
+			reg = <0x02002000 0x2000>;
+			clocks = <&osc>, <&rtc CLK_OSC32K>, <&rtc CLK_IOSC>,
+				 <&rtc CLK_OSC32K_FANOUT>;
+			clock-names = "hosc", "losc", "iosc", "losc-fanout";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		uart0: serial@2500000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x02500000 0x400>;
+			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH 0>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART0>;
+			resets = <&ccu RST_BUS_UART0>;
+			status = "disabled";
+		};
+
+		uart1: serial@2501000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x02501000 0x400>;
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH 0>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART1>;
+			resets = <&ccu RST_BUS_UART1>;
+			status = "disabled";
+		};
+
+		uart2: serial@2502000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x02502000 0x400>;
+			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH 0>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART2>;
+			resets = <&ccu RST_BUS_UART2>;
+			status = "disabled";
+		};
+
+		uart3: serial@2503000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x02503000 0x400>;
+			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH 0>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART3>;
+			resets = <&ccu RST_BUS_UART3>;
+			status = "disabled";
+		};
+
+		uart4: serial@2504000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x02504000 0x400>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH 0>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART4>;
+			resets = <&ccu RST_BUS_UART4>;
+			status = "disabled";
+		};
+
+		uart5: serial@2505000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x02505000 0x400>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH 0>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART5>;
+			resets = <&ccu RST_BUS_UART5>;
+			status = "disabled";
+		};
+
+		uart6: serial@2506000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x02506000 0x400>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH 0>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART6>;
+			resets = <&ccu RST_BUS_UART6>;
+			status = "disabled";
+		};
+
+		i2c0: i2c@2510000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02510000 0x400>;
+			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_BUS_I2C0>;
+			resets = <&ccu RST_BUS_I2C0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@2511000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02511000 0x400>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_BUS_I2C1>;
+			resets = <&ccu RST_BUS_I2C1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@2512000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02512000 0x400>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_BUS_I2C2>;
+			resets = <&ccu RST_BUS_I2C2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@2513000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02513000 0x400>;
+			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_BUS_I2C3>;
+			resets = <&ccu RST_BUS_I2C3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@2514000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02514000 0x400>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_BUS_I2C4>;
+			resets = <&ccu RST_BUS_I2C4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c5: i2c@2515000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02515000 0x400>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_BUS_I2C5>;
+			resets = <&ccu RST_BUS_I2C5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c6: i2c@2516000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02516000 0x400>;
+			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_BUS_I2C6>;
+			resets = <&ccu RST_BUS_I2C6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c7: i2c@2517000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02517000 0x400>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_BUS_I2C7>;
+			resets = <&ccu RST_BUS_I2C7>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c8: i2c@2518000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02518000 0x400>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_BUS_I2C8>;
+			resets = <&ccu RST_BUS_I2C8>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c9: i2c@2519000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02519000 0x400>;
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_BUS_I2C9>;
+			resets = <&ccu RST_BUS_I2C9>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c10: i2c@251a000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x0251a000 0x400>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_BUS_I2C10>;
+			resets = <&ccu RST_BUS_I2C10>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c11: i2c@251b000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x0251b000 0x400>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_BUS_I2C11>;
+			resets = <&ccu RST_BUS_I2C11>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c12: i2c@251c000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x0251c000 0x400>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_BUS_I2C12>;
+			resets = <&ccu RST_BUS_I2C12>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		gic: interrupt-controller@3400000 {
+			compatible = "arm,gic-v3";
+			reg = <0x03400000 0x10000>, <0x03460000 0x100000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+			dma-noncoherent;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			its: msi-controller@3440000 {
+				compatible = "arm,gic-v3-its";
+				reg = <0x03440000 0x20000>;
+				msi-controller;
+				#msi-cells = <1>;
+				dma-noncoherent;
+				status = "disabled";
+			};
+
+			ppi-partitions {
+				ppi_a55: interrupt-partition-0 {
+					affinity = <&cpu0 &cpu1 &cpu2 &cpu3 &cpu4 &cpu5>;
+				};
+
+				ppi_a76: interrupt-partition-1 {
+					affinity = <&cpu6 &cpu7>;
+				};
+			};
+		};
+
+		mmc0: mmc@4020000 {
+			compatible = "allwinner,sun60i-a733-mmc",
+				     "allwinner,sun20i-d1-mmc";
+			reg = <0x04020000 0x1000>;
+			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
+			clock-names = "ahb", "mmc";
+			resets = <&ccu RST_BUS_MMC0>;
+			reset-names = "ahb";
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc0_pins>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		mmc1: mmc@4021000 {
+			compatible = "allwinner,sun60i-a733-mmc",
+				     "allwinner,sun20i-d1-mmc";
+			reg = <0x04021000 0x1000>;
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_BUS_MMC1>, <&ccu CLK_MMC1>;
+			clock-names = "ahb", "mmc";
+			resets = <&ccu RST_BUS_MMC1>;
+			reset-names = "ahb";
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc1_pins>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		mmc2: mmc@4022000 {
+			compatible = "allwinner,sun60i-a733-mmc",
+				     "allwinner,sun20i-d1-mmc";
+			reg = <0x04022000 0x1000>;
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_BUS_MMC2>, <&ccu CLK_MMC2>;
+			clock-names = "ahb", "mmc";
+			resets = <&ccu RST_BUS_MMC2>;
+			reset-names = "ahb";
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc2_pins>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		r_ccu: clock-controller@7010000 {
+			compatible = "allwinner,sun60i-a733-r-ccu";
+			reg = <0x07010000 0x250>;
+			clocks = <&osc>, <&rtc CLK_OSC32K>, <&rtc CLK_IOSC>,
+				 <&ccu CLK_SYS_24M>, <&ccu CLK_PLL_PERIPH0_200M>,
+				 <&ccu CLK_PLL_PERIPH0_300M>,
+				 <&ccu CLK_PLL_PERIPH1_300M>;
+			clock-names = "hosc", "losc", "iosc", "sys-24m",
+				      "pll-periph0-200m", "pll-periph0-300m",
+				      "pll-periph1-300m";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		nmi_intc: interrupt-controller@7010320 {
+			compatible = "allwinner,sun60i-a733-nmi",
+				     "allwinner,sun55i-a523-nmi";
+			reg = <0x07010320 0xc>;
+			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		r_pio: pinctrl@7025000 {
+			compatible = "allwinner,sun60i-a733-r-pinctrl";
+			reg = <0x07025000 0x800>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&r_ccu CLK_R_APB0>, <&osc>, <&rtc CLK_OSC32K>;
+			clock-names = "apb", "hosc", "losc";
+			gpio-controller;
+			#gpio-cells = <3>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+
+			r_i2c0_pl_pins: r-i2c0-pl-pins {
+				pins = "PL0", "PL1";
+				function = "r_i2c0";
+				allwinner,pinmux = <2>;
+			};
+		};
+
+		r_uart0: serial@7080000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x07080000 0x400>;
+			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH 0>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&r_ccu CLK_BUS_R_UART0>;
+			resets = <&r_ccu RST_BUS_R_UART0>;
+			status = "disabled";
+		};
+
+		r_uart1: serial@7081000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x07081000 0x400>;
+			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH 0>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&r_ccu CLK_BUS_R_UART1>;
+			resets = <&r_ccu RST_BUS_R_UART1>;
+			status = "disabled";
+		};
+
+		r_i2c0: i2c@7083000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x07083000 0x400>;
+			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&r_ccu CLK_BUS_R_I2C0>;
+			resets = <&r_ccu RST_BUS_R_I2C0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		r_i2c1: i2c@7084000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x07084000 0x400>;
+			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&r_ccu CLK_BUS_R_I2C1>;
+			resets = <&r_ccu RST_BUS_R_I2C1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		r_i2c2: i2c@7085000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x07085000 0x400>;
+			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&r_ccu CLK_BUS_R_I2C2>;
+			resets = <&r_ccu RST_BUS_R_I2C2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		rtc: rtc@7090000 {
+			compatible = "allwinner,sun60i-a733-rtc",
+				     "allwinner,sun50i-r329-rtc";
+			reg = <0x07090000 0x400>;
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&r_ccu CLK_BUS_R_RTC>, <&osc>, <&r_ccu CLK_R_AHB>;
+			clock-names = "bus", "hosc", "ahb";
+			#clock-cells = <1>;
+		};
+	};
+};

