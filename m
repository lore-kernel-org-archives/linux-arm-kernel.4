Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA80606A890
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yoq3Z8hV;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k/EdGxUe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gmcXc8PpLN8Y0P2f1bs8epH6lji2dvrS3zcd2mdMtMA=; b=yoq3Z8hVYMZpnP4TTtrdPal4Uy
	g0vvmoMywQkET/CwndKFatvNh9Tzp9HUqZnhNVOpV6XbmgOpMhP4nyVz6PvxgOQRqLZJNmcJOCE02
	0IIu9MmPRwp9cFEt93uC94R4pfOBZk5bCVzkhqr8/KLvbADVT11FIvpUYGlRFYly8TVeagJorOViW
	e+Ykx46342/CXm2M8tXbwA74VNCPAI6OUqiyBz+AFZS3HLN7f0kXUtJP3ON8ha1KoCiQ+Hw4FU7OK
	hJ4xylxS4650tVL9siyQNvrEpDfr0lXOV3lFklJNymiPpDSQ893bI5fg1dhpxqAeFLPLI6OLTqi/v
	I2fEMAxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1K6-00000003W51-0JDW;
	Mon, 16 Nov 2026 18:20:58 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1Jx-00000003W2S-0Il5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:20:50 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so2875672b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 10:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853248; x=1795458048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gmcXc8PpLN8Y0P2f1bs8epH6lji2dvrS3zcd2mdMtMA=;
        b=k/EdGxUeCPAPC8zqEyhJE/DzLgCwNPUSZ+fetV6p98wclLgl0YGkcFCNdhyicOLYwq
         cTwiJpF5qrb8rcTF17vUHikEPJwRGt04UFk2M+1CCikOWVok7r3Vp7aiZu/kE/T65qDZ
         aaTyzcYTkpG4B449N4i9Q4eImsTh00eIxhYeRxVdZ0RRy1c8h+DsAsCihPLmcssEYE9x
         kiEM/ULW4wJcQBoeabZVSod5oMAwXBev+MI7iUyEj0DvhjBkof+fB/akwat8v90BInvJ
         3ZL4UxBeN5xbEY7WfIgtb8Wpva6KvH7rx6lCjrqGKPVf43O+v8St7cHV3vn7fNkPvvh2
         KiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853248; x=1795458048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gmcXc8PpLN8Y0P2f1bs8epH6lji2dvrS3zcd2mdMtMA=;
        b=w/TUmq3JFKo7mFS1VJIhgUU2Hj4Reyv1fMU/hkVGsWIQNHbYjISqh9cYtmxyW5zDBl
         yGt/oI6a4KXERNdOt7rzMc22SzKPwJ/6p0/tu4kWL40trXCPU8F1FEJuREZaafH8WRnF
         T61DCJekf1xPL55p218wRUYL6GHYbTOq9zNnoXvaK9IN69TAxT6oUqVRXCCGvdgDMh07
         XeAeF+wHsbNaF7SA8OgOlurz8i6j+DjSYQDfdixkznUk5FE2aAgKBLngdyzEd8J2iL7Y
         PyXZ3exprtGs6d+qPYec0ciZErKNKN0/tW7n1TWI7KkCRxRKP84a33g9q3xjzYb7QcfF
         eycQ==
X-Forwarded-Encrypted: i=1; AL+hErFpbrtHcRVZGwJdnYp3tF1K7r25b9gUh7Ft8U52Z93kisMxu7YCqnKsq339Kivz2NSodBaOIITPvECpuqRjrRwK@lists.infradead.org
X-Gm-Message-State: APuU4Z+4PN2Qn1FvuiOWizLGw1GqWioL1IdyL7quFOs48SLlnG81c78n
	Br2dc/xo4yOO0T9c8+K8kgtdKQDE0Rxg86Ry7AoYpiBi/jXWk3Up0ttWfcgK+i87
