Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8071D606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zyk5xPgx;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OM2+QuqE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JxDKEoGRrpB16fYCd/JI86ZtPyeRLyCQkqjj66jBYHw=; b=zyk5xPgxCnuRCo
	Aal+3O3oZWbakz3oalMjphRwbTWxvMcCuP/VXHpioO2+pJ13QCENkHVbZrAismD7RJ3AfFJ51phwb
	dCA31qsNmFF/6QLj+8ZVhJM5bjTiyrWeLfPc0dPydRsJf+cLAWGpidMeD5x2b4PLYUK11LO7hsNfi
	MpN0Ttd5eBwEduSA6jroMMiB9yEdbnNsKJ5hvVXDEWk9RBT2O3CYXy/GFgVDM4ZtFxOmvpNvCboPJ
	+yFHUkDZdRxtxWVEi+EkhjlQCkqDgqLYaFyIF4cbfkPKJx84lBkmzLiSHeMVqwv54SQ9h4rAQaS9J
	WcmDm7a/B/XzZk1lV5Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQj-00000003ohn-3GYE;
	Mon, 23 Nov 2026 14:54:07 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQH-00000003oJw-40sK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:53:39 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4a358881793so1693351f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445616; x=1796050416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JxDKEoGRrpB16fYCd/JI86ZtPyeRLyCQkqjj66jBYHw=;
        b=OM2+QuqEPNHeb2V3swCZRlFK4DYaTmclFGzeCJdGn1cuk9ahfC0yxazi5I1VDiKI1N
         6mytb/gc/iHoWLK2ShAJUhmL2owjzubS6zV3NAc9SopZk6m5A++Xto1afq/MBeNXhMnw
         IeytZ3n0qYIvV6/HDF7KqBzM/Y2K7rP7yJTOZF2EgxMfmIWjM7ZqZGqUXngS6bzE+ruo
         hFbIKFtzyVdkR+J1cUmfDXAQBoMZe8ZvdArbCMZ9+DEybhB/LfdaSY1BjRjOd5n35r3C
         ssJrsCGHMXgca0wxWxvQ56eaD94kHwxnnVc6o1iOSTd31OH+VsTpYVaUjO/l+PJ7ACgf
         JLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445616; x=1796050416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JxDKEoGRrpB16fYCd/JI86ZtPyeRLyCQkqjj66jBYHw=;
        b=lucb1uuTEXR6W1zdwtzq/H3KVqKglay0lXBbb4QSqYEKXYsUSWi/owptXhKN+VROnF
         aRTaATx4Ai4bk+4FH0pQHZi7GZz3z1DDlDAUJMS5Vb7hH9fAsTZZDNMRG1UxPq5YI71n
         5SLXZBBS0MarDgb3TAA2bSi2Sb7+UnbDWu/hEI/7qfbmNsxSgtymc9QnOIIG+WffvCEa
         nC5Ii4uG+UKnjFN3jH2Ad32DgaSnqL2bJyYAj1SR7w5IOOK9LGTS7cJRzJ72N75U5Q47
         BdXk3y/3D5OBsBC44HhumZNLjBM4Qc7a8bAjFyJ1YfT/RiTrQTkSu2E2c0uiLWVeU7s2
         LmMw==
X-Forwarded-Encrypted: i=1; AL+hErHXG9fRKifZGFdi/S9+Y98U+6VoS+Oq1oqJKit6d3dMZ/Zz6nFZXJ1BQ4JLuqR72/TXyaCJFWWe0vV0NI69qPSC@lists.infradead.org
X-Gm-Message-State: APuU4Z/97taQjWJMURt8YB4KwJ2sG2ODjUgIgHL9mxzFdgPW97+JXbkV
	s5UCl30aOUtogdWo8l2h9QZiULuS2t6V2EPpEFIel8B5MSxG0OIMG+QwyHSqXAqaPgo=
