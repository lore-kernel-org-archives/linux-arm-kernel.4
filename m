Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149A2606A332
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 10:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cekr+cR3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UnUbhJDw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=99rrteyPoSG7Ruj3FSoV0/w4v3L/FLRH/ej3uZqOdyg=; b=cekr+cR3SEHRGE
	cmaq8ThlRmyH10/QvV48a+TF6aArt65cCzXEA4ZzDmu/MHRq4LXXNvkEdh9YdYhIeu5TbCjJVbRhT
	DTexit6MsIfrMHuZ1todOcgdadM+EzKyPni4MLzoPsrkBDy91A2on3xkdpG2BtPdX3TI4kASY90Vk
	d87vK4G26L6oKYyvRdVlmKjnKnIhTHuA5wleZM1R99QVxH/qxWEe/p6wRf8gD9SGVK7iIyTTpKnom
	854V70dj+PGIILb4kPIhfEEKvPCyMWisa73Cws2fxZ7CiuLVA4rU7bIbci3Z9/LALn6kBbycrY562
	nWgykz4/uO3J54nhr8PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4e9-00000000xUw-07Yr;
	Sun, 22 Nov 2026 10:18:09 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4e6-00000000xTn-2tRL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 10:18:07 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so1064133a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 02:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795342685; x=1795947485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=99rrteyPoSG7Ruj3FSoV0/w4v3L/FLRH/ej3uZqOdyg=;
        b=UnUbhJDw4ZBfYthW6v7U09H9sC5RCEMuvxuQsG89OVwLci87hVR7z7eP1RJxzynQ4I
         U9hN5C7BcZrQxHwq6vwYeHv2ejZTKGLLhAbZrnPCZZ5ZzKwdg1DaSM1kjHhzcZcxfqic
         s1rDbrMYo9gvszzzgvo3T9jqFmwI55aAPY+7S95xfWXVLQD8F3NoPlSY8PskjqgtI9Lr
         Wb1AnADxrMOIZw+152JneYhdl7sOdhwmeJF69dD4uW2AyQw/a4vhPa1uAtG0AgCPKkUd
         7DGrCWDBGs3qIQwDEbqc2hASi/uyWHYwgETh/5AykZHmF3NQNhBCucaeSo7c2IPZ7HKo
         QoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795342685; x=1795947485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=99rrteyPoSG7Ruj3FSoV0/w4v3L/FLRH/ej3uZqOdyg=;
        b=Z4HV3lb4y19hkqWrizfdb1ZsgJmj67147z3SxPRyLBNaELPIAtlITCffKzStIaQoXy
         6e1BgdDzrNWC5qidud97GDWFrfNL6/nu3HycQU173h0WjGF5J8YXQgLoW/kt8GYrv3+5
         kQ51gLsrUsZWWMNvsVecbXYauW9aX8Yzm82/wazamfQ0S+xibhQyWPGg4uZ5cXb05niQ
         ot69oIb9dM4Om+GbsSppPb/gsoFQIiRmu/vhBW6LLnQ6oH6GMyQe9mV5w8FmROcd0cFj
         KM+lUnhheuvGHInIS4cPlb1EzB8vt4C5CQurHHzPPY0bsrK845voI1ovVpZmq2BFtGuT
         4CHQ==
X-Forwarded-Encrypted: i=1; AL+hErFq6dg4MiaOEW4yqZQpy45Datq89ALS6IgpZ8OgTqHa6R2ksYFOamVqdyiru1uL0wjSihIEB2qvSib0vBi6whcd@lists.infradead.org
X-Gm-Message-State: APuU4Z+HUDrMNDXVAln16jRwPUhHKtQ1sjmGZKChL71HzOkN02VXT8Ae
	1F5oJfaDLEPummC6QdiZd3gxUdjwIYTgF8mKsmNUPmNnVAGMgY/tFu1B
X-Gm-Gg: AZFdTZdnlni7lojQFGTaGKvB86mVhX2qT+K6n9yne45e2vMfHr7JPJG7vjryKHRwr8Z
	I9nb6mLyloQtL0Ws15Nq31TEg/9ADyGUdAl5BoWe5COC/59SSIVtcfBlkm94rm0L6xR8Am2z2zJ
	WVQUDgadgJpp6EaO2b8DNICEAyXfGlOyhw7PMwTbYt4SA6TiSJGmcgZSgdKuqVMeeK2NW/i8lAC
	CRn25qEO6V/7bPMnIETLq09WCkqdd69f36ruRMSqBI39M4JhktVCrLIOMRHamGWhnEQBlLR3fQT
	nXfOve1jIQ0l9cPgXq5xAR2pnvSOYpvp+iUZPmkINF2SEO4xbF/7adhi4AGzu0I9HBf3mZxUdJM
	/1ifmDY5MWFgPq+WcndkH5eBX6D950+I34sMs6+iGNNA9IRSdyJy4FCnHV8aOtBB4El2C/NJSei
	HCd9wpOToRuT9PafLeJmOJDPA4XCzpUPVXmU94TcD4LRuHMIvTnYlYvg9MwY1iwk2AoDb0rwxiI
	5L3j4gi83cKsABSfit4PsbnSDyzUF1KDRYicusJv9//QJ4gGZbWPFFg7/2R5HAjpvowvS0mfbPM
	TCcjmHJKg0/TEscjG29f20gpOiHXeE45q+5WZhOUouVmrpeAZBQ=
X-Received: by 2002:a17:90b:4ec4:b0:3ac:7116:434a with SMTP id 98e67ed59e1d1-3b41c900858mr6907329a91.15.1795342684858;
        Sun, 22 Nov 2026 02:18:04 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm14953787a91.17.2026.11.22.02.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:18:04 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	robh@kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v2 0/2] ARM: dts: bcm2835: replace deprecated LED fragment
Date: Sun, 22 Nov 2026 04:17:57 -0600
Message-ID: <20261122101759.206056-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122095225.200916-1-artem122novak@gmail.com>
References: <20261122095225.200916-1-artem122novak@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_021806_726683_0D54A195 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

The Raspberry Pi Zero and Model B device trees include the deprecated
bcm283x-rpi-led-deprecated.dtsi fragment to define their ACT LEDs.

Replace the fragment with board-local gpio-leds nodes, preserving the
existing GPIO assignments, polarity, default state, and heartbeat
trigger.

Restore the leds and led_act labels to preserve the device tree
symbols used by overlays.

Changes in v2:

Restore the leds and led_act labels on both boards to preserve
overlay compatibility.

&
 
Add commit descriptions explaining the purpose of the changes.


Artem Novak (2):
  ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi
    Zero
  ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi
    Model B

 arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts    | 14 +++++++++++---
 arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts | 14 +++++++++++---
 2 files changed, 22 insertions(+), 6 deletions(-)

-- 
2.56.1


