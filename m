Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4FB606A69E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 01:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HwFGEtUQ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j1UYZucN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=q43OtFOdNFKAPwH+oRkUo2vplhtOIciQt2V0N0tE52g=; b=HwFGEtUQIwCfVL
	ajW+Asg8iMa6mcAc3UbMFwJa+D2Kuu6simf6kBKc9TULdmnKq27BrOKGgCs11hEfzYfiBeshYg9v/
	A60thg0e7xY47ZmUUG8uj04X5k6aBw6xVWhsTfo3drHeOj6qJ8aCaV7VeXiQEuQTqOO+zByAg74Si
	mgRk+WvClQhQRe+SDz3gmP8iqmXv0JA4l6cM+MCkfMZDoSo9ucUuxjcLzT+9NMpqISAiUDq89e5NV
	R5oyVZDkAg/3UFzTkIJb6tFnWVJ7N42OYJnH3q97G6LjVsIciu4xsz42Owf9x8Uo4CKxRDn1QPehc
	tX16O84nbeDJia6TZArg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZf7-0000000GasA-0r3D;
	Sat, 21 Nov 2026 01:13:06 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdF-0000000GZIO-1mN8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:11 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-862b9c2e78aso912080a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 17:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223468; x=1795828268; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q43OtFOdNFKAPwH+oRkUo2vplhtOIciQt2V0N0tE52g=;
        b=j1UYZucNsWa3NWv12VhLK9byd4VIjxX/EnleY6hEDc77GM2BEGpR+nkybVOf1U32kq
         s425b0HM0FciKr31zvE+2NyS7RyL8JunVz/e5Z8iRm+eKsVgCNviwwwSceBStMvlbo8J
         l9miPEdBakdvg0CVrRfoVzvuBSCKn8GEUSl6+th6T/Exq7y8K6TNHY+mfbQv781pe9If
         9xLdYHoNSWAmvXBjAGWmbIVJ0A3B7YLPTqmzCddt31uAOjIndMezp0u4655yV72Ap8Bc
         7wJOmELihuWWQnwgsVvpQpLfPIT55sllv9shrvPicGjPFRJGKw/P4SFa8Lu5INVlIIZc
         6mvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223468; x=1795828268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q43OtFOdNFKAPwH+oRkUo2vplhtOIciQt2V0N0tE52g=;
        b=EEsAiyeXoJg3ddxQJ4ufzKc7NclCwrJPScHXMvdGZcplDoyLticSRSx9yJuKNPiWOF
         26UxiIkArljluuf7pBTclsqmgJBvunnLyjYT/suNK+d+Xdzik1hvI9XbSaqU3C29CDa/
         muuX8Suk8QpAkzJ19/8fIyyhHmptB5CalTbWFu0JnLZmsOf7DtUqZJzensygfw5bTkWZ
         Cwq5ZcAMyRRAF0HsTwRb86F1guTNvRZ83+VqdLodYD4zIkCKD6R59UuALStmnq16Pzq5
         oj1R9cD+vKqlxSwyDzaGwP93uK3sNWn36+dJIYJDSb8Re8vgYAV7cw4m7njQbPnPLCvN
         IBGQ==
X-Forwarded-Encrypted: i=1; AL+hErHqo01MlEwL1Cwc0zswMMpqeSPGARnMXfC8WrcPU4d+ctTU6I1wrTaJ01gPmtExVu3ydOTu5q9TD99vq0YMn/OG@lists.infradead.org
X-Gm-Message-State: APuU4Z9v9msuSZdCixqvJiYa4AQMVRoaEYOcofdWfAy1SeW5Ie64YQAy
	9o5k/ngdtTMNix3QtSFFm328P4S9zrLU8FkdmYbuy8g6QGF4qQqtPMUB
X-Gm-Gg: AYBFou2czqspWGtjwEZQDgQ2bkr/7+eF51gmUOg8L9Uog4RJy4OKyXAO0YRX/MoLn2R
	5gyLn+rb/UR4AmVX9wy8y9nNEyVMdxFaPdoGWPzMtVMrCSrXpvv4VyJHjja390mWxa5VJpXv7jM
	7nM6p798gG/CsK7YLrNAV2eArYUM0xUqn1gQHQpffcWYTvEkxgsbAaY+T2MDQmpB8E1drahDeP9
	C2ug/JekScTf1pK+2WGl0VV6L/Nbm/YJ3ee23NxumePGQVTXndMxSpre1j5jvsAuITUnpk8A9Ad
	7Rof1Sb5B9bRq97Y6BXPfNr8CKyCTPYsHxhx51IY98u0le7hVHsVWiNBU1Bx1Sxi4Z4xhAMh7M+
	hCCjvHqjsr5VLyeyL2MPVjE+OfMtTU9sJL/NvN0ovcRLmhcj309hHOPc7W314Hnszdg2fZjeIQk
	NpyenMDTAaFvZ20G8ZcPVl5/6B5UkK9x+KPXt2LM5dD6SEvLZGOrHjkF7t7yKjH19tn9AgFX7UV
	AUowCqCgroLzfoXBubbS9N8iW4IZXC96GVE9ghB/IvnPojfzjWpjrqjkz6yL2K0o9UGjXm3r3eX
	wQ48IzYsKI0ReMX2MCvOXGs97nYbxsHSKWcMgxIcekN/RTmY9VaavlbWq+X245wWb0Om449Fn0a
	WZ9LP+CpIC+wjRLtpWsYzGH+W/PAceXAiu7vBayaOGeWLlW04t3ztCPCxkuObI4YW52Xil4llos
	pengeWYKJSwz5LBECRpa5i9k5zyIeXuo5vLFUH5UeFo8aM7c8v9annMw==
X-Received: by 2002:a05:6808:4f6a:b0:572:75e6:1d0e with SMTP id 5614622812f47-57a06d1a870mr5691634b6e.5.1795223468341;
        Fri, 20 Nov 2026 17:11:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:32 -0700
Subject: [PATCH v11 09/26] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-9-9721b1905ef4@gmail.com>
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
X-CRM114-CacheID: sfid-20261120_171110_215024_58663722 
X-CRM114-Status: GOOD (  14.96  )
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

A page or subpage write can issue PAGEPROG and report success even
though sending the setup command or address timed out. The PIO and DMA
writers ignore errors from nand_prog_page_begin_op(), transfer the data
and send the program confirm as if setup had succeeded.

Check setup before enabling ECC or transferring data. DMA preparation
occurs before setup and may already have queued a descriptor and mapped
the buffer, so use its existing abort and cleanup helpers before
returning that error.

The PIO writers also return directly when a chunk reports failure,
leaving ECC enabled for the next controller operation. Route those exits
through ECC disable, preserve the reported error and skip program-end.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 6d7384aac917..76f60fde7a86 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1578,7 +1578,9 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1593,14 +1595,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 						   oob_off + mtd->writesize,
 						   &cur_off, i, page);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
 		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
 						 &cur_off, page);
 
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
+	if (ret)
+		return ret;
 
 	return nand_prog_page_end_op(nand);
 }
@@ -1616,7 +1621,9 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1632,10 +1639,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 						   oob_off + mtd->writesize,
 						   &cur_off, i, page);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
+	if (ret)
+		return ret;
 
 	return nand_prog_page_end_op(nand);
 }
@@ -1676,7 +1686,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		reg_index += user_data_sz / 4;
 	}
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret) {
+		sunxi_nfc_dma_op_abort(nfc);
+		sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+		return ret;
+	}
 
 	sunxi_nfc_hw_ecc_enable(nand);
 	sunxi_nfc_randomizer_config(nand, page, false);

-- 
2.53.0


