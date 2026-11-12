Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E1F606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 02:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RpvgepRL;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CvzV5BoC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZBRlQut3mwF1KjSJZBxJE4prR1XigP7CCRTm+ueBhko=; b=RpvgepRLCiuYFjscjmhfSjvRCA
	a2wCU3QLPXuNc0ne+AVkzwqcLXq7moq7VDNjP1QyO2mk1wu3vmpLquGTp4wmemERkCUFiAXqM1UJI
	pCfjCpVmYY4dJT3IRtoen1wW4CBshw1eg5njEhRLIJQD6QHfA2jmcBS3BPv0wjUeGZCVgD3SMRVSw
	tJ4YUjXwxnyWVG/NP6XvK7N8GOeeVB+26zK4kZGOG1qq+YxDAZLAgA4k/gajujbgN0gqcEsIgk4rR
	t4QqiMxlO/GaM57PwlAhpGpulNCgmdkUZrWiV6DxMsnV0/NxHPaZPq3ui8BPwWRNFjSgPKaGEpfg+
	D6X94WBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKZl-00000008WLP-2Pg2;
	Thu, 12 Nov 2026 02:30:09 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKZg-00000008WKt-1zq0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 02:30:05 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8a39e5161c1so2771361b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 18:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794450603; x=1795055403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZBRlQut3mwF1KjSJZBxJE4prR1XigP7CCRTm+ueBhko=;
        b=CvzV5BoCwSA4Drefb3SLQ5xEwpRYYq5Ut/kVLjEr4Ao9XMwetPiyi68Q5CsMXMVELr
         VsQq7L9kXkn9URgmE/BkxMD0xj1mFpkIvwc6T2LWxB4/eZbkcFlI8V7X+31w1ojoGsc7
         FZLyKLOvcKwq3K3cUHL6DNR2hWhA5XLa0CJTTOQV/0zjisdkUMVSskwgCOMSxGQ+J+4y
         BnkFkskFZeaMR4JxugsVrwrVClbLniA9EabaXcx9oNTkD4bScKTiN25Py3uUIHXSTNi+
         uk9K92V2fjkAEGzdJddV0Oabp8CCBs8C20n2VAvkNzbYMlOnfZtp58mBnJiBlU9TV/eX
         6Vhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794450603; x=1795055403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZBRlQut3mwF1KjSJZBxJE4prR1XigP7CCRTm+ueBhko=;
        b=VqdfcGC5ERYItVLztgRq0vK8xAoMxol5EHcwU8hyhJiRdKFWvRaN8cAd/6qxqvasaa
         MMSRTZsk39vyd3RNJVl/aUK0hShmbgzPmiDWx5VArdaHkrwfN1k0jf4s0ri5CID+4v+4
         Cwzy1fD2mjV7KQi31G4I/HQU12rh+/pnwvpi1/Y4mi23AoJvVGJCOShtRoTmEKvGC1oZ
         gH1ntqrdI0GfDAcolls8P8ILlQEsVR4dc3igdw1mYObwhpDpqznUf+rV66MaoacEOmZW
         yzftOOGVrezQdDO/GhN0BzHgg0zFF5dnOUm9c1FQ4GlUWWCs6zaUE4ookAg1nWLNWTHy
         chqA==
X-Forwarded-Encrypted: i=1; AL+hErFO2lo7cqvloS6Kd9IQ4HFfSJ63ObeU07oIUQ43xj+tm1VwXmiKuYKhitG/xn2KmgUhAbL0evUBZBTgttuI62K/@lists.infradead.org
X-Gm-Message-State: APuU4Z8BPLHTEIL4Ufzd3jpNgMVptms1LzBpfJVITEPFMnCeVvQFjtfl
	CEA+UwHJu0VQuYj11g8hzCgY6+OFijO9lj5j5VJ54xo+n4fkiwtbj/gn
X-Gm-Gg: AYBFou132OuA9oto0gi8cc79GhNMrB6sqvJv7j+7bd0qnubhbimMz2G2Ur2JXLKB58u
	4WqRFliOS53bH5VXGX34yozerPiM0MmIBk1+eKVsV60se+GchNrBXxZJHAZRKGe2Y7yjD3VQzrV
	CKQaay++6vqu8v7cUHvwtkuqm9WKvqgPw0Zfn5uaQtS3+VUvgKwFKriQSxDqjvqgs2bfVxyCp1R
	D2K5aIp4RYLD2YNwZBaAjucPvXgWv7bFRGJBS+MKBqukqJ9NBRQWKH80qAkbSAzmkIjfVqY9UI1
	qp3lNiHLmfto0Jfx9wBVgw7VZ5g735qOdoUrtap6O67pylvEob69ajEETTcAJWsB81I16YQvvyq
	Btj/HOO98JmbKzMaMPTGnQpz9M2uo7hTE22YyuByXjTvQI7LlEOMTqrdvBeGqyqEusuYCXxyMdO
	MXDpgbfwcfiPAkHFam1ZerULel1gdndH06+/LpD3vpdQOzBNhsai3hJBe9Z8+NWNi8m8w3vgS7H
	bsv4WVQU0BrhNue+yms7JRhLZzVaBevXo4kRc5uJSwzZyxYVzi3Vlu2ur6QfCwAT+PnK9nTQ8Ow
	Ra9A44N0bhn76x/Tml6gUG1a/STKo7Fv+XfSleJhJY7jfMpZ
