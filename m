Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1526606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pF7gSdHH;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eAjt7EtV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TyMpVGhTjV/u04TckFiyynsoMuEnZrBpJU3DYNeD5YM=; b=pF7gSdHH8EPPrv
	/mjtHAdQHFPmui0da+RdymQN7aaw8h9hBrIp2OQVpn6VR3VPurjLS2r0VeyZReFFO7I5rtonNVehG
	Q+OrDrYBlNNVFqWjvzIHpacjgZdWA0R4KhE8gaI/bk8wv9EMsHWAtvDWch1f/G6f4MMVCExMBXwEX
	JxvPyFzCCcuaHAsl3x+KCaoHsH/tGNmwfCtFUk+i2tdBUmBa9SSogiWptH55Ur238IkWGtBJQP0te
	E7nSbjv5gy3Z3Mqy5YzN7LfJG/ldc7mBq/jbFqnA9immqIceN9VsGlvF+8uRlCgl4DL4fEbQP71lk
	CLbC3azsiSMIhEDDhMjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWugR-0000000FycM-20Kz;
	Fri, 27 Nov 2026 12:04:07 +0000
Received: from mail-wm1-f51.google.com ([209.85.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueP-0000000FwhJ-1cSW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:02:12 +0000
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso42783245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780918; x=1796385718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TyMpVGhTjV/u04TckFiyynsoMuEnZrBpJU3DYNeD5YM=;
        b=eAjt7EtVnzDsy5tCNSaaz+wmpAfzu6QmZlQ/btIBhiHnzn3LZ86AxGSsUWqz+SmPKR
         NPZxwaf5ty6WpXGqh20mUTBkAOT1q0psQon3KKPFOnf5U7ayX8qgcu303bOfqatvhDbI
         o9XTOg8N+/HYqt0wkRdHen9ywmB0qm+FfXDXTfjsq8Ot1hYXt7zwHyYAfgycLVNw69z8
         QleulQ+ssw7/xUYrYGL0olEt9Mo4quiaU/e0Cz0njRdcEVI68jHzwP4FPnZ7jnTgd19Q
         p8hJFzpf/BcyAp/Fa80qzn31zyOLRSQHOKMxcft0+hEUqlgXOTNtafkpfn4uHDZ8B7yU
         okiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780918; x=1796385718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TyMpVGhTjV/u04TckFiyynsoMuEnZrBpJU3DYNeD5YM=;
        b=JZAylhC8Xea8/ymwNM7YS4Bj5HkPL3whZZkNAQW0JVcpw013LPiq+pDlkyAP7m8xd7
         SZmgtd1j784Yk3RHieF+NFf5WNnXO+Rm6GoShSdpZX0JEeX2uwZYZdt2ToMa4WFrtbsk
         w7VDdlY0Hh59uJkKDrS9u1l3iCWPKbMX//i+sfSOlZEs+ckHJYUGkYnWdN5m2a0i+F/c
         NjSqILcUJuZZlc1DIVZpajaBN7LpIGTdYQKMLCoU30KX9oTnlTs8xlhDLPRYyQ1ZS/vN
         wPrAqcG1CMi2mmBvTZ5R0DojhN3m/ddHdMyorG1qrU73Fzca69NhaIbWz9+RdHYgCReQ
         /ncw==
X-Forwarded-Encrypted: i=1; AL+hErHeBgnbVpC/fX7WJXdDX8bwyelck9lSBmeHMQVKr3Nr2gKzqnNdSDaTNqY8erupkIcqwXohmbAV8JEgH5eLlgYL@lists.infradead.org
X-Gm-Message-State: APuU4Z8PbIUWK3yzq9cGIkt2re4RlfHYVfpp+3L/kpGUNJGzDycyqAqV
	zMeW9pNqD7wLHd0K07yamVQFMaSagXejWC+4q/+IyuPh0OxqBA5BFJV3
X-Gm-Gg: AZFdTZcfMjV5BRUinRgzC2XdJFQzRy/rKurDfRydoHTkp2Fkh/8eWi68Hul9SWKuAjg
	RpVKez6CybBKaOds0N7StRIs39RG7zKedQ1CQR17reeVHoNP9MP3YJAHCIXP2KkieJGITCr2VOh
	870wX1ojAK4E7bzsjxR+nuE6k2UUlNGmQJrcdiaEoZj2w9PPLlW3Co8h90Ff13ZhxsDCWKKxu8G
	U27/3IntPiOKxEYAd3DEqKlNGj9VTdJxphvaZFTyjbttGqcQBOlqjv47Z/v0bCVVteMOhutzH/X
	dhxVuMkW7PH4luy+J+4w1sxzinxHItCszB8ZNa0NugtBiIWBpxaSWrSrtwomAg5EWWhXskPNWxg
	RRPlUKH0I7ObNaj7bxEWjiuoRvNCoRdOJ9CY9K4b/sPx0gTIAchPHcfErz5Ao+FJphLsKSdUzmn
	5220QF7EHjD9VryTx+8ACSpXIWFnV5QD72E/fTDf7Kvpa4qa9DbiSmUvESbpAUhC4ZHXrCYy4Xc
	GT+ywic/ZfIxgdxIxi3JJTs9Qztde9y9KlLxKQmgxRQv4akEnK9kdngxOP+xFtNDiT7xNp6N+p0
	hlNIKKUiQ6nroaJVOSw98IDW4Em1afRSUd20RFxCeqgej78=
X-Received: by 2002:a05:600c:a4b:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4bb88806292mr505147675e9.15.1795780918009;
        Fri, 27 Nov 2026 04:01:58 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:57 -0800 (PST)
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
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v14 21/30] arm64: dts: amlogic: gxl: correct crypto node definition
Date: Fri, 27 Nov 2026 13:00:54 +0100
Message-ID: <20261127120103.1532882-22-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040201_467408_A5F6D31D 
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

From: Alexey Romanov <romanov.alexey2000@gmail.com>

GXL and newer SoC's uses the DMA engine (not blkmv) for crypto HW.
Crypto HW doesn't actually use the blkmv clk. At RTL level, crypto
engine is hard weired to clk81 (CLKID_CLK81). And remove clock-names
field: according to the new dt-binding, it is no longer required.

Also, GXL crypto IP isn't to seconnd interrput line. So we must
remove it from dt-bindings.

Fixes: c4a0457eb858 ("ARM64: dts: amlogic: adds crypto hardware node")
Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index f257fe3860f7..5d0bffda8f19 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -68,10 +68,8 @@ acodec: audio-controller@c8832000 {
 		crypto: crypto@c883e000 {
 			compatible = "amlogic,gxl-crypto";
 			reg = <0x0 0xc883e000 0x0 0x36>;
-			interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
-			clocks = <&clkc CLKID_BLKMV>;
-			clock-names = "blkmv";
+			interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc CLKID_CLK81>;
 			status = "okay";
 		};
 	};
-- 
2.47.3


