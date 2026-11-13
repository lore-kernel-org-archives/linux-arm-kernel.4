Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3656074129
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tVwdx/Mq;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=0p7OeW18
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xcF/qRmyMdOcWsOsmn4LsTlUoZBs0bxa1cPGLKlSvKA=; b=tVwdx/MqIcgea6
	yxJx/mcddlgd7qAKVpRXW9DN6+qRGYenWwUPBccPDuq5Apz5qtGte2daNigITMiUdh7vY4nOTMRPT
	nKrVblc1wF0vZ/P6zm9aBGtzn6sC741jcnE/t8STPtxL67PUd4Ei2SLhYcAPlrhLIhSIgJOefh89r
	tEDqUAE/2iDqXi65Q72alQmpFF/5cGGB3AB/mFZ7z5a5Z4Yd2Rv32s6EoABhi9iT5knGCbNHU+eRa
	fHHuX/57TbrUDOi25hJzJCrHE6ceu/P9cnhwzoK6A0b/aSoFj2B6rG/8mmP4p7uf1Dn8FEE0Dqi1a
	RXVI4owT43Pw7Qd1ZBSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrfk-0000000D1YF-3AuW;
	Fri, 13 Nov 2026 13:50:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrfh-0000000D1V2-2QSF;
	Fri, 13 Nov 2026 13:50:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=xcF/qRmyMdOcWsOsmn4LsTlUoZBs0bxa1cPGLKlSvKA=; b=0p7OeW18XEgf5yUUxxL+rm36R7
	W4i/tSfFKSJ2JkbeVi90tL/9hiD3OvJnb5AXmcB8NAHOkN2hOGN5p4KTwJWz+H2JP0JGjznhRM5il
	aJI6r/IMW9Hi+mCNCwcqJqaij6bB0OpPVRnhiu3LPl1JWw5eAuGjG8Cv55fMHQgZlM+B1KQcwjP3C
	Ty/gSUT7jkzyhMxtpYXmFQrlV/4hAC/Nn0sXIO0o29rPd2liPwW76BGpprAx0xxV2UkL076zJ4GRt
	KcSyjuznFnVpYNPlM0OZZNj3ROMJYwjAOci7W+2gWOVg+a9Ov0jWaVLlIQiaD5mIy6jLB+PHfdB/p
	PVU+w5Iw==;
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
Subject: [PATCH v2 2/6] spi: Export spi_set_cs() function
Date: Fri, 13 Nov 2026 14:50:13 +0100
Message-ID: <20261113135017.1047959-3-heiko@sntech.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113135017.1047959-1-heiko@sntech.de>
References: <20261113135017.1047959-1-heiko@sntech.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_055029_640780_B077A338 
X-CRM114-Status: GOOD (  12.95  )
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
index e79f16aca1a3..b268357e933c 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1268,7 +1268,7 @@ static void spi_toggle_csgpiod(struct spi_device *spi, u8 idx, bool enable, bool
 		spi_delay_exec(&spi->cs_inactive, NULL);
 }
 
-static void spi_set_cs(struct spi_device *spi, bool enable, bool force)
+void spi_set_cs(struct spi_device *spi, bool enable, bool force)
 {
 	bool activate = enable;
 	u8 idx;
@@ -1325,6 +1325,7 @@ static void spi_set_cs(struct spi_device *spi, bool enable, bool force)
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


