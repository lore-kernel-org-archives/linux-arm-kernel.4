Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12999606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UWeDJwf0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DLaKSukN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tepxdS3pjiqx/ESdTVnng/n4oyG1h1s3ol01nQq3JzE=; b=UWeDJwf0qO+G1MwPrScT1h41Qc
	5PVyGYWwQ13EZr+ALmq5s77G4i8SLjYf0kCh4J51hJPMljTpDayQ31cZfsBWCrWXeDsxcQm+krMqr
	zel6SytRKv1MDHDDb0uutyKKDm9LnQ3g57HN3ZEY6MPyiN5Pt4le0mJeacTsj52LxnhU8fTFQd9fY
	6D6SV2fPr+fB4aqHzMk12wC3u7pIuXPlw+4ayYJ69f+eNqy8C0Vfec8asYxoYp2/hTnqWGQdZSHIz
	NYuP4VcKZBFCD/F0iUtO01oAQ8LjrE9u4yibcFJMzTXXK5kElGv8FfWOIOoRLv7k5HT4EPtwbQD/w
	pPJT4QgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjV5-00000003Wr8-2UTQ;
	Tue, 10 Nov 2026 10:54:51 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjV2-00000003WqV-3RLH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:54:50 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-1931ff67a29so1273563c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 02:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308088; x=1794912888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tepxdS3pjiqx/ESdTVnng/n4oyG1h1s3ol01nQq3JzE=;
        b=DLaKSukNhDLKLffefOkDi9gpPOc/Ktz5M8lqSLn7rRX5SLK142ZRBNNXkZrRXISQuB
         UZ5k60jpeC1H30bUBQI4JBkaxhM9d82lptyZny/l2TkEl7AS8nhSXMGZ2ZsmDa+FZFry
         ozgd6WFRUQwYan7tkCwk14cgaPWuKUTA+8p6hScCe456h26XIl5jG3uStPnM+sL5s6J9
         qmKVuyWC2R6U8hZYodDn/9bOqFN7feN69Gnf7w18UQzBn0SVcWxdb9Ohk4KK/9AnHgWx
         x7/xs+qWIzSuunAB4sH0FqF2bDVj1aWKumhLURtwj/1pSXx61/j8PSBFoEH2u/UoMvpa
         ux2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308088; x=1794912888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tepxdS3pjiqx/ESdTVnng/n4oyG1h1s3ol01nQq3JzE=;
        b=n6Cy0AaAe1Iu/RLcvwtyxqDPT8/ek9VzsihcKZFI5g1sy/C66aL9UZH3Q6DhZKT6xr
         3xpgny4Sw7f5gOPQW9ZmltqUuL78Mom/Qwbm+GkcAwQKKVYWU2v/gJ/OXxO/L5/U7gG+
         sYFEv01x16MG5iDk4zkBeB7Y/mekfUX2fdqHHUJk5Bwy9NNhABfqxHcsXM0tmzuEozWH
         tMuVEjWqvBc3xGM2vz8bQHtMQq8NW+Up/6vckyd0QHLYZgQ1yWTXM6/0HvfPmYlHmHQ+
         jjF0kvgN+DVdIXokOz7FhTiaKMSD8pBWrx/IloGoo74nGBMZQqNPhJjpxLZI/9Mc2Yov
         fkYg==
X-Forwarded-Encrypted: i=1; AL+hErEA7vOm9IdmX1RMl+CULUsUjGbr1hP6xc87Unmix7ccl2Uj3xMMBjjM54ddTEdlNJmGYXZylHHPQanOmmYXl1Z6@lists.infradead.org
X-Gm-Message-State: APuU4Z9qLippPtwWGorBBLBXj+ErzfnClW9ZYGeUDXxFMjJIcG8tQBic
	9+GoTSIOHEGgRzd8ty8qF46YCAtd5X9FwntKi0kJf8t/9lKz23zlEFQK
X-Gm-Gg: AYBFou3z/5lb/kAgg92JXDu2Qcau4Um6VyXZBokYF8izg//+56nshsR84uwslgXLAxX
	0A5i3PAQY+gy1WHnNX/JLkOkUTlwEvOsMjxkDTFCYbnerYhnuRf7Oawn3F8YgM0Ia9zoPAeODhb
	B9sNZzorjyI+O+NS+1Dr+swUhYu9L5TzieuTprSz6W//J8onJ/Z1glZbph4jWWx+1NbG1eyUMap
	0Je2nMLzv10C7zHTKdbSkm4HwJZc4Sg2F/zt4Eed0ygugHYmXsw7DqjeGgGUfNA1yyRVE15pR82
	jFbf8pF9YVrIINVcVhgo+gimfbS8LHa+v/hLcaxZOGX7+tynUiVo/k7GtbjhxBfmZo8aLbUko9n
	NUSYPLyP+gxxVc9S2L25EKUSnlEQ6ntKs6pbN8/yRokJRPAhxTIOPSvJ13W7MWqQLSroC1P+dAQ
	6Z6ZQV7chdP3bZUa+YN5wT7xUhBsz0U9dsU9z4sdAYdxY2s0tr1XUbq5SkRZ/5GGbLFewSFpSk5
	5eBhsx0IZ7+fNFmKC0qXiylFO2+85LAasFarKsbZhf93DjAFIw0w+5qNZXbkNilyRIbK4vMRPRX
	X+xu57L51KZqEAzLGNv4E4wn2WCMw4FQkCm6SwC3BOH1FroG
X-Received: by 2002:a05:7022:f50a:b0:1b3:a9c6:b293 with SMTP id a92af1059eb24-1b3b6077440mr2856751c88.25.1794308087698;
        Tue, 10 Nov 2026 02:54:47 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm6996923c88.4.2026.11.10.02.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:54:47 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] remoteproc: imx_dsp_rproc: drain the vq work before freeing the mailbox
Date: Tue, 10 Nov 2026 19:54:36 +0900
Message-ID: <20261110105436.2487822-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_025448_861032_E17E8408 
X-CRM114-Status: GOOD (  11.34  )
X-Spam-Score: -1.9 (-)
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

The mailbox rx callback schedules priv->rproc_work (imx_dsp_rproc_vq_work),
whose handler takes rproc->lock and calls rproc_vq_interrupt(). The work is
never cancelled: imx_dsp_rproc_free_mbox() frees the mailbox channels (which
stops new rx callbacks) but does not drain a work the callback has already
queued.

free_irq()-like teardown of the mailbox does not wait for an already-queued
work item, so a rproc_work still pending when the rproc is torn down runs
after the rproc has been freed and dereferences freed memory (rproc->lock) --
a use-after-free.

Cancel the work in imx_dsp_rproc_free_mbox(), after the channels are freed so
it cannot be re-queued, before the rproc it dereferences is released.

Found by static analysis; not runtime-reproduced (needs an i.MX DSP with a
mailbox message racing teardown).

Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 96d619d..89c72d9 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -642,6 +642,13 @@ static void imx_dsp_rproc_free_mbox(struct imx_dsp_rproc *priv)
 	mbox_free_channel(priv->tx_ch);
 	mbox_free_channel(priv->rx_ch);
 	mbox_free_channel(priv->rxdb_ch);
+
+	/*
+	 * The mailbox rx callback schedules rproc_work; the channels are now
+	 * freed, so no new work can be queued. Drain any pending work before
+	 * the rproc (which the work dereferences) can be freed.
+	 */
+	cancel_work_sync(&priv->rproc_work);
 }

 /**
--
2.43.0

