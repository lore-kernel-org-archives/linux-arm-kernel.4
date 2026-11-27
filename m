Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00E4606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lGjX2gFd;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mc00L7D3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sIlYxHLSdQtSPp876GteXWV9v1qfiA7qZg4ralsrU7I=; b=lGjX2gFd1HbIt+
	HNham5w0YrzekFYIDEc9VYXjB8tf3bHlnTzm9GcpBaV7CasczWVlq+u5guDNCM5umi1QNO2IjjOnH
	pfwKIxRlsANZi6vFkUHMMD6PnpB7dkIS28YTAqO0j9LTaHjHUg/JkgaOAaoQXUlLq3JzHNP3MwcRA
	wC8F5/n/+78V6J7eqXzaHV8SGHFjPN/fngxI+3yiw83bm8PfQhQ0fk+N3RgyheNUmHJhqGcgAfQqB
	EbQ1RdwP8mQ6faUh3zI1JNO667N1yUN7c6kx9WIfTRzL3v+wORBVaiNrcXAjxqHdh1tS60p+xq7NW
	uIRlTrsEPGTAPTafiI+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsC3-0000000FQOo-3K64;
	Fri, 27 Nov 2026 09:24:35 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsBo-0000000FQFt-2DBU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 09:24:21 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso6886897a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 01:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771460; x=1796376260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sIlYxHLSdQtSPp876GteXWV9v1qfiA7qZg4ralsrU7I=;
        b=Mc00L7D3aBS7usdabxuxuxACsGVlt1ztpkoORFHIdz9OQME4rM39E4Ehb4plyKo45u
         I6C2+eHXGwLgtp6Usycvi+k9MNHYhRAd+5/8YflZH9nOTPP9W7ay0Tsvtts8tYgh9S0H
         gjXfJZqmSDgvzdgWyvXESxaPjXdrppxSDiUenFqki7DYDhL9pyf3IjODq+EjCbx8Ehd7
         BsWU/8CBFcy7/L6AOLn0tKbBQB8XHEorv3f4UMtRSU25SLlQsUZsniHoIVuE7UyX27TR
         avxxfPSKU2gpiG8gVH1GgPCESlIQqXE5meMBF4eUNkZRRAdTpBeNddicMNYevnNH5Fln
         4ziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771460; x=1796376260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sIlYxHLSdQtSPp876GteXWV9v1qfiA7qZg4ralsrU7I=;
        b=G30ydDYlEG8GkHeZ0Ge9hBVbr5cKkIMe5eushvf2J/tteio6J3rlcgU/44ywNX9DYQ
         DYidA6gPExLLQ6zuu3IZ/CZDShgw0fJPASj3+aEd1pmGJPiBnaQeN4+IAI/K+2i1077k
         tJV3pMeuuarjWdcKpIsW5Fil/FxCjVAzbTIQeqfpyyHsDGyvMlQvR2tMHMoaNcRG1EVk
         ni2xNkttlfNac/5d+Wm3mN5sTRWILJnEqE8/eePppPv5se1vq1e6MMKW0TLRZIdzDqXa
         MFwZi+sFltrSQW3EoRJgeJuqey8SZRK+8bQ4qKUKuakrM2HnuEWpFFPPo8pbZd/kJaKt
         AsGw==
X-Forwarded-Encrypted: i=1; AL+hErGCw9P6/CV9zx5JjwrVEu4GMuFlRW8Q7Dfzsx+I2EmqKRCg2tz/wfe/ksd1JUIAw0eZTfTXAvC7vlCLyCH0TQyK@lists.infradead.org
X-Gm-Message-State: APuU4Z/fmywlHTwYtY2xu+tk7KTZdFGL+rDTXPSgBVtTRFmEyHwajQF3
	TZKuA9TxbEwDBBPQ1OOX7gR+yCCHhdW74KermurU8UVLKek7IPlvnzvC
X-Gm-Gg: AZFdTZcHi70UeXUlIefQATr9c7NZ2a7DyIL5ayGjzgR6dIp6wQx/8YnKrbgaFTAvlh1
	iDVfMt4pIIO0HQW8suLAUKxEOsS7pYkG7c+/b4QMkzTkEDWJhMkHWBvYy0lfmb67EPflJBmHT83
	gnqQunyykoUrAQuNezjd5N+z6u2wgnNUsHS5kS3GsbRrIKVVrDrCEX6uVFjXm+lfDg1kw3mpuis
	la+ii4J8cn5AGJr/Y/lbCDCQ9cJhnBye+y1QSeMLKk0AGmGfQkxj28jmV1QwVebKITR0iXJpnew
	mJzXZX1a7aPou78KFOkvqFy/dn4jt6jXE3QlwYXXoWYmBiHWy7j+6i4mjapFnIFM//Bip1e4TdD
	YuPs7UdeFgBCKWP/gR6sSH8677c4lM9ceLWK4/ywLUl1kpNUFZDlADE5oDtZNJaM9gikcDABQ8T
	6jacIR7DV34ZNZgwvhVGjh+K72rGSdllJMXa2zmyX1N9l+9dHZDepe2LQ9KJyXA8dmhIobvGkyC
	oZfvRjK37UZIF+R9rbkjY9iIm7P+jnSMV5hJlmfoxZ09Nqar96Q95rUq7kPTuEJGNHNph4zXQvq
	zoxoEpixjZ8m2FVM1h9OY1MnNzq8OKUJYeeMmGVBRcFCa+lEc7+3r98aY0g5Jqz2b6hGOJ71MPC
	AR7jYBJ5vsyTsiMv5BEfEG5eV6Gud8p5Pp3mTkCiOdhPG
X-Received: by 2002:a17:90b:57c6:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b41c9617ffmr16825117a91.37.1795771459702;
        Fri, 27 Nov 2026 01:24:19 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm37942052a91.6.2026.11.27.01.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:24:19 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: stm32: spdifrx: Enable clock before setting substream
Date: Fri, 27 Nov 2026 16:23:45 +0700
Message-ID: <20261127092345.12383-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127092345.12383-1-phucduc.bui@gmail.com>
References: <20261127092345.12383-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_012420_583065_3BC74DBC 
X-CRM114-Status: GOOD (  11.33  )
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

Enable the clock before assigning the substream to avoid leaving
a stale substream pointer if clock enabling fails.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_spdifrx.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index ba6c715750aa..1d62a6fdc472 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -753,14 +753,16 @@ static int stm32_spdifrx_startup(struct snd_pcm_substream *substream,
 	struct stm32_spdifrx_data *spdifrx = snd_soc_dai_get_drvdata(cpu_dai);
 	int ret;
 
+	ret = clk_prepare_enable(spdifrx->kclk);
+	if (ret) {
+		dev_err(&spdifrx->pdev->dev, "Enable kclk failed: %d\n", ret);
+		return ret;
+	}
+
 	scoped_guard(spinlock_irqsave, &spdifrx->irq_lock)
 		spdifrx->substream = substream;
 
-	ret = clk_prepare_enable(spdifrx->kclk);
-	if (ret)
-		dev_err(&spdifrx->pdev->dev, "Enable kclk failed: %d\n", ret);
-
-	return ret;
+	return 0;
 }
 
 static int stm32_spdifrx_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0


