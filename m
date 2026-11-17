Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E4A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 06:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VvC/haB0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0l9Moo5V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L5HQEogAdp/4jA7w2UsfMfPzuR6qmlgb42NC9n7phLY=; b=VvC/haB0p3mp3S
	2TAo9F+h3BsGQw323S7PTgINoxLFkSo66QxM+xRVGXdxdRME5LNR2jTbTteZxnhC9o6NQJxZpnFBy
	6RQv5a3Fob6yBZ264AKgGxbYmOPtA109IFDDllLUunMmDW4i+hdU5C7B6JJ0Z3DO7QOi+OX4N8LDG
	nkQEip5a15Gs0sajYR7Ebm6tpLWiZA1+vHXVdCZOWQY3YTArvoWsuCqL0sydEsTj3bJwnx0t4LjUR
	E3pjtkKbA8Xrh5H3P9UEHwBpll/kLcFXWzcpzGUF7A9CBWax0tz5USZI8k9z16Gneh+sxta1eXqC+
	QC/Lu13BckOUoYPuse9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTCKp-00000004dqq-1lMQ;
	Tue, 17 Nov 2026 06:06:27 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTCKf-00000004dm0-3sAw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 06:06:19 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8a06e79e152so2085386b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 22:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794895577; x=1795500377; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5HQEogAdp/4jA7w2UsfMfPzuR6qmlgb42NC9n7phLY=;
        b=0l9Moo5VNGHeAEzaCxm0EULNvk8J2YtwerG8wkN7RaV+olYx+Vfk4ZbduvA/vCZMoT
         NF4BKK9MIRVh9p0/aWBmL4fiLwzKhR8Xlp8mGX5iWdKuxrOFxpuJsaKPaOKPk+4M36H7
         I5hVeSp5g2eGSFaoJiFi4vylO1CtSRcEsAfgBv9EsSotWS3tXzSX4pGaBqgfHpTE95eT
         2R2b3S4WFuPIcfNNaKEGR5B6w5OFKYnd4/WEkkMGBQxWi+1VXDnzYO7GfoNSTvw4ujZK
         P5lnS4olMhICKfV+dRUr/jc8EPbP1gpiDDshGVYZHqeRe4Lo1roEn1JXu9LbfmZIfB62
         WibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895577; x=1795500377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L5HQEogAdp/4jA7w2UsfMfPzuR6qmlgb42NC9n7phLY=;
        b=RiS0KUU2MNh8UzYzkKSzc7LYowtaSTFpx3NSBiVU49a7BhLofbLBy0vXgt1TbX2cM7
         /wOFmgdkgOgFBohrC0asM0nL1v+cvtHoVX/P1r982N/K2PWMjKEQbAGHGz7xuMh5vAir
         urzbTNzWWJlt9cf3shPozJwj6NzHlYbYtCTKg7Evs45Kh6xy3X9aNbqj6o43Y++mY/gk
         CWrrvPgMxneKsQMB0DDwh9wHvU2mkJeHbhf2vSOVVvSDm/2Uptsrl5GD+YW2xQt3SPfn
         6esNV62OdrEkGHfNxhOM1I2jzoWal+phgHATGE8Kg5+LXC9d8zby61QQlclFA6XHf1cY
         XO8w==
X-Forwarded-Encrypted: i=1; AL+hErFlCkmRvW4h6H36WhgGs/tmFM2FyJOPRv7XMXanxB1Q0XcueSZ/AVgx+QP9w8QA9W3NJbQMPP32kUdYVuVHhlwz@lists.infradead.org
X-Gm-Message-State: APuU4Z9REuT1px0GEAiA8RIq9KoVeKOr1IwTXxu/VvuEksmmaP78VSZX
	J15tGmEVTS8SMwvZF46qoZZ1WdTTqfn2Nvu3NLdBfxcUUfTWG4Qo6OZR
X-Gm-Gg: AYBFou25jQQXc0evVtsMPVH3bJDFouZuSadv0t6JB8tR9kg23D/j/Zm/rGd2A1849P+
	cR/lo4+OSczUNBc7QXO/ClWd+jduWUNNS6PQJDwc8XbsW5En+hF98W8eu9TUrT5otz9nhjpkpxz
	6jsu9yXOkJFDv1gPcZ1SA7ACnLnYe1vcx+Dk8YH1iB/JHh3frJvpXVkxHLgDeBBl9MtC2aAi3I2
	P9fJP4oFnzCXkpgVjWaXlzkaJfQ6fePzPynUlOiuASJdjAgL3s5hi0gELzQJPut25Yar7ClfuWP
	FML9wNUMXgOWeW+6Ws97wNZOnh7+2mpASfhKfPP8xEM+R+/U/ckoRdaJ9qwqB478jRNKw6XiZ4R
	A019OqOTDgcQjGneXO1cciJs+nUEq576oL/pxTlItu63jt/S0ISf0fot1KZpaNqae2DFIjdoxUm
	9rAHjHwayI4b4yDOmCHAQ35lPD+Bhhm7T+vcLfJwFD9XP+R+BgFMvItXXdITIf2051o8WPJBRHT
	k/uP9aQRBF8uALe7dQnyIt4Woslaq6FcUgQRI0UXdKbEYKuRQxcMqk1N5bdC97VW3Jkj7Z9yW8H
	JJXiJzpZbpsPgFnHncfy0e8KOldpLS3dtY4JbWEbASU7wK0bwB9nxQ4utx7vmFiELrbQB4Gg7xL
	hL1fw/aYIg18=
X-Received: by 2002:a05:6a20:6a0f:b0:3e2:95fb:8d03 with SMTP id adf61e73a8af0-3f7a7fc6dcdmr10376493637.69.1794895576986;
        Mon, 16 Nov 2026 22:06:16 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8172sm4464623b3a.13.2026.11.16.22.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:06:16 -0800 (PST)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH 4/4] arm64: dts: nuvoton: ma35d1: Add thermal zone
Date: Tue, 17 Nov 2026 14:05:01 +0800
Message-Id: <20261117060501.2611071-5-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117060501.2611071-1-zychennvt@gmail.com>
References: <20261117060501.2611071-1-zychennvt@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_220617_965489_7C45CC27 
X-CRM114-Status: GOOD (  11.53  )
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

Describe the SYS block as the thermal sensor provider and add a thermal
zone with a critical trip point for the SoC.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..986f3cc4176b 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -63,6 +63,21 @@ gic: interrupt-controller@50801000 {
 			      IRQ_TYPE_LEVEL_HIGH)>;
 	};
 
+	thermal-zones {
+		soc-thermal {
+			polling-delay = <1000>;
+			thermal-sensors = <&sys>;
+
+			trips {
+				soc_crit: soc-crit {
+					temperature = <125000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
@@ -86,6 +101,7 @@ sys: system-management@40460000 {
 			compatible = "nuvoton,ma35d1-reset", "syscon";
 			reg = <0x0 0x40460000 0x0 0x200>;
 			#reset-cells = <1>;
+			#thermal-sensor-cells = <0>;
 		};
 
 		clk: clock-controller@40460200 {
-- 
2.34.1