X-Received: by 2002:a05:6a00:3693:b0:8b5:7fc8:8679 with SMTP id d2e1a72fcca58-8bc1cd5fb7fmr4228562b3a.21.1794450603001;
        Wed, 11 Nov 2026 18:30:03 -0800 (PST)
Received: from ubuntu24.vpn.host.chaitin.net ([124.77.124.144])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1226e6sm2618017b3a.43.2026.11.11.18.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 18:30:02 -0800 (PST)
From: Yuansheng Yang <0xbeac@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH RESEND] mmc: tmio: disable dma_issue work before releasing DMA
Date: Thu, 12 Nov 2026 10:29:54 +0800
Message-ID: <20261112022954.7473-1-0xbeac@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_183004_524805_B84DC10B 
X-CRM114-Status: GOOD (  15.86  )
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

tmio_mmc_host_remove() drains done and delayed_reset_work, but leaves
dma_issue pending or running when it releases the DMA resources. Its
backend callback accesses the host, controller registers and DMA state.

Disable dma_issue synchronously before releasing DMA. This also rejects
late queue attempts from an interrupt handler that is still running;
cancel_work_sync() alone does not provide that guarantee.

Some DMA backends fall back to PIO before initializing dma_issue. Move
their work initialization ahead of the fallible setup so the work is
always initialized when a DMA backend is present. Skip the disable call
when no DMA backend is configured.

The analysis, patch and validation were assisted by OpenAI Codex.

Fixes: 85683fb39d9b ("mmc: sdhi: Convert from tasklet to BH workqueue")
Cc: stable@vger.kernel.org
Signed-off-by: Yuansheng Yang <0xbeac@gmail.com>
---
Resending with the real name in From/Signed-off-by only; no code changes.

Testing: x86_64 COMPILE_TEST object builds with gcc 13.3 and W=1 for
tmio_mmc_core, renesas_sdhi_core, both Renesas DMA backends and
uniphier-sd. A userspace model of the extracted remove function checks
the no-DMA case and modeled late queue attempts before DMA release.
It does not simulate real IRQ/DMA concurrency or backend hardware.

No matching hardware, kernel crash trace or demonstrated unprivileged
trigger is available. Please review DMA-to-PIO fallback, probe failure
and teardown on Renesas and UniPhier. The initialization changes cover
backends that can return before setting up DMA. Other work items and
the wider IRQ teardown remain outside this patch.

 drivers/mmc/host/renesas_sdhi_sys_dmac.c | 4 ++--
 drivers/mmc/host/tmio_mmc_core.c         | 2 ++
 drivers/mmc/host/uniphier-sd.c           | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index 426308b73b..45e34d57ab 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -340,6 +340,8 @@ static void renesas_sdhi_sys_dmac_request_dma(struct tmio_mmc_host *host,
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
 
+	INIT_WORK(&host->dma_issue, renesas_sdhi_sys_dmac_issue_work_fn);
+
 	/* We can only either use DMA for both Tx and Rx or not use it at all */
 	if (!host->pdev->dev.of_node &&
 	    (!pdata->chan_priv_tx || !pdata->chan_priv_rx))
@@ -402,8 +404,6 @@ static void renesas_sdhi_sys_dmac_request_dma(struct tmio_mmc_host *host,
 			goto ebouncebuf;
 
 		init_completion(&priv->dma_priv.dma_dataend);
-		INIT_WORK(&host->dma_issue,
-			  renesas_sdhi_sys_dmac_issue_work_fn);
 	}
 
 	renesas_sdhi_sys_dmac_enable_dma(host, true);
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 775e0d9353..d0d3dd05a0 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1272,6 +1272,8 @@ void tmio_mmc_host_remove(struct tmio_mmc_host *host)
 	dev_pm_qos_hide_latency_limit(&pdev->dev);
 
 	mmc_remove_host(mmc);
+	if (host->dma_ops)
+		disable_work_sync(&host->dma_issue);
 	cancel_work_sync(&host->done);
 	cancel_delayed_work_sync(&host->delayed_reset_work);
 	tmio_mmc_release_dma(host);
diff --git a/drivers/mmc/host/uniphier-sd.c b/drivers/mmc/host/uniphier-sd.c
index 1eae2f4b6c..cd0fdffa30 100644
--- a/drivers/mmc/host/uniphier-sd.c
+++ b/drivers/mmc/host/uniphier-sd.c
@@ -187,6 +187,8 @@ static void uniphier_sd_external_dma_request(struct tmio_mmc_host *host,
 	struct uniphier_sd_priv *priv = uniphier_sd_priv(host);
 	struct dma_chan *chan;
 
+	INIT_WORK(&host->dma_issue, uniphier_sd_external_dma_issue);
+
 	chan = dma_request_chan(mmc_dev(host->mmc), "rx-tx");
 	if (IS_ERR(chan)) {
 		dev_warn(mmc_dev(host->mmc),
@@ -198,8 +200,6 @@ static void uniphier_sd_external_dma_request(struct tmio_mmc_host *host,
 	priv->chan = chan;
 	host->chan_rx = chan;
 	host->chan_tx = chan;
-
-	INIT_WORK(&host->dma_issue, uniphier_sd_external_dma_issue);
 }
 
 static void uniphier_sd_external_dma_release(struct tmio_mmc_host *host)

base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
-- 
2.43.0


