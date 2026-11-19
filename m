Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6780606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UVqSSV8G;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=loFriHE7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=n0YIwd+6fF1gaH/fRdW2fKrVKfd8aWdILvAcZvt6cEU=; b=UVqSSV8GxLjpvh1vW1e11MsSPp
	bDwLnHaF9G+HVq3DXhGPOb0C/vMrjAHN4HfkHnAwN36QtgKHja0mpbZs4wohTR6YLXtk+pYqU4UOZ
	twmGXstjRhtuzD0ZiYtAGFQYCwAfmChitQXSGj4skfFIDZZvZBkduIF79nU9LsAMdLR5JcICRVq59
	CY4MCUOLZHW7XkfXth6KRA+S7mJgGGP9moN6Jc9EHkYIKIjEIGaUH4ML/UY9B1HdZAoYBR6+ccyOc
	uJH7CoO3hsHptHFEU8kxrDq1RBcCFTuKr7jYft/zmg78WgBRDDonhXr0nutVV1nVivqNHSo46TSoO
	r7zFFo+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2PI-0000000C6Ef-0QnK;
	Thu, 19 Nov 2026 13:42:32 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2PG-0000000C6Dh-0RUz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:42:31 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4aa5833c263so454282f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 05:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095748; x=1795700548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n0YIwd+6fF1gaH/fRdW2fKrVKfd8aWdILvAcZvt6cEU=;
        b=loFriHE7VxnxJPHeeRImfUXJ4nKq4HBxYP0fZy3D5vMefpwVcSoeWk2zrGOFLjI6nn
         VxfuEztro0jcQZd14qoGJ4Nb6Qgyk4XgFPWBJLy+bWm9BaNUGgR3ebQpN6m1nh1cX7lF
         Nii6JA8i0NjxsB5cOZ8z457Qx+BoaRfN+CjKMWuK9Kd6KSkt7TykMCJXcXOv7O8mS1wm
         OLNuYj5utwulR4n9lV3YywWnHwllYBcOBYJWGlxRzvJWH4hPWaKWCp1uj3H9bw2eZnT6
         V5zQikTWdaDNPFdj19NAG3mnhSrdOrzsLBPtUAdqStl/dZUWcEXFMjoBOL7D4rc/G7Nc
         4AZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095748; x=1795700548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n0YIwd+6fF1gaH/fRdW2fKrVKfd8aWdILvAcZvt6cEU=;
        b=f95U76YXfi/4LOqm8/wH3rT8Q5jpRzHk2VY3E25H+VqLjGGR+dM8S1OgQDZIdmbp/T
         eCloD2iTM7Gz/+a/uxoWw3rcvTWPswAKcz8Fz6yryKeipkvyivf+lg++IVCdzq6XkTOk
         EbAODDX/88tvj57ONs/neZdQc2s0Wc8KRI0nnt0ZVR2oGkS6y8aD6MMIuv3+H8GWTbnr
         HBPC9V2FIL1JDqFYESi8NUl6TV/1PZZJA8whEWOCew1T91DNre8d8wClF6jqIHVQ9ycs
         baSzf6jPxSxrolgiheJDMYE2SmVqctYYjdp4Y0nLpyDQxv9TeyqqMCGlqY4L8zOF1z91
         toyw==
X-Forwarded-Encrypted: i=1; AL+hErGnUPJ733Br5BDHOLJfq1FiiDjlAYnhlYhArINyVtK4H+obm8M6NLygDP63rH8uozSjvkMDivaW9xqDjRxCM33V@lists.infradead.org
X-Gm-Message-State: APuU4Z9W8mpET2iXJ5UmRP6AAsxvz6fnuquTH/cHmCnSBVy0wyGnPZk0
	nETe8pX7BgDwgbCPM8TxE8scXToe46aiXvAxDoTbBXN2M4kjXdeKL0WCD93lmwGL
