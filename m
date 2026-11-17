Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD24606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 23:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=goKvL4sO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=IetqthzO;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=Mms/Revh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=E+uOyneVmVFOmGSZe+TfjwVrm4UGuXqktpAbFT4fB/s=; b=goKvL4sOEtuRN0
	6TW/U2Q3xTWX0OtxXYKG2kARKMa+Ne86zG8dXQZNwmb5egQgoz2E6DFQClWgse1l2GJfp9yxcjV2r
	xw7ncntp86uMJLC6j5fQ3B/diJO25S+RfVuNHz173JYIK+2ZsHZFql1/78NPXF34KTo22UECrmESO
	S+rt8FScO51fSKx4XxrZVdrlmE+ssOff+j7Tmb8narTzq5ldWuKTniRiwfc4LSYvywpuaV5afs5S7
	skuaFsFvFSPEvpskHH2a7uwAuoS19FW71TUsur8pyTwwuooVWc7w3JMG3dsLIweToDVli6mXnwfx2
	3Mmni0ODcsPISSKTevig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTSx4-00000007JUJ-0DrZ;
	Tue, 17 Nov 2026 23:51:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTSwu-00000007JOj-1U43;
	Tue, 17 Nov 2026 23:50:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=E+uOyneVmVFOmGSZe+TfjwVrm4UGuXqktpAbFT4fB/s=; b=IetqthzOCfih0vLAXHxNuByHcl
	3rd01hSWXkfQWm7yS7GIe8dcN0Ux/vRMFOPoXJYfbzE6a0NSUeBVhVQSih9Ps03oASd0UlNtLn94n
	tSFncBB3NkpAOTKG/9v5LoZNl9b3N/N44npgksU9K1ROrNy9vWqJEhfar4kkd4EvkNivWlr/KdsnW
	lTecAd0EilLZZfxjCJgPpurvcTMS7qURsydlbNPDAQr8Kg6VDEDTBXbjdnaB9yftRhvdF6uGGPwON
	90baP/BODXgO272EPkjFU2w/UplO/0z85+JxBHpoEGCgkvZ/YwNYPFuzmGzg9kRKgTaKfyOtX1DB3
	3lXetyWg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTSwp-0000000FVIb-1aiW;
	Tue, 17 Nov 2026 23:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=E+uOyneVmVFOmGSZe+TfjwVrm4UGuXqktpAbFT4fB/s=; b=Mms/RevhfEzZ6SqVv+4s8Pm05f
	pNj96haiAjK79hLRROvVlFLM7VOp0mCwB88itTGcKcjkBwllRgTv6GI3LBZ8N/jWygqugduI5tK3a
	gl+9xo9sZGHeiMdlmeCmQCW8sJtI2L3uU76mmSlRIYSPX5WwjTZroeNrdiliQOmDpBtDyRhyvWxDD
	cDBG0v7RO17k/l3C3/JM3rny+YJHHwSUzxB93oz001ewZy1bexKTfJpTk7HCfEeG52sKQN7WCAJTx
	o6vdMtF/4oE0r75jvYXj2asXQbg+heMeGW9mv0cNl81755nLOZhPRJb7sckEPwVBnKxgEC79bM95M
	wyQGc3Zg==;
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
Subject: [PATCH v3 3/7] spi: Export spi_set_cs() function
Date: Wed, 18 Nov 2026 00:50:17 +0100
Message-ID: <20261117235021.2013719-4-heiko@sntech.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117235021.2013719-1-heiko@sntech.de>
References: <20261117235021.2013719-1-heiko@sntech.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_235047_686976_0C316183 
X-CRM114-Status: GOOD (  14.28  )
X-Spam-Score: -0.2 (/)
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
index 8a82d7f5b9fa..f04adf069ec1 100644
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


