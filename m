Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D109A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 02:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u4lCWvqO;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=yAf6e/Da
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vpUJEjP9x2su6rUsdB/qg950nFELOqFmn3iPrfPBO6Q=; b=u4lCWvqOnQWbfPY7cU+oIhPVHp
	NTWrSe2FHDTYj53JuCDsQKUTjmK70hTaqggou8KN9dh+GyD49Cyk+rCD3m1byZJnAybupe1FJ9/wQ
	10LVpUOie4V9TfnNW6gg9qhcZDo2gxYNCxWFqLSy3gYTjErUMkbtu2vE2gB4fv98YUfaE2JwciUy6
	RA0TgEwoc9QzJ5xVI/sK1FxHFOrLt3Q1ax8/f35SrpU2wRviGfz7XV/YXpHh61igcqX3OTmQrEet2
	Zl6ss6A0Kh8RJWmIZz4JL7BkG4A6HV4b9CeBQcJpxSlwe3JU2DSi1a/AvhDx5tVAKjZ9B18MtAqEm
	93bEaXdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8ZG-00000004M5q-0eMw;
	Tue, 17 Nov 2026 02:05:06 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8ZB-00000004M4b-38uL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 02:05:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=yAf6e/DaQkzfXcqAsVFSJJGqUbUZw5J5+TsZ6KlMyo97xOyC0DLlJSV95XGGgyOl1ujEvB8HBRKYk
	 lwXAULxeksP0mbJYDqAcOtHXIc00slqEumyWVKBf2g5pgxLp2y0ygvbogH3hALn4NifFnGpqZOSohQ
	 kgyp+L/EQOPcU3Y8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56afbb64093c-01345;
	Tue, 17 Nov 2026 10:04:48 +0800 (CST)
X-RM-TRANSID: 2ee56afbb64093c-01345
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46afbb63ab5d-9ef9c;
	Tue, 17 Nov 2026 10:04:43 +0800 (CST)
X-RM-TRANSID: 2ee46afbb63ab5d-9ef9c
From: Luo Yifan <luoyifan@cmss.chinamobile.com>
To: Aubin Constans <aubin.constans@microchip.com>,
	Eugen Hristev <ehristev@kernel.org>,
	linux-mmc@vger.kernel.org
Cc: Ulf Hansson <ulfh@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] mmc: sdhci-of-at91: handle clock enable failures in set_clks_presets()
Date: Tue, 17 Nov 2026 10:04:46 +0800
Message-Id: <20261117020446.19927-1-luoyifan@cmss.chinamobile.com>
X-Mailer: git-send-email 2.24.4
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_180502_320732_F34072F7 
X-CRM114-Status: GOOD (  13.16  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

sdhci_at91_set_clks_presets() enables hclock, mainck and gck but ignores
the return value of all three clk_prepare_enable() calls.  It returns 0
even when a clock could not be enabled.

The function is called from the probe path and from the system resume
path.  In both cases the caller continues to use the controller even
though the clocks may be off: probe proceeds to sdhci_get_of_property()
and sdhci_add_host(), and sdhci_at91_runtime_resume() calls
sdhci_runtime_resume_host(), which accesses the controller registers.
Accessing the controller without its clocks can hang the bus.

Check the return value of each clk_prepare_enable() and unwind the clocks
enabled so far when one fails.  hclock is enabled first and is needed for
the register accesses inside the function, so it has to be checked as
well.

Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>
---
 drivers/mmc/host/sdhci-of-at91.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-of-at91.c
index 7c4ac65f24..8acf2ddf58 100644
--- a/drivers/mmc/host/sdhci-of-at91.c
+++ b/drivers/mmc/host/sdhci-of-at91.c
@@ -173,8 +173,12 @@ static int sdhci_at91_set_clks_presets(struct device *dev)
 	unsigned int			clk_base, clk_mul;
 	unsigned int			gck_rate, clk_base_rate;
 	unsigned int			preset_div;
+	int				ret;
+
+	ret = clk_prepare_enable(priv->hclock);
+	if (ret)
+		return ret;
 
-	clk_prepare_enable(priv->hclock);
 	caps0 = readl(host->ioaddr + SDHCI_CAPABILITIES);
 	caps1 = readl(host->ioaddr + SDHCI_CAPABILITIES_1);
 
@@ -223,10 +227,21 @@ static int sdhci_at91_set_clks_presets(struct device *dev)
 	writew(SDHCI_AT91_PRESET_COMMON_CONF | preset_div,
 	       host->ioaddr + SDHCI_PRESET_FOR_DDR50);
 
-	clk_prepare_enable(priv->mainck);
-	clk_prepare_enable(priv->gck);
+	ret = clk_prepare_enable(priv->mainck);
+	if (ret)
+		goto err_hclock;
+
+	ret = clk_prepare_enable(priv->gck);
+	if (ret)
+		goto err_mainck;
 
 	return 0;
+
+err_mainck:
+	clk_disable_unprepare(priv->mainck);
+err_hclock:
+	clk_disable_unprepare(priv->hclock);
+	return ret;
 }
 
 static int sdhci_at91_suspend(struct device *dev)
-- 
2.24.4




