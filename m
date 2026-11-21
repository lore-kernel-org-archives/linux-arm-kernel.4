Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1722606A6B7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 01:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VdrtEbv0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ogdFPblu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Rd+OJrfYC05spJgrrPaaw8Or0kLWD6WKtcmuDL8E++0=; b=VdrtEbv0L8hmpY
	Hj0t/TybNL3AyjQE8aucrhqLIBLjo3vv+lwxbNvzVuDVxG7KZWEsdnVvZErOLf283A0zuVUgzTFeh
	wii7O38ssPXl9dUhOH0FCFjsXy+1WPcOeX5urhqbxDQKIPT8JTnGyYVoQfddTsIVfVVMTfMAUVtD9
	MEv3to+XC2nOcFstP0zNSoSxhy3iO7fWHhCIxiqhxWppnAjyxonwFsigiEBs0FB9UrY4JbKQq6pB9
	azNh+hR3tPDduXkDQKhvCAk4C93J7g/nfx6oLSVyiv/Hh5QjOOvbvQf0FprM5s7SQaQkaUGREYQ96
	hjbhdAnPwnJoyH8jEzow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZh3-0000000GcBT-0UAC;
	Sat, 21 Nov 2026 01:15:05 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdQ-0000000GZSV-3H7a
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:27 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-4ad881b6517so1186320fac.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 17:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223480; x=1795828280; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rd+OJrfYC05spJgrrPaaw8Or0kLWD6WKtcmuDL8E++0=;
        b=ogdFPbluAXr0goUgngWYJHG1NhE8oGToYVnN1qNZNRDYtjX2XOWQu+OxfIe/4DVShn
         LZwytZBMkwdFSMh2RLduJJfKqRVJE1OZFXkzAf2bB3kciiv1brscAG/PsEXW2k/tF4Vf
         b4k4+UyqD9W432B/y7LMATLFmI/7E9wG0UbTXgTVb7DAmwtr25WoNZXEo2zaR97YxIkV
         crTQdqWC8wmMrbNl+GRwBmoZJisiQsJny/vkxeMz++EtUKgG3zPR996td4wgkLSfp8lW
         XQibvLJm9WReyB3AJWdK7k7SvMh19z0Ksd4AtUTUGoyCsDfuNrIVTbFrY3d0VIxabEMJ
         lO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223480; x=1795828280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rd+OJrfYC05spJgrrPaaw8Or0kLWD6WKtcmuDL8E++0=;
        b=vy/f85HYAy5/xENUhvUduDbAY3Q7EmsTfolrkr/w2mBTZ2lFDga/8UGKAepQVw40MD
         YjhiGl7HECLui9hXf+ihA0X2t6A7XUffQeJHTeOPGQRCa3UiroQZnmBUvTv/GEfrG4QJ
         UP7jmaSWwlDJbaKPm3GdlKOTJSMfEqhOzl+E0ct3jGFO4hKrwAZBf+imroecxvk2tSDT
         uOxx46PVMduMv4l9OWZ4ajnmK4lRTseF8C91F/BWPwbVAueJMfasi/7unnpYHi/Juf2M
         614Z1nxZhwKUVVStH+6yMqc6xftLLEjCamKbYEe2TwPRjkYo+FMU2/OgOwD9VgZ/ejMS
         TscQ==
X-Forwarded-Encrypted: i=1; AL+hErF+veKjNAGG8+JzVJ00M2EJGx0/TaYcsf7v3EqSrhM4UtxjGDMBz5fh4q4P/fG5aVpSnNIV6T2O8CKXiZgFecRg@lists.infradead.org
X-Gm-Message-State: APuU4Z/QphNEeUHLrak8Ex81VPz8sNnp//xjKrIVpc3na3FvZUmqa78c
	fNH7QFUmq7MNzkJYLfVx/dmyMMG/wC7VPfSLyZhX9WTwxdU0zPmLtkEW
