Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD1A606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sgRrejoI;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=nHtZdBaW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FIDR+CbcYrPMhx79jeVnPIavdIqoZl1OxXu1LX4HYhM=; b=sgRrejoISW9bV+
	rzw/jmx9Tn3yLMnKxXfLhpGBcD6yNtzFcVDvDb2CBbK7r+FX6hkMZQDSjpjpW3T5riom32kucjuhk
	4auI5UVk2pnKOxUu6zUccyPU+a51cOONy/TrmpSJRtyYNSgOZqTWIWCoShtMqZFLzFMu/EUqox4M/
	I6AMdmAzCGL5eP7OS8QTq0qh0Q78mfPP++WagyFiiO8ca0E8xpQOBgRNOlY6smHjSMnjj050ykIfj
	kuvH3Ayh+rlwSz10ZRg/5OShQfkvz4RpiMMEsEF/+e/SvVhnenXn0Cg1xhVIXooH4UQctz2steXwB
	tKwL4BFPC8Z04HN/TGig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2eo-0000000C9FC-35yH;
	Thu, 19 Nov 2026 13:58:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2ef-0000000C9AB-2VqN;
	Thu, 19 Nov 2026 13:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=FIDR+CbcYrPMhx79jeVnPIavdIqoZl1OxXu1LX4HYhM=; b=nHtZdBaWcb8+298HxUi6d5LuLU
	jktbOepkE2mvyOVHnjW8neUeGKueqGdipUVVkjyccH+wQ5wtZFEEZihUVJslujdpBsDeYYvKBftzH
	J6NHGgD+oBmCuxYEL/1xiDJg8CYLYvv36Td5TYf1fxfet1pFPEsrcqMPDC47HW8Cub4Bw6tS582WK
	ftiQ1/XSi7l7ul8wV2QBXXiZpsHymooBIqg+VEnmbmhLEdKJiOKp71DkDt72bUuBcx+EwPBSK1PPg
	LEUYJ7muC2a9aoAeM8kmgpxhxsrM80ytQuz4C539ZSgq+vEOUP7EmN7/ssn5jy93Pgf3jKlud/UiT
	/BlvHUGA==;
From: Heiko Stuebner <heiko@sntech.de>
To: broonie@kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	quentin.schulz@cherry.de,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v4 3/6] spi: Export spi_set_cs() function
Date: Thu, 19 Nov 2026 14:58:05 +0100
Message-ID: <20261119135808.2377849-4-heiko@sntech.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119135808.2377849-1-heiko@sntech.de>
References: <20261119135808.2377849-1-heiko@sntech.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_055825_997002_42208BA0 
X-CRM114-Status: GOOD (  13.12  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

While spi_set_cs is currently only used when the SPI framework manages
the core transfer function, it contains a lot of functionality that
can be used for the upcoming atomic transfers, where a driver implementing
that atomic transfer could profit from not having to duplicate the
chip-select functionality.

The only sleeping part was the spi_delay_exec function doing the
chip-select delays, which can now also run in atomic contexts.

So export the function.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/spi/spi.c       | 3 ++-
 include/linux/spi/spi.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index ec2074126910..0b0bc093e01f 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1278,7 +1278,7 @@ static void spi_toggle_csgpiod(struct spi_device *spi, u8 idx, bool enable, bool
 		spi_delay_exec(&spi->cs_inactive, NULL);
 }
 
-static void spi_set_cs(struct spi_device *spi, bool enable, bool force)
+void spi_set_cs(struct spi_device *spi, bool enable, bool force)
 {
 	bool activate = enable;
 	u8 idx;
@@ -1335,6 +1335,7 @@ static void spi_set_cs(struct spi_device *spi, bool enable, bool force)
 			spi_delay_exec(&spi->cs_inactive, NULL);
 	}
 }
+EXPORT_SYMBOL_GPL(spi_set_cs);
 
 #ifdef CONFIG_HAS_DMA
 static int spi_map_buf_attrs(struct spi_controller *ctlr, struct device *dev,
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index fb4baa0d3398..0bf31776c54c 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -349,6 +349,8 @@ static inline bool spi_is_csgpiod(struct spi_device *spi)
 	return false;
 }
 
+extern void spi_set_cs(struct spi_device *spi, bool enable, bool force);
+
 /**
  * struct spi_driver - Host side "protocol" driver
  * @id_table: List of SPI devices supported by this driver
-- 
2.53.0


