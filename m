Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81045606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o6Qce+uK;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aJa1KCpG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=B/LK2W9tMRY5x8wpA2h9YuUMfckHvhSfaFlgBZU2Y7c=; b=o6Qce+uKCbpQaj
	R9NrSMgTm95wi58WE4OFugJtyEyf8G+s1iHd1NwMZMCTklo01S9dDreMVpyemtHhebVO///rS30s5
	wcir/lmWrAp5L+HBxtacVOpBeYkY3C6aXn71JwucWJlhRD8Me8Y4EmHZAzUzXvhTZ6gB9ELwOIwJU
	Qt9FSotNJnLCRRtvDtzHdnCqnC1qLrNAi1DFFSNl/smv5trpIIMYLd9FHJ9GtVoO64VnGcD3NNqne
	S/40zIPp0IzVfRWOxzinuSRtbAqIkucW5ybcLTR84qNhExCrVngZmNXznguKyhCYDJPa43+lluSEv
	0NqdEKtr2eunLkwR8XkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTA3-00000009kk1-0vWs;
	Thu, 12 Nov 2026 11:40:11 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRT9w-00000009khf-0F4R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 11:40:05 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so2795199f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 03:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794483601; x=1795088401; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B/LK2W9tMRY5x8wpA2h9YuUMfckHvhSfaFlgBZU2Y7c=;
        b=aJa1KCpGAQM9FhorfY1lwOeUJ7n07cy709EWBU0W3aWUs9c0jPiVDUemXstH0+uY6q
         YfSF38B7vbNRhSib0e+T0AK9LL4vtWd4I2oxT8gLSSSoO0dHScs4GBr0Dbb64W22MclU
         GX502jo0/scTv0XQ/X+0HxOGxKodiCg4v0ussQzlnG06XzFOYXzU8yt9KIoj+tqnrugw
         7rSNXKg7bkNas+fEt8wjCFmn6OML7l1AoUPmctiV4Avi1TdS4d99P4IVIHu4gX8D7VAj
         W+qAlPL9hJuLtdaep3r3mX4Erq48/DveNcHG9/3nvmEm4RkMUO15tMGoy+atLglX9G9L
         PB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483601; x=1795088401;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B/LK2W9tMRY5x8wpA2h9YuUMfckHvhSfaFlgBZU2Y7c=;
        b=RYih1U1S5p+o5bDNY0oojPr4GCJzwCtNcJWIJCOrm3STRduYWp/mWK0ZQ8vnctIzCv
         7R2pSkw2sWZcbZ0Df/eqGYOG57fU9mHvPGf3cV4OH5Zrg2x9ctwD69/AL+K/5X0BzPC9
         14Z0DFk2xUnvAw08vRs2l48ztC8JUIN9J/ex++ktpfhhr/ga4xhdA3o4g8dpLL+oq/hv
         xvUZqAUh8wxD6smDEGtn6etswa/HCQ6Hu1nIuPYk5uXArg+hbx1Plc8mIguZicl/X/kF
         Y+mVjr5gzOPT9zb5Gcf1TPgx81l1ji0TU8lNrNLdk7LnbgezH9ikY1l3lYjFP2h6f2tE
         FbOg==
X-Forwarded-Encrypted: i=1; AL+hErEnorLe6X2Mk8uEzufoi5vnDQsygkgcf706EpRHBd2h2Iik7P9keUAn6XuwlIpkpqC0sQijpB92gXfB+3mdzU1w@lists.infradead.org
X-Gm-Message-State: APuU4Z9HDezveYiyOI33WrbmmlfA5twbpkd2pzTUYztRszzgitygIt/f
	eJA2W6Y0Rzxjc61CrwfCRQ/so3JClcq3eToqGVKSJJIhc6qhjtLvaGavJeZRP3Sau4c=
