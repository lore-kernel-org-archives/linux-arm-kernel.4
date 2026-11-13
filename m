Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47A9606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 15:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vlhvFoXq;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TouQkqBt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=mOarK0ZUP5B0bKlIjJx/4smq9XTzerMTaUSt18kN7Y4=; b=vlhvFoXqIEzsBEwdylfJYqACGY
	HgqDNXpWE2qH4MTA/D1wW/GZit7cr5YkTMFPSoDqu4DDSlbUPl4uNOm4wX4SRvtAv+LSYJVmRM6Oo
	jmsJcWTZLu5jW+GcrynOcE9FRcHLVyZUun6PO6rpkAr1mmkUc9rWG/vwnLyshnLrLcq/eYRhI7z9e
	yqhHWWJ7ftqBr3XvhAQ4ykQ78xK9yIFbGEoFFKEXY1jDJFzE2RpUp0TmwdPzdNBmMEVftz7s9oU29
	R1F33wxJVG5dUB56qOr2UV/mplPpMXsqu0TmrG+Nk9TlMQoTcreu9yueOIjmZRlsdWyz+6XA1n4z0
	fRdiFn2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtY3-0000000DSDg-0gJk;
	Fri, 13 Nov 2026 15:50:43 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtY0-0000000DSDC-1AiP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 15:50:41 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so16156145e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 07:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585038; x=1795189838; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mOarK0ZUP5B0bKlIjJx/4smq9XTzerMTaUSt18kN7Y4=;
        b=TouQkqBtbiDZ8BKY2cRMY/GStxf7BqLGxWwmfyx5LpJZKFtVwXF9UdhT8WvGaSAqp7
         kK+bvbqmAdbVziEb78RmU4NN7l2jX/S/Gd1Dx3B8uIXUCvUjIYUaPgNVVdrd5l27rWY/
         ufm/FDO//qXcbhRqtJ0FuchmXKQ0By6br3OIx3b+i0/brW6bIWUWVw91I6oFK5DCnSo2
         TqwE3AC0HVZcyrgb8k4FlrPni8pH5VeUQJ++9iNZiQWSnJ9SQQKCoaCEVClkMPG5OAHa
         yLtV99zSix17DZlH8RgGYfD5zjNTOxFHIahkCM1OC09SKH8wAEpSvcpo6FOBmITy9WpU
         3i/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585038; x=1795189838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOarK0ZUP5B0bKlIjJx/4smq9XTzerMTaUSt18kN7Y4=;
        b=DXefH3OAqJNHcbtBR7R0Ce/jZXUZdyO7rYqxfyfjYHjFoDg51jzQi6obalO1Hebigy
         ndhC7d1KMHfOxKoXffXm1Tdz3K9HwrnRc7M8s8o7udkHZk39vt5W22umOA25ZfXTsSXn
         PFLAC5LyyWjoi5lRq6X67d2oN+9YvnBB8Wzr3zrbWIxCWG02HEwq6Wxf6Z+bTpttSymo
         Xr/8mdGF5w0F98OrzIwET49VqYTpARkn5EFNet6Bu5CDJPpffWJlxH8/2QROf4MpehZt
         uPRYm0bas78am73eja/yV4IhPcIqxE2XP+K5pbm3KRoF3OoEAHyRlJFxSjJTELKaO97H
         mX6w==
X-Forwarded-Encrypted: i=1; AL+hErFc9iBvTX7GqYiabm5ygDBUEHHWQm8qS9weSKiFewEmKpH2H3SpfMxIuQMCUoymjhZTgi/lTjABUiHKzZ4/c3Sy@lists.infradead.org
X-Gm-Message-State: APuU4Z+1QrM3XveoH+Oabvs7x7ktQqFld5eV4IjYnqjcUbUcEL3dEqbq
	Dp1bqsy36gsBLh5Sj/fGuBm9oEnggB29CKkJaht3hTAYdKgjpyhNRZ1q
X-Gm-Gg: AYBFou2jmbVUkIvc5et8/dCsZOmexRnf1JkTKLsoSqUHUcvt89CDc+SciB+KxBwOopd
	m8ar9gY320vLuuYQGK/EH8JbkK0y+Kw9moLCYjygEVen7JBfAYveyRsHtnNMyd3LM6fFPn+lO0d
	LdoFFfI3Ws2dWRfVP4+SyclvjcVLvafq/PCnjNkYkP5W4dUR8FcqehT81fr0FXkMO/dQj2/A9TM
	nuSp5vDX3n0z3aaI9W523awiZpA7+o//vnEVGqRw1jz67GdbNDR1Opv5XmA4BU9ct0iq0Lj+Xhj
	I5wZ3IYl6n8umG+Nr7bCxExhcZoSYvWXFqx1CXJzn7pmosYVuMi/vwZ8RskCcsKiHXSnTTDDNd+
	T129mf0+LjAmZopo1o+Q1bp1pD3Dn4qiyu7zy0A6cV97ByB3BVLYJPVQxWIDbOcB5i1zVwweFd7
	AwQD511BipO3wf6+ZxXH0BAWybxEBbSpMgwExZZtGZBbQKO/Onq/4+dMBRyxRUuD7uR3224LGt4
	xqxkqFzV77QUUEPqhqo8im7E3RtZcBKMqW/JCemZEvM7kl64Uqe3E+IZC45ldARgsO371iznW06
	h2pGmM/QEztqOyqH4plJEtcK7tUdGumdGj2GveVQVcs/tgPd9mx7TCueRHWSfPo=
X-Received: by 2002:a05:600c:8b47:b0:4b1:32c8:27db with SMTP id 5b1f17b1804b1-4bb55a7b9damr65527035e9.22.1794585038370;
        Fri, 13 Nov 2026 07:50:38 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6020bb0fsm5518477f8f.34.2026.11.13.07.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:50:36 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v5 0/2] clk: sunxi-ng: add the Allwinner B288 CCU
Date: Fri, 13 Nov 2026 15:49:58 +0000
Message-ID: <20261113155000.84703-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_075040_339174_33EC4AC9 
X-CRM114-Status: GOOD (  11.78  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Allwinner B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book
readers. This adds its CCU.

These are the CCU patches of the B288 series v4, sent on their own so
they don't wait for the pin controller. The rest of the series follows
later.

The B288 is closest to the A64: most of its PLLs are bit-identical. The
clock descriptions come from Allwinner's BSP, cross-checked against
ccu-sun50i-a64.c. Tested on a PocketBook Verse (PB629).

Changes since v4:
- rename some clocks and resets to the names the other sunxi-ng
  bindings use
- build the module as sun8i-b288-ccu, like the other CCUs
- add the CPU PLL and mux notifiers

Pablo Mazzini (2):
  dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
  clk: sunxi-ng: add Allwinner B288 CCU driver

 .../clock/allwinner,sun4i-a10-ccu.yaml        |   1 +
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   2 +
 drivers/clk/sunxi-ng/ccu-sun8i-b288.c         | 775 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-b288.h         |  10 +
 include/dt-bindings/clock/sun8i-b288-ccu.h    |  82 ++
 include/dt-bindings/reset/sun8i-b288-ccu.h    |  45 +
 7 files changed, 920 insertions(+)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.h
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.52.0


