Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AA9606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NpDPXsZR;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mFp3VIuB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=H1UxkeLQlmXTSBoY4Hag54M+vDnMqFCGtxj59kTEfoQ=; b=NpDPXsZRgL0YYHD3g9Upuk+BOa
	Czb9kFTedKtfN5TBJFEcTRPIJqJZiMC12wxO94qQx5wl5uVJ6spvxgH/I/yK9EdbLGi+yj1sZ91aB
	aCTxhmw4xqINCY7pHPQGbBs04oM1VE1a3ZGkJNYgr4WK8Rz0JVFJ1+/s5k4o+U9I/BG3L50YjuZhL
	ZmLjW0h1p706vjKUgRHGNcW8a2DOLhcyUPjbsqSWdcoCj/Zwbx6NTkwiwIdzVVjNTqkNfdYgMwuUc
	r3FebHbO0fCrghARB2CuM47FD1yJLmBpBsmRJ+5uTDiqwIcFhQMXTackzkD8LfOhLT3bcl6Rv7L6q
	nPzo9yCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQbA-0000000FRAr-2N9G;
	Fri, 20 Nov 2026 15:32:24 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQb8-0000000FR9y-0uiu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:32:24 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-717080a2d50so939414eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 07:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795188741; x=1795793541; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H1UxkeLQlmXTSBoY4Hag54M+vDnMqFCGtxj59kTEfoQ=;
        b=mFp3VIuBhuMgfaDnmDD3f3pa6HvByq0mcDvP+O5B+x8IQ7mL+YEFDxhE2pHQKUKMOl
         1r7/02+m1kEnRlg1T9fczlGOhZC5kpiJ0HdHw35+kR0JeRArmPHaRGG/SR/r1oiEscgP
         0wsYUkcLr/xQ2jAqdnx3yTfO6vtQ298a64UPxPsIPy7MVwIh01SOcaafqlsYcwocZpe9
         Ko6rlJ071G+OT/eOLtmwFc50VW7f2MAKV0ieBrCL1VGhgTvLIGXD4JT4kq3qWy2BdIvG
         6lZc46rfwrEUmMT6B7a1+w7kQA4+6EATr9lm6j1ZsZdxRX9nh2t4qzqOKtFxywkbjauK
         PbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188741; x=1795793541;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H1UxkeLQlmXTSBoY4Hag54M+vDnMqFCGtxj59kTEfoQ=;
        b=hve7sgmIWZrph0siXeiKVtEduHxURPiAEpuL2BJBF338AFcnY/QIdwt/JCW/6s65Yd
         3mAunrMpJiWKqUnLZxSzoGfutnYSZHsWOK/iwbiii635p9EoLWsDThXuey/akF6T0u73
         twS8FdzlZ+LCbhni8DMiE4O1urR1iZAWLTjv3q63WbBhFycyOJ8AuGhKzBVr9Exttmgx
         NFprH4w/m1FSjcvQ83XpshVGv9B2+9NPynzkELdi7HDEwaEBOuyYBar80C/XkO2bisHJ
         kwbzuSvhBGBVtONjamjSh31OzmFiBcqqxRRH4myXVe1PSD1AGBalDK6fKN8QbhaE4pUX
         xpYg==
X-Forwarded-Encrypted: i=1; AL+hErH9tl7BLJc+NodGb3FgdRlPruCzQxauvNcDUnQVQpGe7NJYAeEw4jo23Lb5UJdVyEK80uLQh94ysyEcf1wkD4pv@lists.infradead.org
X-Gm-Message-State: APuU4Z+Oq8BIIhEZ0kzFb09/5CEt8rlk96ltYX+2Rvv11GaxGAYCkj/O
	hbnTeOjRMLMpPU857UCxJZ5heAXdWSyTDbrhQ/5ajGqWRi+y5XtTa0RuSNI8dxlX
