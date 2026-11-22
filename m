Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764D4606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hW9jZF/e;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=MEHXdYHk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P4BwB3GPSpT/AdzHng5SCwGK7VpozgBU8e5MfbG9wwI=; b=hW9jZF/egbHmEb
	RbIPFAIYEg+IhPq0rsp9EAJhwB1d7CzFXec+n1erv8SJ5UiQpU70qQx3BDPiMmfQUQSFmF4PLsi3I
	6NnyNN+mrMSsk2opD8HLKxNwmhZbx51lSC+Ac2zaqelA8TGCFfFADafZciIlXgg8OC/gRgIxSq+pu
	KdYiCul0G75o/F6PJciuZOy8MFk0YcLUXEHpf2/3HPYNVCUiQFa5VRPbm826IxxwH7/n43Zgb9d14
	U3h87pTsh2B1b9H53bWuQEWpBLHHYhME/P55WXKjWJGdXR+JlXORZ0/HwTx9qv600vy08jsAa6aZD
	p55cUEPLlU5aXG7/1sDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4ML-00000000wWi-0ZAU;
	Sun, 22 Nov 2026 09:59:45 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4MI-00000000wVe-3OFi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 09:59:44 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4b467581b98so20805825e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 01:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795341581; x=1795946381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P4BwB3GPSpT/AdzHng5SCwGK7VpozgBU8e5MfbG9wwI=;
        b=MEHXdYHkgGH9zSJ9LJ9CoS2Z0nDQa2H1E05lhyjMZkajntCUU+gd9fSrRwaIO0gmpx
         vo+ndqcgjudkuNxl0efaaJ2IZhHpkzpMF8C1JYvxVZ8DZBH82dQ3ND5HWf+BwZnCzcsU
         hrnuwnKuN+VMMhzVLl6cGlxLRrZippBeDof78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341581; x=1795946381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P4BwB3GPSpT/AdzHng5SCwGK7VpozgBU8e5MfbG9wwI=;
        b=oDNXI0+YZVEWsiRDNQ2n82svemsyRfis63hyyo1/Y4kCYPYOUu+tiZu9a1bKYwP8wN
         Myylwh6wLVUH8ouq46QvipNG2FZFd/m7CAh/fC3ys1+u8NaGjx18y4snCLKU7F4Rg0Pv
         m3FJKYF7LQd6lIoO9RqihpNDkqu8GTz394+f3z/VS+93+dZXWdMWcXbm+9Nm579GEM/V
         9G8cz0838DThkTRfftnJfcJsC+Ykp3yF8TY6hqgFncCKHIpyrXZ87HK00Bbr1zDmgb7G
         sOSrzKSUi67hdRjSYQT5oqsBi0CXHv750bJZctT2CKukCdxSowsZeCaRv/WAsrn3MNi4
         2JNA==
X-Forwarded-Encrypted: i=1; AL+hErGqUs9QBsJBs66603w8UH/ZHUwYbFQ95Y9si40WIJzx4MzS2gnxCVztZgbzx/I5FiY7PtbxkYSObg0Bqpp1sLZx@lists.infradead.org
X-Gm-Message-State: APuU4Z8LOAHsJELAb3E+uxeBHTu4ATN+/UxE1VTzEUwELHZMkHIWNXjK
	IF0oR30Pfehvp3bOjEp5yyy+iSjlssJYBuc6vjzTNaUh/R/cSwwrJBziaLOMTS1CAZQ=
X-Gm-Gg: AZFdTZfZx7CNL/NAmrHPUr5+dcTdGPa5qGeWDdkhs4Ds0TX5XGumY367S7vcd32l7Xl
	F3If4ydhComMt2nFRD0mlb6Qo2FFovm3zUMEuv/RjJvW7I7dIZFVw0mF7/j2gwg4JCxhPflletb
	tomSWvMyl5sbL/7z5fSCu38VSURzd6+cBB5Weo0m7Jr6D+nmwvqAQWblwCFRkkBv+WjsZiKZoSF
	R2WlV2iSaSDOSsZaveTWs7wa2d83lhih4k6CnoJqlb4Bx+7zvNAZATOYJs8Q9ClX6xX6aRlnNDg
	Msw7fHLZq5ibGXteKf0+S285dN7W0iCNv5eADjliR+yUEg6gT9FHvJcqnYqS21Pkd+fJeaAWu+M
	rIblaa1InRGzCWcALp6VZsN1+wJmVXL9USM46UR2catKbXv5VkkAodZdpw364DvA4nGwAUGZi2j
	VYQuRFxoKlBpfbZrAELw3fgmrQIUCrzW/CFZgBb7dq8+27IKfEDdlqNnUoynCNtRMsTlCLETinq
	0RC93fSwC74qPYljvTZ/hI+nJfSQo8qh0Zwc31SOiGYtnxtjLXPzjSMCS7UTA9jAs25We31KUAL
	gVF0SvliD4EDG5SGWwJc3dQFV46sqSL0D2TG9wEcmNPUoXI2A8IOD43PPjfBxgDkkpz/KAuJNwk
	g/GRtdYIhfYKZfSs1Wjmk0UY9kjyP50xzU9q78RI9fdGxqmX9zYBFZ3vs2Muho5b6LAK/MWCxH9
	dY7cjgELUmPK0STdviHI7eJMnsqZtOeg4BTFjeBe0jU2OBwVE=
