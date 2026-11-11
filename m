Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A40606A88A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 18:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W6KGjrBP;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EO8Kbs5F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9ifZvoltqEgqn3t7aXg0tAmsOAN1/Z3pCD2DytrLj48=; b=W6KGjrBPsJ4XCl
	sV/tOEo30MDzTd72vzGTy0mpW36+wkpIdOGrrCAlpWr4xh8w7WAZyyQuXdXJN0eO4LTcObZyrxF/y
	iRdHuwP+muwPq3vEG5RsMRqFzU6ug58t6x3EDEUtfDwY6lNtaSdXYof4Q+vnB4IUbRy+NtR7Himuj
	hzIkEjdciNBSM4o8npc6NBBAI0u6IrhKjeFacXMj0q/Gi6zLsCtJjA693YfTPZJurQdaaz3nr6bdc
	0yO2rjSkuXN/EQ4AP2sinFZAW4lElccMXbl3eB3zIffcNDFOSKZ8+z5z/Cw4uXAiSJrelcvMfUm5F
	8UMJQDa5mQajCJ1ooCrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCve-00000007OLE-3Od1;
	Wed, 11 Nov 2026 18:20:14 +0000
Received: from mail-oo2-x05.google.com ([2607:f8b0:4864:31::5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCvb-00000007OFl-3L4Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 18:20:12 +0000
Received: by mail-oo2-x05.google.com with SMTP id 46e09a7af769-8458555b6a8so1059267a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 10:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421211; x=1795026011; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ifZvoltqEgqn3t7aXg0tAmsOAN1/Z3pCD2DytrLj48=;
        b=EO8Kbs5FF6NP9RMt2qBxhnJYw6IWz2lBoCK9QpNxpphlxO9Rb/xyTPUg7agpd3lW1u
         PvU6H05CLz4++Kwbjkh4tL/lvXH0uRXGO+mb1e94pjIQUGAPCMyaiL/nHfPTk9XiBLbr
         WJbgG+t0bbPcm4L5+o9HlssFNOO6YWnwdRVjG3CNsvdHWatjRkIL456/mrEuQr1dZUFm
         S3abqX8XPAKWSpmwhkBS5lUheflXLSZTICIrbtxJeuZzgWfIqDaMW8Jx090N2x3I0YkI
         lQoEykK9nqOAZtgqQvsnQBqXLDlANSQR75BLmhLXzoZnrrQaz66nrycSKfjAYSWK9U9r
         41jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421211; x=1795026011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ifZvoltqEgqn3t7aXg0tAmsOAN1/Z3pCD2DytrLj48=;
        b=0mT+97AAqdA9Ag9MUfeVSWyUB87L5aUJLF1p3AFg7xIq/WWX02weguR1mk/aAAXzEv
         GKD17tCFJABoVstEqqIeSaHk8gXvPpRfwV8Q/psX4L4/o3msZTBDvFdoulZYECvlsYIo
         Jl6TpqHXURdt/v798rS5fq/ANxYPx4yYQDHZ5JAez0aGMRrPA5+KbHtF5uWM+6K+Nlqf
         V4+obzXJNBeNLpUSXXsJpEJaSLiyQkjAJBnI5Q6x5/pHDfpuMkax8cLvGDXBt5BoCuWT
         NQTDW1Dvc4pM43WPWMZ0b+kJ0yaIzuGIBrZ9gTto6l3tg12SJS90cqy34LGgVxiQVH+0
         L1pw==
X-Forwarded-Encrypted: i=1; AL+hErEh+80dV2xxIpIU3iP0X/GsPf7wdqx/SR0hZ93xwNBOxDbp1KFrDRc2Qg3G/OGnMOnguSMaeZXl3VEL2DC/MRpT@lists.infradead.org
X-Gm-Message-State: APuU4Z+TUUHEPfEU1lze5L8OkoWOjw13isjfVXDamfWu8kb/H+cnkfL/
	nlT+UaEMhuofjomc0Of095NL8oxR002/F3doncCaybFdAwX/3XaJIMqE
X-Gm-Gg: AYBFou3OlypPNzKB0YM29GWmOPVVFKdoDytRzu1rAGDbZBUZSdadYj/+rO0nNtuT4Wu
	K478TZjWKgfJsfGEWVWyBawbdt7f4rrnQcjMfuqlCYU7Rd7oMYD8SlZ71XYUIeqWlfO+C3JTQKB
	7SWatn71CosEK5PEhGDUvkJZ9IEsSmjqMDuKuJDsN0r7vjgnMJKBOPiPRsPp4KSxUXXxRDj7mST
	lURd5Ipmu3yOfFADMSNIKJQzPUNDT3+OIuSjm68VONwHdNUPW5S9nqjLPGPnBdkkddXLt81KTAf
	qYws/o72IXOzoiSFitBVB5FEoGuOPSgL33FUJGPQyP0DDruWfgEYcJKnGwwCb+C2id3WxyA3gwD
	F8a8RG5VZhDpG75nu64WbcX+JSaOcTso0LohZyRJr4NIo1LjtHPkf7h0DK8c5Eju23fHs8m84YD
	Ye1FUO1//KyMjFL6NLvErsxbZNqeh3Y7rxOnbx3FyUjhxPFTCthuuD1SJGi36pr03fzTuTRWFGG
	qGp+eyZoQRTBBYJFZO9H8ViGMftSLohu7xaQ640cPNBsmSIF4vCWZjKFE4SUxkFzCs5X2oqAC6D
	9f+L9HLPft6ovDFCQgJDW5umB2tHcBocLTncXJA6d9ecJg73IWkNa/EhF2CCEp4BTf9Fi5ATwOc
	0NAovNzc5NyNoQZw43as=
X-Received: by 2002:a05:6830:410b:b0:822:527e:f653 with SMTP id 46e09a7af769-860f2873418mr3497542a34.13.1794421206253;
        Wed, 11 Nov 2026 10:20:06 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f847sm4824708a34.8.2026.11.11.10.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:20:05 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 11 Nov 2026 12:19:54 -0600
Subject: [PATCH 5/5] arm64: dts: mediatek: mt8173-amazon-suez: Add the PMIC
 AUXADC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-5-77b47cdea702@gmail.com>
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
In-Reply-To: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794421198; l=1624;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=HdWvFN0Bi8Q0rbvoIQxbOy8Qqy9TBXeblCz/hYCaNOc=;
 b=UvFfe+0GNgf41aG/dgO1cAx/OHNQZPN8YTQnRZRWrp3VGqS+hjyqshurUxvY6rTsopRdJ36hE
 4HIPzTzo7G3Bhra+u2cvMi769b+xIiRwgt/1s3ljGRKqqhzOF5zEQTN
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_102011_856391_874121F6 
X-CRM114-Status: GOOD (  11.66  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the MT6397's AUXADC and the battery pack's thermistor on it.
The SoC's AUXADC only has the board thermistors, and the charger has no
ADC, so this is the only way to measure the battery.

The thermistor is a 47 kOhm NTC behind a 24 kOhm pull-up to 1.2 V.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
The thermistor numbers were referenced from the vendor kernel.
---
 arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts b/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
index 7dc0d818a44d..07a1ba7539a5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/adc/mediatek,mt6397-auxadc.h>
 #include <dt-bindings/input/input.h>
 #include "mt8173.dtsi"
 
@@ -87,6 +88,15 @@ thermistor-2 {
 		pullup-ohm = <39000>;
 		pulldown-ohm = <0>;
 	};
+
+	/* The battery pack's thermistor */
+	thermistor-battery {
+		compatible = "murata,ncp15wb473";
+		io-channels = <&pmic_auxadc MT6397_AUXADC_BAT_TEMP>;
+		pullup-uv = <1200000>;
+		pullup-ohm = <24000>;
+		pulldown-ohm = <0>;
+	};
 };
 
 &cpu0 {
@@ -471,6 +481,11 @@ mt6397clk: clocks {
 			#clock-cells = <1>;
 		};
 
+		pmic_auxadc: adc {
+			compatible = "mediatek,mt6397-auxadc";
+			#io-channel-cells = <1>;
+		};
+
 		mt6397pin: pinctrl {
 			compatible = "mediatek,mt6397-pinctrl";
 			gpio-controller;

-- 
2.56.0


