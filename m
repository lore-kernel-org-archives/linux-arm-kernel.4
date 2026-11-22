Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E144606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 07:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qAjIETT3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=De2EkzP+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UnoQBYDYgrvm0uzeAP1oNmC1dNptSUJaGHHy2JIxghI=; b=qAjIETT3winAS0
	Pvv72pU6M+77lUNyG4eVu1IWXbeuuQmoKVEv7qfcnRIB3tN7TYN6E/Vzjq1ZlmChHKlBDUgTl8IiT
	jH+RUaA75RHudZGyWQQRhQxBDUGUXxoxMKyMRWWUQfqo6hf36HIOsdVgwg6nlx5lF0M2ZzYVAO2pm
	aiPzbJukG5M4G/OZfaCtLOJrv3HajFofh2pGxeg7elH80Awdd1bOMw/Ac+9j+bPFPGQP+9U9S1SZr
	ef9lDnjMtlKJh56XKYlO8Yn+4B2DWgE8P9eFVg6DOXqhj0vJgt+MKe8dCi6v8OMqWLgXCDK6PPjzR
	Ohmx1yAcjOvUXSHfTqOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV2Ss-00000000qZr-366c;
	Sun, 22 Nov 2026 07:58:22 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV2Sq-00000000qZ8-18dg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 07:58:21 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3b3fb193c03so986712a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 23:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795334299; x=1795939099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnoQBYDYgrvm0uzeAP1oNmC1dNptSUJaGHHy2JIxghI=;
        b=De2EkzP+ULiMsmvtck9m/uunFgmquolPSZ5qPNRao9Ln77rHF2Q4MExYjsFr8LtcQe
         R74HktTayOskOKmnMMtTc3qIE3+0337PtZ55mNxrWIt3srxzUvcc+KXmy444K0AEW4Oq
         JEKCHZQ/DJoaF88tDgwWjZELJFDP/7HWrjLtqsu6rpZaS9iGE/Isg62zJgW+YCqPGUxM
         CE83g6O3SyWPv4Eiob7fWtLkFBWdmUiwAFWUlrrujWpIZnyndWEHSfApME6fKPjJ5Ns8
         B52QqbDrmcTB0N/xVb7r9lFMlfQH2gLf3vrqSOrnJT9FbY9u0bidenB6fScEucrAoczL
         eRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795334299; x=1795939099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UnoQBYDYgrvm0uzeAP1oNmC1dNptSUJaGHHy2JIxghI=;
        b=K94tqT/cNoyL9Zp4/gWywsqc4DPi7ZgQnuLxLShodWT81WuILFEuLBlXzIBNX8ihnl
         dGiOP6Fb9eUnU1QYbnsURwGv2e+utorLvCXDk0QJTM0h7yHjm4BvgnltdOuoLAPcYPZc
         kTaIDCxUBxNc+XPcHZbaz7yYmIfyLphM+b2vqQ5JD5hA7A3uTbTr1eXXVIdF0SdxclG6
         zUuqRP4ekywYkAxB0XByYhd7ouT614nLEyKUvBBDRR9Kt4EP0UUlP77dyulJ4iQELIb2
         +niuTSRa3w3h1+fjofSVoOiodbZDT4CuITheRilsWeukLyDF9X9He4obtqO7QInVogZ5
         Cl0w==
X-Forwarded-Encrypted: i=1; AL+hErEprr7jVYD2o4/tjmQwPlaHv2ngVl6ZXD0KStdq+R6wE7jxSZTviuN9Lcq6ONZjffUrFRJVT8ThH+bbjZJRiTAZ@lists.infradead.org
X-Gm-Message-State: APuU4Z//oeK8/2NhOCLIsmz3hOrKHo5Q2X56vSb/yD2aWoWKdGz/vytY
	bw3OzulghNaTd4+NCV7Z1wzx1MeAdQ4oPtT80OB+sHg9KOEFw5FhmU2v
X-Gm-Gg: AZFdTZf3APfn9m0WeGxXBEJZV2P7uT0s14gqgEczRoWtFfTXkK/wFX5OQ9DLSTjAnmV
	7ERXiDE/ohANDL85eHXgrZPjYf/QQmWyvIiP1SvXmVFm4j7NnqZYbh8vYfcvumZktUdZuCLy2Rd
	m+pHH0cpHQEQULJSaayhQLb1XkoLPioIe/w9TKzq11J1Pb3gpQpfG8Yj5EWpzj7A8Q7oznkT4ca
	5CV+AO2Iyuh4atCQze3IZWssKSUoAIVmnhvDU5FNcM9ZslciQLCB+drtuo99KCuWaKkjOWthqHL
	WaZ329QaLgvXMaxJrL1KpBFyzv2fcWhkNPUqIwNlwXiBvnDcv/O/Im0XHErFdKuvjVYNxpX6eRi
	H3jDQjHZ6I3NntDhQnJsNDJueh+74cTkd7QQV8yLSjUSgrZcsgI5P44kNRZnszGJWeamJ8NZcao
	jzAmEA0X3JL+QfKlB0EseVDUzX2nnOsITiVhODFbrkAPB4r5mfJhVYe5l23EFWMZMeBW1tkQQRy
	eihGX++tEZbsKYD8A7b6EFtk+q/UKRADNx74B6Eca4x9/6XXFYS13UMZwv53Xx7d1vrwLbSNcT5
	GabhjwUP2f4dJF7MLjd8HR5br2YF77A7Cg0+Pkt0BLr/he026A==
X-Received: by 2002:a17:90b:1fc4:b0:3b0:9e2c:9b60 with SMTP id 98e67ed59e1d1-3b41c98a145mr7001710a91.21.1795334298573;
        Sat, 21 Nov 2026 23:58:18 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm11570028a91.3.2026.11.21.23.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:58:18 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: wahrenst@gmx.net
Cc: bcm-kernel-feedback-list@broadcom.com,
	florian.fainelli@broadcom.com,
	hemanth.selam@gmail.com,
	john.garry@linux.dev,
	kraxel@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	ulfh@kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v2] mmc: bcm2835: restore scatterlist after DMA setup failure
Date: Sun, 22 Nov 2026 01:58:14 -0600
Message-ID: <20261122075814.162099-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <fcfc5d38-2755-445c-8444-bd4c5b9c524f@gmx.net>
References: <fcfc5d38-2755-445c-8444-bd4c5b9c524f@gmx.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_235820_452588_8E500C9A 
X-CRM114-Status: GOOD (  15.01  )
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
unchanged. As a result, the PIO transfer may omit part of the
data, potentially causing corrupted or incomplete I/O.

Restore the entry's original length and clear drain_words
before returning to the fallback path.

This issue was found while investigating a kernel panic on
my Raspberry Pi server.

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
2.56.1


