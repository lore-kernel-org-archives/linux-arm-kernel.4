Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C6D606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 20:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IJWPl4tu;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmxZBvW0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ybyQzwZ3PkNAZEo66FI21Y1cWKk1p2Nf3GLBD7KeT88=; b=IJWPl4tu0uDe1LnsmQOtFGyfJ6
	JmYIPJUDqP/tAdAZnisZwF1pGDq/gG6n/zJccELtSL0caQH8/Y4CO5y5n3w1Z8rPA+ai8hxMdKa1n
	kwrvJmLd7VrEVe8OFljgkyPuFzQ15c+uNje7oBNSosizijBpQzuppDNe8SClixRu0BHSHkXIFVj4Q
	wnJ/wSt4EjKUMbF3Cpt78cItNy0Iu0LJTafEFOI9+5d9RGAwjEwHtL664WXvYftx79DAbOf+R/k2d
	MV7SSToDPzJ/PuR1N1gKbuxBQTuDmsyJwABrxeU8S1ZO98cwIaXPMQVH9dB9S6OMA68x9R0rwz9Or
	4OFeSEwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT3Ou-00000003sbI-3kIn;
	Mon, 16 Nov 2026 20:34:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT3Ot-00000003san-2MvQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 20:34:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9291761D8B
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 20:34:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A19A1F000C7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 20:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794861242;
	bh=ybyQzwZ3PkNAZEo66FI21Y1cWKk1p2Nf3GLBD7KeT88=;
	h=From:Date:Subject:To:Cc;
	b=bmxZBvW0kwJIoOGvPPEd0e0ogqTZTsAn3ZlV+DDdPDExH4/YJPwtEJXThl3u0reiE
	 cIYiIU86waGucOvI67ARn3UWomRx65RhC8ZGk0o9CxnE87hgPfqfQCIwzvsOMjW9+P
	 AKHfh2TETQ2NKuJ+q8oPB5fNxeTmoSpgu85fuDM66SYIbhciGOS2dABzKUeZ/LndBt
	 gTv+UaQ9ToS3d6/u9AAykHrIB54K9V0i+ZRy+X8qtPaDzaB17Baw111em54f81ha4z
	 5ZLVJmBoo1/FBYQuqUEd3WQWsFTQkfpk7rxr8YAPNPz7zcbDrrjhbUbXolFiZvCqaR
	 0WHk3JtFLVZWA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be4fea434bso223012e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 12:34:02 -0800 (PST)
X-Gm-Message-State: APuU4Z+B+aX573NLiKfP3u0Ktdf19aXL6S67ZYghM7Wg/tEH3Zn9A2gT
	4ApOWEOlJySjg1JgiSkhP5c7RLvIs0sxuII4jgcVSqR0xMtuU5BoyKQg5SBR3WOa0ysT9X6zLpC
	H7igtLJwUJTjrOfo+uiNk8twz+8LwhRI=
X-Received: by 2002:a05:6512:3e02:b0:5c1:70b3:1975 with SMTP id
 2adb3069b0e04-5c1a0f0e2fcmr212994e87.17.1794861241041; Mon, 16 Nov 2026
 12:34:01 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Nov 2026 21:33:48 +0100
X-Gmail-Original-Message-ID: <CAD++jL=FzG1EMuZUZ3_14VqV-1U9=c06gCUJYaTZpAkdB9+5Cg@mail.gmail.com>
X-Gm-Features: Aa3M54qK7nT5lTq4DRQf3huPCFn-AZkG5Rxf3lO7hTcUY2eSx3gWnFsUCbF1En0
Message-ID: <CAD++jL=FzG1EMuZUZ3_14VqV-1U9=c06gCUJYaTZpAkdB9+5Cg@mail.gmail.com>
Subject: [GIT PULL] U8500 defconfig changes
To: soc@lists.linux.dev
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Stefan Hansson <newbyte@postmarketos.org>
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

this is an annual update of the U8500 defconfig.

The details of the update are in the signed tag.

I dropped the tail commit off of this pull reques becuase
Stefan raised a concern regarding the generality of that patch.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/u8500-defconfig-v7.5-soc

for you to fetch changes up to 96561f4bc602db784d06e35c8918876036c08057:

  ARM: configs: u8500: Enable audio graph card2 (2026-11-15 18:52:05 +0100)

----------------------------------------------------------------
Annual U8500 defconfig update

This config is mostly used by the Nura (former PostmarketOS) project.

- Refresh to Kconfig changes.
- Update to contemporary scheduling and using e.g. the TEO cpuidle
  governor, BSD process accounting, PSI and autogrouping.
- Enable control groups and namespacing, checkpoint-restore.
- Enable generational LRU, DMA-CMA for memory management, disable
  PAN (too slow) and ramdisk commandline.
- Enable FUSE, DM/dmcrypt, squashfs, ZRAM.
- Enable basic IP routing, nftables, TUN and VETH.
- Move a bunch of U8500-applicable device drivers to be modules.
- Enable I2C mux (MPU3050 is the sole user but we need to support
  it.)
- Move V4L2 support (used for flash) into modules.
- Disable devices such as the STM32 MMCI we don't use.
- Move all IIO sensor drivers to modules.
- Enable some security features, crypto XTS, EXT4 ACLs, BPF
  jit compiler.
- Update Coresight debugging options and move it to modules.
- Enabled the Audio Graph Card2 as introduced for U8500 in
  kernel v7.4-rc1.

----------------------------------------------------------------
Linus Walleij (14):
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

 arch/arm/configs/u8500_defconfig | 184 +++++++++++++++++++++++++++++----------
 1 file changed, 137 insertions(+), 47 deletions(-)

