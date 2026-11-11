Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F19606A8B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y538IBi/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=buUpJwfg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cX/Tp5audNOVGhUTi+88u7YfX7Lqy3DYIOIRzLRbeyY=; b=Y538IBi/42YXtO
	xMC/qjGavu8RH6/ssg+TmHxSgGN8+MMm62JZqDd0L1uUm+XnWG89jzyN2tD7To7fKgW3eLNKfkMx/
	CwuT56T7GbxwKNNvPsKoF+6itC6inessIuc0m9BetCDmRNHBUDKGMpaFRGFSL5Zy214xvrIHLsqnb
	D5Wd3OwZ+5GrFxflcBifxj5Cirj4c7JPoAD0J0HLbzUMp9TAPPQCzenwhZrgdSebD70xe5OzClsoD
	g/69spqxSFbI6EG2v1+nXGYGm7aU6kcVf6ywW2QYf1mF/bCzDMj1UH9uSnYVujlZL6LnjQzB64wxO
	d0xWFpwWGjKwRM7fkcQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH2W-000000080Pj-0UV6;
	Wed, 11 Nov 2026 22:43:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH2M-000000080Ip-1HOm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:43:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BE65063B34;
	Wed, 11 Nov 2026 22:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D25E1F00A06;
	Wed, 11 Nov 2026 22:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794437005;
	bh=cX/Tp5audNOVGhUTi+88u7YfX7Lqy3DYIOIRzLRbeyY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=buUpJwfgTYkO2rE+o86IT2/I+go5KxcIEK5OFkI5mIqdAWhG0kDrMe8TzKEWNWQAQ
	 Sb9qv+WZH0H9h1N0aGnNZMYa/pXxFL00OWoytbDOe9uieJr1wXS5Dmoyi1l399+KJf
	 XTfzvvmuoLASW+nOPknvvpTg/l0fTb8nHEBji1tRn+//ZPoiddA7aWEjtO3CjHvPOW
	 jMDY8xvAXX8Ub3WvMZXdAvaOv05kHT/Mkea61tHwBDpTt7S4DkHdVWa9xpTdSEOmW0
	 Uus4porQjBSWgoZoM5ODpN2S1WHLKIr3OH4eGoGcHX7JE/6WNNNWVL7m1rHEfr+pcu
	 4cfBdWCQooe5Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 16:43:05 -0600
Subject: [PATCH 8/9] arm64: dts: marvell: cn9131-cf-solidwan: Drop
 st,m41t80 reset-gpios
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-dtbs-marvell-v1-8-938788aff3ae@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
In-Reply-To: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The part has no reset line nor does the Linux driver handle the property,
so drop it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts b/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts
index b6aeba7d0a61..0b079e1428bf 100644
--- a/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts
+++ b/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts
@@ -252,7 +252,6 @@ carrier_rtc: rtc@68 {
 		pinctrl-names = "default";
 		interrupt-parent = <&cp1_gpio1>;
 		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
-		reset-gpios = <&cp1_gpio1 13 GPIO_ACTIVE_LOW>;
 	};
 };
 

-- 
2.53.0


