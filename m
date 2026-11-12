Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94709606C2E5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bMAoqtJL;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWHRr52z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fTf5xwUaVqhCGYlOB3/ivLsxy/QQjCllvG43X3tVGp0=; b=bMAoqtJLYb0I2cLkCPUk9KnuD2
	anJvwMovW8es+1bGtqaHPnPo1kIkFhKKnRlLMXGo1k8d1lIQgcf4EXCjFo+GgNxYtS46yE7v335nL
	69tpf0nuha0c5J17ECWIa8/bX6pye/y3GukJEaYdmK0W+pIJmkR+B/zXp2I3L8WyT4DBc2FoEEWh5
	tAddz952edqBgZmqev9nCPBgnzuAxJ/uG5Tv1WOuqUwG4Uod43WUrMr+0nijS78xSpzMSdxz7T6hG
	mqiFY7EQsEapVLOPoOc9D4unf64wTsHzp4jmmstv/pXJFLgEICT8FdqbnlkczY12KJF5qKywDj2Z9
	CqB1i80g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXkH-0000000AbE8-05SI;
	Thu, 12 Nov 2026 16:33:53 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXk4-0000000Ab9Y-0o44
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 16:33:46 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-1a8cc11ac42so4481966c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 08:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501219; x=1795106019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fTf5xwUaVqhCGYlOB3/ivLsxy/QQjCllvG43X3tVGp0=;
        b=OWHRr52z3fcq47vs7Y2WoEYov9bFRzcm1NYOMcxP1L8bDL/exFY26gRB/Dgs4uq4PH
         F9MIEuYftM9qMQcv9wc2KMHd+1jC0YlQnnmLiWwRSPuMcyhwMaOcqoXyTGejOsOerUlS
         D82nfB8Dys0G9Qk/eWXSs9NDBJ4zUrqtnS9ygHSO8hKkSWj0HaqL8IgG/2kxK5GZMqS/
         hxyov19TDqH3BSF/r4tCP6fzzFganCjO/rsBRgxhbPCWmCD4/jxBRTF+W3voSSzaew10
         6SmVir4Dm3vaFoYOhMI5aqesq+bh02+6z80Uil3pnN/g8skAzk9/ZxcvLHSBnkEonNDD
         nGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501219; x=1795106019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTf5xwUaVqhCGYlOB3/ivLsxy/QQjCllvG43X3tVGp0=;
        b=yVMwNPRmxkVeWZXZlbWZ0Tj24f7eOjLEDY1sjjxqq7TWd3nA4iGN1X9VSsDAjiqcow
         z/Yce6i1lPYwN0hxPvpI2kIuoTy4HMhXbkLL2asOyqftOVL0EJ5x5hRxu9paLzWnkE6I
         G9kZMg6Wiluno6nXoPVCz7TwphBsms4ci2gL6XQwAn80AA6AxJW6Q4L8wfUxkLlUy6AX
         LhAekKSzgtqVI80oiwYEzjWpxniOCxVwRyWkmDoEm3uo7lwGnInat/KD0fW0vdRl/9eH
         gOsPbbnGEdMXCKQ1Q9GSHa3d6cpMKomPY5p65MIXBmu3ydv4ofz67CZKFZqr1j5Vw/gr
         IHUA==
X-Forwarded-Encrypted: i=1; AL+hErEKioq1VD5D5dyGcaxfmii/gqkFi5UPOpFqjh907oF6ZAbsn3LYbVkawXo1tHQfiWR3OXnTqL+zhFnsYDSZ17tA@lists.infradead.org
X-Gm-Message-State: APuU4Z9x4ZNEsOqplIqdzhkE7FK7V41n6k0WI/IUkJ/6tazvVldufMcR
	MnVnG8x/AbMlZ4wBFIAeHwDr3s49eHmcYp31EdeneQyWJR1+FZ8xAv+z