X-Gm-Gg: AZFdTZcvYyTxY60jPM7i4ePMU+P7pwUv2lAvxUBdfqxUXZnwQqqBxc31czDKFsHCL8G
	X/PQfldnOYeHmFhECZbUzRsCjae/qe7iesC/4JXLaVgp8py4vVSaFxXhJEp5WDEgt/AbhzCNvi8
	2HSmr+e1WZuAh0b3XJig85uCJ/8bH5Q6oPpwQbbBQcokEW3sEjQcdPVZRIPxBnkqlmSWT9nOkKw
	MUS2nbkKEM0TbSjkEJiLtDPX0wATsAx9N4j+qpoAPA5qcucyTRnZz+cewQ8rrEZdbO4jw3uxWla
	f6honA6cgg4gIxghMqi3FKGzhZlUE7JEHdFOX4IlGP/onWxLs6gCr//AZzNBzDyEG56HGTTh4bv
	iwvhNtIZ0sfl/yKb+f+0SXukQPX7+yFDByQjC7863DtcWsJUUCYWRFOQTiHcaO5Id7CdrMUEXiN
	WklpVULzfQSRvTsnahoeJYOoTMm8P/jeYUns+5A1Wyb2o4KP83rPRO2KPeVpjneQpS9eRSo+dwW
	O/bU4kE1YV0YlsWFFeiDvuAjp+QppSo2xuKl6ewIKeDbC5zrs00oudBNH7ILY9A6CLcAUD7mZSk
	CtdMhl0BCk4w
X-Received: by 2002:a05:6000:29d2:b0:4a6:4591:e4ac with SMTP id ffacd0b85a97d-4abb3b42d80mr17490933f8f.15.1795445616375;
        Mon, 23 Nov 2026 06:53:36 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm22698782f8f.41.2026.11.23.06.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:36 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 03/28] dmaengine: bcm2835: Add NO_WAIT_RESP, DMA_WIDE_SOURCE and DMA_WIDE_DEST flag
Date: Mon, 23 Nov 2026 15:56:41 +0100
Message-ID: <20261123145728.29082-4-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_065338_032181_34750633 
X-CRM114-Status: GOOD (  16.04  )
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

From: Phil Elwell <phil@raspberrypi.com>

Use bit 27 of the dreq value (the second cell of the DT DMA descriptor)
to request that the WAIT_RESP bit is not set.

Use (reserved) bits 24 and 25 of the dreq value
(the second cell of the DT DMA descriptor) to request
that wide source reads or wide dest writes are required

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Phil Elwell <phil@raspberrypi.com>
Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 690f5ba1c439..118ba2f71dc8 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -145,6 +145,21 @@ struct bcm2835_desc {
 #define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles */
 #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
 
+/* A fake bit to request that the driver doesn't set the WAIT_RESP bit. */
+#define BCM2835_DMA_NO_WAIT_RESP BIT(27)
+#define WAIT_RESP(x) (((x) & BCM2835_DMA_NO_WAIT_RESP) ? \
+		      0 : BCM2835_DMA_WAIT_RESP)
+
+/* A fake bit to request that the driver requires wide reads */
+#define BCM2835_DMA_WIDE_SOURCE BIT(24)
+#define WIDE_SOURCE(x) (((x) & BCM2835_DMA_WIDE_SOURCE) ? \
+		      BCM2835_DMA_S_WIDTH : 0)
+
+/* A fake bit to request that the driver requires wide writes */
+#define BCM2835_DMA_WIDE_DEST BIT(25)
+#define WIDE_DEST(x) (((x) & BCM2835_DMA_WIDE_DEST) ? \
+		      BCM2835_DMA_D_WIDTH : 0)
+
 /* debug register bits */
 #define BCM2835_DMA_DEBUG_LAST_NOT_SET_ERR	BIT(0)
 #define BCM2835_DMA_DEBUG_FIFO_ERR		BIT(1)
@@ -605,8 +620,9 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 {
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
-	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC;
-	u32 extra = BCM2835_DMA_INT_EN | BCM2835_DMA_WAIT_RESP;
+	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC |
+		   WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
+	u32 extra = BCM2835_DMA_INT_EN;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -636,7 +652,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
-	u32 info = BCM2835_DMA_WAIT_RESP;
+	u32 info = WAIT_RESP(c->dreq) |
+		   WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t frames;
 
@@ -688,7 +705,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src, dst;
-	u32 info = BCM2835_DMA_WAIT_RESP;
+	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
 	u32 extra = 0;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
-- 
2.51.0


