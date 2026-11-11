Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB33606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q27mZ9xL;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G/JeNC+s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K5vGCoq82de48Tm6DcVbUfpg0uUXTUpd+UWgSwr4YJQ=; b=Q27mZ9xLKCBwzG
	ZU48rOlduQ/8CmgzN/PZqgOUE2+ClnypoejdANI2zden6jvy7qZpfIvrCHRJNH+Hj8EidqcU8W8Iw
	RbX5GUQi+qxR8w/zPDO05Cx73FKQDbAL+dqvao7dPLQ7TZEyllNbti+A7j8evrKk97NA9WBFab/Qw
	dYSjydWSln4jRJaBblC5EOTCn7uKq5Et5p8go9WM6IXynOTsbHKncR97GOuDBGfbNR8RTtkhEYYQf
	PbRcqExP/8hbchw9GC1/FnuZAc/SGfm/JFvSOiNr75KRCoSlZBsYv2Ar8wKmSx0WQPDhK1aU6ymSc
	UW268/ZE00Oh4LdGYh5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8i2-00000006sSh-4BhZ;
	Wed, 11 Nov 2026 13:49:55 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8i1-00000006sRU-183u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 13:49:54 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-8b31448caccso25594737b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 05:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404992; x=1795009792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5vGCoq82de48Tm6DcVbUfpg0uUXTUpd+UWgSwr4YJQ=;
        b=G/JeNC+sr9yF8n1B7cKWXP4DuikmRtjjAw2+NAMyalHAN+249H0+epZNvYeJJ1k47c
         aTjonZVGendmsman7/XzvVPO4332qLnWvG1PhA1cOB97Sako4YMg1WrUPh7CrvdjVcN4
         n4x5J6lMw67/XTvMjX1OZULYTIghaOjzMFqaK6CoO83zWTVMQLSFPxlaO4SXxQMalKdv
         7xja5IrIPjNyaSDB86421TIEqEB55X+vKRyGxjgtSrxgy2RbossdZhle7PBAqKTOcAs/
         3hO44mbtTVNDqgXYTeEA5CzWQyMGmtEL/4MgLYD0TdKwxZ9X4Lg1/Nzg5ym20z8Cz9oq
         8IcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404992; x=1795009792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5vGCoq82de48Tm6DcVbUfpg0uUXTUpd+UWgSwr4YJQ=;
        b=CfO5K8dgtWe4V/A0wcePefduY5HNi50+1geK4PArGofYOJj778URbpzpZ3WrwCUnbz
         EIKH3zPI6zb5PRhadDCLpNaO58j4iHClFXHLSeDitYYr/peKSF4aryqTiLuefS2z8CF3
         JPBVRnXgG8gw3L1oVRt2hMlx/DeeeM9Z4DkSFXcfYosmAOBMg4k7KkvE6QcVIlxb4ueg
         fU9Z0iCLskczltuvuPqK4brlwdLmpAj/kKUUddquBcNXn3dR61/vePUOPEeac9yYZh6T
         T1a6/p/Dc6iW5PH3WzIthjsbFGvJHL98T7di5ce3jA5YSACZC/qto+9zjKN8s+IWvydn
         AUlg==
X-Forwarded-Encrypted: i=1; AL+hErHTSByeRcGxvli084Pms33/WqD8v97vidQ6asQTdCPHCVBMiIKNrCA+7BkYB8zNUks7ZELZ8unOk+l48+c/2vzw@lists.infradead.org
X-Gm-Message-State: APuU4Z80LK5vhLvtjbMCWmeiMJ17fUT0YwYUwz60Fu68FKOwtrS/NBEs
	u4ZlJlXGFl8AgTdpeateMCHeJQX/FwzHS002l9GDw6nijqNPe8pr5Wkr
X-Gm-Gg: AYBFou1jpEfVo3rwMaxjPZUNTs/9NLdKBhjE7eyB44l7xe9f4Yxwrl71y5I7xEAPued
	ubbDul2ithjzkh4nG3uj2Sytl1cDiir67bTWofo3WvVfnhnXrGCCkxcmykUQEYUznn4bF6hPR3s
	qr+v6ixWSSC27Ar3/5+q5/smeQBVKrkMd6mds+6JBdv7Rqpag31XDGEDw9PuQIKJBh4lEq6VUbk
	ebQNwrd6uomHWNH1ru8CY4pJmJDkrZIx/Wcb9O6Gb5vduso12/8NyS+WAGvyfedsPOmY7rNFigd
	4JVrezaPf7eXHwpKzTL9cA7Ekthmb4KmNYwz9NBS9ypec4fnBNqWQ5OQNM2nQNoqSezChRHRV5r
	AmClWO/1IRd8M2gRtt8Wiwl0aFE4pPgqCxPmoIKiusSO7+8ocMfdEByLM3QydJWvClZs6a6P6y0
	4Q1XOq5t4oaYIXIj+uHw3OP4UHuNoUExG55mm+r7mcOUfD2ZzNx6sPQ9HxiG2A/hgnIMJvXrCMR
	jqI4N/ooYfwalpuG+bnygRZCFET6GTg/DCRdmbZHLdXafKHP5oOTMS1blsUqigUWAShaWaMdg/a
	lPw7FfNI9Ax60uG1U3WSwPDmbda5piBV2S48y2DayDXE1Jo+vVZPGyoC/QeC3GxGgUMhLYHP30R
	EC/7tNJV3G5FBwQ0mkN2qkPzOHyFwcgjVIw2Ah1PWPvS4Ui2CXHwfIQxgzI/zraCdqmkFcGm9BH
	0=
X-Received: by 2002:a05:690c:6989:b0:8b3:4deb:7cdf with SMTP id 00721157ae682-8b3a7fe512fmr20947607b3.22.1794404992067;
        Wed, 11 Nov 2026 05:49:52 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393426f13sm44519817b3.34.2026.11.11.05.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:49:51 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: allwinner: sun60i-a733-cubie-a7z: add the user LED
Date: Wed, 11 Nov 2026 10:49:17 -0300
Message-ID: <20261111134919.90264-4-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_054953_316104_3AD09525 
X-CRM114-Status: GOOD (  11.36  )
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

Describe the green user LED on the Radxa Cubie A7Z. It is driven high
by PM2 and uses the heartbeat trigger by default.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 .../boot/dts/allwinner/sun60i-a733-cubie-a7z.dts     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
index ab3d3d70f9ff..5dee2084906c 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
@@ -4,6 +4,7 @@
 #include "sun60i-a733.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "Radxa Cubie A7Z";
@@ -18,6 +19,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&r_pio 1 2 GPIO_ACTIVE_HIGH>; /* PM2 */
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
 	reg_ps: regulator-system-power {
 		compatible = "regulator-fixed";
 		regulator-name = "ps";
-- 
2.43.0


