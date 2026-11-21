Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3ED606A335
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 01:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vDErgjig;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JmWemP69
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T83jSZtlzKtrASqdJI86cD7q3EhrQGMc7SvJoDp9Zl0=; b=vDErgjigiD2+bA
	ObEYWud33mlcNVwn98b79TgwA4YtVErvgHuluEBZOVMIQmqv1dMYPPghrPev2EllcoAxrFlSLQSML
	jxbVowoX9vmHmbCmHJ1iaJjs51Yc5Kiufm0eMDWPzBPXaUU4rd8idqK3Pj3nS1wTGRJWnrT338sI9
	iN3ekQRaysuVzDr20PBt+0fezRwQJCgHZnGlE11gSS88V+wJTM6D6vJov9t8wkkGnv5CiSl6d6vML
	Djwke4xKSi6eh91aE9CpR/Pebqr8XLPvLT7sZfkFJqSsk54zHV4vFzw1hvDawL++L481GrT0EjMi7
	++asgOmmtbJJNSkGbc5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZfA-0000000Gau0-3J2q;
	Sat, 21 Nov 2026 01:13:09 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdG-0000000GZIZ-23ep
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:13 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-571c36e48d4so394116b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 17:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223470; x=1795828270; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T83jSZtlzKtrASqdJI86cD7q3EhrQGMc7SvJoDp9Zl0=;
        b=JmWemP697EYReM+wYnx1KTsefIX/dHAcoUF026WGNCigp83ILzSyK3zluiIUUHeXrV
         TnwWbvFkqA3AkeLaNUHZBM2UNOO0064gkB3hqchw1QtGEnJ7TLZgr/b4GgLRYwlzQ2Td
         qA+inqvss5BNRgb8SI28udFDKKxOqHvZubqVxmFLUf7iGEWrsU91Mn0akc7Ywavk4nQQ
         swn1GzYumMb8PST8gJGgSlFplj074v7CJVZ01w1VGF/FRgJl1CGumRlZ8ktUvuk4GFLX
         ZiMLpA6UMkQ4yucyoTscHMQWvskvtdSr+hyau5hobuXs1otGeUWXV1q1wtO/VtBh/AEJ
         hboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223470; x=1795828270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T83jSZtlzKtrASqdJI86cD7q3EhrQGMc7SvJoDp9Zl0=;
        b=vIIPk91kyT1dwjp5QzdDm8J5nwXqsqycolxK2bkfjirHZHmAN2kiHloo+WX0e/1pIF
         sTN1tCYbn51RwWxmG1zTUKs2Y/Bte4i2Dsf4FAPao4CIRCZySUmocWPhKkBGpkkpUvJr
         AdxggG0k1jwQD7Axo0ZyNKeRhfP7REehrRyMHuY+JFFBdCUZEYPfPHgMEYlOLeC4GmvI
         B6fZvyGbUURAuMyBke08pP+r4S4S4lUnFstCa2AmiRIFnXqyqQml2IUxi58h3Jh2W612
         Y7tZ/iNZLil5S8P1rY4i6WWpH1VhTx2Gql013tNcyxhmFyRAsT+9T60q/EqBfbTsFyoY
         VZmg==
X-Forwarded-Encrypted: i=1; AL+hErF5ksHBPphJ04cxCAArusXkx80R8Pu6ifUkKlZS5Kw3zwfLuWMZxzfhCmdA/wKklYVGJjILoQaJwi24sbzIAHAY@lists.infradead.org
X-Gm-Message-State: APuU4Z90rF8/xX9cwxWB4rHRaSwqSCwwgdwDeEnrR2LsAkRN0Fc3yIbC
	3s+N5Pi6CmQArDkXRymIYFFPc6V7pAiKXDZu+MHnQ9Gyj4/ZFhGyCtk2
X-Gm-Gg: AYBFou2BvWMTJBCYKLu5pYmPsuMTjTzrfHBZJRMoZU/gdUy55gX4PmsCfA8bvANglGT
	Lv28d3KjxGlTwxv7B+GZe0yuim4rrBInCEjJsqWGyU6AqObfh+oFaUYdae6Brlwqz4F3VM3xRMQ
	L15GH9Z7xGBPorPByhz1EaBMNlGRaZk5zYtX4oXC9Layy9d+7EUF0lP2a84JzOSJl2IfmvmfJNw
	dznoR5b0k2HnxYMPEmJcGyFLoUDWZKuhy81a3xs/MqhjRJ3ruCkpIWBTECGfijnNILd+iRWHZWx
	x99BtOvfEw6f/IEW4ZF0J/26XcIGck1B68W/jr6vIq9/e74kZ++LOV2hwDLrzLeE1qQdKWlhDwb
	1eFhBkxo+MSj9FovikvtpRXElp3H+3qH4tVTD1AjthfxhlTop4GyJKRjZ3zv7sAKn9ar37OqUqE
	tuxwidE6BRUMuXcQpsPpkXq2kOJMBQkZ+heCGQvdFLlQk3/njFfe0AaYTF6S7QflN4oADnx7dUj
	b4XYykguxiUU/qUqTA8CwVlp5jElvLox58G5uBC2f9gpg4CwtKM9YR5GKgUT6tcED9mArZ6rgDZ
	DZw/Ca3YTwew/xCNCn5OSWL1qdcRmkosQVUpThX9feSmsCQ1A8QBahc+5sRpeumEQLZBepLnr0y
	24khJiltPJfK9SsOHBmhNPcm0aWQlaDTMX9LoI9DXhn4AFhW+Wag+0sU1cPI5SLtGDKjdBYk87u
	4TfvkxWmyugZBItIY7W+fCbYeJvTvaOu0BfhIk6LzRUGeTkb0gmDX+
X-Received: by 2002:a05:6808:19a7:b0:55c:844:98b3 with SMTP id 5614622812f47-57a0bb53de5mr6320056b6e.50.1795223469671;
        Fri, 20 Nov 2026 17:11:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:33 -0700
Subject: [PATCH v11 10/26] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-10-9721b1905ef4@gmail.com>
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
X-CRM114-CacheID: sfid-20261120_171110_660997_052BE3CC 
X-CRM114-Status: GOOD (  16.02  )
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

A DMA read with scrambling enabled can report success but return zeros
for an all-ones ECC step, or all ones for an all-zero step. Requested
OOB can also be filled with the wrong pattern.

The controller reports a pattern-found bit and a pattern-ID bit for
each hardware slot. The driver tests the current slot's pattern-found
bit but uses slot zero's ID to choose between zero and 0xff. PIO only
uses slot zero. DMA can report several slots in one transfer, and
their patterns need not match.

Use the pattern-ID bit for the same slot as the pattern-found bit.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 76f60fde7a86..43c0796d953a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1086,7 +1086,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0


