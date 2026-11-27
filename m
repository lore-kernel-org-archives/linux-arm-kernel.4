Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7B9606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NBGRzmx2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fHfKlEcM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Gs/a4DDZkULpkfxaE5kGJ7kgjNQPkZBpTJ4KeEOsPSI=; b=NBGRzmx2tWHTpf
	Da3W4MVwEjCwKlmRo7E/LykWXgmpfUQ7rAe963OSwaHpfT4dTlLQDyM/SzEelFYsUw3slIJ9YE63g
	OJzDxN7C5dI1we5Hvq6Ch7hTr2MQ7qtkyvDm3/UT0qiYQpWIRKD6rDWFesG4cPYsvtBTIEo/DsoD0
	7flGzPEbZDntkKblbs5sZIyjUGbr/lQ+4EAo7nzkAPpuHIRN+kdTQr/RRk6QCvKP1yzYTkVxmhOAL
	mZD6URI63dVDUeImUs8fWUgUHHMuFtSKvvGalr/W+vZ++CPWGr4Sspgp9X3hbDTiXZm6WFEJh5lBi
	B5f7xASNCV8zaf28sutQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuhG-0000000Fz6v-1Tri;
	Fri, 27 Nov 2026 12:04:58 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuec-0000000Fx6C-2G82
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:02:32 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so46753075e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780933; x=1796385733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gs/a4DDZkULpkfxaE5kGJ7kgjNQPkZBpTJ4KeEOsPSI=;
        b=fHfKlEcMlFEfBUK4PyrMlpbKUNjl4DNrKxnjRvZbG8YjDBSfLkXHoE8VI8F4IVmTgL
         yUY3k3EoylbpunF67Y+nU9ThVFu6EqLD9Niu2B6e2N2Rm43njH0wX5GPvPEhMmdX3Hkq
         VsP05aa24ABCe57osqHGf3zZki5IRoc6oiEuhWjzIaK1hFaU6X1+dMLlk9Afp2EIvv25
         Zg/60/rtFgN7fptMNYk1qEp91J/45sPq83AZtGQQAh2SaVVMUdt/P8iigi1ZRZ5JeA/0
         CiSBgnCA8LMIXRpyyLupw4GiZ7KNyWQb4xebm8KVDjs3yuP+yItCld7EtRNFMW9662UL
         MhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780933; x=1796385733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gs/a4DDZkULpkfxaE5kGJ7kgjNQPkZBpTJ4KeEOsPSI=;
        b=OLseBgJS4I1KonPKO6Sq8Cu6QXLA1CsQRB08G4RAvZ9BKDqTNBjM8BE8VGgIvbDSWs
         ROW08FhTdwtTwk1SUXhSeVp5kF3MrHfEoHpo73aATHB+l4R36tSbG3JQWpGF2AxZUPCh
         tyBZdWhyFCaqlY2JrlJ9hqMIMDmnlOHV1qvBWSADb7ZAcEY6+zHXSkJWgEVQ8isZiHcb
         M+81tidAMI/MOh4Fm+yFbqb/uzDpaXA44KTC7kyM78nLnM7E1ktu96oUTm0Fk4XtrTch
         6CuTHZuByPhdYbADaBUwvf+PIVQJ8METr/7cR4vFauy5tm7v+XT4y34JssfkgCP9qecP
         5qyw==
X-Forwarded-Encrypted: i=1; AL+hErGTrxgH306/aV/uWMkhgVQKAczZJRvtBrGKLZcutQ9iJ5Mpr5xivS1uqqw6OB7NnEkXdL/FgpQE9UBSbBYY6E9T@lists.infradead.org
X-Gm-Message-State: APuU4Z9zWFtaIE1HF2nxXUPnkBULEXbjgzWE6GfA8iI2ahFxryiXUCuC
	wcHeWAoWE92RtAVmcZsvoJEIC+nXOJKwMJdl2MGKyfTqA5G77Gp+FZUw
X-Gm-Gg: AZFdTZd3/yzi76CCoT1P00UM+mfwb/Swk07C96LT9M+ssZ8PH5eCSCX/9OjDgxhk2pm
	zyNSxT/PuXrqdtCmr2MV8IbjZMRHMRO4WyleUBA3zbU78T1e6bPqRmLxxnnJfwOSTcSrPZjkiKT
	i11DScrY9aIqEM4Sxm69iIUnLq8DQ9P1ysu5Rx2UtkxGh8qx4OKHAY7iExPeEGj60UVxU/SWHIr
	XSScy7c4NTgpsibi3qVpEsgczthhLYrhqriXElDsX+BsbFIJO6A1Pc5BVS/Fa0U/JLXEQSg4a3J
	DQWtrn+uWWqyxD+9tPcccCdVnqme5Wik+6Uf0MK6w7RR63abs4loM+rY2pGom7tbWye4cE+apyu
	24oVShG15IhiGoWtLgWFegmED98FZJAipCHNVn49GFOYHQLAwuYr2FMloupBpXlbzq09EcNy+RG
	GdrF80qCn+JmTWfz49GKixe0pvM0AMBR+toy0b4ekq4C4lCn38OmgZN2yXMw9b8mH9cZTz9s9Tc
	X/KdbRs7zuV1eDGXga8PECEeUJVFrH6VVBmxJ91G43naYMk7d8ZE/k0zfJvm2eD3j+vRnaAtB84
	t2P5UOYuGgWHdbD3TLs/XZj8Au3MA67Hu13bCg+cq0ZX16VD
X-Received: by 2002:a05:600c:3b8a:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4bb8892da25mr486388005e9.22.1795780932698;
        Fri, 27 Nov 2026 04:02:12 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:02:12 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v14 30/30] arm64: dts: amlogic: use the system clock for A1/S4 crypto
Date: Fri, 27 Nov 2026 13:01:03 +0100
Message-ID: <20261127120103.1532882-31-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040220_112917_2E2647A0 
X-CRM114-Status: GOOD (  11.39  )
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

The A1 and S4 crypto engines are clocked by the SoC system bus clock
provided
by the peripheral clock controller.  Use <&clkc_periphs CLKID_SYS> and drop
the synthetic 64/166 MHz clk81 fixed-clock nodes.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 8 +-------
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 8 +-------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 396260b7b398..1b064c556c68 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -691,7 +691,7 @@ crypto: crypto@6000 {
 				compatible = "amlogic,a1-crypto";
 				reg = <0x0 0x6000 0x0 0x48>;
 				interrupts = <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>;
-				clocks = <&clk81>;
+				clocks = <&clkc_periphs CLKID_SYS>;
 				power-domains = <&pwrc PWRC_DMA_ID>;
 			};
 		};
@@ -775,10 +775,4 @@ xtal: xtal-clk {
 		clock-output-names = "xtal";
 		#clock-cells = <0>;
 	};
-
-	clk81: clk81 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <64000000>;
-	};
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index de173f40e15e..c004ab7bbdfd 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -71,12 +71,6 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
-	clk81: clk81 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <166000000>;
-	};
-
 	firmware {
 		sm: secure-monitor {
 			compatible = "amlogic,meson-gxbb-sm";
@@ -631,7 +625,7 @@ crypto: crypto@440400 {
 				compatible = "amlogic,s4-crypto", "amlogic,a1-crypto";
 				reg = <0x0 0x440400 0x0 0x48>;
 				interrupts = <GIC_SPI 24 IRQ_TYPE_EDGE_RISING>;
-				clocks = <&clk81>;
+				clocks = <&clkc_periphs CLKID_SYS>;
 			};
 
 			gpio_intc: interrupt-controller@4080 {
-- 
2.47.3


