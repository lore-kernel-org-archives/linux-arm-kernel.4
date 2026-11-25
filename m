Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AE5606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0tup942K;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=NQZXXiIb;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y4pI/Xmt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BGofZF7WnGSF9gs6MjlInhn49MlqjmtmyUenZnGkdj4=; b=0tup942KM+8VaD
	3UpGY0Ve7dYNNW7c2cA63XDsnjJM4LQlvqhWBsxwE+TzmLVIV4TMLgqLABNei43a665olzgY8ey7S
	IyWnGmQonfD/mdjQek5IUIvnfngfDYq0bhtY+qUtI/Yaam2IIoc6A5GANuyQyS/21mplddgM79itS
	eKCNjPCpfDvgmFuLxXtkSkKgrQV9dAoo/PU2HVZc/FBBUgbp8hZ8YbmPmGtJVMmiWwp4ZyERLk98J
	gY1yqkwUosoZfmUbXJceahi5temnl6GxxyqLKQAwgivnpT9UMM39+WD0tsVptPRmIAEA04NxzQ7IA
	Z6al7dyGwSVAzyfrdJOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7L8-00000008rFm-1pFM;
	Wed, 25 Nov 2026 07:22:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7K5-00000008qjU-3e11
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 07:21:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BGofZF7WnGSF9gs6MjlInhn49MlqjmtmyUenZnGkdj4=; b=NQZXXiIbiKLlrZ4cHj7flflx0C
	SFE88wQq/9rVN6EiU+ZMf6fEQQCUH6UUB7I4s7SZlfY+ngTgPdd3ycLJPxyL2P1zA3PnFqfbivNvy
	n7XwRtW+Z/mHRrWxJFOdmpWfDHc7kEOYHIp8yNzHBbsCzxoWonVMOyTvyysnByqjVWvepZWmRzouG
	QomN/jl6jYBBq7WKSXhBXHj4cdhuLG2nKIEtCksz86gWx5Gs659mjojJQeWYCgQUjcEfmkKVvBHgP
	xNmFL2piFwU+mSI5kHqDcj9QDq24dF9VPJrekXiDwX3wh9Iz+xdnGiBHdelHUCOqS7NZUaI5VFUQF
	O45/PTYw==;
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7K1-00000004yKk-3Xw6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:21:44 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-38190551625so10863583eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591299; x=1796196099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BGofZF7WnGSF9gs6MjlInhn49MlqjmtmyUenZnGkdj4=;
        b=Y4pI/XmtPOMOjm9laFNlyoG2Y0LQgPcvjEBOtHWuGdsASbx6oGXxJj1OvKIsNiUG0E
         0QiymrPfE4BvZ/5Ux+NN6tvWEO5RXju8JIzIU0Di7EZzyCQaswsj6lQCjgZd5flAG+0c
         Ux/96YyfDmkLLiyNoNWjVwiZSsk9kuUwN9MbyOjBCXf5Z8zJjos2/IHNvlhweuwxEj2H
         x8T1I0GOGzU939bzQiCpFxN7q1Opp/vHiwQEUu9o0avxX0pYy8Qi33UoDPxbMeNn5pjN
         63z1Qy5oFInXhr6K7mgsGRnl+VtI22Ska4iAVHCTIBvVmvTqJdNKrDL8W0ROGyRfSm4N
         08Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591299; x=1796196099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BGofZF7WnGSF9gs6MjlInhn49MlqjmtmyUenZnGkdj4=;
        b=PnXuVoUkJJgcxB6xSk+I5GzMl+FODW9yOC+fAQEw4tPZfbYggFxf0nccTozdKsKVy+
         B4EncXVxewrNqnJkQ6LMoI6u1l+/WcI+xue9IrWizkySUfWdglYbfi2d4wazm/aQHFQJ
         retMzfW4byS6hzDjfKC/5F10Quea3hSjltNULUygzFPtIsYbPLr4okQX7YZzmQk+Wltc
         OSqp4THy/qzRN8heljS8KCVwmLw312Dl5e1h9jBQw8OqDxRLdmVxxxINgANZM6z2tzUE
         r8M3m86mZwoXyehLjOlW/FO18B4Zahpv6vdXUAppy//rGAIHbCCCJR2J/FQmLaM2/ASR
         m+6w==