X-Received: by 2002:a05:600c:5249:b0:4bb:665c:a078 with SMTP id 5b1f17b1804b1-4bb8893a89bmr173732335e9.28.1795341580916;
        Sun, 22 Nov 2026 01:59:40 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm342455265e9.13.2026.11.22.01.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:59:40 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 4/4] pmdomain: imx8m-blk-ctrl: Hold boot-on domain clocks until sync_state
Date: Sun, 22 Nov 2026 10:59:19 +0100
Message-ID: <20261122095927.2631909-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122095927.2631909-1-dario.binacchi@amarulasolutions.com>
References: <20261122095927.2631909-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_015942_861142_B7C24E01 
X-CRM114-Status: GOOD (  19.55  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The clocks of a domain left on by the bootloader have no user until
its consumers probe, so they are gated when the unused clocks are
disabled. On the i.MX8MN, with the LCDIF driver built as a module,
this stops the pixel clock of the U-Boot splash screen long before
the DRM driver probes.

Keep the clocks of these domains enabled until sync_state, i.e. until
all the consumers of the blk-ctrl have probed.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Rebase on the changes of the previous patch

 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 5ab201eefeb3..bc69e7336526 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -84,6 +84,7 @@ struct imx8m_blk_ctrl_domain {
 	struct imx8m_blk_ctrl *bc;
 	int num_paths;
 	bool boot_on;	/* Left on by the bootloader */
+	bool boot_clks_held;	/* Until sync_state */
 };
 
 struct imx8m_blk_ctrl_data {
@@ -250,11 +251,29 @@ static int imx8m_blk_ctrl_get_boot_on(struct imx8m_blk_ctrl_domain *domain)
 	if (icc_bulk_set_bw(domain->num_paths, domain->paths))
 		dev_err(bc->dev, "failed to set icc bw\n");
 
+	/* Nobody else holds the clocks until the consumers probe */
+	if (clk_bulk_prepare_enable(domain->data->num_clks, domain->clks))
+		dev_warn(bc->dev, "failed to enable clocks of \"%s\"\n",
+			 domain->data->name);
+	else
+		domain->boot_clks_held = true;
+
 	return 0;
 }
 
+static void imx8m_blk_ctrl_put_boot_clks(struct imx8m_blk_ctrl_domain *domain)
+{
+	if (!domain->boot_clks_held)
+		return;
+
+	clk_bulk_disable_unprepare(domain->data->num_clks, domain->clks);
+	domain->boot_clks_held = false;
+}
+
 static void imx8m_blk_ctrl_put_boot_on(struct imx8m_blk_ctrl_domain *domain)
 {
+	imx8m_blk_ctrl_put_boot_clks(domain);
+
 	if (!domain->boot_on)
 		return;
 
@@ -1045,11 +1064,24 @@ static const struct of_device_id imx8m_blk_ctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, imx8m_blk_ctrl_of_match);
 
+static void imx8m_blk_ctrl_sync_state(struct device *dev)
+{
+	struct imx8m_blk_ctrl *bc = dev_get_drvdata(dev);
+	int i;
+
+	/* This replaces the genpd provider sync_state */
+	of_genpd_sync_state(dev->of_node);
+
+	for (i = 0; i < bc->onecell_data.num_domains; i++)
+		imx8m_blk_ctrl_put_boot_clks(&bc->domains[i]);
+}
+
 static struct platform_driver imx8m_blk_ctrl_driver = {
 	.probe = imx8m_blk_ctrl_probe,
 	.remove = imx8m_blk_ctrl_remove,
 	.driver = {
 		.name = "imx8m-blk-ctrl",
+		.sync_state = imx8m_blk_ctrl_sync_state,
 		.pm = &imx8m_blk_ctrl_pm_ops,
 		.of_match_table = imx8m_blk_ctrl_of_match,
 		.suppress_bind_attrs = true,
-- 
2.43.0


