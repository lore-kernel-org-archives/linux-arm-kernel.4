Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5863D606A69E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 01:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MA5UeTZO;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A5+GtHXI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CgxsAtXFuwPIOpoqITa/yCw7bucmWGSvP7CHXYFl5l4=; b=MA5UeTZOfgwTgQ
	WFSzYLtyaaBeg5yjPUcII9Nmb3457yJqTUv4HyA1ymx5t4+svCzyE6zINwN0EXs43L2U8TygJfrGZ
	hFSUqmAp/wlchM3UdQ65IRhMCZzUZ0m0QSGKzhwNpnb8U6nNQbx8d2X/rzXIBm0O9KlL1p1K72bw9
	jhz4WnQr5STzC68xiRNYukp0SAyrgNlZB25H2Bm4XGOGRvXmynSU7MOupRuhPy8GZdAFrAswjlC7M
	fKrg6KqpPFO2t+B5m891kc8ustC1xHcMXUXLskzlqFGaxJhYJBNg0d4CThczmExjx2uuLyiwb5dih
	5fu+8ZvePmytaheDUYew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZfD-0000000Gax0-15hz;
	Sat, 21 Nov 2026 01:13:11 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdM-0000000GZOw-2Fyk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:22 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7f84a55cc06so962130a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 17:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223475; x=1795828275; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CgxsAtXFuwPIOpoqITa/yCw7bucmWGSvP7CHXYFl5l4=;
        b=A5+GtHXIOsGrslVXPWAxexdzZoeRu9uILxTy2QWwaw+TuJ69UhctomFkozY96p+mqh
         jUYA3eCajkUc2xndUivvTcuJhTSNDvQruoEGbX4h0OO6AJ+ScZ9r/5DlFhl+eAa0GrEW
         fe4bZcHSISlzgr9LdgkVsunO4Fl4QAbl1+ICJDIfoU9pmSP4NeI5p/ta4/iPc8n/G5kW
         T0klQTBnanjMFpRl4N3eP+tsqkhMn69p1kB+4/EWVWAjBvaEMQaTKICYjNmvydTMw6M8
         1gRnFzV5Bxr+yK+hwJ1UdW1zdZbZayvY9nLCzPiGSb3+4HihnwW1AyjqyWdAfcBzAVJ/
         LT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223475; x=1795828275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgxsAtXFuwPIOpoqITa/yCw7bucmWGSvP7CHXYFl5l4=;
        b=FyWOPqA37zKVyj5rpiOL3pV3p7JHILYmBjrHSX+KiJtD4XvY/EB+ineXv/QGiHhV2P
         tbSNGh+WHM3if1M9x2jdXu0GmnuKehjnKKWBn8sZewYyz64a2mgCmpWK1z2HnzaZKP6i
         9iHablKFzwdUGysyQk0NJPWPTsYPUDoY6VFrWfjW2axlcq0QhxC5kGHw3BW8tv2a06kx
         SvQNIfBag4F3fxU8FAlwsYDLvvy8rwA/vYycCLpjFJxfXT6NPFHL2YicZTvuBR4QE/QQ
         hI0CQmRohX3CfTUk9nz2BsePAhlSSdmr4s4ZCxOLhqFaIZYNIl/EKvC/sVNyxgONMtKV
         2Haw==
X-Forwarded-Encrypted: i=1; AL+hErHMd8KqwOeMLkiKWYiH/M0moZGUYfZ3nnZOJQiCmeswubBGGE/AyVUneZmWly0SRu95i64maz/wFcPJ7t8MRdPt@lists.infradead.org
X-Gm-Message-State: APuU4Z+zXE/KjFVY9+aF4A1o57h6RJ9+AyJy8Nn+UGPx0JQY7+yHfHMW
	2rZfDhtDO19ncbMeC2XYK9jrRnjB4Tmj2XIa132GiaH5/LrGE2WaZzLz
X-Gm-Gg: AYBFou1lfmQGencppPJkoBtUJmTHUDA+NIzE6x9Zig+UOFq0ZP5K70NV2C4MZugPEzz
	oOHJexoTKTOK3D+TGcTzLnTWnwzolP1uoFw1+qAwB++BaO83RmMYi2+MSCbkFZ3GOJ2ICAr2ueH
	L9M+ZiTqu+eZ1Imfzo0MgDO+Z3ccT8yFKXZS+FYKEyJbxCHhmcKYTItYR01TedX9BfhXBkTB5iV
	o23+ko4pkCwcUWsxzo6masITMU/3lojkT+rhW2jVOqvdBNp3HdRrPqpTW36LBE3iJxIl2LYQVFu
	blMQpssCPYluYXkKtcMbRC/dam9r3wsWw0H9InCcB0qh5q8pwZeyPeLIXOpx1HFUh8rUfnuRkAO
	55atHgryyGsoGL2PNdJX5pS29fVyN5Kd5Q2nCXBU97W6t2HzbeJhc2j2XNOSxRUf3MBzfwIHMrC
	AJ4cOuM2tROo1oQPkN4wxweEV8zfS+gT+T3ZCFtj+XidXuBbRrvalvQwBG73qfHdwVx+OUJ4aZ3
	r5nJpeMpizfSTb3q0NVtlpmhzAe0lh8H4gAL/1F7kh44PcI28ix+Mkh+2zI8wyzi+IuVtr55exT
	mkIZW8tjKOqPtNwD0YBXH2VsbBmjif8FDisHCq8Rm4CKL104WRwFw4FiZi4EB/EAiQwqFYEZokK
	SBmR+5t2VtrFQMNilLyD56oZVhCWkEN4Oz/wWhA5Bp7U1mD8t2oIMmq9KrBF/nCfi/Aj8PFY+zV
	+AxSBohyxii4PWMmmWZCyVkM1JZPSG1BtmOJicvtDMSEuVWMbgKKIt
X-Received: by 2002:a05:6808:23c3:b0:567:f5d0:741c with SMTP id 5614622812f47-57a0b959e91mr6046198b6e.34.1795223475472;
        Fri, 20 Nov 2026 17:11:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:37 -0700
Subject: [PATCH v11 14/26] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-14-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_171118_162935_2D291408 
X-CRM114-Status: GOOD (  14.11  )
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

An OOB-only write can report failure after the NAND has already
programmed the page. Both the PIO and DMA page writers issue PAGEPROG,
wait for completion and check the status. The OOB wrapper then issues
the same command without another program setup or data transfer. If
that second confirm fails, its error masks the successful write.

Return the page writer's result directly. It remains responsible for the
single program confirm and status check, including on the
bad-block-marker write path. Raw OOB writes use separate callbacks and
are unchanged.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 712648864407..7f9bc0237cea 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1779,15 +1779,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	u8 *buf = nand_get_data_buf(nand);
-	int ret;
 
 	memset(buf, 0xff, mtd->writesize);
-	ret = nand->ecc.write_page(nand, buf, 1, page);
-	if (ret)
-		return ret;
 
-	/* Send command to program the OOB data */
-	return nand_prog_page_end_op(nand);
+	return nand->ecc.write_page(nand, buf, 1, page);
 }
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {

-- 
2.53.0


