Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED85060A260E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g8DXn3cy;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b/AfWcBr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9qeJQ2WcAvPP7/Q2COJ9+M/C2lXq9FsH5eUhG/hiMvQ=; b=g8DXn3cyrQXimE
	0Yj8h7jtOAIIn8GI3R0xTPCTaJpEYjt3eRj4Z3HHDHjUGPJs3T0cwM4UxQAMvCeVeCl7FbTGBWKgp
	r3Ofs2dyfDeidkXx3EW9pOBb6fgvPwAIOFPgakIMNRVaHHtcXeVBVect7DgBzrvQXfDc9R9sdoGsn
	QU8P21bMhTmkmRaZ/1jlUqYqk1ZWtyEUYEZKDGIMbdsRu9Fc1J9uKZdgPL9YHjjpm5hzh4H8vxP8R
	nGpbjsfud68Ap3fr182pc6Fn+BTfdQDiQIh84epNlBEeg02avQhuJ1pCk6c846qal7pEYA1CACH7y
	Tzlc8PoucMjWSPWWvMuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2PR-0000000C6Km-0dvz;
	Thu, 19 Nov 2026 13:42:41 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2PL-0000000C6FU-0QAT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:42:36 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso1138339f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 05:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095752; x=1795700552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9qeJQ2WcAvPP7/Q2COJ9+M/C2lXq9FsH5eUhG/hiMvQ=;
        b=b/AfWcBrIUf+5HEOH1BLBiNOLd05s7EWi0tE+p9KCjhbhqEnMRCkAJkdWS/acGpnf4
         MlUapnYpKbfz2fHZqXsknDKAEAeH+rWOHg4aoW3a8U5UnkaxB1jDLwZtmn9Hl86+Exbf
         3npQdF2J2JYvq+C2kSGPkPteiazjMHjISccz8NZrUCSpXl0K1syJqVdJbpqOW/hxME7+
         YPAz85JbEuTgBpkUUOuY0/v2SzqleilcROcxveCEUTGeS9PmBpqWj0QV4QlKGBkMs5gz
         WMfuJOzA4Y0P4k3sd+YTkWUGgE5pX0VS55eFBGQJkOQVA6J4Vh43S0VN/+hnERIK6Y6t
         9LDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095752; x=1795700552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9qeJQ2WcAvPP7/Q2COJ9+M/C2lXq9FsH5eUhG/hiMvQ=;
        b=r8SM+eHTgWSug8VjDGTR7bxZK+dlrlyhdsjTNZfYp8egFZb5YoKWBkRFx0zm4C/FVL
         NZuJUJbJarq4NcZF/MxjNN35PfqnJe39DGNHH56OUZWucbhccSrj4C+YedT99dzl/HVh
         6ohsB87H669P7k+/wZmIjhicexe5qHQmMuXSo3nyoJNhfnW+ZXe0LJTw8OHwwDoLGckl
         3xj5gV/XvBId7HC0MWO6bwsIZE+Ey9OmromcT8vTyll6uT+0WKaYDe0gK2oliKDtwP/z
         KJEbF1u2iQxWYJgxgT57ppsCGtCjjLwgj/UsYEegAw/A6+SWmAjIsk4p9loCLp4PrWAj
         mxTA==
X-Forwarded-Encrypted: i=1; AL+hErFb0LGNw3SZqNWMvXmDViTbkgjlork1WcjCK3NuVu8ejXMKfv9Ed1pLZ87979PE4er6jU2q6lIIp6ZCDPRXIwZf@lists.infradead.org
X-Gm-Message-State: APuU4Z81wfQjTSbFzRmUCiM4njG9yxPFYwOrPuWW0iSFxEVd87zQ2IN0
	FR/9GweKsfs7lc/xgBWOgZWpW0DqV0Qh5alClDqPSGqkaphn2RKDZgjG
