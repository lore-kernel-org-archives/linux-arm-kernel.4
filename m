Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0854606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 15:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OroJWN2W;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=WXsh3+JT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YXPf/W4XcAqD9x9Cn0OV3MiVFNQRYObRCyBfE5aJVqU=; b=OroJWN2WaBB+30
	6fxpLP8p5yyi9EJaC+XM4nCWdtgQYakPHYT6vcdACaEry0e3tiJ52oroLwRBCMp94WpZrsR3vVrwJ
	8fVr2RYOdJSndQeR6JBHlv9sqR4lxJWCYAVv4WSH66uIBZ8PyROtrAYu5SBV+FYh/BNZNZjzDN0p4
	mOrmLtz6UGgbKlXz5prCrUA2BxDgZw9fomWu24ahQrg9cj3OQIGILIBAdsKFo2/cSqQafhtg4d9Fs
	uu8RFtUwwU+Tl8z48gxW6ZB37nIpFVv36blqoI/9mlYcAn+FEVK+1XmURryzYqDbKHj0p0BKn9/FT
	h94pRycyMNQ1z5K5I8qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9ux-00000001Iw3-3kUo;
	Sun, 22 Nov 2026 15:55:51 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9ud-00000001Im5-2S1e
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 15:55:34 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-490f38e9688so1724546f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 07:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795362929; x=1795967729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXPf/W4XcAqD9x9Cn0OV3MiVFNQRYObRCyBfE5aJVqU=;
        b=WXsh3+JTaJ/ns912zNTIy71Ktufna7uf5AZbB3Qhr49WHRttCMY4nIsbIxAzsE8Nzv
         Ex+jsho8UGLdRgFSc2wYhXL3iRod+JixbfATt4bhldUjZmgOp5GesIi0dx0zFb38WyqK
         ZeO7/PblxIzck+iqlqjm4eEpVsj+xtWlahCFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362929; x=1795967729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YXPf/W4XcAqD9x9Cn0OV3MiVFNQRYObRCyBfE5aJVqU=;
        b=iPkBA7F28mwnVty3QARKDvmfzCgDI2fqsiahkfLAJhVZUP8sWUl8e6ERsKqPz5wt8x
         8W1PSH5EfWmeX8W6/JakK1U6X1ltYDZuteI4W2sdyRDwvyJZVZV1wBuVl902I4METQ1L
         ax0vlyT6LNMegFTgFW8FdHzfS9Fjcrf0al+T6wS4kQpJ+IbttGdyVNZ/i8kAtt/acrZk
         77GRhjHeO5Nm1yU/WUwqJCrdiKBTlpVXgpRycE91CLbLAuQ9ytz5/VX1ZuGbhpSWFgU9
         blc+S2ua4OlABdSdITLK8OFUQi7jVrGSUEcEJpRU3Fg8Wg17Yc2SRyceEAVUbChMHpN8
         l6NQ==
X-Forwarded-Encrypted: i=1; AL+hErGTcum4lO7REA2To5nmNA/ky+UJStQ8pfBzenNi56KrR7XEv8iXuL4fM/TLNhbPfaM5OYi0gvs+1iq6fR777MTk@lists.infradead.org
X-Gm-Message-State: APuU4Z95sSC9NV2aImVMqKrRrUbe2ZCG9moLV0SodgvCujXZkjAYq/Nh
	B03LGXqWsiQ/Hl8qapn10ELTx+A++KL3oeeJUTBFCCR/7tQ4PYiMiHniA8QUivGuqVQ=
X-Gm-Gg: AZFdTZc1VmfR5RusF4tGDAgjb9oCA0Z3bLpWYFn08d5IthzvBueZaVvaYE05R2Exvy9
	S6Z2LGgQGw9CXcOH321Gyt9MNeorixHHfwjC5iKfQ54AbOGprp35QhtCUR1Z1yeynmcBqggSL8z
	8qgl+SJNox5cr9CEhq6F7DZcjTQHrMZuW08MZT5V2gBpIdjkUaW8fNESojXRg6wUzoBTOzYZ1MD
	MqV1jT75KGRlwibGFk73HoukzJ+Wz4v9YIjdRif5X+kVwtKoirAZ6v9qJaDiv991fYX7a3eBsmc
	x3S48LK72QUANKlVfBMlHC2nCRD2wMB4GnYINgVaZN4QswhyRqRihPSRDuveimZRs4xNO0BUqSf
	U4qIgDNk9eftaWRaJW2iosW0ZWVBpu61rYqJlmD/Z/eDnwFSA6tUwZV8t/fBWqQOag8hVBcQmgz
	GDHlDroNbCckuTmef7+VOM98Jo9MThZGq6JxufiJey4Pyaf9g8h5iEXo6jybC3uKHLZN3UdlZ5S
	DBl3tqEs82zkXEffC/6rgQVnIsybi2iYtl+hFpp+CijZ5GLSUQv27/N2bICFIFejWn/xsXkPIej
	y0VFJdBO5St9npUV+dBfTyiq380aOAg3vcLpzvVaCO3nYoF58LwkzFfwCFVN05W08e/mjL1aM1R
	NCfic4TVWohLzRDxRjf+vjh0ZqK3aqKsJx2SJVjA/j4rpxxwH8saIK6++NmE82PH1lXcjjFLhrP
	+1BUejttQbO1xvNkkzWFz9b9W9AA==
X-Received: by 2002:a05:6000:4012:b0:4a8:f1a5:efb3 with SMTP id ffacd0b85a97d-4aa550796b2mr23844832f8f.11.1795362929563;
        Sun, 22 Nov 2026 07:55:29 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm20046526f8f.55.2026.11.22.07.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:55:28 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Peng Fan <peng.fan@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
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
Subject: [PATCH v3 4/4] pmdomain: imx8m-blk-ctrl: Hold boot-on domain clocks until sync_state
Date: Sun, 22 Nov 2026 16:55:11 +0100
Message-ID: <20261122155514.10289-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122155514.10289-1-dario.binacchi@amarulasolutions.com>
References: <20261122155514.10289-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_075532_754869_CB106A21 
X-CRM114-Status: GOOD (  19.44  )
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
index 99d75bfb69e9..e360cb038969 100644
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


