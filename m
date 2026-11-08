Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A477606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 15:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uewHlIf9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hswlQr3K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lKCjL7p+zgW33BiYzxPBThwXq3MND07dMD37nZ771vM=; b=uewHlIf91t0SEtdfIU2/UvF3Wd
	5P1fQhSYjcQ9C248UqsjnHLZfVYefueKPKyarjNE4NfZ+q9ZIUgaV4lI5vvule9NIwiErPQYntJeC
	DjqlLttbz6qKxpYrLEM3VOPYAfJ/1/2cRchoajFxKWHRxx6NuR+eLTslzgbU/l34WQmyorPCC99KQ
	h/uTr7Rg3AfwsYuvYY2VeuvSNoeYEzJsNFiLZW3jK3aFWiZDhVhO2uZSusjrpc47BiRzSLW6FRxN7
	NslWaBRZHmbvP6IhxJG34aphJiv8vNbG/i6vpYk5Vy2L08JMWvnq1PG8TmGcioVwTaCDR58dmqprk
	nH4Ekl0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ4iL-0000000GIiH-06DO;
	Sun, 08 Nov 2026 15:21:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ4iJ-0000000GIiB-2FNH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 15:21:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0859643BDC
	for <linux-arm-kernel@lists.infradead.org>; Sun,  8 Nov 2026 15:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08BA1F008A1
	for <linux-arm-kernel@lists.infradead.org>; Sun,  8 Nov 2026 15:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794151306;
	bh=lKCjL7p+zgW33BiYzxPBThwXq3MND07dMD37nZ771vM=;
	h=From:Date:Subject:To:Cc;
	b=hswlQr3KNt8NG4/kvlgIzs3B4PAintguleytdN2UpZfULCAAo8tTYwDghejA65Kou
	 RNnSqd26q1dfcnEwMFY6hzzfTxgJNeI2J+mTg3vSJrklPFQSdTtYv946PuS1S0manb
	 cywIxnbrvKQBm+jjQefB6jJMIQUni/UZeIu9Cp2FHj6mVy4C6ztlf315UFxLncz9OT
	 CnAvkdBQgNAwJY5zQGMrT9Kq2Kwl9RYaB/VQnul2lPY65EwweJjDfyykNhzN8bCdyC
	 6xNksy/6jkLV7hrryjoeht8+N/wtDaEMggd6y1qNJSLD0gyXP74utYRHrqcfADFHeH
	 m8e2IZHQm4kBg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c146cf35ceso81870e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 07:21:46 -0800 (PST)
X-Gm-Message-State: APuU4Z9vm40qEQ1v6FCtBRxuQHhVPrP0xvyVawGGrJpIQ4z6c/eWISyi
	f+m5MAnXiydrFPlc65cQGy07lcmP/GMshHNNAs6vYJaFC5XQfT/Ka9pbGY/DZ7xx+4YALmR1vr2
	RN6cN0aWfack4F9jp6FQtyyC+RFjTZss=
X-Received: by 2002:a05:6512:690:b0:5bf:c27b:8e52 with SMTP id
 2adb3069b0e04-5c14c03b28cmr381749e87.65.1794151305742; Sun, 08 Nov 2026
 07:21:45 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 8 Nov 2026 16:21:34 +0100
X-Gmail-Original-Message-ID: <CAD++jL=Jiy8tRd9KjMQHAd==HkfdofeU5NPoRRejvWQgexKdAw@mail.gmail.com>
X-Gm-Features: AclHuK8mYwR23FTGYPto6xZ1otnl6J7UrOuU8x3OE6Nm5XuQ4RCbP7Hvsyt3DXE
Message-ID: <CAD++jL=Jiy8tRd9KjMQHAd==HkfdofeU5NPoRRejvWQgexKdAw@mail.gmail.com>
Subject: [GIT PULL] configs: TEO cpuidle governor defconfig for ARM64
To: soc@lists.linux.dev
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi SoC maintainers,

this selects the TEO cpuidle governor as the default for the
ARM64 defconfig.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/soc-v7.5-teo-arm64-cpuidle

for you to fetch changes up to 52e0398e1d0f456f0df93d217e54a6aee8ba730f:

  arm64: defconfig: Enable the TEO cpuidle governor (2026-11-08 16:16:28 +0100)

----------------------------------------------------------------
This selects the TEO cpuidle governor as default for
ARM64 systems.

----------------------------------------------------------------
Linus Walleij (1):
      arm64: defconfig: Enable the TEO cpuidle governor

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