X-Gm-Gg: AZFdTZdlDOzHOBT45y7xCa6EklxRZC3SpH3ebfpCCCTNjBXvDQ1VvEFuMY4mcEWZ5py
	lU2o1dQLDNAcK33AwiVAAZ10v/g1tyqp5owuH4IIDZ3TXjTVEkArocB5hz2k9TlQj99lXE/MOMs
	0c/9GPS4clq3UxJ3yyP5NHOTwtLXHuepaFoqMB4ajarkIanCkk6yeIU/WNQxpidq7TIGabVYa7u
	jfUrCbw9rt9Hz3qmbZIEGFoNMjqd4YJJNieL4Mr7b2rBZXAFwwLgzQYkJEOM+63/23xLhlhjz/n
	1cXtbaD0iN7bcniFPYiGt78DHtgRNuYfZVrfXJa4XAD3VNhU+QVh59L1rKxb8ypBNQYbtDwelv7
	t4+7KMEIVFonDBAG51kcy7VdQKEMorSUGfxJUlTgcZ57e3wldEKNiYvqbf6a6s9yWfVrX5IHy0x
	UHHcCI7Z3gIC6oF4441v1XZSbM0IGgIhNGDVxfW9E69AJrs8LF1fAYchcPVqvywXn0AaUVkLI6i
	TY/lzrz+1+eLR8haJFSDRiWnF5OUuuLcMBhJYf+y5q5vf9g3P4qhXnkH2sWlO+ht113sW7tr+JK
	CB7VK+37GcbY/wr3aZVlwz6lezVwjVVbQ3o=
X-Received: by 2002:a05:6000:26c7:b0:48c:67d6:a87a with SMTP id ffacd0b85a97d-4a639ff6138mr14542869f8f.32.1795095747665;
        Thu, 19 Nov 2026 05:42:27 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095e98sm9437971f8f.42.2026.11.19.05.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:42:26 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	Yao Yuan <yao.yuan@freescale.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v2 0/3] i2c: imx: fixes for a DMA write that is not acknowledged
Date: Thu, 19 Nov 2026 14:42:22 +0100
Message-ID: <20261119134225.265242-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_054230_169233_0ACFCD2A 
X-CRM114-Status: GOOD (  15.77  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

A write of DMA_THRESHOLD bytes or more to an address that does not
answer leaves the interrupt status behind, so that the next DMA read
returns 0xff for every byte without an error (patch 1). It also leaves
its DMA buffer mapped, as every terminated DMA transfer does (patch 2),
and it blocks for DMA_TIMEOUT before it fails with -ETIMEDOUT instead
of -ENXIO (patch 3). Patch 3 needs patches 1 and 2.

Tested on a Colibri VF50 on the Iris carrier (i2c0 with DMA, M41T0 RTC
at 0x68) with this base, the other i2c-imx fixes on the list [1-4],
PROVE_LOCKING and DMA_API_DEBUG. Each round wrote 20 bytes to an unused
address and read 16 bytes of the RTC:

  without the series, 200 rounds: 124 writes failed with -ETIMEDOUT
    after up to 1.08 s, none with -ENXIO, 163 reads failed, 128 more
    DMA mappings in use afterwards
  with the series, 200 + 300 rounds: every write failed with -ENXIO
    within 10 ms, every read was right, 4 more DMA mappings in use
    after the first 200 rounds and none more after the next 300

On a v6.12 product kernel with the series backported, 200 rounds that
also wrote 18 bytes to a device that acknowledges them: every NACKed
write failed with -ENXIO at once and every acknowledged write went
through. A NACK of the last byte the DMA writes could not be provoked
on either board, so that path is not tested.

For stable: 6.12.y and older need backports, as noted on v1; I can
send them once the patches are in mainline.

Changes in v2:
- 2/3: new. Sashiko on v1 2/2: the new -ENXIO path left the DMA buffer
  mapped, as the timeout path already did
- 3/3 (v1 2/2): a NACK of the last byte the DMA writes was missed
  (Sashiko). Its acknowledge is now checked once the byte is out,
  before the final byte is sent
- 1/3: no change
- rebased on v7.4-rc3+ (4405c18c95d2) and tested on that base; v1
  was compile tested on its base only

v1: https://lore.kernel.org/linux-i2c/20261113073250.1037215-1-mehmet.fide@gmail.com/

[1] https://lore.kernel.org/linux-i2c/20261113110501.1142036-1-mehmet.fide@gmail.com/
[2] https://lore.kernel.org/linux-i2c/20261116122707.1349139-1-mehmet.fide@gmail.com/
[3] https://lore.kernel.org/linux-i2c/20261116125940.1368194-1-mehmet.fide@gmail.com/
[4] https://lore.kernel.org/linux-i2c/20261119130542.180192-1-mehmet.fide@gmail.com/

Mehmet Fide (3):
  i2c: imx: do not carry the interrupt status over to the next transfer
  i2c: imx: unmap the DMA buffer when a transfer is terminated
  i2c: imx: return -ENXIO at once when a DMA write is not acknowledged

 drivers/i2c/busses/i2c-imx.c | 52 +++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 18 deletions(-)


base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
-- 
2.56.0


