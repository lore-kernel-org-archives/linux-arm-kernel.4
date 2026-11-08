Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA77606A322
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 15:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t6iRZFwf;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SPsKDDVq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=K1wv4P9LkVe//Bk8oo2Vt8BpwtAtk9Cmoa2L4e+Ln+k=; b=t6iRZFwfZXV35Ye+m7OzR/kifo
	k6xWDEc5PF/rbMA+uVGcmwYAqyBvDgORMx7OggjkEZEjEIQLoLIp6a0KfcVbJkalnuagC1y5CjPzN
	ys8ZU3icwq4ro8AQ/IhqZcFlbj0qdFn+ewm6vvI1oo/PIoZdXhjSeFrHJAoTyTcV8a1GSxxfJuO0y
	DfOaotUy+TLsX8/RwqwFAfXcPKVhWbi9hCXKrpr+YC+T5L8K7Wa27opLfIWT8tkHRF1zZ9vJSbgq8
	hanARRK80zOisE24UpunzmTexnpxeHq2KWyDPq2kaevhVHenf6eViLX8j9hndp/7BcYlzB/qZTFC8
	WBKY8lIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ4cS-0000000GIOu-0RhQ;
	Sun, 08 Nov 2026 15:15:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ4cR-0000000GIOo-0YfI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 15:15:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 92D68408D5
	for <linux-arm-kernel@lists.infradead.org>; Sun,  8 Nov 2026 15:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 771491F008A1
	for <linux-arm-kernel@lists.infradead.org>; Sun,  8 Nov 2026 15:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794150942;
	bh=K1wv4P9LkVe//Bk8oo2Vt8BpwtAtk9Cmoa2L4e+Ln+k=;
	h=From:Date:Subject:To:Cc;
	b=SPsKDDVqSGn6EV8y2o/iPxzkQBr/S/OtpUuk4lJ2GIlAjBBUrxRZl/MLjbeKwX/DY
	 I8Rw92/qWH9iZHFPh5XSRguFVkcmAqVwLCSKDt5Qv842bDtESd4qRQkL+CgbQy8cRS
	 ldqMRW3lqOWa1k5zau88wI+r1ZNSu7QjBZRPC8Iz4hSJtqwRD1Z8AKSASkQ2lBH4PQ
	 47/TsdOmdKfsyLcqpDykBq0IoEBFhPs0TPdNIA3qVnPKaA7S2rVjqvHJz7BUqxs4vJ
	 3LHM4J7CSS5uQqt2IiHOJcVV61cER+cd5HkmaFGgqA0mKWDXSEoXDG9bdW3EQNf9cF
	 IO7F/DwrlSxvA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso61752e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 07:15:42 -0800 (PST)
X-Gm-Message-State: APuU4Z+m8xMzB+F+kSGc+t1P1b6U4UD/2dRasXxqceXXYBLEFjxFSnR9
	mAUG8ftzc5nhWGNQdG3OZVJ+QuALcvWk4Ni4UQ4c2Sqw51g/kd/H0e28TPQ0MwJnl70JhuxKg5Y
	k6Rhv4R8IGKttRZL1bNUf4FFQH90Lb1Y=
X-Received: by 2002:a05:6512:3986:b0:5be:58c0:c674 with SMTP id
 2adb3069b0e04-5c14bf7beb1mr473407e87.5.1794150941244; Sun, 08 Nov 2026
 07:15:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 8 Nov 2026 16:15:29 +0100
X-Gmail-Original-Message-ID: <CAD++jL=Ap8G6E0pzBEuufRstvSCZ=Owo=n50pnHHODb3swLqOw@mail.gmail.com>
X-Gm-Features: AclHuK-G56ovpD2VqIImn6Zr3zGs43aGmBuAyqZR9JxoVjNzUz56CLaNqp2LDIo
Message-ID: <CAD++jL=Ap8G6E0pzBEuufRstvSCZ=Owo=n50pnHHODb3swLqOw@mail.gmail.com>
Subject: [GIT PULL] configs: TEO cpuidle governor defconfig for ARM32 multi_v5/7
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

this selecte the TEO cpuidle governor in the defconfigs for multi_v5 and
multi_v7.

In this pull request I have squashed the two individual patches to not create
too many individual changes.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/soc-v7.5-teo-arm-cpuidle

for you to fetch changes up to c351cb712444b5a31158570271d953546f6f5e3b:

  ARM: configs: multi_v5/7: Enable the TEO cpuidle governor
(2026-11-08 16:08:38 +0100)

----------------------------------------------------------------
This selects the TEO cpuidle governor as default for
multi_v5 and multi_v7 ARM32 systems.

----------------------------------------------------------------
Linus Walleij (1):
      ARM: configs: multi_v5/7: Enable the TEO cpuidle governor

 arch/arm/configs/multi_v5_defconfig | 1 +
 arch/arm/configs/multi_v7_defconfig | 1 +
 2 files changed, 2 insertions(+)

