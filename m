Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6AF606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wf8V94sp;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JIZnsQnq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WZHCTs4f986cWxYB4Wn0WoeFqnSR+ysmF/iaTpKX2P0=; b=wf8V94spJplNWI
	SlZ863bwIIu+9SNzWH7w4UI+fHFei80N7+59h82JAl2cM1ZjmfqMd8UjwxXHuJD7VG17JTOAx1BGI
	r/5jMB3eErK5PQ7g2zjGQ1C2PEbX7r8nhJwtviQvCnKWGwxOB9egoyIfbZhXWQnY/+KORPdzEepR9
	HR+B7zfKC/R9LiNsAYxOyIyblPNi6aY7fYsk8e5DCIvU778/nfvPnL7jYoVJT56PmhKYuyvy6Tsbc
	c1/HJAZVOzWM6cvQQhTUkGk6iaFaxb212mt+TWpqAnPK1tbzMRjrLJwGtoGBMpRXvR8C5tvZoPClQ
	z6yV2bh8+9SxTZKlCANA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTA3-00000009kkh-2m8E;
	Thu, 12 Nov 2026 11:40:11 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRT9w-00000009ki0-2Qcl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 11:40:06 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-49465892f7bso3023948f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 03:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794483602; x=1795088402; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WZHCTs4f986cWxYB4Wn0WoeFqnSR+ysmF/iaTpKX2P0=;
        b=JIZnsQnq2V0kZl5yqqLlGBfBh/WgIeiZ2MGbtdWBqPH+zdYePizHZQR90z4DDRFzaW
         aHCsQTEFNkIDS6kiftuESQtz6/LejsAVqUrgaF9uMQeEEkIGWYdrXDc22+FGE9RofFTs
         QEn8SHgTOjgGrjReNUuFSGELclUU5cU2QQqP4faKPhJhvgsxl72mKKP8nG+bg+VmbzcV
         4LIpssvYs7fGO1fAGBq8xhvYcNWkyeSZZohdQ3Z+rBEMHJx9PYykIeqAyEm86h/wC0Ul
         z9bnWJTflwWK2mH2tOKF9e6RS7qi1l9s/3NwcU/H0+kc8+dHvQDidiHUkuASNEo8DPcY
         8h6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483602; x=1795088402;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZHCTs4f986cWxYB4Wn0WoeFqnSR+ysmF/iaTpKX2P0=;
        b=Ln8bHWOFq9alkgxRDAVu7VULKtmwgjtXLLRHRHN7EQMzY1y33gHeMNostidfjjaPC/
         Keml0iOkul7cejoGspXpRrYrvsoyrbNctJYJOch5MREeqxHCGXipIcCDxs6c37isJIkX
         NCciJ7f6UIkOIshwwHQtt2jL9VWQmI40b+c1W+MtRnNadK/kee4m34jctI1KAgslw4rW
         ogTQo0WpPnOCbyFIWeRfGdVh3OKnwE/c7dZTmio6jMi7qfd7s21h8uysxnfh5Ei/Ikwf
         RlXoGdoRToMNg8iSKnX3jJQ+L0XOORGCtoCSzFJ4Abgg11BM+SIrELnvEgolk5MxRmZX
         GkjQ==
X-Forwarded-Encrypted: i=1; AL+hErHii+uqSW58nF3FnyklaUWdUhLRdQm0z32Hn/oiZo+R0sVpn8YcR/w0e+CSUfTBtwNsOqh8YZzOaKgdcsY6XpWq@lists.infradead.org
X-Gm-Message-State: APuU4Z+uXekzh7ONa4u+eedad1XnoHfTBqvkt1/L5VoGima5SUyp8g84
	U7wlp1fzEXXTeeRCPZPeCFxnkDsYgEqHUu17nHhu2ni4WM0WV2H6QkaR+GoSPtKvwOg=
