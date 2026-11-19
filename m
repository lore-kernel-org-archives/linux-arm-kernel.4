Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECAB60A2628
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 01:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g9flv+1o;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tgl1PLj5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nDoAWY11ZCr0ihHoFalCpChIz8Et8oFGy4RrYPRx3SQ=; b=g9flv+1oNm/wZP4/ej7WZy4CYl
	vQR+15kIjIH/yzQHurnuETdQE1G6Pytw3ulbnuzEVOE9GeC9V7AF9mo2Vc1yd9nypGb4oJalJt+rv
	lHUQSGOUVchVoELbNw6lfWdEbIIQ4s5Ij189QsGOKtrFq57ZkJJ7sIR28FZYsugtYqd8t9yE/mYTT
	XNc3ccS/gLaBNw5yNWaCwTtkQw3BToJARedkq7vAlqLlLyb+GOYUZydHkq0EM7OduyFpcIdLGVkAS
	L0AWNyEJDg2cImArqG3kRyqLSMcNEOOouSdg/3SztSmtZ+WzUMWhZkdgz3w7r5bn6oJJnNFJ0rtak
	PuD7ikMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTrMa-0000000Aeqh-0BXU;
	Thu, 19 Nov 2026 01:55:00 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTrMX-0000000AeqK-2Dxw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 01:54:58 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ed08b07213so8191775ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 17:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795053296; x=1795658096; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nDoAWY11ZCr0ihHoFalCpChIz8Et8oFGy4RrYPRx3SQ=;
        b=Tgl1PLj5OdToPU18HMzdVoPV5QSLQ+PCIV1mm2Dnzj5q6HCRM9xX8OLIApm9NXEIgU
         Oa0yf3N92tGmxLHaKXdjM8yH3v797cuZMNeXrELP3nEWrKN+mdwso7x7q+ZjeGca8t8n
         IFYoBXbpPbC/TftWeM4IU1ZGnKbpHPy15gSK8iEZ17pubgSx4ltdlavrN+cm0Gcup6ec
         JeL56BLGk0aaH6J06TrujcWPu5ESD/ZQfgyuq2cietC4NTM2NAhBnV6sK+WWQE1aWm1Y
         m+LImuVKtQfd6qijfxPss+iYl4cHILVrF43xRcyHVTHr1FYbpnC3EUyPZRKGMsR0ap5P
         f3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795053296; x=1795658096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nDoAWY11ZCr0ihHoFalCpChIz8Et8oFGy4RrYPRx3SQ=;
        b=zbw4v2KSI6p67diFxM09Z6W9GNe5lOHFrtahdauyBfAKPsJs3QxKuGurcG9DjIiCgi
         gbUjSIiKmB2rwsZGNOliYGeXMyWZlMGk8k1uHy6bYhFMNkSsICDLivmyYZhp0n/4RygL
         MP+9WoQ+pC7cJpVV6+0+psDhJarMs2FpZNFvllnX95ySmllUzVNgVfFP9xfflU6Pkprb
         BJcV8eTuJ86CBhkxj4ASTV9m+8RRqi9lPvbI04TJWZVHnXIF3gxHIxbUwhlXcSR/gFpK
         ubmQO2bXrrbsr+Gw0EfuOwbbTs5kfthatrVEPWzJxuaVVWMJly0gJGhCP6/iTxMh/SX9
         15gg==
X-Forwarded-Encrypted: i=1; AL+hErEmZKr9lqMnfwxn65gH3Wcar4muEbtbihn8w9VWWQLvkfBTBsqackhOMLyTqppMtluqJGGIKVYiM9tFk+dbc3Sq@lists.infradead.org
X-Gm-Message-State: APuU4Z9waL07yD5qZNmuoxWctPph636ylNN1L1XYnub8unUo+ak2fRMx
	OH0gLGpDLrX1jJRH57Tro44OfFoeqLKZ2+03dM+LHIqVnUAmojfwfxpK
