Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2166606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qY6Iz0HR;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Abevh6yC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JDEDLRxX+y+hxeESjxpnyx7awbIDm3QHkdvwKR0hu5A=; b=qY6Iz0HRnv+It9
	E7qX3cnSS/ZX8S8tt7vYD9Zq/kec8xz0FzDkcBh9vOd6ayYbOO8BFq96vzKo9p0qbE92kEu7+jAoq
	+iEIEBneMRXTqIBTaONpMRLofd8Sn/M48SVkCerTIWOXiOC2CdzdA3cC2eb5ZWnxMW6L/hthQAfFO
	RMxhJfH+504e/Bzwfa4VJR8KICLYfpr9M+8nvfGVyeCyblAUrCsqTJKtDERVXonSvT39mHF4oH9jD
	VuhNA20SD1eU1TcJdSN0Iv+agbEU9dGc7uJjMddOb7hUG3PyLZ2G4baYyQ1ppzhDrZ8zU66liZAcT
	HymQ24wQPI4o4lZxgwIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuvr-0000000G3w3-1rvi;
	Fri, 27 Nov 2026 12:20:03 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuun-0000000G33a-0Bce
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:18:58 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so4763306f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781935; x=1796386735; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDEDLRxX+y+hxeESjxpnyx7awbIDm3QHkdvwKR0hu5A=;
        b=Abevh6yCr9sr1BdK/PcGjlxE2sKjb1o3kOsi5Qd2OUNytnfaEXe/m4oBvAlC5QI1Ph
         BR4EiSke5BC5hnNRuY3GSh5y/jfvhaETnFB7ellXcxYEt7WlFSsyqYqk6UyExkzvZEEC
         2FcnUsfMS44m892SEWyFXm4nP0wCsgMZkSvIDgeDEUY+g1aPkFB7Z8qshP15qtEx66uc
         rm21V1x6zLV8/qAfo3mSvEMIPRR8A970OOK9RjrQvtRu/us6iQKUC7nD6FVwHWT4J/GT
         40YHLsalPyn+xkJ/Dyyr7sUeLu1Nv3O7RPiqsQfL0KU3hGZgVPjr487D7DQJvMcbt01s
         haJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781935; x=1796386735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDEDLRxX+y+hxeESjxpnyx7awbIDm3QHkdvwKR0hu5A=;
        b=TGLWrnNPXzfDgA4j1LVby410ZgGawiit3StDOzxNUkGYIN2JzP9VuM0w53WwlqgaeR
         sEK5e/iFe85+6Ke7LDn+Sj5E8nhrE5a9Cvz/Rn0c+pHiKfcpO5U0AWZWBGi1pCC4yfUH
         dclN7210EyRgvrIOIaBsdt/SFGay6f5CJE+UafwHxeekP5wKg43ooxIfnGgGwsLWKNrx
         /mrZdbcHCz5fKQl3DzXB5v0ztiN/tIYL8IGLXYx/8cbWLEZTB7h3Zz4T9olWKaCxdNJY
         g+30LdYCdmW3PPmnXmkU4zmKazyWMWAbJa7mQvILYfZ+8gb5cT//Y++RvAN3JWyeXIOd
         k7zg==
X-Forwarded-Encrypted: i=1; AL+hErFCCqwRV7zhrlu7/xkxBjj1+2hxpznw1HJjDObKdsuobY4n7lU+VjxfdhSU0/ZTu3nt4/ltc+Ct6GcU7CCKC8F1@lists.infradead.org
X-Gm-Message-State: APuU4Z/AjXn5kr6eBx367+3MBzxv7DyCLu3eInLn4I7F/6Cfr6wzTLg5
	s5HwlcPwcrtbX8KsFP1zgCPtkzC5nLWr4LKVXExho5aLjpkozB5PM4iH9r98oxxQApM=
