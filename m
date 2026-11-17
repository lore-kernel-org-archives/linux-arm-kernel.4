Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54FD606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 18:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RrVI88J8;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dnTy2Jkq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gqR+F7gVJ9rNyT0hWAQ5lLNLohFVCHLjOQf24JgO0GY=; b=RrVI88J8cjsNb3Y48vXJScicuC
	dewN29CxxobJCK/MpppBqyny33hXnSmGEhWSoSL/ShLdAsbGzOiJc8O15KZ+z6PzXhnqtt/llCbEB
	4RI0jFjMUiE84Vy97k1RGwEVsTj2x8xJX/7wg78bdWx6K6j8AOUckg/riNUrkCRp0yDV5MrPTOEC7
	gRViG1iOrljKNiWWH36iTJ3Od2J+yswSRQEO0XSzrpbNB4SjINkGx3oYULeuGogO6D0pRPlLL54eP
	AUNXkcOfJLSSIVKdrqKjQ2Vs+y2gatXl4z1R3y8ouWWdQphsraPfct534GFsvUj7korPGersAF9XK
	RS9sCXNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOHp-00000006o3A-2YWN;
	Tue, 17 Nov 2026 18:52:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOHo-00000006o2u-0LE4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 18:52:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CA3561204
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 18:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82A01F000C4
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 18:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794941526;
	bh=gqR+F7gVJ9rNyT0hWAQ5lLNLohFVCHLjOQf24JgO0GY=;
	h=From:Date:Subject:To:Cc;
	b=dnTy2JkqihNqXYn5xAkz5J+sQz/gJxVDvUYo+zGcyNQTgC9BLAvV5vn9VkqFy0hHh
	 hAeG2/FlGt+mg8Wpf91waLERzt8pLB96iqGy8xVWbzeJJOQoupMe/Ni6B97ZMwlsSp
	 O91AOqxxUxz4/QWJwaBLagjEaUJ+r9s/AP5YfnuaSC4lROeNr2nJVSwNjO2kdG27yT
	 yD04TY1Z2KldNifY7tRVD3GPasNO+pzL/GGJRlWFy+L3DgHxNt6umCg5TyTEZUGN4e
	 PmwwiBzmfrAPjXx6bkQDEg1VwbDxpW734KfuXwsyaL7bQeRLc0Kxu6ZglOw319V37q
	 qlpItJ0WZJDcw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so89398e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 10:52:06 -0800 (PST)
X-Gm-Message-State: APuU4Z95yXU1f2OqRWjYVmaczCrUPXTHZiKUNFaR2zeHXjfSWYOMNu7n
	WCg6bmfbxy+ft8pKxE4qaiuFlyJZ6wzGn2AB6to2/LuipDbQr2g0nfmFP6plT4GGiO7PqhB3rJ5
	Zkm5JKu277rH2sLZNCFQiBa4aNxl9W9Q=
X-Received: by 2002:a05:6512:2381:b0:5c1:57ba:f848 with SMTP id
 2adb3069b0e04-5c1a98d45f4mr61721e87.0.1794941525716; Tue, 17 Nov 2026
 10:52:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 19:51:53 +0100
X-Gmail-Original-Message-ID: <CAD++jL=1xfmNQf-=ejeDy6iL5BL_yiEFnFtPsakufN4QkipS3g@mail.gmail.com>
X-Gm-Features: Aa3M54oOP4o0Yt1r8edslc8_KYEjmGYNVrS4UJmWgAw6m2tO5wJNxwFv7iCxXfc
Message-ID: <CAD++jL=1xfmNQf-=ejeDy6iL5BL_yiEFnFtPsakufN4QkipS3g@mail.gmail.com>
Subject: [GIT PULL] sram runtime PM
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

the following is a single patch to the SRAM driver that was ACKed by misc
maintainer Arnd Bergman and needs to go into the SoC tree as a drivers
patch.

Details in the signed tag, please pull it in!

Yours,
Linus Walleij

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/sram-soc-v7.5

for you to fetch changes up to 2e2ce48be3da719d1814154e385548d31c59b579:

  misc: sram: Enable runtime PM (2026-11-17 19:46:26 +0100)

----------------------------------------------------------------
This add runtime power management to the sram driver,
so drivers using SRAM can increase/decrease references to
SRAM memory and thus eventually power up/down their associated
SRAM memory.

----------------------------------------------------------------
Linus Walleij (1):
      misc: sram: Enable runtime PM

 drivers/misc/sram.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