X-Gm-Gg: AYBFou3mqzsJPJk02JQwO+flwAafg4aWiJDXsN0hGQ+Pqqv7ab3jQJ2Pl3b4snAK5mc
	wobBs+ukvLEG0VunwR2yZZhRlpLrgCT4MMZC2ySAhluyaolTRaK7rRphdwX8+qbRDdENpF/7bJb
	21kIh4YNkyawcUmnsqoA0yZroV+qQ8VR88wuRvgy/BLbhQRrfOn11xrP4LKLeU6Tek5EkZAqcSk
	QQWeD97DogQ1P9S297GZsYxS7YdIqhuYxvVqKwg+KiF9ZTLwSk1wv634sKFAeK/evA40SJv/XbZ
	m4mwrmK+Aft0ZuqOpFmwDenFE88x6fNgsLz+YKVAKIb3O/evLd4EsvnjSpBLokvFIiR/OpEbM1u
	UqvG4h5Up+OCPmRi8ne9fvvkb4wGCNdG9jAnPiT1k46D6tkznx/J/7QabF20gq4c37N+HYXGd5L
	3YpUgUOsZahGISFst0y9zaTxMVOgyvjCctV0zXdGaYOGgl8hChbsvbHY5GNuTEFYhzYxjMIIjGq
	Xy5SUmLGGNup/3bU24g3Os6uOzfBTi1zb08XmelMYCVFACt/h3nOT4KWpI743kIgaYrl3gM0a2o
	HqrPfTbq6asis4CzAjXeI/zSkCFlx4H0SVBL7ALge40D8Rmrip+BBV0kHx9Of5Rql9IpcaoTnTa
	oredh5AelBBUjfiGZ
X-Received: by 2002:a05:6000:40c9:b0:491:8462:20b6 with SMTP id ffacd0b85a97d-499c83c0d12mr9610739f8f.38.1794483600775;
        Thu, 12 Nov 2026 03:40:00 -0800 (PST)
Received: from localhost (p200300f65f19a904528996c8ea0fadad.dip0.t-ipconnect.de. [2003:f6:5f19:a904:5289:96c8:ea0f:adad])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49836b8eb11sm17512463f8f.57.2026.11.12.03.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:40:00 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v4 1/2] remoteproc: elf_loader: Create new callback for copying segments to remote cpu
Date: Thu, 12 Nov 2026 12:39:50 +0100
Message-ID: <a6e3206a90f3be915a57a7497a34ef97f914b340.1794483181.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1794483181.git.u.kleine-koenig@baylibre.com>
References: <cover.1794483181.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4986; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=N+9MpIEOMHu+xlJxUw2mD/JXqfJF1eqVB7nMk5Eh7D8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq9aV2s8sFfFVOC95VOupA+IXP3fdYI2xxC6vn/ iHUWQY7n6qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavWldgAKCRCPgPtYfRL+ TvLzB/9SAwbizeNpaG5VX8F40ZM0gqXMvkPFUjPd5fWsSsgflHW37D6qTZi0Hy6tMwfOBRx5FL9 z9329gZpkYZ2BO9TlrhlDR0n4EHawZPES1yyLw3utlF3vt2kGtlaUK2UPYWUFabDCoXF/9FBRb3 4IuKrl8TTSvOT2JiVFtlLWqK3J9S1obd1J1frD66oRhf4+AwrFC5uXbxHGRqvPMAfyT5/fAYp8l QCzAhRxPHgvizEmswaldebcNk1c93h9lEFeNniN2Da5oG/C/O49s6x1CymDFlrkjuOO/9yRaICZ GRGNSBNYed0GgnudxNHtbGspOPm7C2RXZURJEsbgywCXCkfZ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_034004_199121_BA1811E7 
X-CRM114-Status: GOOD (  24.38  )
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