X-Gm-Gg: AYBFou1V+8ZEFtsMf/cbcfv56SV8+urUdSWUvIxDQqq44QyIVUh7ScNn5jdyW7SuIy1
	dgQ3bP5O1fdgzm7qJ1dSZqj8xBomBg9uz9c2rRU2VERiauneqkuAM+4Jhw5BYaeRC+DclrcGv3k
	v0nFDq05hpltp464TjByZgjOwyTL2AFNuvgsesgwiEh+USbsmdbESlAFtw0c968FHpBmi2C2hpJ
	gZvQLL9zxgwQCWUNQrQfo7P0X1NcwIO/0pZjrg7OKG25t0yKHeLEvF4H/fVpV43lasZlRpKVRhO
	5yUIEnjg/q9rMPRRXkkA2myWUDgBghw0pUEfKhH0PF6CYYtakgKJc9DyH4s4IHdbUOvD3EQr923
	1vfVe4edDSrHsZomE0WMq/aLI86ErYJu5aqMp9tkQvq7FoTOsi55JrdHKA6o55tyPaHvQeP8FX7
	Pbo0fUvfCLO9AyZAYUNXiozpoDk+hYHWRpsElMgLYtt8Asp6p4c1r/mxRRUEHt5m1bXrPpXTUYM
	3YMnA1xqauliV1psDfXUxr3hZAxHUZqlnigPQrlUDxyPld+KmIS25u0xvcYvplfcsx5+1GGkkSu
	s3NknIEKae5U7OrVvWXvxwfKgXYFBn/3EoXUH0OerWQurPC/LtHT16vQAtpdWHXTm7EQAr68X/N
	ufGeRIBU3gEeIrAbsoa+F/Yq/c1affB+ACc5HcCilc24K9lcCLJr/BmjR82wGqQY96+YJpmXIvt
	AP4tAqb67rgZDCzAdSE071WrrWR/EruySHMSEJ+UHwZEBTPJidP2w=
X-Received: by 2002:a05:6820:709c:10b0:71a:fcbf:248f with SMTP id 006d021491bc7-71b39528b98mr2217708eaf.65.1795188741038;
        Fri, 20 Nov 2026 07:32:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380bdff9sm2159605eaf.11.2026.11.20.07.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:32:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next 0/2] net: stmmac: handle RX checksum and wire
 errors on sun8i
Date: Fri, 20 Nov 2026 08:32:04 -0700
Message-Id: <20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQrCMBCE4auUfXbBjdQmXkV8qO1UVzBKNi2B0
 rsb9Wn4GfhWMiSF0alZKWFR01esIbuGhnsfb2Ada5Pbu6OIBLb5+tRcJ3rlVHhCn+cE40U4SNf
 BH5xvg6cqvBMmLT/9TBGZI0qmy/+p0AND/uK0bR/+00/fiQAAAA==
X-Change-ID: 20261119-submit-sun8i-rx-features-v1-9177e8328598
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_073222_446653_122D85C3 
X-CRM114-Status: GOOD (  10.58  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The sun8i MAC has one DMA forwarding control for both IP checksum
failures and Ethernet errors. With forwarding disabled, packet sockets
cannot see bad transport checksums, and the stack cannot apply its own
checksum policy. Toggling the hardware checker instead leaves no way
to tell whether a queued IP frame was actually checked.

Jakub asked how the proposed bit-27 change [0] fits into the complete
fix [1]. This series replaces that change: the checker stays on whenever
the receiver is running. Both ethtool modes deliver checksum failures for
software validation; only with rx on can the driver mark a checked
packet as verified. Changing modes no longer needs a ring flush.

The first patch fixes ordinary reception while still dropping frames
with a bad FCS. The second adds rx-all support for capturing complete
frames with wire errors and runts that the MAC can forward.
On H616, a bad-FCS 64-byte frame reaches DMA, but a bad-FCS 63-byte
frame does not, even with both forwarding controls enabled.

[0] https://lore.kernel.org/r/20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com/
[1] https://lore.kernel.org/r/20261119161151.5251fc86@kernel.org/

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (2):
      net: stmmac: dwmac-sun8i: deliver RX checksum errors to the stack
      net: stmmac: dwmac-sun8i: support ethtool rx-all

 drivers/net/ethernet/stmicro/stmmac/common.h      |   4 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 167 ++++++++++++++++------
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |   3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  59 +++++---
 4 files changed, 172 insertions(+), 61 deletions(-)
---
base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
change-id: 20261119-submit-sun8i-rx-features-v1-9177e8328598

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


