Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF07606A696
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 01:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HjVPy4bP;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DUKyrF9T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=u89IqnoAKi5kjnWBIZSz6wZn1oqd6Ypo53SPsotyUk8=; b=HjVPy4bP2VxpLb
	g1O+uEEhSwcwBqhQdW4/gyTyBo6Po4cR7+VgpCYTbi1xm03Xj5YUAlDTL6zvLX/MxVmw6n7IySdqk
	++dlP3ebIscf6HxgYXoz/PLqrq7ge/xmKZ8RMFy30XpQKqROsoDQt75i6RUiOay5GfhBloQWN0tVl
	VHYSRbq5KRsYQbFXrXNkj6jN1CjtkVUkkJtpMCVJqOh0fs1gnq2/OnWFkXhw+tSAtqSpwXZBXSnqb
	U7VtuGDVdm4IAFypKtiPPPL3peTcnCAhXD5cS+nECLmS/8uSmItPOPOkGvgXfe7SQkj+WbjGrJltp
	MNJNbbT10XXwGHkkCVSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZe8-0000000Ga5l-1A7z;
	Sat, 21 Nov 2026 01:12:04 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdH-0000000GZKV-3u96
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:13 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-53dda625f63so913122b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 17:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223471; x=1795828271; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u89IqnoAKi5kjnWBIZSz6wZn1oqd6Ypo53SPsotyUk8=;
        b=DUKyrF9TVLf7kcZzBjEuDqWu6n7qfn0xJFSgnGZfbSOmiO2veNv2XanIViJqIoH5Pn
         q1bo7NWTkveiLBVhJUx93/gS1X6Y1tp8eEKRgJP5HjDVMioTEK9L1eGcMunRvBWs+wXj
         0/rgh3N1d1GyRr9SqztBZA5ahOagvl9JEcvaHolTgScjD4Up1ZD3fmQ0hle8ahhFLtT6
         ITsBL3K2iNVXv/KfMRx5FUPG0JB4zgUi6E0QQYQZ4oNKpnFdJlB9Q4JofPrNlnmfAuJG
         mUI7j8Adb05odjZ/cr0LxdJNN7ywAVrj9Z1PTIGp3pu1MuQEgENZoOoQUZteLbk4nUeZ
         j12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223471; x=1795828271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u89IqnoAKi5kjnWBIZSz6wZn1oqd6Ypo53SPsotyUk8=;
        b=mKIUfNL2qJiEg6TlSaDQwNflzVwGStSXUCplK6BOVkx1+ZUBvbILelmwEnM1e/ujv9
         PEb7NGg0J/PI4ToDHqnli6J5bLtPvedNPM3ksD5wMTbgwSF5u2evkYFWny5Tsv6TP2CJ
         Y7ngFi3S0PXtzf4BeI1lgT48TWPi6zp5ZKQEODufwdGebbu1zkDATxn0/cCRSJbmgNn5
         GfoerwQq0Pngjl9xT45IufO5HGALcH8BIFLcCeVlpkasvwFKGjX0mJnIe7juwgO/pOuO
         xYBud+wYlrd6KfmJreYRzLCHI1AZhQFjKlgKeDzGY0nLLEUEry3i6LKfWc9lUF5VufW2
         yyUA==
X-Forwarded-Encrypted: i=1; AL+hErFqAGgQgczpjHVoGxNnVAkqZ5KqDRnQfNYpcUf3Fmo0ml7cVv44f3AOxmcW2DiB5ZJdw9g5rbLKdOM+nHvb4XTW@lists.infradead.org
X-Gm-Message-State: APuU4Z9XpNsu5oK7bOt+VF33L2cViaoIEpJJCw+CdvTiZw6n6gKeDt+Z
	Q5xRC6pUSjJMz26Yqr2MMwFimu3A+IZOpZ7z1FM/sJDYlakGCBB736DI
X-Gm-Gg: AYBFou3LLFC0lri6U92z7es1hIOQ0EHs1p+udBdadQwr2YqoXivyYgT1dxXWCiFReks
	4RceyaPQQmTgcKM7IFySXB1cIwLgRhqCs9+U0++6nDoJhwKVwNNIxnZS8ZdoCR8GWBEpBf3Oi6c
	hMMQS4+alRexIlRfyX78c2gfJTIcUIBGEDqn7M0B60da7nXi9fjqbk7cBNoEQ+RJ/lL0/hXIXey
	/lehUMXKyh8YwXCThLuo8tjLLZadKADfc01TInEcQ0pUxcKBposrK9Cyv6VeX4SyVEb5qe1cR2Z
	CM/0z5NCZKWPEZk6ZLbUC5R0aDn6Z0ICcR6UUOPTmMUYsHfXa/o/NZtY3TwLGubbT/fHsFD+1yz
	SOz8h19cTQjBaB1/Y/vYOstoEOrWPZ5WlV3Chw0sLK5lfx04Is2fw9ujA2qhr8QOsKVVp0zzM5h
	wTnbWomZLDt7zohT6YWiQqlhI509iys29nW4tHAkR9QOwtNNdSY7Hq3nMK49OlCfp620zSSy2Vc
	sTMuP+3d9cfjauwvHr+4b8xSPl9klT9ECl0I9B/CCc12YMv1ggDmtyp1eWvGnioS0ur/NtsMmOw
	THTZLGoFLzMRmHwL/JruUMBLP8ZW8g2gu0Qv+9BBNA95jidS6tYPDstLb7xn+ak/EFEaA0odffP
	v4OwkFFNy37I/i7Do3hq7VTw6pVdgpUDf92EMgazXikRnkOYQ+EGJ8HlxRB05BwSLK8vHa6E6fG
	GMngzKbG1K735r4lnhvQXZzEtD5aAq+bPT3tX0WleO+FFtUTvV7SMx4Vn6U+bQ2G96V5Kl3y6h/
	g==
X-Received: by 2002:a05:6808:244e:b0:574:6f37:671d with SMTP id 5614622812f47-57a056c81c5mr5959981b6e.5.1795223471048;
        Fri, 20 Nov 2026 17:11:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:34 -0700
Subject: [PATCH v11 11/26] mtd: rawnand: sunxi: preserve synthesized
 zero-pattern data and OOB
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-11-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_171111_987308_A8F2BF8A 
X-CRM114-Status: GOOD (  15.65  )
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

With scrambling enabled, a PIO read can report success for a physical
all-zero chunk but return descrambled SRAM data instead of zeros.
Both PIO and DMA can also reload the requested OOB after filling it
with the zero pattern.

The ECC helper fills the buffers for either hardware-detected pattern,
but the caller skips normal buffer retrieval only for an all-ones
chunk, the pattern it treats as erased.

Skip normal buffer retrieval for either pattern when there is no ECC
error. Only an all-ones chunk selects a raw read for trailing OOB; a
later all-zero chunk must not undo that choice. Keep the physical
reread and erased-chunk check for ECC errors.

Fixes: cc6822fb756b ("mtd: nand: sunxi: move some ECC related operations to their own functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-172123@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 43c0796d953a..538ffcc79108 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1226,8 +1226,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 			continue;
 		}
 
-		if (erased) {
-			read->has_erased_chunk = true;
+		/* Both patterns are already filled; only all-ones is erased. */
+		if (pattern_found & BIT(i)) {
+			read->has_erased_chunk |= erased;
 			continue;
 		}
 

-- 
2.53.0