Some devices have special needs about how an Elf segment is copied to
the remote cpu's memory space where the default implementation using
da_to_va() + memcpy_toio/memcpy and memset_io/memset isn't suitable. An
affected mainline driver is imx-dsp-rproc which includes a near-copy of
rproc_elf_load_segments() just to handle the IRAM only allowing 32 bit
accesses. On (not-yet-mainline) ADI SC846 the respective memory isn't
directly accessible at all and DMA must be used to copy the data. To
cover that usecase don't keep rproc_da_to_va() in
rproc_elf_load_segments() and let the new callback operate on the device
address.

The new callback can be used to implement just the driver specific
memory mapping + memcpy() + memset() to increase code reuse.

The patch only appears big because of indentation changes.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/remoteproc/remoteproc_elf_loader.c | 64 +++++++++++++---------
 include/linux/remoteproc.h                 |  7 +++
 2 files changed, 44 insertions(+), 27 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index da3cddbe7d4c..3c749a39e5da 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -227,35 +227,45 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 			break;
 		}
 
-		/* grab the kernel address for this device address */
-		ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
-		if (!ptr) {
-			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
-				memsz);
-			ret = -EINVAL;
-			break;
-		}
+		if (rproc->ops->memcpy_tova) {
+			ret = rproc->ops->memcpy_tova(rproc, da, elf_data + offset, filesz, memsz);
+			if (ret) {
+				dev_err(dev, "Failed to copy segment %d to device address 0x%llx: %pe\n",
+					i, da, ERR_PTR(ret));
+				break;
+			}
+		} else {
+			/* grab the kernel address for this device address */
+			ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
+			if (!ptr) {
+				dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
+					memsz);
+				ret = -EINVAL;
+				break;
+			}
 
-		/* put the segment where the remote processor expects it */
-		if (filesz) {
-			if (is_iomem)
-				memcpy_toio((void __iomem *)ptr, elf_data + offset, filesz);
-			else
-				memcpy(ptr, elf_data + offset, filesz);
-		}
+			/* put the segment where the remote processor expects it */
+			if (filesz) {
+				if (is_iomem)
+					memcpy_toio((void __iomem *)ptr, elf_data + offset, filesz);
+				else
+					memcpy(ptr, elf_data + offset, filesz);
+			}
 
-		/*
-		 * Zero out remaining memory for this segment.
-		 *
-		 * This isn't strictly required since dma_alloc_coherent already
-		 * did this for us. albeit harmless, we may consider removing
-		 * this.
-		 */
-		if (memsz > filesz) {
-			if (is_iomem)
-				memset_io((void __iomem *)(ptr + filesz), 0, memsz - filesz);
-			else
-				memset(ptr + filesz, 0, memsz - filesz);
+			/*
+			 * Zero out remaining memory for this segment.
+			 *
+			 * This isn't strictly required since dma_alloc_coherent already
+			 * did this for us. albeit harmless, we may consider removing
+			 * this.
+			 */
+			if (memsz > filesz) {
+				if (is_iomem)
+					memset_io((void __iomem *)(ptr + filesz),
+						  0, memsz - filesz);
+				else
+					memset(ptr + filesz, 0, memsz - filesz);
+			}
 		}
 	}
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 00019b1895e6..165ba8fc1d88 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -75,6 +75,10 @@ enum rsc_handling_status {
  * @detach:	detach from a device, leaving it powered up
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
  * @da_to_va:	optional platform hook to perform address translations
+ * @memcpy_tova:optional platform hook to copy data into remote memory range
+ *              The objective is to copy [src...src+filesz] to the remote
+ *              processor's address da and set the remainder of the memory range
+ *              (i.e. [da+filesz...da+memsz]) to zero.
  * @parse_fw:	parse firmware to extract information (e.g. resource table)
  * @handle_rsc:	optional platform hook to handle vendor resources. Should return
  *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
@@ -99,6 +103,9 @@ struct rproc_ops {
 	int (*detach)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
+	int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src,
+			   size_t filesz, size_t memsz);
+
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
 	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
 			  int offset, int avail);
-- 
2.56.0.rc1