X-Forwarded-Encrypted: i=1; AL+hErEEVqh7ak5+N/npvMxDNM+AnFwMX1hQJq9VD812qbWSQ6LEHOjspqGsAOU+WZOM6YXCLaucsBDBnPlMeUI1nRks@lists.infradead.org
X-Gm-Message-State: APuU4Z9pK1itLoKw6w+l5aMed3E/p1gCXLiMz8NsbpDzPAPLZZoz74Ip
	13P8FSpVkbV8le9G/oaO4tPhyt2SyFA+hhmVc8Buc3a52McNmvsVVeGu
X-Gm-Gg: AZFdTZdiKbSPFKDuGcEZrbxfhTqfP2w9YG0jJCwMobl0c6K801mVwCqdPZpHls7qMfK
	pYwsu7/NCyivL8KFoks9uBxuwDDlkYVxCVeUcvWNTU95XydyUHkGfTAS2PJ14s6mk+CrbcM7NvZ
	g0+UaIZqFBy7t+d2ys6CrqrWHtEgPoEt6hU21dFchp2Y4OSKwzW7I5aig9PdziCVp+kF8mA8v07
	3ooasU+OyE378Kmn9Ir+lxhFraFQXxa3Pu560xxv60MssAFzzDv1l//vEwWH/vRss63J9oBLTXP
	703vNEX8ghV2tFLo+s+AasjS9oW+f1mIgmtQBF7oRWceq2ewW2H63IMIdeYbW+eTkR36uxihsJq
	haq8kG91ZoNZWvEt2XviVeJDG26iQ3ZlJlETzHC6DrM486tZi3orMSjCOgvGC+o5kTKVJJKoJ4k
	1xT+LaiCup47SPlyDfnrG4smswjk4tGqvYUlSESPLeSgBurzzAaGue7EutyLbBxq++52BWBm+A3
	HNHV6zikpG7/bd0QUTJq6zK4kUZQUfVv1JF227o6Y8pdsZeeZhIQh+cXvnJAVE3mbW48j2k5j3x
	ATpx7Ih2LLjI4wnTkG5cZvkxkaBdB6puIMuZCR3m+5vlvqBw/Ie7atQlHZuRLFKZF730gZRgPvZ
	OWtVoOLSq+Q==
X-Received: by 2002:a05:693c:69dc:b0:386:aff0:6109 with SMTP id 5a478bee46e88-386aff061f8mr9195868eec.2.1795591299376;
        Tue, 24 Nov 2026 23:21:39 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm62232352eec.11.2026.11.24.23.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:21:39 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
X-Google-Original-From: Prasanth R <prasanth.r@lineo.co.jp>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Prasanth R <ragaprasanth@gmail.com>,
	Prasanth R <prasanth.r@lineo.co.jp>
Subject: [PATCH 3/3] Input: da9063 - clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:21:24 +0900
Message-Id: <20261125072124.2997511-4-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125072124.2997511-1-prasanth.r@lineo.co.jp>
References: <20261125072124.2997511-1-prasanth.r@lineo.co.jp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_072141_809978_DD462433 
X-CRM114-Status: GOOD (  15.70  )
X-Spam-Score: -0.2 (/)
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

From: Prasanth R <ragaprasanth@gmail.com>

The driver has no remove callback, so the wake IRQ set with
dev_pm_set_wake_irq() and the wakeup source enabled with
device_init_wakeup() are never released on unbind.

When the driver is bound again, dev_pm_set_wake_irq() finds the old wake
IRQ, warns "wake irq already initialized" and returns -EEXIST, so the
driver warns that it failed to set the wake IRQ and does not enable
wakeup.

Use the device-managed variants so both are released on unbind.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: d7781232b5b2 ("Input: da9063 - add wakeup support")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/input/misc/da9063_onkey.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/da9063_onkey.c b/drivers/input/misc/da9063_onkey.c
index 98297ca1d..304fd674d 100644
--- a/drivers/input/misc/da9063_onkey.c
+++ b/drivers/input/misc/da9063_onkey.c
@@ -229,13 +229,13 @@ static int da9063_onkey_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, error,
 				     "Failed to allocate onkey IRQ\n");
 
-	error = dev_pm_set_wake_irq(&pdev->dev, irq);
+	error = devm_pm_set_wake_irq(&pdev->dev, irq);
 	if (error)
 		dev_warn(&pdev->dev,
 			 "Failed to set IRQ %d as a wake IRQ: %d\n",
 			 irq, error);
 	else
-		device_init_wakeup(&pdev->dev, true);
+		devm_device_init_wakeup(&pdev->dev);
 
 	error = input_register_device(onkey->input);
 	if (error)
-- 
2.43.0


