Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADBE60A2627
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=emM6xFhn;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KNBk1GyP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3q3WBayPBlbewt1E1eNRkQsJMusptNxG4L6m1LCm1Ic=; b=emM6xFhnMeobQD3AJF7Im352Vk
	uNQ+K6F3wnBjhJvlD+12JFuhnLoOFy+IqyZefX3LZdQVblkExiAAZW0nkSSUMXoOggn2z83tt1DAO
	fAiX1iMgyuaICdVnqmmQaFRYrmkEhRTgfGkUuMNcPA189j7T+jo4wKyc2lvvPStqLCwJskAZ1zr+n
	4RrH/NS4m7UNXDTb5vSRWUHBGCxZOb3grxS28gbXfKWv3kCZ/Y5ZV77vNXIIVIm8drcb/8EQY2Yn0
	vXrAmsWCZ8rzEXvOn3Z6pZhJOOTXqzmuZBFHG+ENnvSL5VW2eUp1aC+xnxGdlx01btttQAgxdoO6l
	n0Ui8JCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThSG-00000009F9b-0e4a;
	Wed, 18 Nov 2026 15:20:12 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThS0-00000009EuF-0FEJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:19:57 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so769399b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 07:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795015195; x=1795619995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3q3WBayPBlbewt1E1eNRkQsJMusptNxG4L6m1LCm1Ic=;
        b=KNBk1GyPc/UzElS+qKZJQgjiVk5r5z0a+rzaa4wvskuUSOqNWXrL1LLtJgOJ8cNLYY
         8DFqIjnuiz/8H2OIStPfAS7Oy7/gnQxJigqjwaadIscH1pwJKoTS4Ywctea3h1M/0rNz
         opu0gvRhbQROPWzJ+G6nw/X68RSijkDYJvtHbookUNqJ98I2mPlhc/FIHKVtUt0/r3BJ
         4u5a2DjhHVRmEFI1Xilt7EDxLFaHA6dNeJD9pQCn0cyVMO3T8iXYAfrMgRYYkahw7/q/
         dMV4qZp8MTlbhy7xln0r7p50hFvUKEfgWQPPn8nOJ7u5n0jfzJHpDt+w/C2vM50PWb7s
         pZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015195; x=1795619995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3q3WBayPBlbewt1E1eNRkQsJMusptNxG4L6m1LCm1Ic=;
        b=mTSRYJxUW57wiz4NHP+hSN099WH+E5MIUPaMGSZT2HmaiDuEW/OmzmloOAyfVutK5/
         zZ83b2xmGJ01Lj1syX6pyVVBEFbhMpce0uetxkdN4wFSf7+vlM07q9hlrYQjVVrnY8B9
         29aC7fnngANQvR38nPWLuT5ojTpGW7NW8KDa+jE8xfsCkSfsYvOy69UXCHx1h2d4IvsO
         3U0Xe+HlWak9lbR3s70jKbmh5js7H8tmU6T7+QjnfelJxYxzGAsnI/e7aUk6XTvW7uRC
         UIIzaxdFlGs8TI+qVppl9r7/oSUP3/dIPrIWzD+AEb8F3j7UHZFhejUx9Z0rU7FK+rpl
         ZBiw==
X-Forwarded-Encrypted: i=1; AL+hErGNDNcEz8R3NHEvpv+F8IZnTjipGNclSXGYAOTIbdWhnyYaIYjU51H0Z7XyMtr3xDUAYsUhgyHRoEHjq1ZSyXg+@lists.infradead.org
X-Gm-Message-State: APuU4Z/eeuffRdRabnXwnksItEnD6kTZgrLiOjQJSq2q50rAIGJb900a
	uZ/+lJlM7eJDQiUq8bMN+Q64scJ0OMlrkULcz6r9mEk17lH/g6OyUv+i
