Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983AF606A89F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 20:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Swk2QZNp;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kVdrWS3t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=KG0frz1qgVuhICCz66saxxD6xAtI8Ts+CPzc9aA7q0w=; b=Swk2QZNpFcPd9zcCqh3070IFN2
	qUfXl98qnDwkt9fu9j8uOSEaUkLAZY7tG98qOqUQf3GOcEvNzSRsGl7+6O/lWQbcYSV7X0ZIKH/SC
	UsNTKQlRYRzis4i9dSGBse9QMiLqQd5HZSqHiTAj++CH8lZR17v+JjNNEYrYMgs//pldEMmIlceQS
	azdoJX0OqpqWk/bqpP5iHf2lDufjVEZmIS9vnttahoxRD3O1L4wdy4k91sdCp77S+O+1JvAV1omK9
	FzsqSK4MKXz++kAoHBjyD4RcZlXE43Rne2+y4gLx8x+6pIxd0IEyu79G3GZE0+pCP70qOSx4BU2QP
	3shGa4Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxzQ-0000000ER3a-3ckZ;
	Fri, 13 Nov 2026 20:35:16 +0000
Received: from mail-oo2-x02.google.com ([2607:f8b0:4864:31::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxzM-0000000ER1F-2boe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 20:35:15 +0000
Received: by mail-oo2-x02.google.com with SMTP id 46e09a7af769-8629f20d968so128350a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 12:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794602111; x=1795206911; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KG0frz1qgVuhICCz66saxxD6xAtI8Ts+CPzc9aA7q0w=;
        b=kVdrWS3toUCzfL/b3q4lE7BvDSYBiKxuYk/WqZANN9ZJ0gYtG9CYZdZNCSbCSi3SVN
         adzAoygS1mb/zyj4QFQBcVqsv2NFRt0vrT3v5ZdR/Tp7GbOdlOb4tyunJzgeGn5Ejzns
         bg8iWUdHZZtvKtQFGCSQLh/BnarQoRTLpONnsxSnq4HD0S4QrWniyXDrJfZaN1OurC9z
         g+FHxPcMFCmDHB0lWK3SpWFtDKvM8e5scZONIpF9KEB/7ga8wipeKuMhGPBzSjTeYjI1
         PEDJFqF0Pg8RVY6s9if4uc9jiPT4PFW69s53l+bUDT3HT6jjIGKnMG0VyKiSbfFkeD3p
         /1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602111; x=1795206911;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KG0frz1qgVuhICCz66saxxD6xAtI8Ts+CPzc9aA7q0w=;
        b=nCICivxJaqmiy2AL8xqWQkO4E2jCluAohw6JLujO3b2HJ63UmaIe+j0jiuSf5W+TSq
         E7aD1mnfA9vx+/ATQk+86hhsFDSfQpQQowNRw1c/epKRVxljQ/bjBCcbCTFmeIXUJrz/
         IUcMJLW1ctdRmHWqvqmThwMs+2Lxc1s6uMVeEf/4GS6JvqM4ib98cxXvFBYpgjPO5Jyk
         blAKjPprMWUNY/Q6YTa3PoIJ7AWLr0ZxtVQJMd81rAAZ67M57i5naZleL0a8+B6wUcYE
         YQn9frCsMfOs8//+FP4vTCg0qJ36x5EJzuyQHDyVt19PLZfBntB/S7HF1OpuMlL47zFl
         NatQ==
X-Forwarded-Encrypted: i=1; AL+hErGaDnvI6IyN2BWkyo1S34depaBpQODDW/Uq7HR8aDkeEQ+qVettP1tQ7TaeWJhyQ33xmI4aBxjdrUubu9BBYTd7@lists.infradead.org
X-Gm-Message-State: APuU4Z+IlLNVtSB3YQzMl2dERlUwbYngYNK+c451e9+MtVByqtH/Haoi
	+p/xL1vZ1Zpppi0YpIq0LP4RXPm/aHmIsbSEwQEhCKdbS7GHO8hk75yM
X-Gm-Gg: AYBFou38vUxtVsCbAAVsf/5ny5Fmxn8gFB8I/i1i7jRy0oLlyZrSvTfgxnBvJhrsuTf
	FrHtP8XlJU1qXqx1x5uPke87fEZyfOvf0LiZ4rn93GtsgmNPnSvinFfwu4GPZbqL0WsTFtxM+O6
	7e13L0VjFyk0krYSyg1D+CPT0rCNrqIQA96wjI94H4mS0ZSQDB7vD1XQ6mrQHHZSYKNONM7GAsk
	zOVc422Olzx0G3/kK2V5e6pHxAaSj/wP4NlhZiJjzG9rtt9MVm/G/O6arPsWlY1N8TNCuHaNjHC
	xBtopOMVNdn4iM3yQrGMclToArukqi6c22RflRzycfatzrN0iJQcOMytURzUQTC88CUww0SbBcj
	bXeJNWiRV33rst0ugulf9SXQdyRyzcN5OwT0nMWiX/ztiMh/vp2vfrjHWv+NDbP5PIHqJKtu9hl
	ppcWmNI7ObkdevCR2bRh01EwmBYLS5N7/rzvx5qRpxE1wt0Uw1iJGEgCvLBj3Q+zOXlF2lNH6hq
	LocFgx84sbH695UD3x+kASz357bjvgE8PKbD3p/+xtN3hHbfgCVuxiQFHyTWp17eZR3RBmc9n7B
	Pr52fz/tuv5xGmiHQvOyE4Tt9cByYYgJ8Vs1LPjmMjDXojqPsCpDaF7QZghnHXNir3hHXRgOnCL
	yQV8kRkiegKkyALOXTc8=
X-Received: by 2002:a05:6808:1527:b0:4a3:3108:866a with SMTP id 5614622812f47-56e637950e9mr3481169b6e.17.1794602111487;
        Fri, 13 Nov 2026 12:35:11 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm2712225b6e.13.2026.11.13.12.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:35:11 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH RESEND 0/2] clk: mediatek: Fix FHCTL DDS mask widths for
 mt8173, mt6795
Date: Fri, 13 Nov 2026 14:34:54 -0600
Message-Id: <20261113-mt8173-fix-dds-mask-width-v1-0-c8d1e3288df9@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/42OsQ6CMBRFf6V5M8+0RQGZHGR10NEwQFvgqQXTI
 mII/27AH3C9OTnnTuCNI+MhZRM4M5CnroWUiYCBaoq2NkgaUgaSy4jvhUTbJyIOsaIRtfZoC3/
 HN+m+wUiVsVBRZbZaQMDg6UxF4+q+wjm7ZKcj5L/dv8qbUf0iXsiGfN+5z3piECv/R28QyDHUX
 HG5lyrZqUNtC3psVGchn+f5Cwnp5IDcAAAA
X-Change-ID: 20260912-mt8173-fix-dds-mask-width-6cb71c6fe4d1
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794602109; l=1971;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=SOLu4jzxQrQXcZ93wAkCZjEM/VLMoV7Mr0LjnwhotLc=;
 b=fFa1XmGpk3uBIN1Zz6dT/QjiYTDVTbfEew2GPALp8trqTIHfGKnKk9edIoN7tUBqvwxjac2jk
 emNoj2NFPYmDGP15GLsBdV+AHx657qde8qsIrnkzqjM7JUqLtbxn51N
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_123512_984547_CD40E6A9 
X-CRM114-Status: GOOD (  15.54  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Discovered this while working on bringup for the Amazon Fire HD 10 (2017).

In f222a1baec5f ("clk: mediatek: mt6795: Add support for frequency hopping
through FHCTL"), and 45a5cbe05d1f ("clk: mediatek: mt8173: Add support
for frequency hopping through FHCTL"), the DDS masks were set to the same
GENMASK(21, 0) as mt8186, mt8192, and mt8195, despite not having the same
pcwbits (21 as opposed to 22). These two patches correct that.

Tested on an Amazon Fire HD 10 (2017), an mt8173 tablet, across 6 MMPLL
rate changes. All of them timed out prior to this patchset, and all of
them succeed with the patchset. mt8173 currently doesn't use FHCTL, but
this will correct it for the future in case it does get used.

I do not have an mt6795 to test with, but mt6795-sony-xperia-m5.dts is an
actual consumer of the FHCTL node, and switches it on for mainpll, mpll
and msdcpll. If someone has that device to test the second patch, that
would be appreciated. I do believe this is the correct fix though
regardless.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
RESEND: no changes since v1 [1], rebased onto v7.4-rc2, with Angelo's
Reviewed-by collected. Jerome noted these go through Angelo's MediaTek clk
pull request for 7.5. The Assisted-by: LLM trailer is dropped for the new
contributing guidelines.

The patches were still developed with the help of an LLM.

[1] https://lore.kernel.org/all/20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com/

---
Ryan Brue (2):
      clk: mediatek: mt8173: fix the FHCTL DDS mask width
      clk: mediatek: mt6795: fix the FHCTL DDS mask width

 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 2 +-
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20260912-mt8173-fix-dds-mask-width-6cb71c6fe4d1

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


