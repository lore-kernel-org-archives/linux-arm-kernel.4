Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA7F606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S9qwM1ex;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ApU9cEi9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2ImmBlyem+dKD8BtksWY7e6g1iRuBiOaIKzcItgpI8E=; b=S9qwM1exaEqSwN
	moKvv8v5LSAbRps40C3MRlqH93jqlShiLwTnIj5G5PktCk2oWfnQdi8HZ8+FFGEERCmJDim7Lg1JJ
	pHDsd04b6ddyS0lHq8RgKktFZlfFXscNPKrUYjGZXNzTVghUGfpj7SC9z5u8P/3ElyylNEN7ZY97j
	SbA3z/57tDKgg5ekb9djmLYV40LYsiNmkruDHeWy3aKARObrAIvkdU4KfBUiOzhNMPXrRivpGuStC
	rHym0jxeOwAAotWEo2NzuuJSDPSTuh5zb20C0WWrYHU92AUxY6lgPTS4WIUtlQItOvsZ+b6XZYba2
	TdbxynznQDzNTw76zgww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS62-000000037ne-06Op;
	Mon, 23 Nov 2026 11:20:32 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS4s-000000036qs-0CMg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:19:21 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c4d581da0aaso412009466b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 03:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432755; x=1796037555; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ImmBlyem+dKD8BtksWY7e6g1iRuBiOaIKzcItgpI8E=;
        b=ApU9cEi9eozKZGK1a5YkAX6vCM43FVRAudFI+BlWn0yL+9+c/uaV6mClEp3vJNeAp9
         +945OEl3t+rUumYmQ1Uoqmsy1i4/fPyhDpcb2iSp1b3swr5xkbXiYfy9vm/vWUQ5IMUp
         8uxrZ/Fq9aPmYWSkWxEsGqYO9wzx2+VHCB8afWbq2ZOhKDGsQK1xjTc4qiHBVVAOA/OU
         1krOK1yaFiHAyg5P712JqTC9wwI8itMQIBw9wzTeZG2Bk1fhTyNavHWyPmY7VkQ17Oyg
         Xh/BHMKSx0ERAeuirX+orxDmPjn8yM4SRPrC9611keY4GK08fqou75/jYKqvS0wTa48b
         BJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432755; x=1796037555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ImmBlyem+dKD8BtksWY7e6g1iRuBiOaIKzcItgpI8E=;
        b=zZcFy6Dix5QBh28D7B7PYT4rYK8rm0NL59ge+x+xXWFoMBke9m0VZ8UGcxBgbo8xby
         cDE5loTgjO2jNLKlK+ccJTZYLGTqYf40edf+JkJTfHho2WLx2s8wdyFkFbrKtoKbM0cu
         nmyFCCK+N0m0B4sYuqvG2YCdyow6rBtH1W8Kvu7dbiRg9mkKwxDjEVUnjmUVnn7jMjzQ
         +yRbtdNYdHlcrPy0kY1Dt4SjAGqRTjYRw6XqhWRvW7zYR9uRKRDtvwq7nLacXij8EqG3
         hq/ZbhhM8IPMxpvZ0x/isad9uWjW3ceAn4MmQuC+Cbs4cFYWz45udIrPfgZHBCPnenzE
         74Uw==
X-Forwarded-Encrypted: i=1; AL+hErEZgx5GBp6woKqlbRE56ESKaPzsHWgRGpNHc7oCH+3HIs4FdY2vw9iABHV72IaiIWpyGRABxYNi943bfr37eqpA@lists.infradead.org
X-Gm-Message-State: APuU4Z+4oiaeh3Qy6ciq/j0bpxlwGE2/c13r7mQ/HtOOgNusG2uGgvHv
	avn5rCgew4OPNrKxEqtwCXss3WOT/ZCI34DSaRMIL81TMq8ltEC8IgUl
X-Gm-Gg: AZFdTZeMGl9ggtApUaPUWHdry1cPiEz9PJaQ1dDCa6VLjEcROj1/umTySjNRMfY6d/a
	AhkYqZy5tGpX3U8wDjGVlmje7rYrl6Z7GZgeM/7tHFkWK+7YB4XkWigeN1+ATH1GcQFr8b7yOWd
	WEp1CTnhZX2KXf4QcumeO+4tv8Tt8iRRHla9OTyVmHTpMRt0qzKPssIDscIoJid6O+Yq187lemb
	nbTB5IsoHb4QRqtVMxs+iboFH+xHauoLX7VzyvHYiaNKe4USOPxbjd8tNmISiCXdvx4ykUq7URm
	HB+l3lplJfV5yQVdGU6cnHcMYn6Sfkqm4TZUlcH0kQAp8GCcl1PhY1kbyzI8Vinap4z7DTVaZ9q
	5y2maXa1G8lwr9WGsNDiMytwoSSuVVKHzPEpeFpYlwZBZtY+Tv1PlnZ6yM6QQa2sBh3viCeqBwR
	XNwJ1a6AZR66CIV/91/CdJBVRRANntgpqxb/OVvn5CY00CWuiKbr8EYy1JEOodgVVA62j5jVzCw
	2Q63uyjg8lDj4TIBSpFYAxOfsiEkD1ho1TQNjfANhWIYpmf4t7Lb58cSGEg9DEVhJPssEtpkZuz
	RQc+tiKAr24E5XFOub4aKsStr6n0+TAr0Kkl+f+bVll3yzp5w7tUN8LqZ5nqShacZw==
