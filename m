Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90530606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PBbyETVF;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WT5zz0SP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=a90TSHLYo3ufI2Ap4R5Yr5uKZJ9gis2VXsyUzLmZH4s=; b=PBbyETVFLI6G57HxTecUd8mMe3
	v0Cds2MGYBI/mfHYjW69zJev7guK07hnNddEgHbf2H7SH1a8ppMX2GGMQ6C0ykUO0JT+MpILJsynD
	zebP3mBMFhAXpX5Z4JuJZpK+mGk2B6sZTcD3TtMKdr/aIRKzDuJ7unn3HRNKNA9rHtK5P06he6o4s
	dBavZzu9ZdSCGbW8VOQRGX4bRENVi2qJY2yLQpV/A5gg4pdRYiV2+wTIHnKw4JOiiv+qJJLyGdynX
	sHZsTo0p8STJySiVU+UiSF03eKARJGDMHp4zyuY0LRFvuVnQfwHW+97/km5pQb+gi8/mm6dtrZ3EU
	wm6b+A/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8Y6-00000006qE2-1jqP;
	Wed, 11 Nov 2026 13:39:38 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8Y3-00000006qCR-0Tvh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 13:39:36 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so18953605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 05:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404373; x=1795009173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a90TSHLYo3ufI2Ap4R5Yr5uKZJ9gis2VXsyUzLmZH4s=;
        b=WT5zz0SP0LAJy4vbgruKtkieZNFVfXSAXbdXPcSYUWsxLBdJKo/a82VYEfXXxugvAW
         uFdv8DhoLmOEDRxffE3bTQKAwtVs+WN817LPM4zN8wsiYL64hbMuk5H0vnzCorjzm7a/
         XbScLkyLyDoUwttCA2ERB4DSIZeVGqn45IJIp59TqAzvivy8GvKSKdcH2RflUoybwENp
         fqyygp6g0p4JVTuAnv5qNN0fKinzYnHlue0PtDVCaO3a9lR3TidbLWd/4cNGItxfstTo
         4YHWrGX9gso7K+H8cIY5Rpxn6A5rC/qnp9csIj2DweHGA9f5IYy3IHI36gAslMc0A3HY
         kQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404373; x=1795009173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a90TSHLYo3ufI2Ap4R5Yr5uKZJ9gis2VXsyUzLmZH4s=;
        b=u9FtL/A5MaI/d0zUyGmI5Y0peOkueY+lodiByz916RMK38a4BwFGYTxJdkUWBCMhkX
         KYQ+jOIkNzxnN+5B4wjeUvZZNT9BiE41bWcPlivviEkoJo8ssDIIxfRFKPvngYbqPgrr
         AKSVUwvQnmsg7iGekMJky1MTeqDp6B+l0gnnxoXdNoa94dk8yQt86wWG/mAHQ6wxeAPT
         XjPgxf+gTot9oMPtxM6zZNf0NCGSv6KZPg+Oh1f2eTjKQIG4Q5aFB1t12mYs7C4kiwih
         JRGoo4Qa4AG/WqhVPRHTNfZZmgLFDJXJksb7aEcYK/dbaGYYpZCYNmzySGz8u6LAMnID
         UWkg==
X-Gm-Message-State: APuU4Z8qRWF/Lu+7tRNipnmViNcm7wAEYnqaNqTxBMZcIxT1zBStVkLK
	TnN9wFe4uMJCn2En1E691QvYLGK9MDiWK4vJ4/HnVWDETtEegsY/82SZ
X-Gm-Gg: AYBFou0C4Ly6Frolymt+YuSVANNMpWDYzh1Csi/ujKPMo9pxQHda8SfxPUN3RgbCBGH
	H7DCCPKE2STn51NjSMHsUkiaEQLmk9EdI9hok63imwKxB5x4SYvzYzAbqrtbeqj9Pr7I8kjn/Rd
	899NDWGlQSeM6SONZ9YXX2nmsnF0MgL66nSNLLeZFnpUw/l3h6UcjdFNxHtBq2igKz2vnkbtEQZ
	jDOvkua4K1+ClAtUbC0dqWJl5VctD8UC1S39LHk5CeahUMK0pMCwSODKXt8qlQGuqVurJygm9zp
	qIqE5OmLkF1PNRM7pOfvg9OI0+yiE3BN4Btz7YNeK3e33dd6MURkWdz54i+BhW+/K6jCpXbnY3R
	KLzQkDbLvV7ZYMeC2qO3mj468iZZFgXn9QKwPy4L4fdtYTjx7YAoeQTdRwHFUjoPpk46ar9Q/Iu
	IiB0afojS+OdXOuxexWZ9rWjEjtPtepKw6rLNe3KuLsEnIChGTCpLFwrOAWH9krB6ZaX1DR9mTP
	aWx9314JoJDYSEJ+a0+2XyJow+2bwT5l/RRPMcrdioCqOknBxnxXffS7NPi8KhGPd2eq35IJ/WA
	aQc2zaNsBbfMWfV7EBLCt8T4YrFTItO7F+dIcuCiCqeGl7p2B2BD56si
X-Received: by 2002:a05:600c:34d4:b0:4ba:cd:f45a with SMTP id 5b1f17b1804b1-4ba09376eb2mr47955805e9.14.1794404372781;
        Wed, 11 Nov 2026 05:39:32 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm136757365e9.10.2026.11.11.05.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:39:32 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 0/2] ARM: l2c: honour status = "disabled" on the L2 cache node
Date: Wed, 11 Nov 2026 14:39:28 +0100
Message-Id: <20261111133930.3665251-1-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_053935_189737_733650AC 
X-CRM114-Status: GOOD (  13.52  )
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

Hi Russell,

l2x0_of_init() finds the L2 cache node by compatible and never looks at
its status property, so a device tree cannot keep the L2 cache off.
Patch 2 makes it honour status = "disabled", as the newer cache
controller drivers in drivers/cache/ already do.  If the firmware left
the cache enabled it cannot just be ignored, since nothing would
maintain it, so it is cleaned, invalidated and disabled instead.  Patch 1 moves
the number-of-ways computation out of the per-part init code so that
the disable path can reuse it.

The user is the ZTE ZX279128S (dual Cortex-A9, L2C-310 r3p3), where a
PCIe read on one CPU deadlocks against an L2C-310 line operation by
physical address or a Cache Sync on the other CPU, and the board hangs
within seconds of WiFi traffic.  Running with the L2 cache off avoids
it, and that was suggested as the fallback for the platform when a
lock-based workaround was found too invasive for generic code:

  https://lore.kernel.org/r/20261110153522.1620088-1-isasmendi.agus@gmail.com

Whether the ZX279128S device tree disables the cache is a decision for
that thread; this series only makes the property work.

No in-tree L2 cache node is disabled, so existing device trees are not
affected.  Tested on the ZTE ZXHN H3600 (not in mainline yet, on top of
Navid Ghahremani's v2 platform series): with the node disabled the cache
stays off (control register 0) and the system runs normally; with it
enabled the cache comes up as before; the firmware-enabled path was
exercised with a test-only change that enables the cache before the
check.  Builds without warnings with W=1 (board config and
multi_v7_defconfig); checkpatch --strict is clean.

Agustin Santiago Isasmendi (2):
  ARM: l2c: factor out the number of ways
  ARM: l2c: honour status = "disabled" on the L2 cache node

 arch/arm/mm/cache-l2x0.c | 85 ++++++++++++++++++++++++++++------------
 1 file changed, 59 insertions(+), 26 deletions(-)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.30.2


