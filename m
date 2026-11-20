Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E41606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BDwDZzGY;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zWaRmvyI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Wv20V3Cm7/chgyBZeECK3U54HfislA0FQ3c62tQ5/jc=; b=BDwDZzGY/ulwe1qV7iieNuKnrq
	H8mGPopGQQEzdAo34Pac1R5VJoAxc0QLCtzCpUE6zgzR74j6rWORDpNBfEzHQj6dXTdnoKY7Rdq3b
	TmMP7gU6za6KSBHiTgGbBMeH1sR0CW30bvsGWnWydLCGY5A61ckyaoK8ZtX4uKEdPWVyAvV6mhCwm
	dGC0U70ocsm3zzK89/aawLm0x6XD+GRgCkgo80TngkEHS6Li8uAbJmvvWSjbMTW98AhgMzskRIR8+
	0EDBWZTMkjLmBZjYA8ePxtlN6XxzRGBCpODftt0rNkVkfWMIGN6lcX+h8Vj8zixr+0QgKDD0EFKVc
	T2CdiM+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULAI-0000000EV1L-1o26;
	Fri, 20 Nov 2026 09:44:18 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULAF-0000000EV0u-20Ve
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 09:44:17 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-380b40319bdso868127eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 01:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167854; x=1795772654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wv20V3Cm7/chgyBZeECK3U54HfislA0FQ3c62tQ5/jc=;
        b=zWaRmvyICEEAG4dlIm5/o4PAqdB2xCyGRebaH+CGb2pp2jfJpTE/ELcYgtF7SS6tYH
         6caQhWQeFyUbqYCnJ8RPWk5B55rOpYZT2nNqQRZpe8lw+lVzwaTThDVwPGwxSKtowLp4
         VAqDBiKOvP6x0ec5oiUpNXcqqYKcc9Bc2+ADRXdgaZ6pmnCEm/EIPMfnDq7FyomKTSbm
         NmGOS4nePWf8ljHabu+lFkMygHi0jhwGQxMnrwMgGaDijFA1RRg2db6mjo1wvUgKXUHu
         xINziamY6gZrizsh036FScbplW2IX5Jb4++J6r7gnMZsokFKBqlC3E0dMAmBxGoyF0No
         0bmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167854; x=1795772654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wv20V3Cm7/chgyBZeECK3U54HfislA0FQ3c62tQ5/jc=;
        b=pZYlERZEynMdMvU/pXciUB3irDwC5GP2gEo4APsORBZ0Akhvj80ukHTzPFkV+mRtfW
         im6HCfnVclLIZEXMIa0NvM10l3hE1psSt5gqJ15otjzPBTOiC2k/6vL8jjOxX7Utetz6
         y3MV6O+3cxbK3nfsiSQmLX4ruGSJx53enQzRIY3qi9XABxNgkY7xW1aVwn8CbEiPBy2J
         DDTlFTxbRD6WuVGc6AYLty1x1asSeqp7JGhYzOkJQxGJFIpfLoJ/u3iDQLA/5iyqaJ51
         YZ000sR+xTKdobsYvax+NPw3Q9GsyxdvufG8OI2r6cJZBzrLSYzgrwaqZ7vyffyUMpY7
         KdcA==
X-Forwarded-Encrypted: i=1; AL+hErFv2vZiqEulK60mvBXOJGF3yh93DFE1b/vpmkVRo/dQXY2Fb8bpyifw7NMFYVEB+8FAetY6BO7DlV5EhVkoQ+tT@lists.infradead.org
X-Gm-Message-State: APuU4Z9+ULTZ6orYCuj5lMOMWmWw5xkE3fIKDkO9z7Y9eFzYTzu39cZj
	qFR2KdeaTzhUv2GnQl/yplqxKHCvXIubvBv/Hx/8cQhZSS+Wm8U6TWqx
X-Gm-Gg: AZFdTZd55rEOKhPdlQVucK3MkQrR9bI7WxYHWWTe0i76VEwYp5ImK5DcaTxqFyKxgSX
	K3jjjCTg89yjUHWYNAHbm8tLRt4SJEqda5QBTzMdlhFnkZyiGMCaEdgKvf4z/btC1Bc1L+64hgJ
	IVmIGci8YCGLGRjJ9YiCsCuzZ0cZ2nA582HlgZpMPPGxPZw/aat3jPndZNXnzrr3/js6LGjA8XB
	7gol5vahAk8pE7FOt7hHzqu09qB/zM4eTuuHpRqGeDfpDBT4XUNbHedAXYaKqknKNiKDRCG9Xb4
	F//8O4oR58S2yutFARR/wROoJYtFcaowCLakH5+LwU8kZnvbuKcIuylczmyv/GJi76xL7+CYjk5
	NIUUmRZy79J5Qz0npJsPM7kNbsKz9U9n010VPGvszvarabGYUkWb8qR8DjZwhLJe0EzqgxWD91U
	+JEajpLS/j2HiDvX7gGy3fd9bhoyu5hOnKKmarm87vWTJZ4bdyr539py3BIHUTr1AIYi5/+b0pc
	grhBYpN4erIJJt9WD23EuaPji+qG+IXhkXKO7koQ+qKYbLYpKb31WyvbZzqwvOQqsYiQjH2AlCo
	26ZQJEaJQn3ZaSPP2egpe0Ho83MHtmFmIm13F12qhefTDCgALPI4XDtpwaQPkEFeoaccqEtMrzC
	FZYz27kKbtREGiMGE2Tt1GorXSDf6Pz4RfyYRHgi8ZbGR
X-Received: by 2002:a05:7300:f496:b0:385:551d:854a with SMTP id 5a478bee46e88-38570845477mr1900177eec.28.1795167854304;
        Fri, 20 Nov 2026 01:44:14 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm3982974eec.13.2026.11.20.01.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:44:13 -0800 (PST)
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
Subject: [PATCH 0/3] ASoC: atmel: mchp-spdiftx: Improve probe and PM handling
Date: Fri, 20 Nov 2026 16:43:51 +0700
Message-ID: <20261120094354.6814-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_014415_522914_EA021D8E 
X-CRM114-Status: UNSURE (   6.75  )
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

This series improves probe error handling and simplifies runtime PM 
management in the mchp-spdiftx driver. It also moves IRQ registration 
after runtime PM setup.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (3):
  ASoC: atmel: mchp-spdiftx: Improve probe error handling
  ASoC: atmel: mchp-spdiftx: Use devm helpers for runtime PM
  ASoC: atmel: mchp-spdiftx: Move IRQ request after runtime PM setup

 sound/soc/atmel/mchp-spdiftx.c | 77 ++++++++++++++++------------------
 1 file changed, 37 insertions(+), 40 deletions(-)

-- 
2.43.0