X-Received: by 2002:a17:907:d40a:b0:c40:f89f:d91d with SMTP id a640c23a62f3a-c513ab2082fmr899555066b.28.1795432754704;
        Mon, 23 Nov 2026 03:19:14 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:14 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:39 +0300
Subject: [PATCH v3 6/7] arm64: dts: mediatek: Add MT6895 SoC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-initial-mt6895-v3-6-95c46597e63d@gmail.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
In-Reply-To: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org, 
 phone-devel@vger.kernel.org, Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_031919_077830_8B83BE19 
X-CRM114-Status: GOOD (  16.64  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add initial support for the MediaTek MT6895 (Dimensity 8000/8100) SoC,
which has four Cortex-A55 and four Cortex-A78 cores sharing a DynamIQ
cluster with 4 MiB of L3 cache.

Describe the CPUs with their caches, PSCI, the GICv3 interrupt
controller, the CPU and DSU PMUs, the architected timer, the system
timer, the pin controller, two UARTs, the watchdog and the keypad.
There is no clock controller driver for this SoC yet, so the UARTs and
the keypad use a fixed 26 MHz clock, and the system timer a fixed
13 MHz clock derived from it.

Only the CPU and cluster power down idle states are described. The
deeper states that also power down the MCUSYS or the whole system need
the SPM and the vendor low power driver, which aren't supported yet.
The system timer serves as the broadcast timer while the CPUs are in
these states.

The cache geometry was checked against the CCSIDR registers of each
core.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6895.dtsi | 461 +++++++++++++++++++++++++++++++
 1 file changed, 461 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6895.dtsi b/arch/arm64/boot/dts/mediatek/mt6895.dtsi
new file mode 100644
index 000000000000..62584cec0f4f
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6895.dtsi
@@ -0,0 +1,461 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2026 Alexander Letuchiy <asalde.le1@gmail.com>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include "mt6895-pinfunc.h"
+
+/ {
+	compatible = "mediatek,mt6895";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	clk13m: clock-13m {
+		compatible = "fixed-factor-clock";
+		#clock-cells = <0>;
+		clocks = <&clk26m>;
+		clock-div = <2>;
+		clock-mult = <1>;
+		clock-output-names = "clk13m";
+	};
+
+	clk26m: clock-26m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+		clock-output-names = "clk26m";
+	};
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
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <380>;
+			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_0>;
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <380>;
+			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_1>;
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x200>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <380>;
+			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_2>;
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x300>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <380>;
+			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_3>;
+		};
+
+		cpu4: cpu@400 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x400>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_4>;
+		};
+
+		cpu5: cpu@500 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x500>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_5>;
+		};
+
+		cpu6: cpu@600 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x600>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_6>;
+		};
+
+		cpu7: cpu@700 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x700>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_7>;
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cluster_off_b: cluster-off-b {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				entry-latency-us = <100>;
+				exit-latency-us = <250>;
+				min-residency-us = <1900>;
+				arm,psci-suspend-param = <0x01010102>;
+			};
+
+			cluster_off_l: cluster-off-l {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				entry-latency-us = <100>;
+				exit-latency-us = <250>;
+				min-residency-us = <2100>;
+				arm,psci-suspend-param = <0x01010101>;
+			};
+
+			cpu_off_b: cpu-off-b {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				entry-latency-us = <50>;
+				exit-latency-us = <100>;
+				min-residency-us = <1400>;
+				arm,psci-suspend-param = <0x00010002>;
+			};
+
+			cpu_off_l: cpu-off-l {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				entry-latency-us = <50>;
+				exit-latency-us = <100>;
+				min-residency-us = <1600>;
+				arm,psci-suspend-param = <0x00010001>;
+			};
+		};
+
+		l2_0: l2-cache0 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <131072>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			next-level-cache = <&l3_0>;
+			cache-unified;
+		};
+
+		l2_1: l2-cache1 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <131072>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			next-level-cache = <&l3_0>;
+			cache-unified;
+		};
+
+		l2_2: l2-cache2 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <131072>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			next-level-cache = <&l3_0>;
+			cache-unified;
+		};
+
+		l2_3: l2-cache3 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <131072>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			next-level-cache = <&l3_0>;
+			cache-unified;
+		};
+
+		l2_4: l2-cache4 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <524288>;
+			cache-line-size = <64>;
+			cache-sets = <1024>;
+			next-level-cache = <&l3_0>;
+			cache-unified;
+		};
+
+		l2_5: l2-cache5 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <524288>;
+			cache-line-size = <64>;
+			cache-sets = <1024>;
+			next-level-cache = <&l3_0>;
+			cache-unified;
+		};
+
+		l2_6: l2-cache6 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <524288>;
+			cache-line-size = <64>;
+			cache-sets = <1024>;
+			next-level-cache = <&l3_0>;
+			cache-unified;
+		};
+
+		l2_7: l2-cache7 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <524288>;
+			cache-line-size = <64>;
+			cache-sets = <1024>;
+			next-level-cache = <&l3_0>;
+			cache-unified;
+		};
+
+		l3_0: l3-cache {
+			compatible = "cache";
+			cache-level = <3>;
+			cache-size = <4194304>;
+			cache-line-size = <64>;
+			cache-sets = <4096>;
+			cache-unified;
+		};
+	};
+
+	dsu-pmu {
+		compatible = "arm,dsu-pmu";
+		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH 0>;
+		cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
+		       <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
+	};
+
+	pmu-a55 {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
+	};
+
+	pmu-a78 {
+		compatible = "arm,cortex-a78-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		gic: interrupt-controller@c000000 {
+			compatible = "arm,gic-v3";
+			reg = <0 0x0c000000 0 0x40000>,
+			      <0 0x0c040000 0 0x200000>;
+			#interrupt-cells = <4>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			ppi-partitions {
+				ppi_cluster0: interrupt-partition-0 {
+					affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
+				};
+
+				ppi_cluster1: interrupt-partition-1 {
+					affinity = <&cpu4 &cpu5 &cpu6 &cpu7>;
+				};
+			};
+		};
+
+		pio: pinctrl@10005000 {
+			compatible = "mediatek,mt6895-pinctrl";
+			reg = <0 0x10005000 0 0x1000>,
+			      <0 0x11c20000 0 0x1000>,
+			      <0 0x11c30000 0 0x1000>,
+			      <0 0x11c40000 0 0x1000>,
+			      <0 0x11d10000 0 0x1000>,
+			      <0 0x11d30000 0 0x1000>,
+			      <0 0x11d40000 0 0x1000>,
+			      <0 0x11d50000 0 0x1000>,
+			      <0 0x11d60000 0 0x1000>,
+			      <0 0x11e10000 0 0x1000>,
+			      <0 0x11ea0000 0 0x1000>,
+			      <0 0x11eb0000 0 0x1000>,
+			      <0 0x11f20000 0 0x1000>,
+			      <0 0x11f30000 0 0x1000>,
+			      <0 0x11e50000 0 0x1000>,
+			      <0 0x11ce0000 0 0x1000>,
+			      <0 0x11de0000 0 0x1000>,
+			      <0 0x11fe0000 0 0x1000>,
+			      <0 0x1c01e000 0 0x1000>;
+			reg-names = "base", "rm", "rt", "rmm", "bl", "bm", "br",
+				    "brr", "lb", "lm", "rtt", "tr", "tl", "lt",
+				    "eint-w", "eint-e", "eint-s", "eint-n", "eint-c";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pio 0 0 227>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH 0>;
+			#interrupt-cells = <2>;
+		};
+
+		uart0: serial@11001000 {
+			compatible = "mediatek,mt6895-uart", "mediatek,mt6577-uart";
+			reg = <0 0x11001000 0 0x1000>;
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>;
+			clock-names = "baud", "bus";
+
+			status = "disabled";
+		};
+
+		uart1: serial@11002000 {
+			compatible = "mediatek,mt6895-uart", "mediatek,mt6577-uart";
+			reg = <0 0x11002000 0 0x1000>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>;
+			clock-names = "baud", "bus";
+
+			status = "disabled";
+		};
+
+		watchdog: watchdog@1c007000 {
+			compatible = "mediatek,mt6895-wdt";
+			reg = <0 0x1c007000 0 0x100>;
+		};
+
+		keypad: keypad@1c00e000 {
+			compatible = "mediatek,mt6895-keypad",
+				     "mediatek,mt6779-keypad";
+			reg = <0 0x1c00e000 0 0x1000>;
+			wakeup-source;
+			interrupts = <GIC_SPI 106 IRQ_TYPE_EDGE_RISING 0>;
+			clocks = <&clk26m>;
+			clock-names = "kpd";
+
+			status = "disabled";
+		};
+
+		systimer: timer@1c011000 {
+			compatible = "mediatek,mt6895-timer",
+				     "mediatek,mt6765-timer";
+			reg = <0 0x1c011000 0 0x1000>;
+			interrupts = <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk13m>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+};

-- 
2.56.0