X-Gm-Gg: AZFdTZdurLMc5JGE1xvbzJ8MHmvB10G4dgDcOoG7yVFDKnlNjkU0Y7//kRagta2Nrzk
	wO10nC1Tgu1cGGFyu0QkmAtq8HsFx5NoJXR2EW6CwwKAj5l6chMHht+KH9Gh1hxIZkzqRj/1JQN
	2CVkdjwYG5LIc+q+jcejJJItQC9MK32Qjy5jlq/dxZCMTRGxUU8Gc03QVuAFuDDGMipDcngomwr
	0z2x86M+yXZZddryJliSe/3lD83FvCJ6GlDd3/MromuMh+BkPzojbVpVLYUtaPXktH86/ng0454
	293vT0Imx7qr+6mDVx0qS8Ya8aZVUjokj6j04jgoGL/o4TC6A7bdkMhAn9D9AMy33KXwTAGdgnU
	/I+KW/2cNqELx7FLswPA5lCpN3bfkwviLhkn2LVmMuwqkShIkP6bfdzyoUIaHEbkVN7K22PghEd
	oIp+0yLupslj/y42NTg2NgzppMGlEzHJtBDbXoqUbpmYYxCU8gzq4pN/LmSGxFcFpD68XeJbszp
	RSiXmMd8r1NKubEk1hhJd5Fh2KkZapEg3Xc/uO3A2i1lW7Jz9UGOTY+sm2ALRemhdygYpvGiijx
	YO876DuuFwctMIfqDDoFIc7Da5CB0eqGak1v3659js9EUhuad88NlxQX
X-Received: by 2002:a05:6000:2c0a:b0:4a7:1fca:e52b with SMTP id ffacd0b85a97d-4a71fcae766mr11850285f8f.19.1795095751841;
        Thu, 19 Nov 2026 05:42:31 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095e98sm9437971f8f.42.2026.11.19.05.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:42:31 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	Yao Yuan <yao.yuan@freescale.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v2 3/3] i2c: imx: return -ENXIO at once when a DMA write is not acknowledged
Date: Thu, 19 Nov 2026 14:42:25 +0100
Message-ID: <20261119134225.265242-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119134225.265242-1-mehmet.fide@gmail.com>
References: <20261119134225.265242-1-mehmet.fide@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_054235_208154_5B80253D 
X-CRM114-Status: GOOD (  14.20  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

When a byte of a DMA write is not acknowledged the controller raises its
interrupt and no DMA request, so i2c_imx_dma_write() blocks for
DMA_TIMEOUT (1 s) and returns -ETIMEDOUT, where the interrupt driven
write returns -ENXIO.

Let the interrupt handler end the wait when it sees a missing
acknowledge during a DMA write, and return -ENXIO. The last byte the DMA
writes is still on the bus when its completion arrives: look at its
acknowledge once the byte is out, before the final byte is sent.

Fixes: ce1a78840ff7 ("i2c: imx: add DMA support for freescale i2c driver")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/i2c/busses/i2c-imx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index fbfabceb29ac..06b082c677a3 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -480,6 +480,9 @@ static int i2c_imx_dma_wait(struct imx_i2c_struct *i2c_imx)
 	if (!wait_for_completion_timeout(&dma->cmd_complete,
 					 msecs_to_jiffies(DMA_TIMEOUT)))
 		result = -ETIMEDOUT;
+	else if (dma->dma_transfer_dir == DMA_MEM_TO_DEV &&
+		 (i2c_imx->i2csr & I2SR_RXAK))
+		result = -ENXIO;
 
 	if (result)
 		dmaengine_terminate_sync(dma->chan_using);
@@ -1123,6 +1126,9 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
 	switch (i2c_imx->state) {
 	case IMX_I2C_STATE_DMA:
 		i2c_imx->i2csr = status;
+		if ((status & I2SR_RXAK) &&
+		    i2c_imx->dma->dma_transfer_dir == DMA_MEM_TO_DEV)
+			complete(&i2c_imx->dma->cmd_complete);
 		wake_up(&i2c_imx->queue);
 		break;
 
@@ -1248,6 +1254,9 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
 		schedule();
 	}
 
+	if (temp & I2SR_RXAK)
+		return -ENXIO;
+
 	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 	temp &= ~I2CR_DMAEN;
 	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
-- 
2.56.0


