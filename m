Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A82A606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=leIdgnNa;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jqiqNcCB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cYhmmDhk9YyrIeJ9b5QNPOWsGYE+KiNLYLN1UcJqjIE=; b=leIdgnNaB2eI4J
	Se4ktUJqc2ffaGIbOCOfiHHoJOrSt82tNfGIUC4sOrG/3DD4IGGd5ucaEvH0nETFwvaFDGXQijphj
	rgEpf3LaVIfNILavQs9oM4Jg5Uaw0lIqLed5TqsAjMem/VbCI1en/RBHcVJxu6GCbJWX7eEJfVHOX
	7CTyHNivBJTvL8kzqetlhaH8FConX9+TXLXkZM8TPSzeEX5Ef6FJoAY+LXS9Bma5mcXElH3beGlks
	39D48hTaKmvvhYvvg/xPw8ZTwfIhmJSoM+pAbqu2W491YIbOXqLsb+CEd2CLolPzqgRRDX1/wzjhJ
	L8eQO39X6iO/UJjWBqGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQliB-000000040VU-2udv;
	Tue, 10 Nov 2026 13:16:31 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQli8-000000040Td-2t8U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:16:30 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1111458a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 05:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316588; x=1794921388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYhmmDhk9YyrIeJ9b5QNPOWsGYE+KiNLYLN1UcJqjIE=;
        b=jqiqNcCBAbPZTdb70ZIMA88j0iKYtR8kIRW4/Aqlj0JWvjy0JHnscFq8ytodX5eHAl
         0DYjW6sUgCiGG0TKV1k3op80XBv7psqEe/sKwLBAFYgUeEAWK2O3Es940nQ5+AhSQxBD
         EuVewRaVboFtm2HubaQc37US4GeSh/RIf2C4Di9eRuMSN7n0WPpn+MzXrlpVqUsWnXVF
         cRxU+zF2Xv/zqA7A9agX4W4Hp4tc4KoBo9dGeDrno//utyjEsOlnC0/+TsBN810jIoMa
         3sVgrb4VO5Qj/X2MUCZBMTAlXtY5e+ruSYXBHTBLDE5Fomr3Y6MkQnjaQgJbDg4+xzzX
         FP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316588; x=1794921388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYhmmDhk9YyrIeJ9b5QNPOWsGYE+KiNLYLN1UcJqjIE=;
        b=047TJK2FDlozBb2xvyAJjl7EZY0eSWEFwX0eH/Ga6nsy9lAvQHonxwvsGOfRzQ6Uf3
         gTbBg21HLjnIlbaGcBp8ZaWGacNIcL3VW3wkSeRZoXae8orNq/xVAcEL1qkccOk67EUI
         U0R99NlvQcw1UCIof0ImVEaDOG5Ph5FfBQS8G3uDJNS5qOBTPdhUxPTj7B31pM8rHenE
         KMdlSYjL8dA8dcnQkNKlipwqlsIT08JRva98iadFTMCvF/yO31vLxw/UaJXaG5iGEpmK
         Deg5Y1Fs/1yn4lN35yYLVJRst1zPQfxthaL1D0pC7LhUP6FRYsXobrVJtPQ/B64bZK6f
         xObA==
X-Forwarded-Encrypted: i=1; AL+hErFNiof0yZR+6rMtQSGNYTZo4svvO+SgTJTNdUC8EMX/NHON8DyDjO51PeVN8vRr6Eq4blkLk94IRTKDKCV0RRQQ@lists.infradead.org
X-Gm-Message-State: APuU4Z/cwrGFuwqQgMBMpzG3FyUcfG431zWDdV0tgSeq5oqMLz571jBk
	G1f/JxaRHQcvqEsXcM3TtPkKFHm92gq/AIc7UuZLW2y0fTct46og/5D8
