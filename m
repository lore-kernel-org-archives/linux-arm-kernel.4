Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABCF606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 15:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rn+W0wve;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=icjXLhHG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IeN5+FZHkIBk7BivbMm3OEe+tgdrCoavTG5lN7hD1lI=; b=Rn+W0wve6jJ58ZMOiRhwjQn9Q7
	LFlt1PGjO8NeSvO0OjfAlilmRZULjEYSgwDAEFPV9ENH/cpurvJTj5PriYcZthtEzT73+cJ2uc3hB
	YOtm2FcFvuu6WyZLyHsVBfpq6ciRhFeMzNGpIAt63l/QLI3s3yxs9aiQLIYmChVMCVa5xSrbrKIRD
	1+ZM9EgXftWzjvp66QWaszmWOKJQNg48UK/illYdVBRyn+N9RwuMysg1QpGDGPTiCha+kwpqPBlw3
	eH5PFitUZ25IXX4Y87Oe8JgkzONrFJlEZcQmBzcXJuypRv7f/YszkvwHfPLFHQYTNY+N9UKkulaMd
	dQEMt29A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Ac-0000000GLF8-3dbR;
	Sun, 08 Nov 2026 15:51:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Ab-0000000GLEn-0zB7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 15:51:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AECB242E6C;
	Sun,  8 Nov 2026 15:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2ED11F0089F;
	Sun,  8 Nov 2026 15:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794153060;
	bh=IeN5+FZHkIBk7BivbMm3OEe+tgdrCoavTG5lN7hD1lI=;
	h=From:Subject:Date:To:Cc;
	b=icjXLhHGFYjyjnKWto611vLeZOMeyLVX1gQgxnmmPgkCXJGZKfTFu1VLzW/oE7A55
	 QA/jabvf4X36ccNB/07BcK7o1tH0Expi3IsL/iyQBzqMezxDch2rRJt3WF2fNEHlnv
	 2C9pSZExd2GIMhvT9Fpy27wwQHyU0eVcar9zqUTiijKEv8NVkf0jrichMK1+qsYpY1
	 MTzQCzmdDCJpgIAB1ERH+7z1HmrVadaKiv4mVxc8oyuC1h3yDOXJC9ZJt4faWv5Lf7
	 6thpd8jFcPs76vpwqXUTI9KDoEUutXoPQt+QnnMvRxemWH6kMLssVzXUVJgrtSgPK/
	 VTYvyLCtF6DCg==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v2 00/15] Update U8500 defconfig
Date: Sun, 08 Nov 2026 16:50:56 +0100
Message-Id: <20261108-ux500-defconfig-update-v2-0-13b701e66cbd@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/3XNQQ6CMBBA0as0s2bMtBZQVt7DsAA6wETTkhYIh
 nB3I3u3f/H+DomjcIJK7RB5lSTBQ6VMpqAbGz8wioNKgSFT0M2UuGw5ETruu+B7GXCZXDMz3gs
 ia9qyLYggUzBF7mU74WedKRglzSF+zs+qf/UktSb7j1w1EtpcO8qvpbP39vHi6Pl9CXGA+jiOL
 2LYqBO9AAAA
X-Change-ID: 20260827-ux500-defconfig-update-960042b7b600
To: Stefan Hansson <newbyte@postmarketos.org>, 
 linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Refresh the U8500 defconfig against v7.4-rc1 and update scheduling,
memory management, storage, networking, security and peripheral support
in focused patches.

Bring in selected postmarketOS features: initramfs support, zram,
multi-generation LRU, pressure information, additional cgroup controls,
filesystem modules, nftables, virtual networking and compressed firmware.
Build Bluetooth, wireless networking and evdev as modules alongside the
existing peripheral modules. Use audio graph card2 and the TEO idle
governor.

An LLM coding assistant was used to prepare the configuration changes,
write changelogs and run validation.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v2:
- Squash the TEO cpuidle governor patch into the scheduling/accounting patch.
- Drop CONFIG_NO_HZ_FULL; retain CONFIG_NO_HZ_IDLE.
- Link to v1: https://lore.kernel.org/linux-arm-kernel/20261104-ux500-defconfig-update-v1-0-451d0537d49b@kernel.org/

---
Linus Walleij (15):
      ARM: configs: Refresh U8500 defconfig
      ARM: configs: u8500: Update scheduling and accounting
      ARM: configs: u8500: Enable control groups and namespaces
      ARM: configs: u8500: Update boot and memory configuration
      ARM: configs: u8500: Enable storage support
      ARM: configs: u8500: Enable IP routing and filtering
      ARM: configs: u8500: Build peripheral drivers as modules
      ARM: configs: u8500: Enable I2C mux support
      ARM: configs: u8500: Update media support
      ARM: configs: u8500: Disable unused drivers
      ARM: configs: u8500: Build IIO sensors as modules
      ARM: configs: u8500: Enable security features
      ARM: configs: u8500: Update debug and CoreSight support
      ARM: configs: u8500: Enable audio graph card2
      ARM: configs: u8500: Enable compressed firmware loading

 arch/arm/configs/u8500_defconfig | 187 +++++++++++++++++++++++++++++----------
 1 file changed, 140 insertions(+), 47 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260827-ux500-defconfig-update-960042b7b600

Best regards,
--  
Linus Walleij <linusw@kernel.org>


