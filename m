Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AC1606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cB6Zc+AX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=d9lJtUUo;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gvwYemCj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9EgS1eeYniF1lumgzc+HBSwMC0WmhqQn1YuP8Q7M2uI=; b=cB6Zc+AXvhd5bP
	HKw7sWTnYwGlceCfe15WPyS0g3lHtgc5FGCJcwqp6qU4hXn+wQs8YWUUxoW4auKQsTQj+HsLmfn/i
	u/nfLKTReHIQWC7wWz23OQW1Oqjq9yUPllt51A14x8eUmId5l3glfebx2PUwE0lAf6RSEbFQlWYqm
	zrmBm/2FzPOBzJRdJQXS2iYtO9NhJfNWhPSZXEahbJKl/2KVCBiSCZpPXstGDNu7VrwlGJ/N1KhRU
	WOLJZr3BSXUOKF4aNFdK1js/vgBO6FO8+5rXvSw1Y/RvNbrHbRx3Lidehdrts2tPBgL21UAufv/a3
	tCks9by82SgB3bh919hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfEX-0000000ELIo-1x9T;
	Thu, 26 Nov 2026 19:34:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfE1-0000000EKJR-3LXj
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Nov 2026 19:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9EgS1eeYniF1lumgzc+HBSwMC0WmhqQn1YuP8Q7M2uI=; b=d9lJtUUomJUFbLB68NhbPDm4Zy
	1519iHG9im+zZfEbUuHkUIN01palgbIhRVAMEsoOPr02IX433/fABAPCAqZ0nS/0gBO/Q9J21CeFw
	wtq+sVqXTla1ckaHCwB7T5S/IwuoMzwdOmFMAKvBPj6pNy8zQyIv0BFCSYs5199B11ptGqfdvE6+K
	S0mOAyednnIz0d6SHF9gh4iB4GHLx9+lf8RlgYw6AAn4y+CI2V3dlXVsvxUXgdwfQ2W7FZ3ApOI3e
	myjoRe+tuTh4wpBt0Wm123h2mZxv6TGEdQbkc5yyF+j9y0oHoV7GeAQNEJMQe75lIz7n7Nwqyyf7N
	2QelBaPQ==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDw-0000000702S-0yYj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:44 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-49412eb1474so4825953f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 11:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721617; x=1796326417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EgS1eeYniF1lumgzc+HBSwMC0WmhqQn1YuP8Q7M2uI=;
        b=gvwYemCje2g+pes/7uQhOLht5J9E6vObTtqc6GsKafcuZHozn/xin5ZBkg0Mh0Sttv
         D14rw0Y1BJ2P2y14kbqI7XS1DhWTHWo6l+wgy2iT2dnODimhwatkMifd6Y+eYEhgsHiV
         xKNiVIGicgKbufgS19o9gEHzapIOkn8EE8WLZknQHr70zGY4QzcrumJby/uJycjbWoT6
         bSj4czyDUJtJBK8mwETV28OLQB3ulQ1dbmks7E0HRPR7L69XeMLM42MfNNS4BoXGQ7aN
         CUzu77CWhcs4HNPAeRulTgFzGc2siIX5Q8NRrYJpa6f60GKWy7FdEJtRMjV6OySm7wCb
         a43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721617; x=1796326417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9EgS1eeYniF1lumgzc+HBSwMC0WmhqQn1YuP8Q7M2uI=;
        b=CX+K6xfNeovsxdESx2W25XxPm+T0lIxs1EOetGSrldW7PV3prEm45e4jbXwqJT0+p0
         tkoSEpZXYq/FRT1Ab/zgNcOlhCyZWNDJieeGIEpXlnKgt5U487NAWxgtLu6Fpp4YQvy9
         6GuMFuA2NX3nccXFHmKK+vy3+kuUiovnDfl543hP710GRGwrUizJp1Sgai22PaPOgFPH
         /q2PxWMwJHXHVWBlCIvLPLcu3Ob6L0dmP/LsRaNGF57aKXmbH4qx3HoyFLUSCj04ENzr
         9F5fqEFW8svx32o5MUwCptDkBQMeOh+ru+gt1ECsPwwo119/G6xW4rAcVcMRqYo5pC//
         +rVA==
X-Forwarded-Encrypted: i=1; AL+hErFYDvbhEkUIUJjCT3p1kEnc4XYhuVFLsDdxeNfSzYf16vh8gxxeHCW0wx99avVF4GamEqgm3zaDGUQXO9Lcnr44@lists.infradead.org
X-Gm-Message-State: APuU4Z9o+LDi5n5PwR7Fg9E91L3aAklD9wvf9LUvN/gM6Jy7C9+C6MTZ
	LM98no4FJPnZtewdQ5Oh87OLOHp6agYQgflYZ5iXShYSTnTCcQkGamPk
X-Gm-Gg: AZFdTZduC/F6wE2PWEk6+bG2S1uDhCWDWsPZ+MByG/FO5HlfUvUUu477e8OOA9/y8Z4
	U5Prvn5okS3GBwci/C2Q8Ds9SZrv/CFmDJK7Sjoe3IvYfmImBBiUCSCtSJoE/NwlxZ6xeDD3XfE
	v3I7eE5GkvfmlhkW7pd+aIVzWmwCn1FtNQbZqpgwVVZ9a/Lr14aAi7Cu1txuMhwjTwXhuizL7wP
	FKz3/yJidohHjBWKc3a+EdSs/KhUbQ7Aq9Yy7z5NjUEpjlS5L9yUy8SXN8Iv0ag0qB0jrB5xuuQ
	PjsgJNLw//3YGUoStAMK2TM+cU6ik82AtvEKFogExTZKyB/WIoc5TzN9lSbOREfMoIgMqJRunLn
	mpjmdvXagxYgF5ca1eLUxS5wzVoswmEYH/k0KzLsJauZSp712GvGrCH8RCESEvKGawW6UjpqEuX
	w1YT/7ZW1TtSnDuxncZbHSQ60fUc9QOElgbAVbwK86Lw7GMsudeLNZwZGonbF2Zcc/zAEB4j7rc
	c3rCsQeOKNW7y2vPe8IqHDZCPsZp3fo0ys1ONmWzgZeGZ4YCjOH/k0Z0EQ1L7MjbKULkegOS+bw
	dcwX4tkiL9IyffIrevJkl16mb2BPylT7IHaF9b6iEcaZ+w==
X-Received: by 2002:a05:600c:800e:b0:4bb:7757:fe58 with SMTP id 5b1f17b1804b1-4bb8881b9d7mr459950635e9.19.1795721617102;
        Thu, 26 Nov 2026 11:33:37 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:35 -0800 (PST)
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
Subject: [PATCH v13 22/25] arm64: dts: amlogic: a1: add crypto node
Date: Thu, 26 Nov 2026 20:32:38 +0100
Message-ID: <20261126193241.1471372-23-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_193340_106208_13888806 
X-CRM114-Status: GOOD (  11.46  )
X-Spam-Score: -0.2 (/)
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


