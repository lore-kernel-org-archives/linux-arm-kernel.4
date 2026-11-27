Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6BB606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I5ZpWGzG;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UItYDhIL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=SVK9o+TEy+mRM7Y9b0GBxL1NkApW4WyeZVqrEHMtafo=; b=I5ZpWGzGAx1xDKvGRP9f0dzMYB
	5gElKQ63Q3g2K+mQZPRi6HljHVPvl8j1QGT06+kYQjkL4OHJybTiBNJ8CxOBKfjNL4UfWQ5VOQtoL
	Os6yU3ESye+7RL1dertrkDsyOzCpeUM/QOXGvJ+TBiFWmLNzFdsKWtqQAJ1NI+lpucZUTS/FD1DJQ
	8/WT8U5IHGT2D5QjQwDL53/EHqkve96JwkoSk7CXf9trqJu3aVMsnLGQouyQMDP0NCTVBH35S68zE
	IO4vWK7g58Oz6ZzfkHuPi9ieVpL21npJtEzIum3dtj6ft1dU/w4Gtr4D9J/8JpJPZTOVLx+PU2Eet
	hzZ285Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsQu-0000000FSpI-0qQV;
	Fri, 27 Nov 2026 09:39:56 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsQr-0000000FSog-3L3U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 09:39:54 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso7083517f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 01:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795772392; x=1796377192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SVK9o+TEy+mRM7Y9b0GBxL1NkApW4WyeZVqrEHMtafo=;
        b=UItYDhILbKmfdz38RwgZSAfwwmUFx0o7zeRwKnA8gGqHc7BLEtQak2N1EeK2uwBbaX
         5cww9CBcPCx+dASwXU7yrWc8EgItShKy+Oy/CmA1WcGQLD1+CWI0VbeHOw1bRuerLgne
         /TMe5dyG6tMa8ntJFwM6pZcJLxWa7qqilMKKLM/A5eWN5rhGCqrYxZzsg52d4wSgmbQ3
         2dMaV+iqtsZESlr+8WP9irOuUlOz6oB71+FeH8L65MCbdSWWi0T76vH2Pt70Qo/4KVe8
         /ft/2totvR6T0TxhuDfTXOFqPIwH53Fzyul/eEK3VwPjIgjxlutzU5VkbwyNEl/8EQCK
         IhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772392; x=1796377192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SVK9o+TEy+mRM7Y9b0GBxL1NkApW4WyeZVqrEHMtafo=;
        b=vaLa56Uu6su2LEyBhPt4FddZAsxDsXnacHBh3XQe/E7gJQeM2Hbr9ZOE2i5TDhba+n
         dLl+OIAlGoES8bFLUqEoN8ZeEnyQPbIM+1XG2zvA3kow5ggOAMwXFO/jIabY5sRuFMO2
         cb9vAZD62ePGD6zx3W+OPZ9aCpo2VSPzszGcRe8IHWw8Li1yHLbxSScPh4mZXkWFAyrd
         qDKotY2HkSwTVOThXnoEMrOwZg0k8O+0OuY5wfVjF0IaD8WuXin4xZO9M48gDCQf5Qwc
         lS6v4TXKAK2DSUQXlO5Ea9g4O6KNIX+W7e07V0VgW81Y0n1hKlKSrUBIkMLS/n7YBDJe
         +vWg==
X-Forwarded-Encrypted: i=1; AL+hErEGMtXYKHt9imrwE+agARzUUDhNt2neZ8Kq4ZZ+KEVy9VD3WYu7hnIO28Q3ZrGHNBOm18eqPIalX5Ynaqh4nLWO@lists.infradead.org
X-Gm-Message-State: APuU4Z9vuYVklMcY/r8XRYvBfAEODyni8Ife7B5U7qd/2g2ihsBSlMKD
	mpC2hvLvU0eYilb+ORkAXiHHrtMZqMf9DlZiflrZAj1xKq1W/l3X97G1
X-Gm-Gg: AZFdTZdlHA7HGLxVU/j+SO0h9WyDHXbjwsYiKY8kshU0M0j5eJs33umNyFnPwfCGZWm
	LpJ0ah6Swe/lF0DWxx7i5lhkU9EbhQZRgCHtCp/6FJGTRDqbQSdh6JPQ/iMjmqduma4/7eMdB7K
	7lLZCQoOhAUykHx1fWasX86TLJu4jvf86++urvaIQMy5Y1bhfqMhudhxeAtlXKfYtsHElxPvOXD
	LbfsxxxVuZAUJ5HPRQnFXkgdSbkxwR2CADWsxheOGsgD5uJhCFqOjRp0gAvmifWBl7uIYG3F+S6
	kSPsRyh9yIvuJJr5DG2tPxY3t5ThOx/jtK6wo7kzlJXRIVcscoNCye/vqSp7IqEv3mCS0uZNfuf
	Z2k+fU0CcGaQII2dak5kTEWn5NS3TwenSM4YWpcCpiMR1eqaKQAzgnNUDZwqlY0DTgV3+bGiNKU
	orZ8jVwFHmR6rNncs3bFWPEBvtyRkueS1y39spuHJ8tPTdITP5gMCYtmAV4Kg9otmSHaIy6rnOg
	YFckOtuKtGuAQCpyxnfk2olfoGdqYyPwEBWsTFAQD+5m34kmCbbhBbhhNGLvoq/Zj16v7jp96Mt
	FCrV9xi/Idcd2zwx470BnxBwiooF3QUjaFwYoJMKQvDvU05Gz9DNb+JycwpaSL63bL/M
X-Received: by 2002:a5d:5f53:0:b0:4b7:6ea2:54be with SMTP id ffacd0b85a97d-4b76ec0df5fmr25970915f8f.14.1795772391607;
        Fri, 27 Nov 2026 01:39:51 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm55531185f8f.21.2026.11.27.01.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:39:51 -0800 (PST)
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Sven Peter <sven@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Anton Protopopov <a.s.protopopov@gmail.com>
Subject: [PATCH] iommu/apple-dart: Properly check the error
Date: Fri, 27 Nov 2026 09:51:18 +0000
Message-ID: <20261127095119.1342988-1-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_013953_861151_E174F44E 
X-CRM114-Status: GOOD (  11.05  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The apple_dart_device_group() function expects pci_device_group()
(or generic_device_group() for a non-PCI device) to return NULL on
failure. However, both of them return an error pointer instead of
NULL. The error pointer then is immediately dereferenced by the
iommu_group_get_iommudata() function.

Check for an error pointer instead of NULL and return the error.

Fixes: f0b636804c7c ("iommu/dart: Clear sid2group entry when a group is freed")
Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
---

(Found accidentally, while working on BPF stuff.)

 drivers/iommu/apple-dart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index d8302128b465..36ce5ac39b7b 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -981,8 +981,8 @@ static struct iommu_group *apple_dart_device_group(struct device *dev)
 #endif
 		group = generic_device_group(dev);
 
-	res = ERR_PTR(-ENOMEM);
-	if (!group)
+	res = group;
+	if (IS_ERR(group))
 		goto out;
 
 	group_master_cfg = iommu_group_get_iommudata(group);

