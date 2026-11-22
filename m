Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C5D606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 20:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3z6Motal;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Tn8tbS5D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9qk8/ka9rPvexMaFJhcemSvfcHnBVEPtA/l1jjpp0TY=; b=3z6Motal98Q8x8
	sTyW0fKZVHjgWaiN2yV2Okb5R629K9kxBNqK1E+i1ifUQAcmD0clTEZZtETVSoxLJxvgvkn3OfAdL
	2fL5Tr4eUjQiNB1NtiAOna3wPdwghThZF63HuPmxW6P3kzJDkUwawdLXSovqU5urTgm1U8JEljfqY
	7Z5RpgchyjVbDo/u5Hk3o6aiKQ42feFW5m3fVpfD9lDyRWc3HiZI0h7H6jwOnOeNtTV02JuQYY93K
	60OGGTR9GZea2FyVni50CYF/ag+cgs3OgqOxR2ZZXfnYO8NZUZkEZCnPGthVeQBS1cRyuPng8tpRH
	H7wSBDyMVA7hYG2CHUjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEXm-00000001k0j-2M7Y;
	Sun, 22 Nov 2026 20:52:14 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEXO-00000001jq9-1eH2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 20:51:52 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49d05d51553so17972185e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 12:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795380709; x=1795985509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9qk8/ka9rPvexMaFJhcemSvfcHnBVEPtA/l1jjpp0TY=;
        b=Tn8tbS5Dqz0xRI2aMSJ/p4ECPY69eT1cCEY/XVMJUkv7oxr6bCahCSK9UyOwA9zt+l
         Z2z4DgP3Pn2h9FqxRm3hJu5ROsa3tNKUw8zzLEezs7N4iL8AaTPdOIUIWxms1JrRXlta
         RBE2gpRa48XWTiGINdhu6F3QTxxP4+plXouYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795380709; x=1795985509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9qk8/ka9rPvexMaFJhcemSvfcHnBVEPtA/l1jjpp0TY=;
        b=yR5NyjsvDPQxyCI+D51hozynxpXHJLanwWDV21EmezIP1bcpr6jQO6y4FfjgXEv6D/
         j0qYNbz62yI9UtZtOKTJoDe7KMeToFrmfnOtkFFtliMIuHbaTQvgq8Kt3HfcZpRmdixw
         86jhObKGsUkk/1mpp5g0WQbnjk3VMUhT8G8zhk2WS/Y23c/7JfWClvqgJqKI5YIWvzNR
         OX91F/Qcxtumi1zF7klH1Guq4IkfWAvicaaHi3XytQhkFmKTLtccTGoyFxnkb1TcsO9f
         fimyYBxsJtnaxT64DGRpAEpu8GojmefLy/RWUoYrJOEtrjl0d4rV3VZtUmeEL1Jg7BCC
         3AVA==
X-Forwarded-Encrypted: i=1; AL+hErG6t0YUdQcG67T9FiGfC61ya7UNCnNyQxIdia24TzifPMffIXHdHmXopKekp6s+jjGJ89hp8hD7g9xU4IDi/SYG@lists.infradead.org
X-Gm-Message-State: APuU4Z/yTp1eR6McXt4NZ6dLYUPCSqjWdLiwposM0B0rJiuhWtQcF0Jk
	WaXZx/YBPTuFdqsEg/7sxYCC9JsJYI1+xBwQjSUWJMGAswh5/Mg0uEShuQXQV6xdLd0=
X-Gm-Gg: AZFdTZfgMylqGytEVe84bY5nXcObdUDULPv4bYtXCXyPwmTRW/UaUwDmqdrKWfF8CH1
	cWP+M+3MSyFNndjcuY9SRkPVJE1oM3TAHdASq+rxzGd7K8+V/NirS/dSBJ//HUEevPFWHZdln/C
	/ts7YyRSjT5dRN6iq2EHdX0L4Y0ztIUqiHVA6jn1aRAiGNwIcurFMrNJTL+ghvPYu8kj1VNRaD9
	eIXRkJUr5BqKh3V8Fe0bNVIw2e1rdI1CXUkkmFiKje/Zxvj+JazTLd2KHH7uARANCG5uLA99qrR
	Y/Wb0pu+42hUEUSXg6spGsjc4JM+Fksf8s01b1tr9/xikDKt3hFtntULknfx/DKgC/73XXV9vO3
	lKV3Px50/BYzfhAGFzpukhOmAz5V/eAmbvkp21pn+cYxO3E1ZWjBHB2u/74NvUCv2G92GsRJsQZ
	9XJRy+KB7xOPkky+4OgTdUg3omGjwTZDe0Y8NlwsRZ4PHzzrOeifb0phs4DCnvA0IwmziefY02X
	3+cgGuZVb3ErhUowR/aRQ6fFDO2bhC1WaMxZc1Egsz1ktB+XwZFQORydov8VfJOyQtVuy0FFMic
	updWFQC7eVEpWhfN5gdbpJ/yndHQeHgGRNg/d7q+YDkxL1wYP/y3tzX93qgaw14hqK9+IyEZEhG
	2RgcDclM5w3Kk5bJHqvgDsgkUsxKFSgS1sQbK9w+m1a3twWYD9dDUTFdNtUQRZfLMLuc0FYjnOY
	idKBBoTd9cPd9N4Oi8O3oDQpAkOw==
X-Received: by 2002:a05:600c:45d4:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4bb8880988cmr211812645e9.6.1795380708837;
        Sun, 22 Nov 2026 12:51:48 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm397355305e9.13.2026.11.22.12.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:51:48 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Lucas Stach <l.stach@pengutronix.de>,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Peng Fan <peng.fan@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Xu Yang <xu.yang_2@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 4/4] pmdomain: imx8m-blk-ctrl: Hold boot-on domain clocks until sync_state
Date: Sun, 22 Nov 2026 21:51:13 +0100
Message-ID: <20261122205136.138173-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122205136.138173-1-dario.binacchi@amarulasolutions.com>
References: <20261122205136.138173-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_125151_046059_EE523CEC 
X-CRM114-Status: GOOD (  19.33  )
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

(no changes since v2)

Changes in v2:
- Rebase on the changes of the previous patch

 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 04383d7e40cb..680a76b49ac4 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -84,6 +84,7 @@ struct imx8m_blk_ctrl_domain {
 	struct imx8m_blk_ctrl *bc;
 	int num_paths;
 	bool boot_on;	/* Left on by the bootloader */
+	bool boot_clks_held;	/* Until sync_state */
 };
 
 struct imx8m_blk_ctrl_data {
@@ -246,13 +247,31 @@ static int imx8m_blk_ctrl_get_boot_on(struct imx8m_blk_ctrl_domain *domain)
 	if (icc_bulk_set_bw(domain->num_paths, domain->paths))
 		dev_err(bc->dev, "failed to set icc bw\n");
 
+	/* Nobody else holds the clocks until the consumers probe */
+	if (clk_bulk_prepare_enable(domain->data->num_clks, domain->clks))
+		dev_warn(bc->dev, "failed to enable clocks of \"%s\"\n",
+			 domain->data->name);
+	else
+		domain->boot_clks_held = true;
+
 	domain->boot_on = true;
 
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
 
@@ -1059,11 +1078,24 @@ static const struct of_device_id imx8m_blk_ctrl_of_match[] = {
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


