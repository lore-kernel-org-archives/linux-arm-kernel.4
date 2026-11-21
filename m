Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE486606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 13:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OI2MyCY0;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Frn9pkEd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=U33Eqi0MwkCHOyFx02ypgQ50QlY/YFdApS7Aq1x3HP4=; b=OI2MyCY0Rhm3vD
	JSd9o8sHeigHKH7peXcNPKfZ/IvF8z4gQWlEXssjJUp5HYBcQp6JaG1CwmrgO452UwTCN/VUKWQSN
	UNfoTewxSnNhnq3k7CoJi5qfV6KBTZOzaQ8NztTpd2kJ6SMcpJb9whhRhwtFD+Z+k/8bwkBpWTKRR
	jY+PmlxwZD4mjM8mh1tW++wyJrEDiXOsXE5EM0pw4pL9AhbDP1NHlWwmxCLwW0XkBC8kTb+/CjDeF
	yTDUDVuXIfLX8gJlC/EGSA7YAdSq7szOIdU4fwSt//uq6YY2h62p+PdXEynSGJRmV5f6cRuesmHCX
	uWuYYrKD1ZGeJfTddCkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUknY-0000000HErX-0HDX;
	Sat, 21 Nov 2026 13:06:32 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUknT-0000000HEpS-2pPR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 13:06:30 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso12862575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 05:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795266386; x=1795871186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U33Eqi0MwkCHOyFx02ypgQ50QlY/YFdApS7Aq1x3HP4=;
        b=Frn9pkEdxJlLneJ+XJcgzHpnLGyfXBW1xiCwMbktzJF9a+EQLuWSbhpD5GN8XKlcEj
         aGxPzIdIpaykDUWY8tT228qxiuCvZr3MyeQNAzqvMbQHhqxAIwYODr6fcz3cgDR8r1KN
         GafCLCFzX6jdHv+MQHR2coTL1Ks8FO9LlpOHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795266386; x=1795871186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U33Eqi0MwkCHOyFx02ypgQ50QlY/YFdApS7Aq1x3HP4=;
        b=dv76qOGSOg5zgOi4ZJzhhpnQvcF2+ik6Gf7yIkeTAEfgWWwy0tOQGnMpnCYmlw31WV
         BqXw5OtX1LyfV5VIgiz2CjsJUjwqgeTutzvseph7+YdTvSMgv7SiG1wEWeHjiNzfklMx
         Au8JKTTwUyhnXQ6DqhaSVT8AQpr3y3/pgoZWOdJ0oNtQCx1TWbqMUtVowaC6OTJ+UFDn
         oULTZrqUExaRekGHQR8vkfctf0cieEXXb/rNg2SV5rv1pTHI5gAxiXI/Fqbz62quCxJ7
         hpujDe2jZkwMNtib9/D6aoKwjq7Int2rU0IsJMjC8H36Tgw+IwlHF4i14d4exfOv5S/r
         X4DQ==
X-Forwarded-Encrypted: i=1; AL+hErFsPyrgHtkPcRIwr0+2pkTW3AWSsCjPVSiH92m/0RL6hQAV5/2nbps9IFV8F83LsnM83BBpQQ8p3vpp3N8FAaWa@lists.infradead.org
X-Gm-Message-State: APuU4Z+9JBctiPR/br7LITdvHP0MZtMNykzkoIvltFrTbiob9wiOaiwf
	yV1bzn05qXtonPprBpfe8f5CwWM1Uwg4tjaN8Lt4J8X6qiAKpdZLKjZ6XgFd1/TUDBo=
X-Gm-Gg: AZFdTZeYcTeFW+CoJnloKz1B/gcHeSKi2yPMzhHHzlemzx8qtT7nKFqdL2oAkwOtO+H
	flTbMAxRfqycJFIMvWVeWrhxx2xHPigPrY4V0mnkm5eGM+LrIX7uDIWwg1m+BbZ0uk5Y5hvI6eA
	xN6mLRpGuNO09WtKwPphBtNFmn73Q1fYmZGa6Fp626tSRGNmmowN5q8jiGCya0yEYB0piJAHBbM
	FyMJqza4XCnJ7Bkb4E8dy8RURG/SfX+Umw/Ee+QiM22SwE8UR09uRDIEoN9HOdcoPhI0FtoQ7Uq
	jnx+bgmcNbuLVe5D31U4qO1UF5/O0/auRIH5ATJnQ0FHMpPMCsz6TmTBXhu2bzMBjYlBeiqydJI
	AdVnhTXQUHLH2ueOvZ9GEEheXkwX3Wba/l2yU63glBa6FBNWRHKmAiULuTio7snHsQVfSbGbBbn
	enwn3eafQYhoGxiHAB3x1NzQzRWwQGgh25az9Dyq/dvq1ON4k9hjSH0brYRnGq/P6jfjGKgD3SD
	4Tdza9tW6+RipOXIFk/gswzdDeO37T0oEWtgk8lK0pMSLQsp8XbDlypP3syDbG9VVKvV7T0w9tU
	T3AAtCjnObWhNDSACDvzKrxTqLoyMArLGrjOzZHrCjtQupV2pVQa+3Kfu24neRe1XuQh4Ja8DNj
	6qGpu2IDZ+rY9u+OTkn7OCGXdmqcsNr7aykZHMQIERxLxCD1g2P7E5FlVb0iIY+l48i2LVGxkEB
	kI9rFSniFp7WRsgVIa9iYsSHqUaJc=
X-Received: by 2002:a05:600c:848a:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4bb8880993amr134343985e9.7.1795266385739;
        Sat, 21 Nov 2026 05:06:25 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm47196545e9.3.2026.11.21.05.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:06:25 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Lucas Stach <l.stach@pengutronix.de>,
	michael@amarulasolutions.com,
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
Subject: [PATCH 3/3] pmdomain: imx8m-blk-ctrl: Hold boot-on domain clocks until sync_state
Date: Sat, 21 Nov 2026 14:06:10 +0100
Message-ID: <20261121130614.2482656-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121130614.2482656-1-dario.binacchi@amarulasolutions.com>
References: <20261121130614.2482656-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_050628_857789_137ED723 
X-CRM114-Status: GOOD (  19.20  )
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

 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 35087da43dd7..95b010505ded 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -84,6 +84,7 @@ struct imx8m_blk_ctrl_domain {
 	struct imx8m_blk_ctrl *bc;
 	int num_paths;
 	bool boot_on;	/* Left on by the bootloader */
+	bool boot_clks_held;	/* Until sync_state */
 };
 
 struct imx8m_blk_ctrl_data {
@@ -245,16 +246,33 @@ static int imx8m_blk_ctrl_get_boot_on(struct imx8m_blk_ctrl_domain *domain)
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
 	if (!domain->boot_on)
 		return;
 
+	imx8m_blk_ctrl_put_boot_clks(domain);
 	pm_runtime_put(domain->power_dev);
 	pm_runtime_put(domain->bc->bus_power_dev);
 	domain->boot_on = false;
@@ -452,6 +470,7 @@ static void imx8m_blk_ctrl_remove(struct platform_device *pdev)
 	for (i = 0; i < bc->onecell_data.num_domains; i++) {
 		struct imx8m_blk_ctrl_domain *domain = &bc->domains[i];
 
+		imx8m_blk_ctrl_put_boot_clks(domain);
 		pm_genpd_remove(&domain->genpd);
 		dev_pm_domain_detach(domain->power_dev, true);
 	}
@@ -1032,11 +1051,24 @@ static const struct of_device_id imx8m_blk_ctrl_of_match[] = {
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


