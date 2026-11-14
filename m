Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7F1606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 05:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RZ4b7DxA;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LoJud9Z8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1nOqDeZUOqhBqrS+LB1gpt8pjUJMSW9vWxZMjrz4Bh8=; b=RZ4b7DxAJ2pwTQQvd9KkXo8rDM
	AGGzmznEv/i5P3fTII2qCEqAqOnn6noHq7gzeKGoUgkDVPLPr6xkjXafAaDSt1832ru7mGSObVS4S
	nReDZnYkhwLLLlOufGZoy9nOntnbZ8IBm8QGf8AKXJJXB3Z+/VQvgpI1Ase6V6ZhRUs0ujj+BOPeP
	w4lHMK4F4DkhnTnmAx4jOeo7tDsZZSOGJPpUrczlNZTihvddsUhu7eAVzBOACch/Cxw7SL50wCkQf
	kaJw77SMkUBe6AK78rlefbMEm++/rTTH59Ib9r50lL06602FhulyAz9gWLxcIoqzAAm5Z7nVtn7MV
	PekYRFng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS61p-0000000FUAZ-2oxy;
	Sat, 14 Nov 2026 05:10:17 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS61n-0000000FU9j-20q7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 05:10:16 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ed2b4348fcso5946635ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 21:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794633014; x=1795237814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1nOqDeZUOqhBqrS+LB1gpt8pjUJMSW9vWxZMjrz4Bh8=;
        b=LoJud9Z8/JOOrGhR2feaSxK9X3WCeU+0nLkBAB/Kt4npDGrl183bCBjEQRvooe8xhL
         a9sBigxqg//aTjJpxswKUnSQ5nqNRWGkDzPVGRoApTf0cHo/Its4ahQiviCS+OlACT0C
         D8w+wzTiJROGwchXGK58h3Ey9duE8x+NTjqPaadd/kaLC9JF2ZEgt5mIbEQG/nxpSFj5
         rCPKKu7BNLHr6mJ2W2oCTesKuTUZvJuBBDul35UKy33LtJx3tOBeMi+LWu9HjQncwfgY
         Ygigt5jQswWibmpcLAvwchFbwHVGhz8nZlD/lrZTGK+0LFEnbOLCrzsL1EN4sVXXDQMd
         x3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794633014; x=1795237814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1nOqDeZUOqhBqrS+LB1gpt8pjUJMSW9vWxZMjrz4Bh8=;
        b=IU9sChqD0/Xp2pePqS2/mblX4Rrc+CjbCygtc7sR/mUm63Rnl9w6yVY7X/Xs5RUo2k
         sPUUT2nBOOTetRlch+uAOEHMttsFh8xlJGpnkJQF5FBChRyflWeTAuK58gxcaBEblOVZ
         zA2IS1xz/90OemeeQbCpZZUPsqqqb503iNYrNbg8/iCnjVG+89RkjoQoTAH1lAwtOMSu
         KgAEwBFVxDbkKC7JicWJhWCGc9IkqhVUSHX9eiIB6oPORRUtUDpfzunkUxyORbGB86nG
         J3J/c6wroCwn9QyRIO1Bd1rx2ssL8Xvou+VRER1C+giNPzhrXjvcLQ7qQ9zdLkXftuoE
         nJhA==
X-Forwarded-Encrypted: i=1; AL+hErGgepQlXYXmlsu5gH1txF4RdF1jTOXFCCuLGWY39a23HxMqwCG8MaAb6nmVE3aOPsU804v5IJyAFmQTYbPt6StX@lists.infradead.org
X-Gm-Message-State: APuU4Z/VFVVwnbcxhUW4yWXiU3obclWLY5fg2Jih4l8PWD8ZDEE3evsV
	TFWbEzKHrkf9zEKK0CesPHyNC/wK0GuvOZeti0pxWy6O8cNwIhbuDbfqtMyB0pvJqM8=