X-Gm-Gg: AYBFou2FYyzQLYq5ge5Uj/PoOKbnCsdGg6JFEBgchCklID0cuGnc6IiM9Li/6etmWvE
	Ous6Dcbw9CarrW7sqdMAjgIs5iSnkFHdnIvvSajhVPfqXUPZQL6Qrre7NIpbk8x99w7pk1/hV70
	LMx/Jl3FGciMQCMOBBopPlmNAWLT9JVJgCRmNJWVsWhEJFiDkRUSLSiGs75dKuP+DGumJ5c27kV
	mPrrwcLljtNnwi1tOXSbPUIlVrL3+Uc2h7fOMKQxuka+jROBHaM3oe6RCElKdQ5RwMuX5GETmk1
	EGmP4YGYRsaR2vRWWBJASU2Q9c0O42vQ/hUYfSyANv3jMhCGULVbt2DyQc1mxREcwkk+oMOS8m8
	RU2FZwya8KDLjtYR0tAkkb67xpJ6lykm+aWmFwuPUOlEN9kP1PVPqbJLMkoHL/skbCMNJOUfbNC
	CfmDciGQJu0h0Uz+dWOb18y0IeTHpNruC6wbyOLPq19r7sOyWo6284Xi+DOxP85o8L6HeJyIAnV
	IN4OW14nOUeVUpCj5TFZU+HChFjDW6AOWgyVJAVqWmb0/w0FHnW2TZevcT1M2zSR1fe29O+S5L9
	hxv5bDwCA80KcJGNEt39CKPMJ92Wz2w=
X-Received: by 2002:a17:90b:4c51:b0:3ab:9f1a:3825 with SMTP id 98e67ed59e1d1-3b166aef970mr2935950a91.4.1794316587571;
        Tue, 10 Nov 2026 05:16:27 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:27 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 13/33] dmaengine: mxs-dma: use dmaengine BH scheduling
Date: Tue, 10 Nov 2026 05:13:13 -0800
Message-ID: <dc2a8bc5d071b865be14d8ede93a3b6bc68839a5.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_051628_737422_4A18E78D 
X-CRM114-Status: GOOD (  14.68  )
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

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/mxs-dma.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index cfe4d759d65f..3dfd56a53414 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -109,7 +109,6 @@ struct mxs_dma_chan {
 	struct mxs_dma_engine		*mxs_dma;
 	struct dma_chan			chan;
 	struct dma_async_tx_descriptor	desc;
-	struct tasklet_struct		tasklet;
 	unsigned int			chan_irq;
 	struct mxs_dma_ccw		*ccw;
 	dma_addr_t			ccw_phys;
@@ -300,9 +299,9 @@ static dma_cookie_t mxs_dma_tx_submit(struct dma_async_tx_descriptor *tx)
 	return dma_cookie_assign(tx);
 }
 
-static void mxs_dma_tasklet(struct tasklet_struct *t)
+static void mxs_dma_tasklet(struct dma_chan *chan)
 {
-	struct mxs_dma_chan *mxs_chan = from_tasklet(mxs_chan, t, tasklet);
+	struct mxs_dma_chan *mxs_chan = to_mxs_dma_chan(chan);
 
 	dmaengine_desc_get_callback_invoke(&mxs_chan->desc, NULL);
 }
@@ -386,8 +385,8 @@ static irqreturn_t mxs_dma_int_handler(int irq, void *dev_id)
 		dma_cookie_complete(&mxs_chan->desc);
 	}
 
-	/* schedule tasklet on this channel */
-	tasklet_schedule(&mxs_chan->tasklet);
+	/* schedule BH on this channel */
+	dmaengine_schedule_bh(&mxs_chan->chan);
 
 	return IRQ_HANDLED;
 }
@@ -781,7 +780,7 @@ static int mxs_dma_probe(struct platform_device *pdev)
 		mxs_chan->chan.device = &mxs_dma->dma_device;
 		dma_cookie_init(&mxs_chan->chan);
 
-		tasklet_setup(&mxs_chan->tasklet, mxs_dma_tasklet);
+		dmaengine_init_bh(&mxs_chan->chan, mxs_dma_tasklet);
 
 
 		/* Add the channel to mxs_chan list */
-- 
2.43.0


