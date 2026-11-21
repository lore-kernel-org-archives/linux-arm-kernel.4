Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CFA606A6B1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 01:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m4xEdIw0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wpTbj3Xu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qRrftGPwx46kokq6Qlnqorb+rnqytcdDxCR8IL9gaTA=; b=m4xEdIw0k0NVo5
	hxC0l3925D7JlIxdfSVD7wYSip1s/oUCOo43FYsAMrsO+rUwRxkBt5a5Fw8mBFCzbgz/KxlmpCGq+
	TOm0v9jtVaFRJTNdPtuf2hiskzYy8Bq/qzRukCC89/nr8Z4VokZKPTIydAwHpkusmcdBUCYimvV/O
	wVkq0kYHq7rkPEy8PKUCqn0C01qv4qAUxObaQEApEiKBWvPE15FrXEpcIHBviTmLbrn7jHFC0F+L5
	p4+2334nMCWFEm6U8EUng2ipnDBJ7cy5PzQdkeTnJQcg+LnKGA5tJgoCZ8Ciu23Dqrnpcse3UsCoW
	NZR6At+R/0FuAUVq5qxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdZ-0000000GZel-24sc;
	Sat, 21 Nov 2026 01:11:29 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZd9-0000000GZFX-2zYE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:05 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-8253bc5a613so1015397a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 17:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223462; x=1795828262; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRrftGPwx46kokq6Qlnqorb+rnqytcdDxCR8IL9gaTA=;
        b=wpTbj3Xu2D3YdSrydQLinb7Hr/EMNRUt1uz2DEOSqsbKLXvhE2ggOVBF5cqjytHnz0
         F5+yVJgea8M2YXAPP0KL7H+8KeExQIZXu1f2szzJIWJ/6EeRu65FWywfUZNC45zumja0
         wQYL8qF2WA1KkPR4qwn/p+8z8Ne67k61JM5Sw2UersgWoesHyeUze0Ux+h5TUN7E7BGg
         7J6ozB6iQLnrPMkxJnhryBYbAGOqo5Kh5HyqHATXcNq0sR7sr7ytqc/DM6/k1yJO2G93
         oiw1ZK/ol1zqUnipFTRz4W2uZbeBrrVimt7Ft7CGJrX2XY4OByrQ2P7JJwKuHSJqs7lB
         Js5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223462; x=1795828262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRrftGPwx46kokq6Qlnqorb+rnqytcdDxCR8IL9gaTA=;
        b=TESVlperiiz/kIiYwKoQivyqWmxZlluTXf0YZjb7TtrhvGyvW82ER0Oic19GhYl5RF
         93P2/fpNAhAm0MSXgn2EJCeXVpWg+eCc/FnIXzPFB0BpaD3q9T4oPbj0CysmgvmSkGnI
         YXMeA9jaSWRg8E7FgwmvHV49hVmIllci0NSncCmIoxSsi4Wln8BEmlwt3ZFfu+C18nyV
         c6VLYrHadxiOvVf+CUKmfO176AwVj4dfqMsaqtjcgDaDuQhsNiwTEi/w2mTNFK41aCl3
         T3L23PfGgPRPImkZKswSgmiFMVCsnS/9K/wp/oQx6yKL944P+mBecjJ5ha5SivfzXTD9
         Jy/g==
X-Forwarded-Encrypted: i=1; AL+hErF7P1xAnVVsvkX/XyTYSft/N02j+AL/+pVvaJyoRRX3bMg9FFNq7E1CpYzfA9Tzk8IjmK+KWG6l5sDZo2L1v+l1@lists.infradead.org
X-Gm-Message-State: APuU4Z9OzWOvrpswgcmyZV6tvj1+yAUG//4JGi48H1Mirt3GqUvcBAwN
	uUpvkXTrTpkfe6iajBRiGmSpcU4UG0GqRhHbekeufSoNdO9+i8iNC4Sx
