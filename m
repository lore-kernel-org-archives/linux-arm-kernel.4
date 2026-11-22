Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A899C606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 20:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IQDoKdQI;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=LKO4f+hX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=H1tDo9wE8GIjmvDNP7MPhEM33+qsU/I9oOSPNzyzY9E=; b=IQDoKdQIa4HWrd
	Yper7nZQ1E7Xs2ROm1POCSg344gHau/rUWM4uprjqVU9RF+dWcmznm6MWsLHFiCZ5V2DkLxLEqIaq
	e6gG+h0mPhA2YKtmzDIEUhEyiptniFn4x/na+/utKpNU67t4adHngi9b4w9bHHWWX53408q09aLIT
	IBr7WvsSyLjQhKPKqQkZEikGPkrdGiz0QIiXqQaBb4tcqfaX74n6P2MUy/zp6OgJrsz6fHXTzyGQi
	CnwBcugc644y9vSTQUY2KGEazEphk9tK1nYBCC8vQr/p+/wNtMufuSPdSHFgPyqmmICv0ithSRGUk
	BO5wVaKy/H97uZPMl5QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEXP-00000001jr5-0WNr;
	Sun, 22 Nov 2026 20:51:51 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEXI-00000001joo-2SO3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 20:51:46 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so32188855e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 12:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795380703; x=1795985503; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H1tDo9wE8GIjmvDNP7MPhEM33+qsU/I9oOSPNzyzY9E=;
        b=LKO4f+hXSS5xdwxOsx8etScTlRNdC5IZtMz+N/owxWpJrlpla2Fc9uL4jP26KF1Zh6
         +WG44b0ihldORIHyUR1AZV8i+GqJNARJg4mfneScTevTly/gGxy9fvZjFUYMMKDK5zHC
         IBS2qb/Xo/3DfHKyH3xQ3Zl9sQf9GrGHN07f0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795380703; x=1795985503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H1tDo9wE8GIjmvDNP7MPhEM33+qsU/I9oOSPNzyzY9E=;
        b=gxsRTgYg36sq2slbkIFp0W3dCFGC7aIiTY+2SWkXUkWFzEtN8T5+xkxl0Nxj92Njpg
         5HcpO/qd+A+G+ZIFKi9L/b1lRTOrQongtHiqJ1pRZq3ZO3PYwL4i5DR3bgKCe2ikWeJ8
         7yfvDl8S3qtzg0Umm8TorfBcm2Ke5aI2T6jW+xEsbtsvTpXmZ/9gJM/3g39qEKisVBo1
         quDNMlOo0aoG+H90ugCTJqQXA9YiyUwkxxnTmPvQ4tnkBrqj/iu87NzkXHjOxq7aR4lA
         D8w7SuyKRdILD7qpJ/KbMQGV/g2VcaWSQ/oAbDB9NNe+kl3AGymdUqceyrkt9atk4we7
         wxpQ==
X-Forwarded-Encrypted: i=1; AL+hErExXabvHOQT1slHOPCChDiEwcw6FOxf8Rsr7alXCkDSi/ru87Xvmq5t0T2WtB1S9j1hb+zPHdUO7Nj1uMl7BJqg@lists.infradead.org
X-Gm-Message-State: APuU4Z/6lXbrFz6iegF4+e8TUG4CVYLa2SzB0MLobcQadUEL0m+VDQkE
	sRnMDLN9174QNi0eOK55WIyURLWuG5Ad45xMCi6yNdZEWxmSS7nm7QDoFm12tJlMJ0k=
X-Gm-Gg: AZFdTZf2ackrSkaVsz3mX0kkQg/KS/GwFMjcJ5mO4QDaj3YMgh8eyfQVKfoLxnrOwll
	wX29eKuQZEbxINKEDetXEaAdjlsEIQ1Iy206VKUf58d91TMdC51WbfRGibi7yCfSbL/R3ZlxMUo
	itceWJlZn2Wjb+iedm+nwMNnfiJdlXdPD4HVLeREc8Rrk10yUqTa7uToTkt6Eiea5Oafehn/lmD
	qmyGHHiccrUti8XZwC6VSkJXqWd4Ef+hk5fyFldhF4x6P/td6AD6mXb71X9cKLTMBvo5yRvO6B/
	O5ZIGlZ7RAvOTJTn9/sfZO8+110suJrSOPCLvhHC+e4I8Vnl5ypK8mdDnNBA76UCJ7YHgZbfYMw
	u9AMRnrv4wegQGTIyjtUfPBDFo0cueoy4ABq7FVKNAdODQ0nuX3MWWuKaLZUO8hGTXgjBe2sumC
	0mBOXX1pbD2qee8Iv/kWKAAMsVwgtEGxYjsRaPLXKKdEw8PF1FF/sWQ5b1jn0Mhj3KbZeAsqqcZ
	vRscSt9/dMtmmSt0YZdYELINypOp8OP2BoyMCUEka+RQM4KDBs6KO2lV42VMF80PL/sFBF7RUYO
	7ssY8ZOO11Y4haQJ7TXp9LFrBn+458tppoQfW+/nYE1LIwPqr2jHpFjfuBtT/wOAKf8O+UC+IBU
	nf9GK4J73CRnicRve92h9dIw07XZ46ldhPiq5Wh9ial1uUEEUPqpkixWhVbqkh7UhYtGkNGoZpT
	hFcGKVk8DepZ6LR3RfkPMCupXFRQ==
X-Received: by 2002:a05:600c:a085:b0:4bb:85d9:156e with SMTP id 5b1f17b1804b1-4bb8880fe46mr205083495e9.11.1795380702757;
        Sun, 22 Nov 2026 12:51:42 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm397355305e9.13.2026.11.22.12.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:51:42 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Lucas Stach <l.stach@pengutronix.de>,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Peng Fan <peng.fan@nxp.com>,
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
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 1/4] pmdomain: imx8m-blk-ctrl: Remove the power notifier on probe failure
Date: Sun, 22 Nov 2026 21:51:10 +0100
Message-ID: <20261122205136.138173-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122205136.138173-1-dario.binacchi@amarulasolutions.com>
References: <20261122205136.138173-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_125144_641939_E9BC6931 
X-CRM114-Status: GOOD (  11.86  )
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

(no changes since v3)

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