X-Gm-Gg: AYBFou1SJHWCk3orXnrEw91zUubhOvVLuf4NdeG2xeDXRQ++NIx5sRpRn/PCYhub9aM
	TzAEWY99Ezj3W55TFdhALlVS0lzU/pw5tCL8YCHYBzs6zcRcOYldMQK+sHmy8Z6jRH8lPX2Zrm9
	gJR7hY6YDOfKNT4SKMC3c+fo4B7r8L4TIOq58wicV4YNh9LUyngeDEMCtt1ZhyusYCrRhxrtdmO
	NpjYYMNySveV4u/QcJK6eWDvmu5hSc871QZWXYjX507RIfGf2vEiKla5Mdb7nYAZMtqNPRFhVCx
	A+QWhh4QsjNghqOfefHJo1Ez6zW713oMUKL8b60mLwbPExU6z9cR+TgLZELQfVRgi7dtj63ocjE
	Y4r71WrPCmEJaEIeDI5y7RPLxre0zB733ElNpPC6zYo6i0DdXS1gQESCD26roFzunkqG6oFb+fu
	xUHSMk9hseGPN1ZGREUfWS8Gm8OhPc/LMD6fPrCwIJQZmpvVnaiC4gcJaMTEMt3SHOXTqi59SvO
	utoWS6Un4tp6APKnzCcTgFnuyyS1ZbFfLf6sZh2Z4PM+IJy+I54gyPj23yuRZOVU1lxagCKa/K7
	J02uPcmgLm7zX2NJUEzvKm9LgLp5hPGuBzN83jeFSlk4EfXjKd4961sMbAJqrli++nsVeoSSi1H
	oEWQ2Zs9+FlMc3oQu
X-Received: by 2002:a05:6000:248a:b0:493:1477:cdd7 with SMTP id ffacd0b85a97d-499c7271d72mr9671131f8f.45.1794483602143;
        Thu, 12 Nov 2026 03:40:02 -0800 (PST)
Received: from localhost (p200300f65f19a904528996c8ea0fadad.dip0.t-ipconnect.de. [2003:f6:5f19:a904:5289:96c8:ea0f:adad])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-498366c43f4sm19115427f8f.47.2026.11.12.03.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:40:01 -0800 (PST)
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
Subject: [PATCH v4 2/2] remoteproc: imx_dsp_rproc: Implement .memcpy_tova()
Date: Thu, 12 Nov 2026 12:39:51 +0100
Message-ID: <922f685493e615b450c913b77cf33022c9cda8a3.1794483181.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1794483181.git.u.kleine-koenig@baylibre.com>
References: <cover.1794483181.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5301; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=RohBdpkH8TSHsnslkd4R654KBrqmv882JRSoJjjuoBA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq9aV5PpSrVGWZ6id8gqP3pN3LFSP2HbKY5hyhn ejyAuxXlg2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavWleQAKCRCPgPtYfRL+ TugHB/4zsoFIUiu1rOAe+sEMu7U7+oNyHE4Z35KbOqRblj73O+ECqOwmAw1N3/wOf3BVIlj3ntN eex6WkpCriW/JsOvPr8ZRnPIJhvy01Bv/J9xk2UsjjMSghOyUBT7sv5MrDbDezDI9F6eUgUrOR/ 3HafN1OrkN+mT6dTNMqyV71+ymkrO6T/2PAGgcZ1+7dMAt0lA/EeiXJ16jIma/ma/4jjQXeviOE 9LQc7EihvT1ZykXMQEV+hRqi9ADMe/Agq8a462/Xs2SHlzcpQXyS9jERrXgv3QGooTnaT9Po739 B9QXPhoILPe4UbTm8i4R6TN4eR8M1q5R5uAH0JKEW32fWVed
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_034004_713021_774299E4 
X-CRM114-Status: GOOD (  20.75  )
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

This callback allows to use the core's rproc_elf_load_segments()
function instead of reimplementing it for very minor changes.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 120 ++++++++---------------------
 1 file changed, 30 insertions(+), 90 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 96d619daf3f5..324c10f18507 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -864,97 +864,41 @@ static int imx_dsp_rproc_memset(void *addr, u8 value, size_t size)
 	return 0;
 }
 
