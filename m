Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8203A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 15:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v6EfR8dK;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ldxU1sPQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZGa4bNi0q15yRe5T7kbprOuROWeQOYZpNWhT2mvzHGg=; b=v6EfR8dKRhPCRt
	i8gmTB5lvsyrKV2oG+0qcQJuzTwRiJuWhPmWJMDOWsQWwUxbMaNjHJYJg9YFsMLIv1VUGFrFnhIB7
	dlUTsbZLuyObBhZQKthaieQAq9fxm2L4BADV7yvKDgH1C8eLPUQTi1vZv2aQu7ae4GdWVZ9nxIysW
	uja+cMov2LNv0EUScP1+3LJ6izfSAwHdVVF6f0OdOlFgZDWELQj4yleVIWC5Uoi+DsiyECgavwpkm
	EIPecTgGr2BWtFZsaMsdZpEWEzrcaApOnuVhb6X87/ERFYESskoEr+RGqKCDxqiNjkU3pdh7w3fIW
	SBapVcfjNZJntRrfNsQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9uc-00000001Im7-1EeW;
	Sun, 22 Nov 2026 15:55:30 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9uV-00000001IiZ-0Bht
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 15:55:24 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4a9be758734so1450012f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 07:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795362921; x=1795967721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZGa4bNi0q15yRe5T7kbprOuROWeQOYZpNWhT2mvzHGg=;
        b=ldxU1sPQjbcsrvaftAy9v7+jl8zHkGis7qvh6l8inESKs1aFuxFk9bFhmFs+K3jVrD
         h8+QpuHZDLWKeggvkoc2FEnYffwINceGpuvOs3K+PozobOwddjYCu8r000Lfvo/aPgHT
         QXHsxzoGCHbG+mu+X+oF2GELTFq77czhkKd5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362921; x=1795967721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZGa4bNi0q15yRe5T7kbprOuROWeQOYZpNWhT2mvzHGg=;
        b=Ko2qGShxuHkYEW2n0H6Rx3FhUBR4flMcKvuG9SVgbKchZUTpDFqH+hHti0NNvZelKy
         y6XEkUoZHwKlYow7P/+fYiWpAJ2qsY2kUggY+3NnQNcGSfDZoK5dURCgzYbUGeX2YtVi
         DJe1zEQSdJC5UaxJl1mVzeq5dIJ3FNzi54l6vO5wyIwsBR5YwAE1EwwhaUV4dhZq0Y3Z
         Ab9bKOP8f1Hcuwt9kehIKHvduNDagVr+aWBBSam6js/d4GAHSSu5UGmO7hnzeKulPA0d
         dTGEiVW52OP5D3gI0XM1LV5bqSsGweyewLto+o+braUlwnCbFeWHgqgfJs5pwISpsoYr
         bXHA==
X-Forwarded-Encrypted: i=1; AL+hErHzx2/XWWyiJGVjELnPGTapjsvWqpTxdmG4OztSHTScSQ+DlqyQBuqUof2IwC6K92vDCN005tKmT+b+duw6659Q@lists.infradead.org
X-Gm-Message-State: APuU4Z/5zQGVNcYoJDX2spo1NQNwyK/+NEA3uiQ9fpso1E8PfJuNhKWE
	CUygz9c8Q1ehshbHkuTrLCGBtOfKXE62wspdsQW765qy7yyiG+bhrBFr+9DT5mmbiNs=
X-Gm-Gg: AZFdTZeIERD1BWKJUqHAoMdj9edAmNHWZmFploXwuUIai2scWpV+nLYN4t3Sw8GIn6T
	kQMK6UeVkq3/Dn99XlU/X4sE/Y6APK4OZiH9WgOP86kSdyiD0rp6Z/k3zxhL1dSmHrmUFqepJA4
	Y9XXQTLsOhVxYlTMV3tlCmTO5hOImMWRRuzyP0pPwIHOqVHUzZnlMUEdDjjGKH8yATN6kjeE3gr
	ldGaNA5gUhyUZYIIoR6pEMWIQJ73WXw3SpR3086A10CY4/mtNoTRr/uSUCOktkhup2OKWx9F6w+
	ejFDH1hJMDe17m246uLFQSYyIKVAJoJ1t8LsQigLF/mJGSBeyESvRTloyIwPPmPSj5yCCoHpi+X
	5pf0RLyrR/xsPkjaxveCbbaxL9mF5LnqmcWAYi6iXoEzRNLzlpXaE9IuxM3m94C5qKn0ESXE8jJ
	GCFus1IWP763SsdRrw+BdS5JzH/hTaNnXsHRM+MlljeysyQqweaz/CcVPMr7j10Y32MH4Ppwyb6
	IEDHMzD15p6EZDdW67yxtrUxErkM3lRPp7kjE6ucLFmeVHguWU36vgOi88dR2+Gxy7K1z+yyZTg
	gxROapBA+5CDmF4Jh7FYit04T0tQrrqF6Pf7QuoZ/MWjAkZ/qmpGzLuucABjJTVPFWm+KIlXQXK
	bxld9Pa9rZ7HB/lZENaAjWZVq361C2sah/CZ8TzVVs++GfCxL/gQqfr8MGbMlGPZcchsO8Cue2I
	6qyqGVoZPsHpjfPvbtqYHx9MANVrMoOebgfZHzxL6+jbRPLSnX
X-Received: by 2002:a05:6000:25ca:b0:4ac:7595:6f67 with SMTP id ffacd0b85a97d-4ac7595721cmr13682565f8f.40.1795362921141;
        Sun, 22 Nov 2026 07:55:21 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm20046526f8f.55.2026.11.22.07.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:55:20 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Peng Fan <peng.fan@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Xu Yang <xu.yang_2@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 1/4] pmdomain: imx8m-blk-ctrl: Remove the power notifier on probe failure
Date: Sun, 22 Nov 2026 16:55:08 +0100
Message-ID: <20261122155514.10289-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122155514.10289-1-dario.binacchi@amarulasolutions.com>
References: <20261122155514.10289-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_075523_094126_9EB7FCE6 
X-CRM114-Status: GOOD (  12.15  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If devm_of_platform_populate() fails, the probe returns leaving the
power notifier registered on the bus power domain, while the memory
holding it is released. Remove it.

Fixes: 9cb6d1b39a8f ("soc: imx: imx8m-blk-ctrl: Scan subnodes and bind drivers to them")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-227073@kernel.org
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Add Reported-by and Closes tags

Changes in v2:
- New patch

 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 9df933a7a238..7d6735728d8c 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -345,10 +345,12 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 
 	ret = devm_of_platform_populate(dev);
 	if (ret)
-		goto cleanup_provider;
+		goto cleanup_notifier;
 
 	return 0;
 
+cleanup_notifier:
+	dev_pm_genpd_remove_notifier(bc->bus_power_dev);
 cleanup_provider:
 	of_genpd_del_provider(dev->of_node);
 cleanup_pds:
-- 
2.43.0