X-Gm-Gg: AYBFou2QZ+7OYBkek7mjuFhMAsk5Hzzll52M5PUFHYca2gF4HDro2UWty07Cu1t92gj
	a/ZbarHpBS4Tt2IGW2KEnYL4ow1VSu5KEj32yHlc0oyS3VHd4eoQToyxjhMr2eYRxvhZxH/X9tO
	4kS9K9kpOIxHpkUhBukz5OsoPZX1gQTWx+kuU39azAh1zDGr/Fzn0dP65pvyfEqldbN+2WDP3/9
	yyzUF+IcVQgP3LW8bKhRmtFcFr88oQtOCslpQwzCp5jCz1nz8U8fl93M8oiyKflAcXRWZIbh6qy
	xQl5hrR4e44scO6YvdvMytqAXR4CnYDaomBtaWpVUX2Ec2LHmMHAPWz9CdtY0UPHzkqAYT5TyNz
	/W8XSjHgzzM+h3lsYNacG2VgVSzIbLFtNWTuzz8fSGZXsBK/04HyRV1bx9xPN7UB6Irb84dW6fO
	Gw5+pkySM7pjJKXr06rRQ1SbvPxWQh9m2I6afV29AZy7k2+MvviaAG/UG6YjNK7tdf08vobu6Zz
	Fku03FsqO4fIaa9Q193HsW3GbGCBG2wjm2NxSSNKEv5ZA8EVNfHhkOPEHAXU3dpkLypRtlQpdq1
	nGU2S0cgUGt2Zw5BCHSmt8cHwL81gHybDdB48x8gfK1HOz/6rF8rRaR5wzMCoMX94kYt1p5SSQj
	442S/M72h2VfbCpbVbN8bBe4UGMtHmZLSQb+6ONPzCblnYSmsVLyjcQg2fAHIYF3R2BzRpGyivA
	n2JeCyxsz65omcZClzDjxjBN4DElqvWL/EV1SD0CzYzuq7lGS4QiaB
X-Received: by 2002:a05:6808:e8c:b0:4f3:e98f:fa27 with SMTP id 5614622812f47-57a09c1107cmr6207418b6e.16.1795223462573;
        Fri, 20 Nov 2026 17:11:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:28 -0700
Subject: [PATCH v11 05/26] mtd: rawnand: sunxi: reject ECC layouts that
 overwrite the bad-block marker
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-5-9721b1905ef4@gmail.com>
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
X-CRM114-CacheID: sfid-20261120_171103_788611_1C6DA1D2 
X-CRM114-Status: GOOD (  17.40  )
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

On 8-bit NAND with 512-byte pages the factory bad-block marker is at
OOB byte 5. With a 512-byte BCH16 step and 32 spare bytes, A10 and A23
can fit all the parity, but only bytes 0 through 3 are user data. Byte
5 is generated parity: programming a good block can change its marker,
and a mark-bad write cannot set it independently.

Reject on-host ECC if the marker is outside the two bytes reserved for
it by the layout. Leave the on-flash marker at its NAND-defined offset.

This also rejects some configurations that used to probe. On A10 and
A23, requesting a 1 KiB hardware ECC step on a 512-byte page could
trigger a fallback to software Hamming. That fallback kept the
controller's OOB layout: its first three parity bytes occupied offsets
4 through 6, including the marker at byte 5. Selecting software ECC or
no ECC explicitly does not install the controller's layout.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index ffbe851b87c7..086618dee999 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -221,6 +221,7 @@
  * On H6/H616, this size became configurable, from 0 bytes to 32, via the
  * USER_DATA_LEN registers.
  */
+#define SUNXI_NFC_BBM_SIZE 2
 #define USER_DATA_SZ 4
 #define SUNXI_NFC_MAX_USER_DATA_SZ 32
 
@@ -1939,14 +1940,9 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 
 	user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, section);
 
-	/*
-	 * The first 2 bytes are used for BB markers, hence we
-	 * only have user_data_sz - 2 bytes available in the first user data
-	 * section.
-	 */
 	if (section == 0) {
-		oobregion->offset = 2;
-		oobregion->length = user_data_sz > 2 ? user_data_sz - 2 : 0;
+		oobregion->offset = SUNXI_NFC_BBM_SIZE;
+		oobregion->length = user_data_sz - SUNXI_NFC_BBM_SIZE;
 
 		return 0;
 	}
@@ -2099,6 +2095,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	if (mtd->oobsize < sunxi_get_oob_offset(sunxi_nand, ecc, nsectors))
 		return -EINVAL;
 
+	if (nand->badblockpos >= SUNXI_NFC_BBM_SIZE) {
+		dev_err(nfc->dev, "cannot store bad-block marker at OOB byte %u\n",
+			nand->badblockpos);
+		return -EOPNOTSUPP;
+	}
+
 	ecc->read_oob = sunxi_nfc_hw_ecc_read_oob;
 	ecc->write_oob = sunxi_nfc_hw_ecc_write_oob;
 	mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops);

-- 
2.53.0


