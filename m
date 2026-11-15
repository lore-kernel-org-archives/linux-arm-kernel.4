Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F39606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 09:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ks3vapEb;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i72mXTJJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=R2O9ixsjiKLUJuRb29OcTSyZsQI1rKD89T0Os+kzNHA=; b=Ks3vapEbY1J7Am
	KRHiOF2tQoRMV2xmeOhK23oRJbbQggXwYBtVVpHUiAKmLbzhYITLwRvrQ59YHznX1yfdyUQZWHjxW
	w4DE23aVHsHyMi3dt3NiA2oSI4ZhrvkhRbQaZWDi4xf/aQGUOUBofJlmC2xxsTrhtkn3l4TTG+TdV
	9+tJ3rv/yyIDHo3I974As5BX2uQmCGfrb37vdcsqXACA6GRHTPhsqI2wkG5mJFevNie4inkHJ/vhP
	CznvcT5kS/63ctprhfZq88Ft+B61DhblJ1nKwNlJzV7rWQrfulSYXe/pUhrtarBTLX1uLUgJ3OEUc
	6HEDM9na1+HryB8UaAWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWc0-0000000HK2B-0TR7;
	Sun, 15 Nov 2026 09:33:24 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWbr-0000000HJxc-01pi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 09:33:17 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-71ad047710aso721478eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 01:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735194; x=1795339994; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2O9ixsjiKLUJuRb29OcTSyZsQI1rKD89T0Os+kzNHA=;
        b=i72mXTJJeKOtR6UPyskhQ7fIKARRsibbHubXwaY8upVzabQDbruxJ3TGhnng11JKWa
         SjAR4WwBmQBgM7nLswmcrTHVi+A1FvxM+YyoN3hGnJF42WpMACfNbFeWz76U9rxRRaTN
         MzAFWyWoTvEifrCBarjxUsaCQzV2SA/zU1jBaGlnpUyZcw9niJd+z2Q7TBgQKcZgtlvR
         apoKCYS6Nmb8oUVyNttr8StPC6wXEmec0K/hRIubuTbNm4smWufobDojQx6s7g/N0B3O
         xnLW8yGpsWrOUQC+RIYiE6dd8Gpvx5drSAwS692bMg5yQCUVyeG347pMAhAMWVLTteKi
         ad9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735194; x=1795339994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R2O9ixsjiKLUJuRb29OcTSyZsQI1rKD89T0Os+kzNHA=;
        b=fN/Sg8PWdUC4jmZsCuqBgoyoVqwpQTfH8vSp2Vd5s7tK1GubPwis0DNVPa4raL+gEl
         Wpk6JM/uqdm0+0ZlrfeX5mUnWwRy1UCE2ECo+VgiFN/1xOQUM1JsTmjP7Cjp9zvG54Ac
         TZWOSxpE0/PJNNYimXjVWYShuvc+PDUsB2kv1xhA+QbsqcyOecyuglNjIwT1NwHPwScl
         uDEg3IqCu0zjeR94fSihne5BuXtRQ7Lk48PZOrlUwkmOu/ebSqTg9ncfAtRFsS9az/tR
         BSz+zsj0L5f8qPebOABBA/UbFOr6zXrUXAfmD7ZXJ6qE5s93AvxnQ8B/WHeoVMSLAqxC
         3YVg==
X-Forwarded-Encrypted: i=1; AL+hErE+JIH0mDES1L//jON3l9PsvaYU6zW/1FEczUyIfTAFkdKCBRVY8qzIgsCRUL3bKTrnNrFqIInIPoc+8JGPtc11@lists.infradead.org
X-Gm-Message-State: APuU4Z+DY/caEnRuhuV2LBXnj+NzlcZLQyoxOBlb+eWi7gRhHIR+GuMn
	z6Beb6nZQRfcWZ8Zvzg4uAN7Ic5e92lyqS28Mkb74lEgIU3qRh0D4D7v
X-Gm-Gg: AYBFou3ByK+M0TY68VnEz3vdybXkXO/wTYLUQEkiY4hBjqBPJfkqoOyIpAIvHvdurIv
	bOR3kxTASHerhZZZPQjuIJbyykXWatKiYKh7l3RztqPgf9btrLAiG+mDrZ9CoNRDaZD0GvtSjLD
	yPyODrGyxadAwr0Rk8u0FXzQ2pyLCDBlq8ob3MGrcsD4rfFlN+ATWQYL4fxrx+Xvk5aB+Inisi1
	e2pS7seIO8v31PO2xKiowVXhp7GwINrc7/VgflOFvbrAag1CMScEHlzBpeg+e7Ux6+62/MbgkCF
	XbMLBzDKoJjQnn5//4/Fs1ZrD5rTa7q3cLweYYt2Z3QvKF2WNcTn/77GLkrhz2XLearnT07V1aD
	8bLSwSVeTStWXpVFPbD96Lz7vwRiayxDtt9MqOLN8LroI6ipAQx6qz3QIHAI//Ml7jJ99wjfWgX
	0L3cnkMLpez99d580DnVx80zG4EbKOPpFG44eo8GTN/9B6s4wHlCHTBGND1HbYUGXfWSTZwH84J
	D9rLMurhaf69cTJmloqBywrPhc9GYl13YRiUbwiTWX35U8KLNeKrIDgVyyxEdFy9PPpgi2Su4sD
	RHcRZltGM+7H5qbV5kUZUkxdeVLz0ieMjNQguJoByUq/LU+FOL7QpezdbXPrwQMQ36k+VRIIqPS
	2tpy8MLwkeGSz/TbuYjunftR1g2ryc7qxZ9NefTjt1Fj40go2c24EParAEzlMhtoXiDg/qOO4i+
	e3RCUfd8aOsiq3wGMWW/9POfR817M5xH2S+0hOV2b2NRIgyibqVSk=
X-Received: by 2002:a05:6820:c3d8:b0:717:da:ba3f with SMTP id 006d021491bc7-71ab4fa7032mr3576066eaf.18.1794735193626;
        Sun, 15 Nov 2026 01:33:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:49 -0700
Subject: [PATCH v4 1/9] dmaengine: sun6i: fix physical channel index in
 interrupt handler
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-1-043cd476a45f@gmail.com>
References: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
In-Reply-To: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_013315_078005_93C4F8A6 
X-CRM114-Status: GOOD (  14.26  )
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

From: Hongling Zeng <zenghongling@kylinos.cn>

The interrupt handler iterates over register banks in the outer loop,
but the physical channel lookup uses only the inner loop index. It
therefore handles every bank as if it belonged to the first channels.

For controllers with eight channels per bank, interrupts from channels
8 and above are routed to channels 0-7. On A733, each bank covers one
channel, so every interrupt is routed to channel 0. This can falsely
complete descriptors for unrelated channels and corrupt their data.

Use the absolute channel index, calculated from the bank number and the
controller's configured number of channels per bank.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
[james: use the configured bank size and describe the A733 case]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index a57f530c6f70..885cb237b2b9 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -605,7 +605,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 		sun6i_write_irq_stat(sdev, i, status);
 
 		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
-			pchan = sdev->pchans + j;
+			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {

-- 
2.53.0


