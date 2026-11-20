Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC6260A260B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LRlIt7yj;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ku9XzoRE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zZhz1yQnT71k8uzCjSn9kv5P76pbsHicTRHAiqa3oWA=; b=LRlIt7yjVmRC/D
	frhJRmsKoM9Bz33B0N5M67pRp7Cvt6xL5C5O9PE3ML2pgsxD+IFafMaVEaf7ESCzwDSVfSycZa2/7
	LCsS2cv17ZrptO0J6UbNwIpaO0TCX3+qeoHWYbpww5Gk49MBYw3iWn0wHzVcx6OgVkLjIfmjDHaEZ
	SEFRylnNGhvcyze2JxiSkYdD1AfEaJQMM2skx/S4BUG8USHDKB0kq3iSm7yaZ5c5DcWEirPMFnnHX
	2/ihKeiExswx2uw1s8u08/YnQoD3CS+3yN8B+8aQH9wYQsoL/lTmrfga7tnVH0M9Rn6B6b1XfshCS
	/xrVcNmpBhOGNWN44QNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULTx-0000000EYpz-43Ue;
	Fri, 20 Nov 2026 10:04:37 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULTs-0000000EYo2-2JzE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:04:33 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2f0481b35c9so2240595ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 02:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795169071; x=1795773871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZhz1yQnT71k8uzCjSn9kv5P76pbsHicTRHAiqa3oWA=;
        b=ku9XzoREGeLzUREOZXSYxNBuwCIs0p9V1jA4//6wLFxqQ3GfLcCuW1a+kSoli4Ggi8
         50ekvyynXXRlKHRbusp47cl5GVoX/Ptb+N/4Pavgvq1qjRkT14Iqd4H5O93JdHqu9zZu
         M2VJkqM09sv4byHF7s/iI4uXrjOBFleA6v1BRMNDjfYZiq/KJLoYXP5AKxC5Nk+LOltI
         Tjgxiwy5HvpRGaRCiYapUALTYV+Fr9wQfM1y7XW7/2jIasX4gSerVYEHGLNvfEehNLXB
         t96z80B8se7oChbvcJgL4qxTcVq9xgoF/uu61GN7csER+eqtzxR5Kxy5ML5nng+U7mRq
         x+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169071; x=1795773871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zZhz1yQnT71k8uzCjSn9kv5P76pbsHicTRHAiqa3oWA=;
        b=sVxrC/TNe6myYQfICDkzcdU1OftFK6YIhWZ/7jdS3AdNax0bdiuryCCVEMZtiYmlW/
         v+cGcmB63rfONIRKFPy2o7wD3Xht2ep+Xsm2o8SDd+NeTEAUTZtrI8wiGMn7gU1uId7/
         BXI9967gHSKP/mJOA2KOr2hphDiCdeKk9xes55IYkCXq0kV89LJOMxHOeoJLVzmW+Cyv
         VAB/+oB8bxuCNsfuIUzc753I0VFMtLG4UMHhevRIo/J8RSxqNrLiuy7dfssWfa+6q3w6
         +9pOhyn5Is2gqCGnCSemgmPx8ADgxwdlFYyf8fAZ7Y9Ha0NZm6T+5fOvpsKzGQDuwhkf
         z7BA==
X-Forwarded-Encrypted: i=1; AL+hErGE0AJo3guVPyslRc1J0HJA3zjNFrGwgJhcLI+7amQSZrGnF26GzsPdywkLyOG9Nf+9BWj/+sjIvJzg5iV5uJDE@lists.infradead.org
X-Gm-Message-State: APuU4Z+D5NUrNix/1m/ejp/866d4gL9mx1x8ny/79ENqolqAeNAUg+kZ
	cjjYwXQXjJ/9/p1Pan39PufYUvAhlVwLRcBRpiOtUWC/wKM5vGXCzqKN
X-Gm-Gg: AZFdTZeRjFhtIyHzkEanowKN64L4zGawX1gTKyGrtMuWgd0+2EyLFq5qbAbsjFKheI2
	zqHW56iBxFowBwGGmibguET3HsNcWGeFc+1QnoKPy7ncSShl8vHMh8+DqyqtNKzqZwPmaV3hPNE
	gKwgNPI3ukvSI/3BgsaUe89K57wRlABXeOBhfPtcVmcYiQe6fgAJ39prKDCAXmkPucJ5vLt7Smp
	f7YT9MttaS5UXskvizkF42dRXUYpLJwBtt/axt0FQF6Q7F2eJwk27XuFSUpYi7Bhh5qkRNHM9yc
	x3uOzEFpWhqDUQ7PEpeDm1/NdyEjnFpvzQ4bOOdiLEeMZTgXs0uUuH0TI6FxoKn57qY8bixW3q1
	t36q/aWDs6kPd1Ps4EvVMkG3VdYuCcR9h4KlH03HUMfFjGOX1A2LO2peD4oV1aekOEuivG6Mgmn
	LgjBOzRWdoe4ExhHI5hsEB4y+6etpS1W8qc3VHHUgSCFM3bPo7D8ORkYUsDzQslexsb7GM/XP4r
	9o2RzfaDgj2MjgrQ5RSgGQTOlg8aYGcI55nQ8h1IjEfngAvDfAaU8TIanXNafm8b0jpYhh9wTvr
	SnY1oAiSXaHA8b+ZgRm9RDxihdKZcA9UywNSSgeUQbqBXBOQUoxQhTJK+2A8O0Ntqk1HvF8J/dv
	KtNZH7xQb8GKn0CvRJazoRrQChigxVlEhLu1plT2QrM7G
X-Received: by 2002:a17:903:2391:b0:2dd:c0ff:e72c with SMTP id d9443c01a7336-2f03f263555mr26063905ad.62.1795169071541;
        Fri, 20 Nov 2026 02:04:31 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a69sm11797365ad.18.2026.11.20.02.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:04:31 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: atmel: mchp-pdmc: Mark IMR as volatile
Date: Fri, 20 Nov 2026 17:04:07 +0700
Message-ID: <20261120100408.8053-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120100408.8053-1-phucduc.bui@gmail.com>
References: <20261120100408.8053-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_020432_605053_C283D35C 
X-CRM114-Status: UNSURE (   9.86  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: bui duc phuc <phucduc.bui@gmail.com>

The interrupt handler reads ISR and IMR to determine which interrupts
are pending. While ISR is marked as volatile, IMR is not, causing
regmap to return its cached value instead of reading the hardware.

Add IMR to the volatile registers.

Fixes: c5682e2ba132 ("ASoC: mchp-pdmc: fix poc noise at capture startup")
Fixes: 50291652af52 ("ASoC: atmel: mchp-pdmc: add PDMC driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-pdmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index 8b55d864f3d5..4b380dc8b6cf 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -842,6 +842,7 @@ static bool mchp_pdmc_volatile_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
 	case MCHP_PDMC_ISR:
+	case MCHP_PDMC_IMR:
 	case MCHP_PDMC_RHR:
 		return true;
 	default:
-- 
2.43.0