X-Gm-Gg: AYBFou1gwoPvrR7Vn/1J94RsED88+EezHsNAY2VV08iifF23W1En5QuY5PCUsHid8dU
	Ly6ZjuWwtgMgSR4UQ0cMEibQtUyDcpl6g6yhZ9XmD1IHBYuw/oyV0KGB8JlIofBNC2iLouPHwHz
	Nqq/YMLHettEkPL6DgaBUehRPocuTRbg/Gv/KqFp2Bwx1/z9cgakmRqIRS6blgFLSG/sfpLP0Vs
	mpajVBb8gLd2/QBQ5Tv5pD9GeRmAyAJmcsGqFM/B1hJuidj10zZu4mJTSmPhFgQNF/pamqSpKxJ
	IMg3oLrCvncY7B89uVuj1I8iEoo5npFnJOWCtmS/WyOJlc/RNcS8hWM2YS4YdVnctA/BkGe1Jr9
	fsn8iP7LdwcXHWBtawuUHhew4l/FY7wEWN9ezfsABjSoFV3k9qwdGU3YUMYSsziFcq2FACwY/xf
	70ojkrGxuU/uKmJZp0JQCU7EGpw6t9JxBZ/zK1z5qX/8kMj9CBADzqU/eKLSBPLbSqVs0j6VI3B
	cdNSZgviobd8xHecAnmVn4L8hGJr9OKyyOjsHLlnu1tUFsAyaaDL81pqI5RbDZrgTe7tYwOQXbO
	EV34dnxZEo66g+Et3E5nI6b88TS+ycoXGnvygyekDuGjRPP7eCzCc7V5MngToG9RPHrznKUOnUp
	SGpI3yRHZ+2kD3Q/s5c4cW1cCE9u6OjI7qG65VwFkDN8gNjqYOCnBPn5cPgsFbFbKM+Ec21e3sO
	RJajYaHIAOZYVt4O3PGdHdBbZUB8nrwRJULHMu+xZ2I8LFNNNtfcBA
X-Received: by 2002:a05:6808:4f0e:b0:54e:7cf0:c0b9 with SMTP id 5614622812f47-57a0d2f1a5emr5946703b6e.64.1795223479754;
        Fri, 20 Nov 2026 17:11:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:40 -0700
Subject: [PATCH v11 17/26] mtd: rawnand: sunxi: preserve bad-block markers
 on erased OOB reads
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-17-9721b1905ef4@gmail.com>
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
X-CRM114-CacheID: sfid-20261120_171122_708014_8EC98F18 
X-CRM114-Status: GOOD (  16.29  )
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

A bad block can appear good if its marker is the only programmed byte
in an otherwise erased ECC step. If the controller reports that step as
uncorrectable, the erased-page check counts a 0x00 marker as eight
bitflips. With BCH16 it replaces the marker with 0xff in the OOB buffer
that the NAND core uses to check the block.

Leave the reserved marker bytes untouched when checking the physical
first step for erased data. If a hardware pattern supplied the OOB
contents instead, read those marker bytes from flash after the OOB tail.
This preserves the column for sequential reads and leaves the normal
corrected path and data-only read traffic unchanged.

Fixes: 146b503e1027 ("mtd: nand: sunxi: fix bitflips in erased pages")
Fixes: 4be4e03efc7f ("mtd: nand: sunxi: add randomizer support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 5415ac6960b4..f8bc6e3c3ac9 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1111,6 +1111,7 @@ struct sunxi_nfc_ecc_read {
 	bool oob_required;
 	bool dma;
 	bool has_erased_chunk;
+	bool read_raw_bbm;
 };
 
 static unsigned int sunxi_nfc_hw_ecc_read_count(struct nand_chip *nand, int slot)
@@ -1167,6 +1168,12 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
+	/* A factory bad-block marker is not an erased-page bitflip. */
+	if (!step) {
+		oob += SUNXI_NFC_BBM_SIZE;
+		oob_len -= SUNXI_NFC_BBM_SIZE;
+	}
+
 	ret = nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL, 0,
 					  ecc->strength);
 
@@ -1251,8 +1258,11 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 
 			if (!read->dma || randomized)
 				memset(data, pattern, ecc->size);
-			if (read->oob_required)
+			if (read->oob_required) {
 				memset(oob, pattern, ecc->bytes + user_data_sz);
+				if (!step)
+					read->read_raw_bbm = true;
+			}
 			if (pattern == 0xff)
 				read->has_erased_chunk = true;
 			continue;
@@ -1321,6 +1331,14 @@ static int sunxi_nfc_oob_finish_read(struct nand_chip *nand,
 			return ret;
 	}
 
+	/* The pattern supplied no marker bytes. Read them after the OOB tail. */
+	if (read->read_raw_bbm) {
+		ret = sunxi_nfc_read_column(nand, read->page, nand_to_mtd(nand)->writesize,
+					    nand->oob_poi, SUNXI_NFC_BBM_SIZE);
+		if (ret)
+			return ret;
+	}
+
 	return read->max_bitflips;
 }
 

-- 
2.53.0