X-Gm-Gg: AZFdTZfvo09lwECkq5V09M6QLtku1/SDN5NnRlq4lqAxT5gPymGKvW5AG/0eVE8SxvO
	BHHMhqXQwj25SJf7/T5y2uPxYIH/QC/QGRa8bRUzbEIl3fxfC4R2lzeZREhvZmobVApo9etZFjb
	Jxu7/g06N7pH+Bo0JPm1+F23ke/hdVTeambnwE+IYy1iCa5dLOuIYkHA5XTQDnYsju3tGAcholc
	F5rOZTvU4qAx/afc2h5/gecDtbALmF6JkjTS2u+ff6W8wmvcgN5T8OIAuUcKp0G95N8k4YIKNIt
	GrlIbNqS/2MDGqS8Woe7jl2vflkIOFcvqjObbJDGr7rjP3dXsp2RbvOUGEzs7HeIn23ObTCXcvU
	iJ82GvEjHLve85H8tc1fhxJOnYT5uAHshbAkPgw/fWzaAutVT6/9cBv05oorMCbpUlfv9K1avwX
	xkMcXrvIaOwMhu0BbPfdvnBzQarZoRp4SmOUbUVRtlArVHuSOXPTah6Kyz3HtVOFnFY8rL9+Zrv
	Ym2FoQO9yzKDNm1ZgZPAGVFHpHbXAsdk+AG5quw/mwHEiVesJn4YL/MVcH9Bx3lpRxTfUZEopVC
	490t+qMc72uMpDlrKG+P4ftAlURWojbaaLDh5PN6vd8DEEvQWjsA4Zte9g5cd9I6bDYf3PvtC++
	YnpSgcUbl3y03kDUr65JxUSYZIdhzKt4asIpQ
X-Received: by 2002:a17:90b:2ec7:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3b3d07a85e6mr4560280a91.29.1795053296137;
        Wed, 18 Nov 2026 17:54:56 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fe03c3d4sm773081a91.14.2026.11.18.17.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 17:54:55 -0800 (PST)
From: Shan-Chun Hung <shanchun1218@gmail.com>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Shan-Chun Hung <shanchun1218@gmail.com>
Subject: [PATCH v3 0/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
Date: Thu, 19 Nov 2026 09:54:45 +0800
Message-Id: <20261119015447.160470-1-shanchun1218@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_175457_576102_474F785E 
X-CRM114-Status: GOOD (  13.76  )
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

This series adds the PDMA controller driver and DT binding for the
Nuvoton MA35D1 SoC.

The driver supports memory-to-memory, slave scatter-gather and cyclic
transfers.

Tested on the MA35D1 SOM board with Linux v7.4-rc3:
 - memory-to-memory with dmatest (2000 iterations of 1MB buffers, no failures)
 - slave scatter-gather with a local (not yet submitted) QSPI patch
 - cyclic slave with a local (not yet submitted) I2S patch

Changes in v3:
 - Use dma_alloc_coherent() for the hardware SG table instead of
   kzalloc() + dma_map_single(); defer descriptor free in terminate_all().
 - Rename ma35d1_desc_submit() to ma35d1_desc_prep_done(); prep() only
   prepares the descriptor.
 - Rewrite the IRQ handler: read and ack TDSTS/ABTSTS once, then iterate
   the set bits.
 - Address issue identified by Sashiko AI review:
   - Terminate the descriptor with vchan_terminate_vdesc() when a cyclic
     transfer is aborted, avoiding a use-after-free in vchan_complete().
 - Request the IRQ after the DMA device is registered.
 - Use devm_of_dma_controller_register() and
   dmaenginem_async_device_register(), and drop remove(); a devm action
   stops the hardware and kills the tasklets.

Changes in v2:
 - Address issues identified by Sashiko AI review:
   - Program registers on descriptor start instead of prep.
   - Fix interrupt completion handling and return IRQ_NONE when idle.
   - Set PDMA_TBINTDIS on intermediate memcpy chunks.
   - Validate scatter-gather lengths and bus width alignment.
   - Fix channel request assignment in of_xlate().
   - Safe controller teardown order in remove().
   - Drop peripheral timeout support to simplify driver.
 - binding: describe the hardware in the description, and drop
   dma-channels and the dt-bindings header.
 - Use a fixed number of 10 channels and trim the includes.

Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>

Shan-Chun Hung (2):
  dt-bindings: dma: nuvoton,ma35d1-pdma: Document MA35D1 PDMA controller
  dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver

 .../bindings/dma/nuvoton,ma35d1-pdma.yaml     |  71 ++
 drivers/dma/Kconfig                           |  12 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/ma35d1-pdma.c                     | 662 ++++++++++++++++++
 4 files changed, 746 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
 create mode 100644 drivers/dma/ma35d1-pdma.c

-- 
2.25.1


