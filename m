Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF564606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mIobrsyU;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ms/MtL5D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cucuRiAtyyJedRw49cmsQXrkLhK0VoK8rf13ct59K5U=; b=mIobrsyU4XGmtaU+lneLE/sUX6
	fubqesNfXhWRc9CcssAk0lADEy4aY+j3V32/jrDwVGLQDatmrzt/UuSlAbzTyuYW4b1XMX0u1HZc8
	rEc1sY+POUydxmVOlbRAWqr5daK4JYbS8ijMF5sybJxdNCXEQbp2tgKQoJkByy8kFtcYQuciXvCND
	ER/e0lb/uXfc4hbSVil5RHHWjj6AARgcb9urzBKEbGUiTuzChURS7f6yZHRZ4xoGRwVYqQj4pWjcl
	sLxY+nKaLkwi/XX3BPv7hIfpLoLP4pWaaiUiZPen506pr0yPMU5gH5vqtp2da9x6HxKDbqrXcGFBL
	Yv1UIRNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSswv-00000001lHj-37ll;
	Mon, 16 Nov 2026 09:24:29 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSswt-00000001lGa-0NQ6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 09:24:28 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so2827968a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 01:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821066; x=1795425866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cucuRiAtyyJedRw49cmsQXrkLhK0VoK8rf13ct59K5U=;
        b=ms/MtL5DAGWj8lG6TK6djCmTVgFTuBYwa8zsgonU02ImcbJmwn2FydDBBVPGFKtC7G
         2dxUyuNRzpTopEVNIMXqyAa96n41sU4AEuI1SFUicLDFI3asEu0BHxBBEZUtpylVv+7H
         GcSEpp2UgrcIJQJPr14+qolw1bKclQSiHLxf43zSsSvriiquXZ0U7uEA3KeclySSsFJ2
         kmoa3KpMC0SLbgN4RZTPioITES5zKB8xjTFVSuBeJ4BlFuQF3IjDX5YHaAH2WbnQyAlo
         VhIh8VJu6hSi2CtJrbYgHoP+N7Vuw6wBy3MB9JR/gcW+0ng43N01sgebZINt85gYqbwo
         tNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821066; x=1795425866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cucuRiAtyyJedRw49cmsQXrkLhK0VoK8rf13ct59K5U=;
        b=aTbWAfthKfgiYwek2lYxWzR2kitiDpdrV2rpq+AeJcfoYoX6XdD6Itz3aYt+0fie9M
         5dMhMmH8igkBjPaaYwgu416OSz+Xg5e1Ng/TtFDxhppmAR2AL1FFfHVnLCJpEeAPmp7D
         UTMX+cfEKRRsUqmfBa3aLxdwz9u+sXi3rHnpURSGEXYMV7a9U8ulRRKLQFmStuoxmXWc
         stkRIqehXZC0PCbY3cfmSLp1edeVTWefBHnBKSW6oxHddG5e6pQgpF4l37AeMAcMZtfP
         7uwh/rG8ikxVbIj5XessrH8V848xnWYRq1ie41ZGv0tBqePO56TSTRPQNSaCLP0PrSvY
         lKpw==
X-Forwarded-Encrypted: i=1; AL+hErGtDXa+/873HQlUDReM3hzIilb+gKqvrN/q53y5Ft05CDYkCg4BuHG+daDUbXIRD6W9WH3yBnj+pBkCc23oTDWE@lists.infradead.org
X-Gm-Message-State: APuU4Z/7vU+mJZ0PN5mFDJ0ih8z6AMs6zMrnaWjd47g+W/rsg3K0RlVW
	D3WphJrWLZbcoHed0Fh4bj9aUVe9B6NYggZUCN94ZIYIzDIJZGtaN4Wj
X-Gm-Gg: AZFdTZfCl/bPZLBjSFQ9kQ2lDfd8rrBo8e4DKC21fQs3CSIVbhfIdK769oPSzwXCZcR
	dXV+WMh5YahebMouOieJbx4eqez0tctKXIRzk0mjDGeQF2l8izgzHrvgAywQaMm5cRABINl0DSq
	4pCbLemUr+X8sVIjNPsVBmxlSjck3Lr3xFlf88bG1wiK054116mHp8lqjkdZcpdAZMjFIgYBNYE
	iLNC05ICV/chOW0yZaKDuXcdlG3jPWKx+U1yquNyC7eiTaSwCHcM5csuCnrid8K5Dn7szgxxY+g
	z77MGL07z4aW7pKj6OupASR1OLZoxeuR5bHyiRi7lfeNHbfIzp/KqvI5lqLUJv8pepBSZ/DpKPx
	Z7BPM19O9Prj7Ysk/3KFFiaK0JjPdAPqwxZQSNOasGiPiKUzvCmSYNOXE2Ka9fWzPmM088ERrMy
	hpTk+T0TDwncFzMdQkCidVWI/8Neij5wQbmzvwi7dBSpITZq5YNzvirl3KGVeuKtj7JdcW2NnDY
	AymAYTGzjIMN/t8+aIeLcQhTBmpNZe6Gz+AvPaQcCVe18xhsRhQwEWzeU9tOblh6iLsXhB16Swl
	zdK9nch5ILwpB5mncXi2RMkwEEv/qXT0f7lJsGUhAPWQeJx3MHXo1Fg2YcmSb1ic7VKE41FE3gJ
	5z/1Sf0F5veAeTQyTMhSp+8mnsDHCcf+OAUsTneMrwzPbVwsqS7/TaYL1uCjmh9NuOg==
X-Received: by 2002:a17:90b:4d06:b0:3ab:884b:65b7 with SMTP id 98e67ed59e1d1-3b1b0ba1321mr8970677a91.25.1794821066118;
        Mon, 16 Nov 2026 01:24:26 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec43699sm15661189a91.10.2026.11.16.01.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:24:25 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] ASoC: atmel: mchp-i2s-mcc: Improve clock and IRQ handling
Date: Mon, 16 Nov 2026 16:24:03 +0700
Message-ID: <20261116092407.514998-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_012427_127291_2C1626D4 
X-CRM114-Status: UNSURE (   7.23  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series simplifies clock management using devm APIs and ensures
the peripheral clock is enabled before requesting the IRQ.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (3):
  ASoC: atmel: mchp-i2s-mcc: Use devm_clk_get_optional() for gclk
  ASoC: atmel: mchp-i2s-mcc: Use devm_clk_get_enabled() for pclk
  ASoC: atmel: mchp-i2s-mcc: Request IRQ after enabling pclk

 sound/soc/atmel/mchp-i2s-mcc.c | 46 ++++++++--------------------------
 1 file changed, 11 insertions(+), 35 deletions(-)

-- 
2.43.0


