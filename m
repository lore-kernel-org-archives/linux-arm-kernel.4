Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35BB606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JyYJFkDj;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eaHkarng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9EgS1eeYniF1lumgzc+HBSwMC0WmhqQn1YuP8Q7M2uI=; b=JyYJFkDjpIwbn9
	MwZNrI2M4oiKw+Ef9HeG+/rsaNBLNVKqQG7pzl7DmkKl2/+ZS1OXxz5Qwct7SeUI0vGU45ZzvbhJs
	I01c0QF/EXdfCdGUYSFEz0GpBxjlsNt4tTqrGfgtzmaOFpi82tyJPyhCbzmIxMFGB8airPNOS9VE+
	ungW7rTvlIDh+noFxiOzHuXSY3H9e3DD/4Z8hbZThXSQQhGKRsBptOcVDgwUwgEfngrJFES5e28dx
	8snC9Cej9Qw2tpc5VolRn1tHPdSo2+j/zZi5eAl2v/xp63h6zTYf4pSQkOuFvgpQ16ohDD3DVTHQj
	G0vbLPcEbZnJaq31ap5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWugR-0000000FycC-1S6u;
	Fri, 27 Nov 2026 12:04:07 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueR-0000000Fwn5-3qly
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:02:23 +0000
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so62461315e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780921; x=1796385721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EgS1eeYniF1lumgzc+HBSwMC0WmhqQn1YuP8Q7M2uI=;
        b=eaHkarngT6kjEistvt2MjRxvLtpiE/k2BhnbZpGhNpnMn3jfoUujhk2xDtPRh6rmy7
         5kDOcVLSxIZsuplmkvApBTv/VoPyDe0aMd9+RYsYkag4Qy1YKg07wXTUH6XrA8XycVtT
         QqPRgUR3ayLh8NATW1QwfHXjmcY84JOwSu9TtMLUZPTW4rhusNf2XDOnD9Y11knG2Jli
         bbTZit/FOE71XmAkgwWG0rGLw2C2aFP2liBLT6mCZAkUnbqPwPriBSKBZ5yfgwIC3+vI
         pR9oDZjs0e1/wv+kHGlZ+71E8DqxdyNjmEshUKz7x6zigF7gWUoNQJlYvXBF6O7ifgAP
         K3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780921; x=1796385721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9EgS1eeYniF1lumgzc+HBSwMC0WmhqQn1YuP8Q7M2uI=;
        b=l4xv8Ig+RjVCmWG38jNqVLhIEwWVg7v9u3t9WXo9UMCsY/RR71tB0j1+Vu08H1rpAw
         DBR+NEIgMFSnjWpETenmP7FTO6joE8ff4oXiJ2FjCCaymPwjf2lhv+mdvSMeAkapQ7dv
         JL5IaQ7cGvdov6eGBa0ST3KDopXVkUHRKoVoxJGVMzz/NUV75PFe5Pll8FUnvzrSQSdn
         mIwaAfQszL0/q+Xvg78Pe0TMGKlbsZrHs2CA5dLZYzII4DUL/QxWYZKKcgZMvpph+LP6
         azWA0nY0KDR9WURWefsPc+0a3kmDv0r/uZBbio3Jy7AXgN+Os2M1vgpHZA8tOSUNphcy
         Iejg==
X-Forwarded-Encrypted: i=1; AL+hErEGPhbOL8izNT2tWtN+D+14XxenFtEH1L7L10XZnewWa40TswI2k1YBjRM4yLRRBdWj0gWE7HhZkKB+riNHTVJS@lists.infradead.org
X-Gm-Message-State: APuU4Z+pjrhq+eOWv7ZJCFjB+X7WloIFFOW2A2Z7IMR40T8/hhBnAkA4
	PsUDPteaJ2iRd49ty8T/Sphu+wbq3cOlm98wtJQzwlyRTY6Ab40mn/JB
X-Gm-Gg: AZFdTZenCrOJGSCl7MfIiokkhKTH9QLKZsJFz9MLYhukIksgeEBba35kYWhDbMkuMjx
	l25FRMj/z+jN00QKwY5thA7fbmWy1iES9HhMNT436O7+uGMEv5Pq1RdBI4WzFzQUOQEofkozPmi
	LkjJWUrleUNNK98OF3HC+isbZaOAbJBZGXjvgnJDiblj7cG46XBvwc4W/ehR1oZg8Lhyat8VrX/
	a3U4pLcAdAdkXwYqEFVLAk0dotMSJk3fGx7zEAdTZmeYAK9gKyr/Zbcps6PYkoGwq9s1d8+iwuB
	MIrVPEiZhk61D91AonMS6GS6q+YmpbShRI1PrEDneXPGqh65mMzvZLXQR/3XEOliWicmRgO0nJp
	eDg8ufo2RMjXcbvaXomyYedm8KIUtddrhqcuhWvyMTx0550GvRCuxURvC3KkbHSVHsA4dyLXD3s
	/2sIzR4wBylQtnCZvlNb2fooaO2hEiJCvu8TNiDAbSZOGWbGwohOrdqAgIjuFN8AOgFmFrbNgNG
	JhS1q9n5YpvAAV1EmvmoU9XhlkktsCZzK1SZT6FzKsPemEzqiEJ9U4YIzafxN5WEpj9n50HTWJ0
	lhiZrG+Qd5kID+V0binpQVHzwihBF+Qe7HzVI4kIDustfLg=
X-Received: by 2002:a05:600d:18:b0:4bb:9001:1aa with SMTP id 5b1f17b1804b1-4bb900102b8mr353987715e9.10.1795780920450;
        Fri, 27 Nov 2026 04:02:00 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:59 -0800 (PST)
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
Subject: [PATCH v14 22/30] arm64: dts: amlogic: a1: add crypto node
Date: Fri, 27 Nov 2026 13:00:55 +0100
Message-ID: <20261127120103.1532882-23-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040203_997620_E6D11036 
X-CRM114-Status: GOOD (  10.34  )
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

This patch adds a crypto node declaration. With the
Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 6f6a6145cba1..396260b7b398 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -686,6 +686,14 @@ sd_emmc: mmc@10000 {
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC>;
 				assigned-clock-rates = <24000000>;
 			};
+
+			crypto: crypto@6000 {
+				compatible = "amlogic,a1-crypto";
+				reg = <0x0 0x6000 0x0 0x48>;
+				interrupts = <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clk81>;
+				power-domains = <&pwrc PWRC_DMA_ID>;
+			};
 		};
 
 		usb: usb@fe004400 {
@@ -767,4 +775,10 @@ xtal: xtal-clk {
 		clock-output-names = "xtal";
 		#clock-cells = <0>;
 	};
+
+	clk81: clk81 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <64000000>;
+	};
 };
-- 
2.47.3


