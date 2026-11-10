Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D03E606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 04:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GavYvobJ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QmBhsy9I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LQH6/FLfD+l3EuP607p4MXIkH0GyDF3Widek8GlB+OA=; b=GavYvobJd5mpuEAq/cNBpsHK/G
	lQz3jXMr26wwRM/yhviSdoThWmxIsUpsgUALi/wQH2kQJT+/s9UfCieFKA4d5bPO23YYwEFlzCEco
	48s8NVk0toU9DmkbyGR7QNunGm+pE5HwEJtMev3txo1Yrct4uVYewqyekXkM8ys05clcY3ulgxXT6
	MkSIhriRiF6qxnFrtysmpw+WHPGbG6j2BPFj76i63OuCJimcojqhzC7cz4VMeu2gYDDzItdkMMuem
	k8N4+7gjbtALN5wp9/XgbD63+KY8Fg4KiEYRrrpmfhHZrZ4jbax/uAqG2OixsC6XWGVaVPI3E2GEK
	29JtK+5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdvz-00000002QnY-13dE;
	Tue, 10 Nov 2026 04:58:15 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdvw-00000002Qn0-2t39
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 04:58:13 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-91e8938fd01so18174326d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 20:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794286691; x=1794891491; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LQH6/FLfD+l3EuP607p4MXIkH0GyDF3Widek8GlB+OA=;
        b=QmBhsy9ICRM/SoM28SLcwrmjy+0kviPlkSDcdL7wMeNYSkkoIoTsW1FE5cOq1f0ahc
         Tv35wtCK1p1mVc+8s2vkkLTsfdE7Qh3JTygWumW2bYwBcWAO5w30PtKUdh5OTye8W6aJ
         BVgHWC04loOhbvh/l/L1EtJPr1Sb0luRmLKpU2eymuQP7zrHQ1LlIwfshU3j/gIrSF3z
         RtwX8krufbYgB89+BYXdKHi4EkORSYOgZQqVhF+oHheU2faS4GcqSA+gpahbjSz4Xgxl
         6JX7Y5s2BQ/eX4lotS5HhXJ1PHGKA1BFhR6A3ALhjuSuI/s2rolH0M3T2vIe6xqtLcDv
         uShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286691; x=1794891491;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LQH6/FLfD+l3EuP607p4MXIkH0GyDF3Widek8GlB+OA=;
        b=vqrsXxbEgAdfo6jIEI2AgUOQfdL0cPFpGhTRNUeQuQo9zZhxGHxelMeSflIWLDIytH
         0gGB7ZwmyKgqqOTymdGZdwdeaANK3Z2FXLQcCX3qaCnivvI27pJEW0FhQUDOB5AhgQoL
         4MU8B419xqdgp4kxB2oVcO9HQr6MqARd0MywKPilxw3S5nY/+v8jVSvzwWe9Hzm/Iv1U
         KrbjsLY97Cl9k3AAuNnKzaBBmJQSHLzDr0gWZNkvq3h7ZvdDQpHi2hrBpW9l/M0z4tGf
         7bdm/oGGpDw6J0RH600rqVEEWd9seQDTDTDlmEEzFQNtzpirbNPGqr41ZUNpq9hC/17T
         tkRg==
X-Forwarded-Encrypted: i=1; AL+hErFMFBsp0bxeZ4ftdKlf4gJ/KQ3gyDPt+ldBVnVDvhIc/kk6atR8ISWr3Y6kd7hpuYtlstFkSa6j/AcTbf7M86BP@lists.infradead.org
X-Gm-Message-State: APuU4Z+JSMxAghvpp7CvubCO+NYbwipPsnGzi2QP+U//Ik5kOWjFAt73
	UfYBvtfjhdYpf+2XTUGb63Svj8hHHN+ssFfxD7mAO/KMWR/RPSPnWn8=
X-Gm-Gg: AYBFou3kpFz4XxsNuZk41ZiXEaQcsQ1/OlJdwMD+Wgs66vFlOFsTjZ4dujkRGjpTDKa
	4ARdPsUajssISFA4256yaAW3c/oWpHz7z3wpwCuWuQ4Wav8ML4Dkhh4N7+TVUblfkkvTlj5m+r1
	59smFPo0iZE6CbiJzHsx1icCF/if9vcLXAFyqm4Xzi+Ihq0EMorH7HRBYuWRBBm+f325LmtiwfB
	u+xDjPt1upYE/rA2Hwh7LnFNrQpHiiauf0yo6akVCHyeCsZsclTPHxc8vs04oQoJLOhxBu4kWXU
	KQF2ZCrQmAwdSnkaeYpdhulCTVHFrUOEoxfRBb1Yxg04tcsrXvjWr+YUjDEcLK9/6B8SdEG0bqm
	3Lmb96aFBZ4ibUbEVKdeT4TAQHI+cDhkcRkYbs/DqMMCRXpaqyRnlhpcwglpmgKYXobGMAhZ0qK
	9Dh6ev4w1wH7yiAK6tio3LpyXZANFuLZk8LPqsSjSmZCNtXgBuPstV4bh0VX3rs0M36RfEw7Q3z
	hgtSSwnDn2WebCtN5ccMN9ZNjqWGi9F3siPINi65/h8eC/bjMs5zM/sbCMSVlq5K5W4kdDseDlo
	KSMx940cUDyDJNWBFkJ1x3vruwARSetTdrBNgBO+Gbdrh2x6Vwwsz9qTdSOKawZKCZrf46NTugz
	9ZTs0EwuNzpGiBoavfNhq1C7L5ZyaEBE9IUIGUtYQyUXKRVgyukiX7a+sxE5Cm+k1
X-Received: by 2002:a0c:e018:0:b0:91e:c6ec:1d9f with SMTP id 6a1803df08f44-91eef9a214emr27070326d6.52.1794286691211;
        Mon, 09 Nov 2026 20:58:11 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04f89c1sm12462836d6.23.2026.11.09.20.58.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:58:10 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Eddie James <eajames@linux.ibm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jammy Huang <jammy_huang@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2 0/2] media: aspeed: order probe cleanup and last close
Date: Mon,  9 Nov 2026 23:58:07 -0500
Message-ID: <20261109235731-aspeed-v2-0-mhun512@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_205812_756686_44AD6292 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This revision requests the IRQ after its dependencies and synchronizes
IRQ/work before manual probe cleanup. The second patch fixes last-close
ordering and keeps the engine available until VB2 release completes.

Compile-tested on ARM64 with LLVM, W=1.
No hardware testing.

Changes in v2:
- Rebase onto managed reserved-memory initialization.
- Remove the research sentence and Assisted-by tag.
- Join the IRQ and delayed work before manual probe-failure cleanup.
- Keep VB2 release before normal last-close hardware shutdown.
- Drain the IRQ producer before cancelling resolution work.
- Balance IRQ disable/enable within stop and check STOPPED before power-on.

Myeonghun Pak (2):
  media: aspeed: join IRQ and work before probe cleanup
  media: aspeed: drain IRQ work before stopping the engine

 drivers/media/platform/aspeed/aspeed-video.c | 38 +++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