X-Gm-Gg: AYBFou3vK+GgKNawp41Tiej1zWVVyn8HuaoXpH86xz4r75Yw7YVNRjdDxwGKz4MWdqp
	m2EVTN2b1aNud1vMb7yYbc8S0gpWljycQFQpju7FQdnaLVqoM/RkmoZFyzCuky/vwld5S//oJGN
	AU67uQ8W4prk3TkSUQRe5m/yvhBn4cFQsPP+Chn67Ttmg12naFpCHHE3r2UmKe24S3MYNPVO+Ww
	SWf8XFvopK78vlincQypRDrsR8sbGk6brGEwwlesSUQmzFvBBZAGBoq4eURwJvzjjn6A394Gboy
	xfRBjiymxKTVLvfuvN7QN8VTDwLfAu+rrXukHUeifcs3MsMHSja+SBLTxLt0b7hZSorEQEasji9
	M+dkrW/Uf50QWZLAJgZ36OsSy/+8J3vN+bu0pgcghBWyusmaWYuk7fhQcp+4TLJJ6K1ZKwNqrtn
	GIOiy+kgWJBFGdwzy34wbPwPGti35BxjoUSGQdI+XYrGEN0RkRUj9E4JBLndin+HNpRQ4dQjo0d
	jblKUPhn6VsmA2U2sYXLSZbiwtFJm8lp5GImLFheitX5I8RchO4PXjbckVv2dhPSz6wzrOc+6Th
	l2aHfcrzw+dk/AsueUN3mFCenJ+2x1M5hMVT0aY7uoP7o0D2Sv21
X-Received: by 2002:a17:903:2410:b0:2ed:1ca2:ea68 with SMTP id d9443c01a7336-2ee0dca8be1mr43759235ad.49.1794633014214;
        Fri, 13 Nov 2026 21:10:14 -0800 (PST)
Received: from fedora.lan ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f7e4e47sm17849025ad.38.2026.11.13.21.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 21:10:13 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: linux-mmc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	John Garry <john.garry@linux.dev>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] mmc: bcm2835: restore scatterlist after DMA setup failure
Date: Fri, 13 Nov 2026 23:10:11 -0600
Message-ID: <20261114051011.275554-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_211015_526641_AAC370FD 
X-CRM114-Status: GOOD (  14.63  )
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

The DMA preparation path shortens the final scatterlist entry
to reserve space for FIFO drain words.

If DMA mapping or descriptor preparation fails, the request
falls back to PIO, but the shortened scatterlist entry is left
unchanged. Restore its original length and clear drain_words
before returning to the fallback path.

Fixes: 660fc733bd74 ("mmc: bcm2835: Add new driver for the sdhost controller.")
Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 drivers/mmc/host/bcm2835.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
index efd1903c3ccd..49a975e984df 100644
--- a/drivers/mmc/host/bcm2835.c
+++ b/drivers/mmc/host/bcm2835.c
@@ -449,6 +449,8 @@ static
 void bcm2835_prepare_dma(struct bcm2835_host *host, struct mmc_data *data)
 {
 	int sg_len, dir_data, dir_slave;
+	struct scatterlist *trimmed_sg = NULL;
+	unsigned int original_len = 0;
 	struct dma_async_tx_descriptor *desc = NULL;
 	struct dma_chan *dma_chan;
 
@@ -480,6 +482,8 @@ void bcm2835_prepare_dma(struct bcm2835_host *host, struct mmc_data *data)
 		for_each_sg(data->sg, sg, data->sg_len, i) {
 			if (sg_is_last(sg)) {
 				WARN_ON(sg->length < len);
+				trimmed_sg = sg;
+				original_len = sg->length;
 				sg->length -= len;
 				host->drain_page = sg_page(sg);
 				host->drain_offset = sg->offset + sg->length;
@@ -495,14 +499,21 @@ void bcm2835_prepare_dma(struct bcm2835_host *host, struct mmc_data *data)
 				     &host->dma_cfg_tx);
 
 	sg_len = dma_map_sg(host->dma_dev, data->sg, data->sg_len, dir_data);
-	if (!sg_len)
+	if (!sg_len) {
+		if (trimmed_sg)
+			trimmed_sg->length = original_len;
+		host->drain_words = 0;
 		return;
+	}
 
 	desc = dmaengine_prep_slave_sg(dma_chan, data->sg, sg_len, dir_slave,
 				       DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 
 	if (!desc) {
 		dma_unmap_sg(host->dma_dev, data->sg, data->sg_len, dir_data);
+		if (trimmed_sg)
+			trimmed_sg->length = original_len;
+		host->drain_words = 0;
 		return;
 	}
 
-- 
2.56.0