X-Gm-Gg: AYBFou0eUTJP1Tg2zaNwfNCNyc4F2bLtiBxjmuAII4ZLEQnYZvGQsIylw+t64y94z0x
	4mZLiCHYAH/5BxuY5a6O8DwqVoc0yNUFKBC7tvd0n0vW4QAgnUNlBH09FFyeP2pPNX1ETKMmACH
	chWNiaOmnCR4cPI8ZETSCvlNrVGCfB3+UxPd1uBXqSjJU9VirmsxvRVnsgqLkzBg4I0oQCaj02z
	fzTfY/mixGbXgEqrPkMbxT64cXn9eUaHfD2B2nBrMFYJwAEYI2YqojEB9PxRl4pDUvScPCbC3Gi
	fj2qN3NNEItbkNla/6DBxJFYCUXJ72hV+HtMiODV/z4M0tk13Qlu+ONmPy1RDwNxe/g5fp8FrDd
	Dcbn54EgguTSJX3gypyTdm7w8CDQZnO297Ug4N6S20d44FFUpmTdFWMWvnUpSInjheIhf2VMRbh
	FHTQiI3osdL/9WdpESH885WrTc6vpwJvQ5fbAkwuO4H+SRyPoPiQjusUC1zdXK1uuY2OjhlNkeC
	zhwHIxHhqY5JfOhWeMmk8CDXYKEwu3EsepPoDBHLnh1JE9OqPSaahRS12VWRQowGVTl5VRLclWG
	yYBSZC/Bh31KWyHXk0bfdFnnE/SVJMJibqyTdUMKzYpBvzF0D+U/LyH6U54q0dKpcwzPd9wWyRv
	I4rtjOhk7IgHhCJklJ8xxCM9HRyM63c9V9JTUAjREG4b1fS43QFf6zHTEfWhRsIUVqfZKoQYx
X-Received: by 2002:a05:7022:409a:b0:1b2:3b5b:b80b with SMTP id a92af1059eb24-1b5030d7a9dmr70385c88.8.1794501218632;
        Thu, 12 Nov 2026 08:33:38 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm230248c88.0.2026.11.12.08.33.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 08:33:37 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michal Simek <michal.simek@amd.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next v2 0/3] ptp: ocp: support the WiWi production Time Card
Date: Thu, 12 Nov 2026 08:33:29 -0800
Message-ID: <20261112163333.12523-1-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_083341_400631_593EEC68 
X-CRM114-Status: GOOD (  13.63  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The WiWi Time Card (2163:1008, subsystem 10ee:0007) uses a
Celestica-compatible register map behind LitePCIe. Its bridge does not
support the subword MMIO used by the XIIC driver. Add an opt-in word
access mode, exercise both modes with KUnit, and enable ptp_ocp on the
revision 02 interface. Other cards retain their existing access modes.
The series does not enable WiWi flash updates or change LED policy.

Patch 3 uses the platform-data field from patch 1. Could the I2C
maintainers review patches 1 and 2 for an Ack to take the series
through net-next?

Changes since v1:
 - 1/3: Drop five explicit inline annotations in the C file and
   shorten the platform-data comment. No access semantics change.
 - 2/3: Wrap the offsets and expectations flagged by checkpatch.
   The four test modes, register offsets and expected values are unchanged.
 - 3/3: Follow NetTimeLogic's PCI revision convention. Replace the exact
   image ID and per-core version checks with a revision 02 gate. Reject
   unknown revisions before FPGA MMIO and retain the BAR/MSI-X checks.
   Report the full build ID in devlink; select capabilities by interface
   revision. Update the documentation and wrap overlength lines.

The revision 02 driver was tested on a physical card running build
0x0000800f under Secure Boot. It bound with 64 MSI-X vectors; the PHC
advanced 3.000441080 s over three one-second sleeps. SPI NOR and both
EEPROM clients bound. The PHC was UNSYNCED at probe; this test does not
establish PPS lock or valid UTC. Only that firmware build was tested on
hardware. Subsequent edits to the tested drivers remove inline hints or
change formatting and comments.

On the rebased v2, the XIIC and ptp_ocp objects built on x86-64 with
W=1 under allmodconfig and allyesconfig. Four XIIC KUnit cases passed
in an isolated x86-64 QEMU boot. Fixtures exercised all 256 PCI
revisions, bad PCI layouts and multiple image IDs. These are not
additional hardware tests. No full allmodconfig or allyesconfig build
is claimed for v2.

Codex assisted with the changes, tests and changelogs using the board
layout, machine-check evidence, vendor revision rule and v1 CI reports.

v1: https://lore.kernel.org/netdev/20261111041904.48916-1-ahmadexp@gmail.com/

Ahmad Byagowi (3):
  i2c: xiic: allow platforms to require 32-bit register accesses
  i2c: xiic: add KUnit coverage for register access modes
  ptp: ocp: support the WiWi revision 02 Time Card

 Documentation/networking/devlink/ptp_ocp.rst |  36 +++-
 MAINTAINERS                                  |   1 +
 drivers/i2c/busses/Kconfig                   |  14 ++
 drivers/i2c/busses/i2c-xiic.c                |  60 +++++--
 drivers/i2c/busses/tests/i2c_xiic_kunit.c    |  91 +++++++++++
 drivers/ptp/ptp_ocp.c                        | 163 ++++++++++++++++++-
 include/linux/platform_data/i2c-xiic.h       |   3 +
 7 files changed, 341 insertions(+), 27 deletions(-)
 create mode 100644 drivers/i2c/busses/tests/i2c_xiic_kunit.c


base-commit: 368fbf5d82da9ebce309449c74fc0b128f7d0219

