Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F537606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eQ0p2Q1B;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mtefFc8x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8DVFuCOOgLb7+uhJDm59aDBFx3v8r0SbGwj459Jfm20=; b=eQ0p2Q1B2wSolF
	XSSuTJN95gUvmPdg9ZYwJgHel8JPSECB5RlYfYEBjzKzQgYR5UXag8FE1DeSDQY0lOL9fQvy9tD7N
	W+rRiwE19lRFzK4QoycKKmsVM5aNE0ZDV6sllz7Z+be1sLEinqyN64kkIWqfZ7RTnQOW3ce1lhxL8
	LpgcleinORXO7Ww0mRwuIv0M8oXe7ildY5awbhcklkP0Vqhh7F2wg3oGPiDY2cgH7SxNjFLX+pxHH
	antEXJRxmqtAqQCcNlDNig/T4YZ54M5AhxKmPbTronrPe7LvveGElKeqOsEhP0fMwbelU66uqo9Dg
	PbW3SVt4vcC1TWuV7xVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuK7-00000007MC9-0P0K;
	Tue, 24 Nov 2026 17:28:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuJz-00000007MAE-3EBY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:28:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D67A40BB1;
	Tue, 24 Nov 2026 17:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 820E81F000D0;
	Tue, 24 Nov 2026 17:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795541326;
	bh=8DVFuCOOgLb7+uhJDm59aDBFx3v8r0SbGwj459Jfm20=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mtefFc8xWtGcIx1aN66A4Yn1WE0D6bJ/3ouhl5xNJ9SOKNvWCmp6gzb/L+Vc+Xuwv
	 fOlkkWYPQyRk9gxB257IS9bM0JEygthYEixcKehu1hD0YTOdTD+aAqKhQaGubLf5zQ
	 Uwbgu6bd7TyRrP0wKTTjbzC2akUl13pb3JM8ZbsjUzK8U1sSU7YVHOitlUvf+rm4vL
	 rSRsd2zYIy3U7i1JXR5wCC32BAA/1rjwLdNNHkxKb2XiK3V0pyaj8x++kaUdefiYSx
	 0zrsDexAu/EotHXEsJCr9qEirw0ssqQ3SeYclefQHEKwKX/ndYnUcsUCYh0bn0rLq7
	 /NvhozH/dWdLw==
From: Geert Uytterhoeven <geert@kernel.org>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas ARM defconfig updates for v7.5
Date: Tue, 24 Nov 2026 18:28:35 +0100
Message-ID: <cover.1795540798.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795540796.git.geert+renesas@glider.be>
References: <cover.1795540796.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Geert Uytterhoeven <geert+renesas@glider.be>

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v7.5-tag1

for you to fetch changes up to f4b3f6bff6a26acdfecb4ae6e41383cb3f9664c5:

  arm64: defconfig: Enable Renesas RZ/N1 RTC driver (2026-11-16 10:43:19 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v7.5

  - Refresh the ARM SH-Mobile defconfig for v7.4-rc1,
  - Enable support for Renesas RZ/T2H and RZ/N2H RTCs in the ARM64
    defconfig.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v7.4-rc1

Lad Prabhakar (1):
      arm64: defconfig: Enable Renesas RZ/N1 RTC driver

 arch/arm/configs/shmobile_defconfig | 4 +++-
 arch/arm64/configs/defconfig        | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