-/*
- * imx_dsp_rproc_elf_load_segments() - load firmware segments to memory
- * @rproc: remote processor which will be booted using these fw segments
- * @fw: the ELF firmware image
- *
- * This function loads the firmware segments to memory, where the remote
- * processor expects them.
- *
- * Return: 0 on success and an appropriate error code otherwise
- */
-static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
+static int imx_dsp_rproc_memcpy_tova(struct rproc *rproc, u64 da, const void *src,
+				     size_t filesz, size_t memsz)
 {
 	struct device *dev = &rproc->dev;
-	const void *ehdr, *phdr;
-	int i, ret = 0;
-	u16 phnum;
-	const u8 *elf_data = fw->data;
-	u8 class = fw_elf_get_class(fw);
-	u32 elf_phdr_get_size = elf_size_of_phdr(class);
+	void *ptr;
+	int ret;
 
-	ehdr = elf_data;
-	phnum = elf_hdr_get_e_phnum(class, ehdr);
-	phdr = elf_data + elf_hdr_get_e_phoff(class, ehdr);
+	/* grab the kernel address for this device address */
+	ptr = rproc_da_to_va(rproc, da, memsz, NULL);
+	if (!ptr) {
+		dev_err(dev, "bad phdr da 0x%llx mem 0x%zx\n", da, memsz);
+		return -EINVAL;
+	}
 
-	/* go through the available ELF segments */
-	for (i = 0; i < phnum; i++, phdr += elf_phdr_get_size) {
-		u64 da = elf_phdr_get_p_paddr(class, phdr);
-		u64 memsz = elf_phdr_get_p_memsz(class, phdr);
-		u64 filesz = elf_phdr_get_p_filesz(class, phdr);
-		u64 offset = elf_phdr_get_p_offset(class, phdr);
-		u32 type = elf_phdr_get_p_type(class, phdr);
-		void *ptr;
-
-		if (type != PT_LOAD || !memsz)
-			continue;
-
-		dev_dbg(dev, "phdr: type %d da 0x%llx memsz 0x%llx filesz 0x%llx\n",
-			type, da, memsz, filesz);
-
-		if (filesz > memsz) {
-			dev_err(dev, "bad phdr filesz 0x%llx memsz 0x%llx\n",
-				filesz, memsz);
-			ret = -EINVAL;
-			break;
-		}
-
-		if (offset + filesz > fw->size) {
-			dev_err(dev, "truncated fw: need 0x%llx avail 0x%zx\n",
-				offset + filesz, fw->size);
-			ret = -EINVAL;
-			break;
-		}
-
-		if (!rproc_u64_fit_in_size_t(memsz)) {
-			dev_err(dev, "size (%llx) does not fit in size_t type\n",
-				memsz);
-			ret = -EOVERFLOW;
-			break;
-		}
-
-		/* grab the kernel address for this device address */
-		ptr = rproc_da_to_va(rproc, da, memsz, NULL);
-		if (!ptr) {
-			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
-				memsz);
-			ret = -EINVAL;
-			break;
-		}
-
-		/* put the segment where the remote processor expects it */
-		if (filesz) {
-			ret = imx_dsp_rproc_memcpy(ptr, elf_data + offset, filesz);
-			if (ret) {
-				dev_err(dev, "memory copy failed for da 0x%llx memsz 0x%llx\n",
-					da, memsz);
-				break;
-			}
-		}
-
-		/* zero out remaining memory for this segment */
-		if (memsz > filesz) {
-			ret = imx_dsp_rproc_memset(ptr + filesz, 0, memsz - filesz);
-			if (ret) {
-				dev_err(dev, "memset failed for da 0x%llx memsz 0x%llx\n",
-					da, memsz);
-				break;
-			}
+	/* put the segment where the remote processor expects it */
+	if (filesz) {
+		ret = imx_dsp_rproc_memcpy(ptr, src, filesz);
+		if (ret) {
+			dev_err(dev, "memory copy failed for da 0x%llx memsz 0x%zx\n",
+				da, memsz);
+			return ret;
 		}
 	}
 
-	return ret;
+	/* zero out remaining memory for this segment */
+	if (memsz > filesz) {
+		ret = imx_dsp_rproc_memset(ptr + filesz, 0, memsz - filesz);
+		if (ret) {
+			dev_err(dev, "memset failed for da 0x%llx memsz 0x%zx\n",
+				da, memsz);
+			return ret;
+		}
+	}
+
+	return 0;
 }
 
 static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
@@ -969,7 +913,6 @@ static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
 	struct imx_dsp_rproc *priv = rproc->priv;
 	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
 	struct rproc_mem_entry *carveout;
-	int ret;
 
 	/* Reset DSP if needed */
 	if (dsp_dcfg->reset)
@@ -985,11 +928,7 @@ static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
 		}
 	}
 
-	ret = imx_dsp_rproc_elf_load_segments(rproc, fw);
-	if (ret)
-		return ret;
-
-	return 0;
+	return rproc_elf_load_segments(rproc, fw);
 }
 
 static const struct rproc_ops imx_dsp_rproc_ops = {
@@ -998,6 +937,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
 	.start		= imx_dsp_rproc_start,
 	.stop		= imx_dsp_rproc_stop,
 	.kick		= imx_dsp_rproc_kick,
+	.memcpy_tova	= imx_dsp_rproc_memcpy_tova,
 	.load		= imx_dsp_rproc_load,
 	.parse_fw	= imx_dsp_rproc_parse_fw,
 	.handle_rsc	= imx_dsp_rproc_handle_rsc,
-- 
2.56.0.rc1


