Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BF2606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 20:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F8T4fCK4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GhLRVhvz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=; b=F8T4fCK4A/2KCs
	YCBcMZdhmRjoCN3VGG/LAl5B3vOs+i1B9QjyWHyPszIQzLUdEd84pYUGiIhLxwp7gSOYvlfUlny09
	psV22gWBVwe5enHwde3z2Q1zyMEETa409mZNW8YSeygSC5HSmf2K2A7f4FC66PHfQT3RTAdIjwcr8
	yNZdSQbTsn6JjosNhfQP6QtxVEvJMrHXwxfxSyAdwob0HPvvvc59tz5asBuItaa6Y9CPGzjIlclVA
	5+wpey5w61UBghC9+J85Euc2lGGieZqOH4HftSvi9cqG4jrMFnvaMBrvIf8hi0lddSFD+LYBKzUOb
	YJUlrq0yzv16bymJXqMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRbnF-0000000B2NX-0m0Z;
	Thu, 12 Nov 2026 20:53:13 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRbnC-0000000B2MT-2F2E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 20:53:11 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so3724215e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 12:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794516789; x=1795121589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=;
        b=GhLRVhvzR4pminZ4NJ7307Y1PB0l/ICpYKlzRgOobitILewEPF1nR9Pjt9CIZyVb1o
         GSKWVY7ukJgckoVrDkffU8LiP7ffPq3NIZXdqSsujtzVVHTtnDm7zbjNBVapk52lI7fn
         GKF28TvMRSuDVHhY7WEiOsiOS88uJzXM1c1D/yajR2BbQl7L/8ZP4ZRXD0ieP+DrZxlr
         A+ORsLmn9xs+ypypgnUqF+27mPVpkkWo12OCkLfF5jXMEsD/WQnXfdmscaFTHh8RMc/Q
         4WYbcCicLJRXl6Od4FaaOMFdBQZ+qswuDbuStlkWlExi/4klzswaM0BSJAo0xFNaulMV
         gX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794516789; x=1795121589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=;
        b=nqMwTCzidvm8YCFMVTZmUVkSO9P6hF/ar2LVLFz7jKw9j30bI0lJBEmsQFWUF7ybxj
         z/RPF3Z60LiJSUNGOupRAQgQ3cM79Fe1tGjZ5YRuZnWhIjNao6ND9OV8mCamqln6vCec
         C09/hjNo7+IzUCZdL0QvnlLRmM3S4wyPCFYgAZyCwBlFz39r6UMZU701qPwVr7vU7O7x
         bsOzWMbdv47g0hDJ8oyE6nlpkydXkcGZhmdzzJJ8r5gMQ5tAsYn6GmTZsKjkSq4f48Br
         B52RwZsrm+JvWNdJ9n9oEj2ioRxHgsPG0ENAfFhisyzWr3+RbqL16k3xTyT5IwiRG3Pq
         sfVA==
X-Forwarded-Encrypted: i=1; AL+hErF4c7Niy+hPYK7ZwqjruvPXNFBBuwxaNM+eGF10hn6EzcRERJHKigNKlgKFntBSbSDr/hkYx9CaAA22S5SkU0NZ@lists.infradead.org
X-Gm-Message-State: APuU4Z/rkDwaRDaumgcUlpMhqrfnBQ4h0hkUTyh25qA/bzuVsPCTbBTX
	hSH5rq/r8mz1AE7TR0w7LBSG38uyuoQFTic3r5gfSL2fyuiUC+/3O6u+
X-Gm-Gg: AYBFou2ZUZwIHdxpc6KQwrkXTZKRHtQzvmFLRj67t4EQyfYcwOZ3EtI0YuvRGyggG1z
	nwtIQI1brMttiNmctf4jJ8EItJ8KkO2CgusAZdukUSFFyQIHJiv+hgqMvnY3YGyjOY9kVGC1/ZK
	i/kGucBIcoRj1SOdoeY/AJvogGGkDA9q7rRatCgcUD8RQkrhg9jEHYhqbQIYyU2fXZ0wvQ95ZwS
	D9s281S81SWgaVRXrYx9GUs2XEfVW7wUdzSCkEsEz9zPQrI0e5+s+d6HlmkE59Uj9swIe8bme7P
	LvxSeNLDb1ZWzQhKlCICsnlOBdSeXEMRncsIFouctgpLO6ayRpuGdpu17c5gZV3X6aMZcl7YL4C
	3asmw/O2/LsK/VLmKU30PkwegkXi4gfbZf6OxV3qQTFLTQnYnFQ7jUOJbObe8wzbr9UHQn1I6Oo
	+gExwto0Blqi4EY6lU3Z3YoJGFoK+qZcOUywZIoJVAFAILrvBJbl41V9/prWdhEKz60BlFXNA7b
	vZ8DL4B3zaGhr3eO8uQpOJHAqFaUWkDNZt6iLLjXiRvFKiDaFr5RS40hn7Lf87A7Nsol2UVB6C5
	eygd456NhJSsRHYt+iTTDUAl2RNEGiMB74lrGR5t38rNCPafBp40O6GnnEh0GZw=
X-Received: by 2002:a05:600c:1f96:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4bb55a4ea81mr7826645e9.14.1794516788712;
        Thu, 12 Nov 2026 12:53:08 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm8695655e9.10.2026.11.12.12.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 12:53:08 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] ARM: imx_v6_v7_defconfig: drop the SY7636A MFD option
Date: Thu, 12 Nov 2026 20:52:28 +0000
Message-ID: <20261112205228.42630-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112205228.42630-1-pmazzini@gmail.com>
References: <20261112205228.42630-1-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_125310_591968_E39331D7 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

The SY7636A is no longer bound through an MFD.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index ed588add8d31..f02b5605e533 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -239,7 +239,6 @@ CONFIG_MFD_DA9062=y
 CONFIG_MFD_DA9063=y
 CONFIG_MFD_MC13XXX_SPI=y
 CONFIG_MFD_MC13XXX_I2C=y
-CONFIG_MFD_SY7636A=y
 CONFIG_MFD_RN5T618=y
 CONFIG_MFD_STMPE=y
 CONFIG_MFD_ROHM_BD71828=y
-- 
2.52.0


