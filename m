Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04C4606A6BA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 18:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zLxSSbiV;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=genQOJjw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=bJMzVzbCZ/eXll3kanPweMPP8+MueKszbQ0YDiOQAlU=; b=zLxSSbiVeiueDI14AadNe89ZC7
	uQHuD9/FK54kJGCFZ1RptUDSxVl2CmFzL3YfiEMROl3WdxGYCdqifPHRyiu1d3ZFnikf9BGQKqKl9
	h8pKXoioUCiyXAO/OG5EEVvitMdZXcZJGfAT9VtDTVnbSPGAenAXLcx9ZqeLqEykouktCaZ7Uie2h
	ZkvXuPubAzxKE12saTQyPLcSWLO+JRQnj0ex7Fjw7COHUQ5F4FZ7DlNwiaOJhDDDiGh8amXsaqE9K
	uBUnddvejKN9WbiOfuNiqZ5HiC870nRMlWwYRhzextO8HJJBKeRAJPRWxXTSh5EzTibcXCxbGJuJ0
	BSVb4Iiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVv6l-00000007Tyt-0Prn;
	Tue, 24 Nov 2026 18:19:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVv6j-00000007TyL-40x7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 18:19:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A15B41F3D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 18:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445D81F000C4
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 18:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795544349;
	bh=bJMzVzbCZ/eXll3kanPweMPP8+MueKszbQ0YDiOQAlU=;
	h=From:Date:Subject:To:Cc;
	b=genQOJjwG62bqWdH29OiuvPTf9cF4IqLi+YPa8EnEf6hBIxUBsbclOl+2BOv7APlw
	 Az0ruV1e1d1mogOug1I+38yiZLcXQXfLft+jtDsNZB+RcHW73Io6mzm2QjzZaPrC0u
	 l5miwqJ66D4c241D0dDLIvcoomgnDCCZVtcmmZx3sB4aSLt5mgPNKLtfOG3ypAMdUp
	 kdqOznHHcyuxijSWHNYPzTcczb/aqjYccUmjrEKQMs4AhEXznN1m6U2lNO/0f8lkEJ
	 mb6cjY0tkT2aLXosgfZNeJ08yOZAbNPTP0QA58ij0G++WoBSp/RLiK6RYEjbDMnFw2
	 vA7/B8fFSb60A==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c148d4dbfbso4598920e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 10:19:09 -0800 (PST)
X-Gm-Message-State: APuU4Z9T+TwnqrJ1GieYd4wN/soxosljiUPDvN8OCjy22wy5MCN5ogX8
	Yy2kdiMBHFuK0fZI6JfpDWXMMZdV9Jv9HAoLCFASuYxOvc2h1Rw9f3behifN3c1ZJ5wxr5ewV4A
	9MQrRuubNo47KZQD71Y0w01qx0rlUhlo=
X-Received: by 2002:a05:6512:3ca5:b0:5bf:c239:71ad with SMTP id
 2adb3069b0e04-5c1bc802154mr5508244e87.38.1795544348044; Tue, 24 Nov 2026
 10:19:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Nov 2026 19:18:55 +0100
X-Gmail-Original-Message-ID: <CAD++jLkAjWe12teziGE3-81R0tpO47USD6_pLMMrJ4_DXSOa9g@mail.gmail.com>
X-Gm-Features: Aa3M54pIgl57JFg90kutrTDazmVajLRDQYbXRH0F1nZdWP8ta1PJg9pzX_V5wZA
Message-ID: <CAD++jLkAjWe12teziGE3-81R0tpO47USD6_pLMMrJ4_DXSOa9g@mail.gmail.com>
Subject: [GIT PULL] Ux500 Powerdomain DTS changes for v7.5
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

these are the power domain changes for Ux500 for this kernel cycle.

I'm especially happy about this one because it pays of a huge piece
of technical debt as we started doing things wrong in ~2010-2011
and then have tried to back out of it for 15 years. Related changes
to powerdomains, mfd, regulators, clocks, (also bindings) etc etc
are merged into each respective subtree.

I also have a large set of DT fixes that I might send for this kernel
as well, on top of these.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-pd-v7.5

for you to fetch changes up to ce2efbd2e360243deaf4b2a7502714da1a50d06d:

  ARM: dts: ux500: Remove DB8500 EPOD regulators (2026-11-22 10:23:53 +0100)

----------------------------------------------------------------
Ux500 Power Domain changes for kernel cycle v7.5:

- Required bindings changes have been merged to respective
  subtree.

- Rename the powerdomain node according to standard.

- Add the actual power domains to each applicable peripheral.

- Remove the DB8500 EPOD (electronic power domain) regulators.
  This is an old technical debt due to power domains being
  implemented as "some sort of regulators" in 2010 or so.

----------------------------------------------------------------
Linus Walleij (3):
      ARM: dts: ux500: Rename power domains node
      ARM: dts: ux500: Add power domains
      ARM: dts: ux500: Remove DB8500 EPOD regulators

 arch/arm/boot/dts/st/ste-dbx5x0.dtsi | 156 ++++++++++++-----------------------
 1 file changed, 53 insertions(+), 103 deletions(-)

