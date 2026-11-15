Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC3C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 18:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vDF2BFPW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HwtEBNat
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=08ECguGEt5mKY5O0zhlWhlszKnOmF7Z1WUHLZizEhZg=; b=vDF2BFPWLo/uGswXFvaCX/7wlN
	e/sSvwGiumBXKHETodGL4o1AEwbkV9YhjmdX3URhW4tAGixjUWDbKQSvDTHy1AT1ytwkHFZngyAuS
	0SK5UwQ4weIbNiBdrF/3xjMiddfa1HIMaBGTHaC2gEC625DGpZCl50yXF6ZOInr5cRyUEUCEXUEl+
	vxlr19EnczYjyPiO3t2NfOdljDGhbSrXZLy7k0vzSkVi/Uoai9rPWKB3UyVcYfOX8pipbJ01y7vqH
	6HGxapNkNPOar1HUYWac/97UpQjgjYsO6BdFoWncxo8NoYvW5AinDTs5ufWWqdToVnviCmPi1iXab
	HfRwR0MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSedm-00000000JSD-1c8E;
	Sun, 15 Nov 2026 18:07:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSedk-00000000JRV-3Gv4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 18:07:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E7D1E62449
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 18:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03341F000C4
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 18:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794766063;
	bh=08ECguGEt5mKY5O0zhlWhlszKnOmF7Z1WUHLZizEhZg=;
	h=From:Date:Subject:To:Cc;
	b=HwtEBNatawJhYBqAdi26+Fuw/aOPiZ3JNzspnfWuZrU+HIohjDxnDHSDqTzUgchiF
	 ZOkcMXpKMfHTj9TbH2VDCFjSP4KG9RGJ45kCqedfev5aSOdpdGmod5B3htnOaRTGSC
	 8GgSkOMEMrDhn8eGEzrjbNtaAUrkdwgf8TE8cAdtRDvpm2LdK0obcXMoBOoJKvDFWL
	 LsltVAOsbM6/5PSEcfJoS7ABwP7vdKMlGOLyWbb/dTDbnDS2EPbMDTD3qrLQL6DeIk
	 93EAjCKz+lEmyCBxcSWA3YB4Ggn1bup8+iQgkvPh2ZfVgFvTEBnKyLnXkrU6ulcWi5
	 IKI2Gp7s3XfsQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c14f3dab0cso2440156e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 10:07:43 -0800 (PST)
X-Gm-Message-State: APuU4Z9JVcX4JJuvT7QtJeK/DOA4m3UvqlGnoWfR5869u9K4BckYZ8lZ
	/h7EvK/MVmLWVhwG11+2kO03dRIWhzGPSB2/JgvxpR6FA7iKXcE/RTaaRZ11d54dWybZRUw8jhq
	Xlf/IRbLXfLvx/BsmaLsv238202FQLqk=
X-Received: by 2002:a05:6512:b88:b0:5bf:dd05:3a89 with SMTP id
 2adb3069b0e04-5c170a0fce2mr3165979e87.61.1794766062318; Sun, 15 Nov 2026
 10:07:42 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 15 Nov 2026 19:07:29 +0100
X-Gmail-Original-Message-ID: <CAD++jL=z=i8dKwA7XBjjM+tNXPmZDttCYz00gpkZE86Wwh1Mzw@mail.gmail.com>
X-Gm-Features: AclHuK8USlSPTfgH0T_EpOBmC23ixDquMOtn57B_dNGjY89wO27Ifa-8NHjtVYI
Message-ID: <CAD++jL=z=i8dKwA7XBjjM+tNXPmZDttCYz00gpkZE86Wwh1Mzw@mail.gmail.com>
Subject: [GIT PULL] U8500 defconfig updates
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

the posted update of U8500 defconfigs.

I have been told in the past, sharply, to split up these updates, so a lot
of patches. Feel free to just squash them into one or however you like it!
A rundown of the changes in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/u8500-defconfig-v7.5-soc

for you to fetch changes up to f908ea8a0f2de52dca6b19ef14885ed6f034fe58:

  ARM: configs: u8500: Enable compressed firmware loading (2026-11-15
18:52:05 +0100)

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
- Finally enable compressed firmware loading as Nura uses this.

----------------------------------------------------------------
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

