Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B8C606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 06:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IATE5jbQ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sehQZffK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uzgThVtz5FyRtzpWhXy/XQBj1yMgQbdQfAysHaetNR4=; b=IATE5jbQzqV6n7
	yMfLUvyg+0DEGcMdBb+5y5rk4IJ6OuGNaTAJszkjn39MY7mO7wSZstSV74vUdeXdN/InnuPGJodxk
	FnkU4UzMHw3YBsvKVERGYVwyplQXMkNkYgKErVHDgIiQQmCClWtLiXozgoDkTD9Gi8ji4wXGWbh6I
	mh2yZjVPeZtZeorCeWY2M6KJ6NQz7fj6i0s14e66F9k8KWdTL5sCELrcMHvYxclK42mmWiYqE+kP/
	yhTJzqdZakANAshnW5aj1zrJdnrN0RYoaXX2hUjJW2YuJp814y7SfUEatSfpmN9LYAt719bIXATjn
	HuBz34KoD76vpn4NhJ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV1Wc-00000000o1U-1q58;
	Sun, 22 Nov 2026 06:58:10 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV1WY-00000000o0H-1O67
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 06:58:08 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2f0414c1062so11539025ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 22:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795330685; x=1795935485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzgThVtz5FyRtzpWhXy/XQBj1yMgQbdQfAysHaetNR4=;
        b=sehQZffK3zum3GTTXGHOOT6xFROaPZJjb2NV2JDniO/Xq11Ns+0Qbo2cr4qGiFsHeC
         8tJFgn+uS1EceXRtqc7aVWxPMlxDdmgy4zWrl+jwZCQzGSaC1jqPmm6CLQ/CHgTaRbPJ
         WmWzTEb5t9iZHsFrvv1BLW7w8PAwGeAFhDpsBjON0EQt0JbDIgNDzHrxul1IQawzi96i
         wBsDycRCczCxbwmF1FwisZzNOeMG2GRDvDEcvLmRoGa8+DRYa83llOSSPGBuZ1gRaBMD
         moPIqgVh757giUcmBn49JW9caO7qlxbNT7eE9Z1aAmhEAKNPBTOczYk/FOd6B74VCMi9
         3ICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795330685; x=1795935485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uzgThVtz5FyRtzpWhXy/XQBj1yMgQbdQfAysHaetNR4=;
        b=ELHyMspmjA201xb4l1Cvj1urC5XDd6QkJyojl1ufXPWyaFMnFK0WpmNseqmnReKhmt
         6rjwWuob24agvN6PBtktpVb4QGNajE19zl91L0we677nZPZoL83bsVw8U+xPKhdr3URq
         X5B3931+Aed2hzkX93NsesvYxsg94cHuG7pBbGzX7JfzoakPQq+xhXbEyANoVvrUB0mZ
         5OEkHxbIw0fV+ANaIB4nVVkYXRXAt4lrKfXNf2xrGPdUJSjX8omKbjsYPGxVfTbUkMtr
         8ZwhFxuGIvPXTMe+l9ANIEAKE73Bd215ky+GAkkJWD58q7R1Es3DW4D3aq+gKoBfdIP2
         E2Mg==
X-Forwarded-Encrypted: i=1; AL+hErHFAqbU7BHsXYHTKMC7kvX2PMNSjOTIVYx3l/D3IpZJWtq/c2GlukJoYVQ09ix4HyEUskBQVhdN/m4TSnGwraFy@lists.infradead.org
X-Gm-Message-State: APuU4Z90O1VMpliV1oi2CEChasCG/1UqKdvAqXk2/gZ/8mcJZWVzgnBw
	n9uhvCjEqxrnj7uwuEhjKtc3IKl9pMbtD6RPIGER+kEQl+vt1NA+PbDt
X-Gm-Gg: AZFdTZeb3OuLNKuepZad7tL6VIPVeGpYK1uQOqwvEdfeCGfu9dwKFYamBbYFS7M2dtw
	BfUkVJZl1hSVsswg4ZHYkYHqIvZzq0d+XnhjgYPu2C1m0ozxs5c0j2FOdbx3uPP1kBxwU5PzsAb
	wkvZodoIDz3XcmeGXJjYQ+RNKo109bOdR62XPPEnsCTxO7ATuoaznRVQycNwjV3KNo9c2BtWigt
	MW1XHJdoHwdmd6eruJsExdt/v5pd6sIyP5q6BoA03RFgYvRlLpewi22lJPC06S+vTZRJVNp98GQ
	1rc5TUfKDkGsWboJHM7d6tlcf5DSxwhGEoHhdnyTxt/Oqb9wjkdrkWf5wiXBsVun66On7z7N1td
	m8r/X7YnVzwsVS60w1srL1wNvXTdYiefHFM3fsAB5ccsCforbeZLR/ELIL7ZuA64tOX+y23GFUJ
	kpMlK3dTsjLjkwHqkpcUG8CqvgQ02BDeW5j2RMQjU9NonejRkSLUK0V83j2J0A6udiQ0kXFVTVE
	1y9GPA6eN/iCVM735xKpJVbMXFAC3Eiwt53/aWfvTlhMysUOQVhQ7UQi+A0ZPAE73nsEo8klDK0
	zQEkySAXN5AuNj4rZs1aG6STo/YdfNo6penDpaUbzAm6lFIku+58g6osyonn3GordjNSEG2t3Q=
	=
X-Received: by 2002:a17:902:ce85:b0:2ed:1350:59ff with SMTP id d9443c01a7336-2f03ef594c0mr76278785ad.3.1795330685150;
        Sat, 21 Nov 2026 22:58:05 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120016sm34287345ad.58.2026.11.21.22.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:58:04 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] arm64: dts: hisilicon: hi3798cv200: Add watchdog node
Date: Sun, 22 Nov 2026 14:55:22 +0800
Message-ID: <20261122065549.3265519-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122065549.3265519-1-mmyangfl@gmail.com>
References: <20261122065549.3265519-1-mmyangfl@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_225807_484773_4E1F5E2E 
X-CRM114-Status: GOOD (  10.44  )
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

Add the on-chip watchdog controller node to hi3798cv200.dtsi,
backed by the new hisilicon,histb-wdt platform driver.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
index e5010c9d4c39..169a919bb282 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
@@ -254,6 +254,14 @@ range: gpio-range {
 			};
 		};
 
+		watchdog0: watchdog@8a2c000 {
+			compatible = "hisilicon,hi3798cv200-wdt", "hisilicon,histb-wdt";
+			reg = <0x8a2c000 0x1000>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&crg HISTB_OSC_CLK>;
+			status = "disabled";
+		};
+
 		uart0: serial@8b00000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x8b00000 0x1000>;
-- 
2.53.0


