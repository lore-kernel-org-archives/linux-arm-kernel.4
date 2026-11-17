Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA0F606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OPYYyPup;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W+GHFgVa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=A1I4z1aUO9/p85/RlMfw5TI5KhCmT/Op6gBboD1szzg=; b=OPYYyPupkYUKhu
	Fd/wAt6aYbaIWP/9WBIFFvlvVhBedhisWa3RXgXM/PcI9MjuP2Fh6y782PaFhPz+pf8y3h2pGLmC0
	Jn5is5f/pXUBVCsCTIH8WS/r5xN0QumEVCIMybItr1qw8hSojCfrY5S3gbG+/MRoI8cQnpaYi7Q+D
	ltORz0s0BmsZJSCRqRevov1qP7fkx4z7EHCgk0RSd79ZYMsXkiZpE9haWpuDGRNo59nA7ML1D2mLB
	pkUdpIzxmiR831miAlr4l0s1tSBF7UMu3utvjxodVFeD+YO+kMBaXJZ0RmhAnTT9cgAqfKd0+7qr5
	qeywullKZXgAeYCA7i5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMzL-00000006ZMI-3m7k;
	Tue, 17 Nov 2026 17:28:59 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMzB-00000006ZDy-1nhE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:28:56 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-4a85c656c58so32734fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936529; x=1795541329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A1I4z1aUO9/p85/RlMfw5TI5KhCmT/Op6gBboD1szzg=;
        b=W+GHFgVa4qlq0RICd2Gke2uV3YxsDqLbNjYp2yNwBn04W5N+mcWebd0RCkONTxNOKh
         X8Nqqo8A6+1K5QDOA7qGCMwU/tXunKPeY55R8Ca6Wz+VZcLKtQLsUqzJ4PzDuRFB3vJN
         fgor+wBKR+DjsMPaRQF0dpWnFPQcffuAU7dwOyEW0ZWoXta5I8uX2HaYxCjqw796epoZ
         J2O35H7hzZRBIpWPZlwwOvQT4bw3UykGi80z5sKOeNH0Hadxpa8smH0tEEzKnhP/Gbbf
         uCHG2AOWNEJ+hXxsvpiHjgqThJUvRgyGZzDANp6oKRMPM5sntOM2wCVUZF2fHihPcwCN
         4ZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936529; x=1795541329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A1I4z1aUO9/p85/RlMfw5TI5KhCmT/Op6gBboD1szzg=;
        b=xhyEdRy59Wv6bxqqWa9m3eU9+6cMqFjAsgCd3n4Jdn4eaCFt0rrrhGzi3MnNxBiUBj
         0xTmPdbDTt1KwwT2zzqk01Qlm2+VidElzqsEErisYHQdQq9gpg22umjMGqYchk+aGNt3
         9c2EsEaWLqDnusvF23dUARdOgvuRHWdBGkyB5wT5cjPY4pnQh2jS7Zhqe8wJTM+q7vJC
         G5Ru+YzYJdHovykjUxwPWWcCbLzLB3a400rQ4qYjlqlTyxLFQtEfetGfsKXUhxLHtULp
         HU7R+jCc5Q/qVJ8ThKkhnKg02aeG9th+xOTshbm9s8TsLzZtCVII8yBYyBIl98qbaHCx
         xKnA==
X-Forwarded-Encrypted: i=1; AL+hErGD7hGzA/2pYrew1cmSSjabbdqYJ637UbXBrmcKqjl6TwKHZmgBAWPAc+Y7ZlN41YcmI4clTGqbazzfIYGgmny6@lists.infradead.org
X-Gm-Message-State: APuU4Z+qLHLpGNV74snHYUa/mkzUiKLJ4AXiTp3ahCWKPtGaJQBN3x04
	p6LEigfNi3J/IbrxtbsNqYrt6CZqmhgJ9ZNa8xI38QlX3EDeiQa27JJG
X-Gm-Gg: AYBFou2cqfan09FBjS5pRxBRBkreNFlQ3hyQuOw0/QZWXzYT/MwPRuqDwnBLGGBYgw6
	/yb7PxbvE3ABDwBShM+8V0eJ/GriVf4whxXUz8pVczL6WJ3ryMcWZvxGIpKL+n9ucJoE5wMxwMP
	BhUYCt1/xemJBvq3ggcwRNyQsWFkWVONEDdthXEJaLS/15dna+vmaa2nvZrTP77Ss9zrBZXO0N9
	MZudcrjtQ0It+ZNBMaHAdbPLj5KyFrg7sSeKwXAqYj62M2JuYF76tQ1pFwZTXM1fJE2rv+rWH/g
	woCcN+yn0PlkEOVXPt5FK2Wz2iqe1G7CJfUIotQnRpRmM7ZZXiZ7SLILXDW+5Ti2+m59Jw+AKEY
	7p+zER1AO+C7R98+DyPuT2jIJ/3z9Oz/JYRpn1TqJhm8jT0tz2L7T5QfbDsA1X0Wh40aFszXPM6
	F0JZGB4hkmxfr27nJOISM6Maaj6j7OgMd7TJNbTRJ+sVY99gr6vSvG+AL292lFhZ4fshjP8+2O9
	Xf7aOBZdtDlrkmKYhhIcJm/pkyVzu2qB5TEHPeINnXPjB497lXXMH90lAwVUIrxrwgbxjOWx7cU
	KYVJomEwGMCYXBwxrKTU5s1lOGxERw==
X-Received: by 2002:a05:6870:1707:b0:4a6:9418:da4e with SMTP id 586e51a60fabf-4afdf7d9f45mr11592986fac.60.1794936528546;
        Tue, 17 Nov 2026 09:28:48 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b70d5b1c64sm148358fac.14.2026.11.17.09.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:28:48 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	shawn.lin@rock-chips.com,
	diederik@cknow-tech.com,
	michael.riesch@collabora.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	daniel.lezcano@kernel.org,
	tglx@kernel.org,
	detlev.casanova@collabora.com,
	maz@kernel.org,
	david@ixit.cz,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 2/2] arm64: dts: rockchip: Add timer node for rk356x
Date: Tue, 17 Nov 2026 11:28:42 -0600
Message-ID: <20261117172842.65346-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117172842.65346-1-macroalpha82@gmail.com>
References: <20261117172842.65346-1-macroalpha82@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_092849_493632_083C1428 
X-CRM114-Status: GOOD (  11.12  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chris Morgan <macromorgan@hotmail.com>

Add the timer node for the rk356x. The timer is present at the SoC
level and is register compatible with the rk3288 timer.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 7e23f6983448..3c7178b013a5 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -1389,6 +1389,14 @@ i2c5: i2c@fe5e0000 {
 		status = "disabled";
 	};
 
+	timer0: timer@fe5f0000 {
+		compatible = "rockchip,rk3568-timer", "rockchip,rk3288-timer";
+		reg = <0x0 0xfe5f0000 0x0 0x1000>;
+		interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru PCLK_TIMER>, <&cru CLK_TIMER0>;
+		clock-names = "pclk", "timer";
+	};
+
 	wdt: watchdog@fe600000 {
 		compatible = "rockchip,rk3568-wdt", "snps,dw-wdt";
 		reg = <0x0 0xfe600000 0x0 0x100>;
-- 
2.53.0