X-Gm-Gg: AZFdTZcqJLtUKFLF/qJ3JaNk7VKppN0cKO5f2D1FmiHwjYc0BsD+XtYeLwgHzAD12tL
	DEevnkZAA/cRZf0G+96nqzCqLvP2DZFByKJaWT8BtpMBVyZeKwHpvS4/olxZXc30ssiQVC7wXeY
	JWkc4WdkYZtgRi9Z2+NHAp7USC6Dkz+1tecwZ7OaF3x1DeWYQNftq+BspEw7vVBAzKNbzs5Sz01
	GaUvTNbu4pVJsYk2TvfFrWStCcgIHBGXzrWbK6Qk9pD80DtKEBnQDgITLOtaOd3s0/cBlIcAAXw
	tZrPdJ+KBgL3K8bFqwzg09OZsqKBK//RKXZ31WXMSv4naezbDb3SOA9q3yoJEVtur4gczb71inu
	RLYG9zjPeukf7Hf8RxuCRc/l0MXOQeeBhHpEVMALgm9+nRN53bra37LnKc3qQJQD+U1KxwGeAt5
	HDEe8R3zbpDN8Qe5qNVxRoSk8jVAecUQDu8KNwcQ46AMi99bRAtXxJkP178lrRfh+oF8OCij1ik
	6iv96v8Xp7XRoxOdgTl+UKBwrbFU5ol/iuVoAbjQI1v033y9gpm++qJL8qJisyOO7xQIL1l7Gi0
	tkFfIKyDDlu+VdSAw4/nRNBH3GYc
X-Received: by 2002:a05:6000:288c:b0:4b4:2ce4:6dc1 with SMTP id ffacd0b85a97d-4b42ce46e7cmr29398834f8f.44.1795781935043;
        Fri, 27 Nov 2026 04:18:55 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm45163333f8f.56.2026.11.27.04.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:54 -0800 (PST)
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
Subject: [PATCH v4 10/28] dmaengine: bcm2835: make address increment platform independent
Date: Fri, 27 Nov 2026 13:22:00 +0100
Message-ID: <20261127122236.4976-11-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_041857_125995_53339B9F 
X-CRM114-Status: GOOD (  17.05  )
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

Actually the criteria to increment source & destination address isn't
based on platform specific bits. It's just the DMA transfer direction which
is translated into the info bits. So introduce two new helper functions
and get the rid of these platform specifics.

Only the memory side of a transfer is incremented, as the peripherals are
accessed through a single FIFO register. DMA_DEV_TO_DEV is not supported
by the driver, so the helpers only consider the advertised directions.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 0ba23ec6b6fd..1fa7cbfe3c2d 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -275,6 +275,20 @@ static u32 bcm2835_dma_prepare_cb_extra(struct bcm2835_chan *c,
 	return result;
 }
 
+/*
+ * Only the memory side of a transfer gets incremented: the peripherals are
+ * accessed through a single FIFO register. DMA_DEV_TO_DEV is not supported.
+ */
+static inline bool need_src_incr(enum dma_transfer_direction direction)
+{
+	return direction == DMA_MEM_TO_MEM || direction == DMA_MEM_TO_DEV;
+}
+
+static inline bool need_dst_incr(enum dma_transfer_direction direction)
+{
+	return direction == DMA_MEM_TO_MEM || direction == DMA_DEV_TO_MEM;
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -340,10 +354,8 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
  * @cyclic:         it is a cyclic transfer
  * @info:           the default info bits to apply per controlblock
  * @frames:         number of controlblocks to allocate
- * @src:            the src address to assign (if the S_INC bit is set
- *                  in @info, then it gets incremented)
- * @dst:            the dst address to assign (if the D_INC bit is set
- *                  in @info, then it gets incremented)
+ * @src:            the src address to assign
+ * @dst:            the dst address to assign
  * @buf_len:        the full buffer length (may also be 0)
  * @period_len:     the period length when to apply @finalextrainfo
  *                  in addition to the last transfer
@@ -415,9 +427,9 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 			d->cb_list[frame - 1].cb->next = cb_entry->paddr;
 
 		/* update src and dst and length */
-		if (src && (info & BCM2835_DMA_S_INC))
+		if (src && need_src_incr(direction))
 			src += control_block->length;
-		if (dst && (info & BCM2835_DMA_D_INC))
+		if (dst && need_dst_incr(direction))
 			dst += control_block->length;
 
 		/* Length of total transfer */
-- 
2.51.0