X-Gm-Gg: AYBFou0Yklrrcz1AoqaSMy7J0Tk5LSddbgy2jB5WcrZfurk8QwFWNXCjzZeMcL2MJUC
	cYv/ZMxSFjeVVfgRzbZGXNpEm3r9Ut1VTXHDP0pBVRvgakCn2fNWEzfgFvyZM42MK4guiU1sRr1
	QI7GuDC1B4IytiLOLwnGFiKGe0uir8D+wF17IFdcl2nIXvSpkXUte2KMJurUd7W1vbbJOAk2cll
	xyftro3HOiIZfRWfU/Tke8E0ZHJzmxJVlbi1X0WnzD7S1kSGmr30QTPEjjb8BwbptOAx2uFUL+v
	DnOBYFDEj08vTv/vwdD7BVYxE7iULauOnUGGAcncggmHSQc6KoNNp67CjxyRs8nDd7/ld6W9SK9
	aKfsadG0sBcQ9YKSOn6MYMkRBF+h06LW9a/NFFHXE+s22m3yTjdP+5xhhKQOarwKZJCu9rIZScu
	bRrRaxR7zD9j4bQEQniSc7kAY6Bm7dWOlYdIxKNUAOWITXia+Gfs6n/OoMplNH1AsciSgmU0IeS
	lXZ1/7J5++nx1olFUZ/ikA/7TKQ+n89gR2MjMplif8/Met+S+p0F/vR8G+Rl+WmIRGdeKAsIHPs
	4UL2HVrQ6QXDcUffJ7pSbaIjTY/ZAJ5+N2HfGLsH0dMAToo2vpdXdpghqa7QmZ+3flT52VaUef1
	oYKJt+EuwKQp7q0Y3qrpAmqjwcrW1kfl2ZHy5VvoCJ7KuZnxLTq/UBisGnA==
X-Received: by 2002:a05:6a20:9e4e:b0:3e2:827b:2b7e with SMTP id adf61e73a8af0-3f7a6ea143cmr11038256637.28.1794853247994;
        Mon, 16 Nov 2026 10:20:47 -0800 (PST)
Received: from localhost.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececce013sm4235466b3a.6.2026.11.16.10.20.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 10:20:47 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	andi.shyti@kernel.org
Cc: andrew+netdev@lunn.ch,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michal.simek@amd.com,
	pabeni@redhat.com,
	rdunlap@infradead.org,
	richardcochran@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH net-next v3 0/3] ptp: ocp: support the WiWi production Time Card
Date: Mon, 16 Nov 2026 10:20:44 -0800
Message-ID: <20261116-wiwi-v3-87afa10a8-0-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_102049_118411_889D625D 
X-CRM114-Status: GOOD (  10.35  )
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

The WiWi Time Card (2163:1008, subsystem 10ee:0007) presents its timing
peripherals behind a LitePCIe interface that requires aligned word MMIO.
Add an opt-in access mode for XIIC, test both access modes, and support
the revision 02 PCI interface in ptp_ocp. Patch 3 consumes patch 1.
Could the I2C maintainers review patches 1 and 2 for an Ack to take
them through net-next?

Changes since v2:
 - 1/3: Identify patch 3's WiWi XIIC child as the first user.
 - 2/3: Restrict the RAM-backed test to direct x86-64 MMIO. Exclude
   UML and indirect I/O; do not restrict the driver.
 - 3/3: Match the board by its PCI IDs, validate revision and geometry
   separately, and select typed XIIC data from the static board match.
   Do not expose the SPI flash through MTD or devlink. Omit unsupported
   GNSS2 interfaces, preserve external PPS2, and clarify firmware build
   reporting. Refuse timing enables until the interrupt gate is open.
   Distinguish WiWi's PCI interface from legacy Celestica.

The driver objects build for x86-64 allmodconfig with W=1. All four
XIIC KUnit cases passed on x86-64 QEMU with the same two I2C patches.
An earlier revision of the driver on a revision 02 card confirmed
64 MSI-X vectors and an advancing PHC. The new board policy and timing
guard have not been run on that card. No claim of PPS lock, UTC accuracy
or masked-event replay is made.

Codex assisted with implementation, tests and changelogs using the
board evidence, vendor revision rule and mailing-list feedback.

v2: https://lore.kernel.org/netdev/20261112163333.12523-1-ahmadexp@gmail.com/
v1: https://lore.kernel.org/netdev/20261111041904.48916-1-ahmadexp@gmail.com/

Ahmad Byagowi (3):
  i2c: xiic: allow platforms to require 32-bit register accesses
  i2c: xiic: add KUnit coverage for register access modes
  ptp: ocp: support the WiWi revision 02 Time Card

 Documentation/networking/devlink/ptp_ocp.rst |  47 +++-
 MAINTAINERS                                  |   1 +
 drivers/i2c/busses/Kconfig                   |  15 ++
 drivers/i2c/busses/i2c-xiic.c                |  60 +++--
 drivers/i2c/busses/tests/i2c_xiic_kunit.c    |  91 +++++++
 drivers/ptp/ptp_ocp.c                        | 242 +++++++++++++++++--
 include/linux/platform_data/i2c-xiic.h       |   3 +
 7 files changed, 422 insertions(+), 37 deletions(-)
 create mode 100644 drivers/i2c/busses/tests/i2c_xiic_kunit.c


base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649

