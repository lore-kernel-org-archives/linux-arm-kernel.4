Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC0E606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hFNx5Te2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BmyN2ORd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JAkdR+3eBgE3B5MqOfsX36lY9nOmnfkSBHmQMoRmyvc=; b=hFNx5Te2EE/hr4
	oP8nyNkkVYJZf+mfhiVvpdq0q1rjz+gKUsf7wbTYwvT9rZ9HbsqAWoy0f7cW3JjLRtOP0tV5+h+Hb
	aRoqUJQpQFZCMRWrqdphMUIl3WXJtnSoqImHecKRPwh80VnqcbiMxFse/b3EGkz6/78wZDClolxoC
	pj2eSdItOAGOzphKeirpkSznBDbUHQnbO0WDwdRUfFtBYebIHP/CPjuTBituCDkWrQw5CEVe/SX0N
	zQr0C6pmMYgpbGAPv/bviwLjVlk7y8l3W6quDPybz7JNWqA0iZBR89LqzOMV/blQJIz1uc5u98t70
	OWCF4T5jkTSslfsplbcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuK7-00000007MCN-0u7k;
	Tue, 24 Nov 2026 17:28:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuK2-00000007MAy-3Jge
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:28:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 120506271B;
	Tue, 24 Nov 2026 17:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60DC51F000D1;
	Tue, 24 Nov 2026 17:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795541329;
	bh=JAkdR+3eBgE3B5MqOfsX36lY9nOmnfkSBHmQMoRmyvc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BmyN2ORdGBbeeX00xpzXmvMFjvaFgIalWrMvIwY8j7q40PEzcOR6tjR0O16rx6y/v
	 TiqyI2OF3UmN/zgdquwDB5SFPmPe8pU3S78C3kaPKr+mvJ3xq3VK7sT8S3hKWC5pfQ
	 BYzOvWb1nxYKvLrFem2vAoa3vDpieYqMJGN5lFlRtJeM+31mZ+k0olRnG0yr49z4kU
	 U0h7krOjcE1g5GOqYD2Imuh2WDU9fJN/aUXIXaDix6rN0FZZjZi8HyoriQakU8FItf
	 XzeGLhuD9tKdCLtvsPpqL0U4W4sv7NiC0lxCv7OeH9mCc7dxR8RdG7GmVcLyWtLVJp
	 /8sVgIU8fFVCw==
From: Geert Uytterhoeven <geert@kernel.org>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas DTS updates for v7.5
Date: Tue, 24 Nov 2026 18:28:36 +0100
Message-ID: <cover.1795540800.git.geert+renesas@glider.be>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v7.5-tag1

for you to fetch changes up to df85c8ee22391046200bb057c85717eb906e464a:

  arm64: dts: renesas: rzg3s-smarc: Enable CAN-FD (2026-11-23 11:05:32 +0100)

----------------------------------------------------------------
Renesas DTS updates for v7.5

  - Add more timer support for the RZ/N1 SoC,
  - Add PCIe endpoint suppport for the Renesas Spider development board,
  - Add CAN-FD support for the RZ/G3L and RZ/G3S SoCs and their SMARC
    boards.

----------------------------------------------------------------
Biju Das (2):
      arm64: dts: renesas: r9a08g046: Add CAN-FD node
      arm64: dts: renesas: r9a08g046l48-smarc: Enable CAN-FD

Claudiu Beznea (2):
      arm64: dts: renesas: r9a08g045: Add CAN-FD node
      arm64: dts: renesas: rzg3s-smarc: Enable CAN-FD

Herve Codina (Schneider Electric) (1):
      ARM: dts: renesas: r9a06g032: Add support for timers

Koichiro Den (1):
      arm64: dts: renesas: spider: Add overlay for PCIe ch0 endpoint mode

 arch/arm/boot/dts/renesas/r9a06g032.dtsi           | 34 ++++++++++++++++
 arch/arm64/boot/dts/renesas/Makefile               |  3 ++
 .../boot/dts/renesas/r8a779f0-spider-pcie0-ep.dtso | 21 ++++++++++
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         | 39 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 43 +++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 46 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h | 12 ++++++
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi       | 45 +++++++++++++++++++++
 8 files changed, 242 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f0-spider-pcie0-ep.dtso