X-Gm-Gg: AYBFou11As8caSo+j63kHd7+US4C0P8ZM7kVlphwiwz9TVihITsprrrR9GOxE9GoANy
	0nAjuuQEmW6LHwtjoqHrCPd4ZPWhOVquGlNzvmSyjyh8XL4nB9pu1NPxQb96CKJOo7MfPeYHaYQ
	YMnBVYRTACWoAiF1A/1R+ZFWNzev5Fmvxuj+a5kdTihhpfyZdwMjEXet57TUKD3cz+GzW3Tkpvd
	tgbEHq90IC0XZhIdd4SRBwCnQn1tYmONRgkz0kl07fLkiwUcKO9d+lDpZQ5oTbZQkX1+ZLhyGlW
	sEKgfkwLlxxxs9q3NnwhoW95s54N+KQKOnbmMhBXCgwTlqqTIRdfiw9XnA2XZ5cAGUGHMuU8iIt
	U8B6q4eCFppPd4KZGM92rUHq9QnBNQEGGcJmzhWOZ0q3vyePcYreW0W6fpg/5SJDTRcDKPyAJus
	fBqrqLTAifdBRH4VzIVs0xc9vNchzAnDAp7ULmuN0oxR8xDIUrD4niXLL9BOZ1NZ4CPNN4A3qHV
	wCZ/G93GEbesVc4D8Y7uJsFzdNSGF51fHxKqTOaE/t7W/B0iOvUC0wsbCKiO+OZaTSsFOZObd/a
	j6HifnK05XTVO7KPe0uj6s3eZws6dlykrHuQX0Kzc3ku7wkg2sUQ2g8z9cS2i3jYeSuc2w==
X-Received: by 2002:a05:6a21:32a2:b0:3eb:98d2:cd89 with SMTP id adf61e73a8af0-3fe892fd694mr3439498637.25.1795015194581;
        Wed, 18 Nov 2026 07:19:54 -0800 (PST)
Received: from eric-N-A (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aa27dsm1408559b3a.19.2026.11.18.07.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:19:54 -0800 (PST)
From: Eric Yun Lin Chiang <ericyunlinchiang@gmail.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-edac@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Eric Yun Lin Chiang <ericyunlinchiang@gmail.com>
Subject: [PATCH] EDAC/aspeed: do not fail probe when ECC is disabled
Date: Wed, 18 Nov 2026 23:19:07 +0800
Message-ID: <20261118151907.3949719-1-ericyunlinchiang@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_071956_115999_83F42ABA 
X-CRM114-Status: GOOD (  17.03  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The AST2600 memory-controller EDAC node is enabled by default in
aspeed-g6.dtsi (it has no status property), so aspeed_edac binds on
every AST2600 board. aspeed_probe() reads the memory-controller
configuration and, when DRAM ECC was not turned on by firmware,
prints an error and returns -EPERM:

  aspeed-edac 1e6e0000.sdram: ECC mode is not configured in u-boot
  aspeed-edac 1e6e0000.sdram: probe with driver aspeed-edac failed with error -1

Running without DRAM ECC is a normal platform choice, not a failure.
-EPERM is both the wrong errno (this is not a permission problem) and
one the driver core reports as a probe error, so every non-ECC AST2600
board logs a spurious "failed with error -1" at boot.

Return -ENODEV instead, which the driver core treats as "no device to
bind" and does not log as an error, and lower the message to dev_info so
the reason EDAC did not register is still visible once without looking
like a fault. The AST2500 node is disabled by default, so only boards
that explicitly enable it are affected there. No other error path is
changed.

This change was prepared with the help of an AI coding assistant, which
analysed the probe path and drafted this changelog; the author has
reviewed it and stands behind the change.

Fixes: 9b7e6242ee4e ("EDAC, aspeed: Add an Aspeed AST2500 EDAC driver")
Signed-off-by: Eric Yun Lin Chiang <ericyunlinchiang@gmail.com>
---
Tested: the pre-fix "failed with error -1" was reproduced on an AST2600
(Facebook Bletchley) BMC by triggering the aspeed-edac probe over sysfs;
the fixed driver builds (W=1, no new warnings) and passes checkpatch,
and the resulting behaviour -- aspeed_probe() now returns -ENODEV, which
the driver core does not log as an error -- was confirmed by disassembly
of the built object. NOT boot-tested on hardware (the kernel was not
booted).

 drivers/edac/aspeed_edac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
index 6e069b255..e6f8cf78a 100644
--- a/drivers/edac/aspeed_edac.c
+++ b/drivers/edac/aspeed_edac.c
@@ -295,8 +295,8 @@ static int aspeed_probe(struct platform_device *pdev)
 	/* bail out if ECC mode is not configured */
 	regmap_read(aspeed_regmap, ASPEED_MCR_CONF, &reg04);
 	if (!(reg04 & ASPEED_MCR_CONF_ECC)) {
-		dev_err(&pdev->dev, "ECC mode is not configured in u-boot\n");
-		return -EPERM;
+		dev_info(&pdev->dev, "ECC mode is not configured in u-boot\n");
+		return -ENODEV;
 	}
 
 	edac_op_state = EDAC_OPSTATE_INT;
-- 
2.53.0


