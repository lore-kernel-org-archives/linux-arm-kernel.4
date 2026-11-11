Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18B1606A338
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 21:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CRomyTR2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jCM9Q700
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=w4918hHXXDmKU7fR/Ldi5kPR9rByWFlOgXHLpR/sBLM=; b=CRomyTR2Hm1u1CDw9g0GfeezC3
	G1OOFLYgFrp9fc3T3iTnGr0/kaeads46p8gtwgsTV3b8meuct/V9CTz7otIiwOwcmvAWbbA9jhv4H
	uZZ1BkgBSLY3xsIOAfhqK7RrPFXu79wtLdQgf+wPpnVXNGshJoFs1o6Zi+BOtaefqObxZKdPbiZ4O
	8BJWc8DpeYSjfcDbT01tYakogm8iHiwaO0SNcdfXTPjIqFMUmbkc4lMAKPqWL/bT2WT4uaf8RNCGv
	G58A9mrUnwJNOXzA4cfynlzMb8wpVSPz5xspCYqs4XD0rpsDNaYdkQFw88f7HaJYLab0o/TBH07KT
	8oPaZsEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGFe-00000007qy9-2irE;
	Wed, 11 Nov 2026 21:53:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGFc-00000007qxc-39X1;
	Wed, 11 Nov 2026 21:53:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CD5F26344C;
	Wed, 11 Nov 2026 21:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C031F00A06;
	Wed, 11 Nov 2026 21:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794433983;
	bh=w4918hHXXDmKU7fR/Ldi5kPR9rByWFlOgXHLpR/sBLM=;
	h=From:To:Cc:Subject:Date;
	b=jCM9Q700oZYghT9ZuZtkTxVa7WzCKp6T+2kNdPYJhBtwwtts0mwOMiUYHHDWedJ9w
	 h5SE8aYakvTCRXnnwyzIMWrBibmwKYpK9VmBSEnklHu67PZyFSy8WFEToGJY+hRA4D
	 NJf+CdIrNLk9pHMmWw1py4NHbZyAVkYsLofqSuF/1poR3PCt/OW8PCe1lrCKVHVqSl
	 +8YyPDLwpIB46jK9yk6StqbMysQS1bQAyhEyyzaYffSZb0zfKgZX+u8Hemzt6gZYsD
	 +AvQz1XVMeCBuINqD1WrWBSAfFX2E1PPniw+qA8GHgfd4b2hNukVvuKbe4W+9s//+7
	 7lv1AuU7Ya0AA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Dvorkin Dmitry <dvorkin@tibbo.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	James Tai <james.tai@realtek.com>,
	jordan_hargrave@dell.com,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-realtek-soc@lists.infradead.org,
	Nancy Yuen <yuenn@google.com>,
	openbmc@lists.ozlabs.org,
	Patrick Venture <venture@google.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Tali Perry <tali.perry1@gmail.com>,
	tomer.maimon@nuvoton.com,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Tzuyi Chang <tychang@realtek.com>,
	Wells Lu <wellslutw@gmail.com>,
	Yu-Chun Lin <eleanor.lin@realtek.com>
Subject: [PATCH 00/10] pinctrl: Fix resource leaks, out-of-bounds accesses, and error handling (batch 2)
Date: Wed, 11 Nov 2026 21:51:45 +0000
Message-ID: <20261111215256.1982044-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These issues were reported by Sashiko (batch 2).

Cc: "Andreas Färber" <afaerber@suse.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Avi Fishman <avifishman70@gmail.com>
Cc: Benjamin Fair <benjaminfair@google.com>
Cc: Dvorkin Dmitry <dvorkin@tibbo.com>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>
Cc: James Tai <james.tai@realtek.com>
Cc: jordan_hargrave@dell.com
Cc: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-omap@vger.kernel.org
Cc: linux-realtek-soc@lists.infradead.org
Cc: Nancy Yuen <yuenn@google.com>
Cc: openbmc@lists.ozlabs.org
Cc: Patrick Venture <venture@google.com>
Cc: Shan-Chun Hung <schung@nuvoton.com>
Cc: Tali Perry <tali.perry1@gmail.com>
Cc: tomer.maimon@nuvoton.com
Cc: Tomer Maimon <tmaimon77@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Tzuyi Chang <tychang@realtek.com>
Cc: Wells Lu <wellslutw@gmail.com>
Cc: Yu-Chun Lin <eleanor.lin@realtek.com>

Lee Jones (10):
  pinctrl: nuvoton: ma35: Unmap reg_base and release clock on probe
    error
  pinctrl: nuvoton: ma35: Prevent out-of-bounds write in
    ma35_pinctrl_get_soc_data()
  pinctrl: nuvoton: ma35: Assign fwnode to gpio_chip in
    ma35_gpiolib_register()
  pinctrl: nuvoton: ma35: Avoid leaking map when parent node is missing
  pinctrl: nuvoton: npcm8xx: Propagate npcm8xx_gpio_register() error in
    probe
  pinctrl: nuvoton: npcm7xx: Fix fwnode_irq_get() error check in
    npcm7xx_gpio_of()
  pinctrl: single: Reject invalid register width in pcs_probe()
  pinctrl: single: Free pinconf settings array in pcs_dt_free_map()
  pinctrl: sunplus: Validate pin_func index in sppctl_dt_node_to_map()
  pinctrl: realtek: rtd1625: Set dcycle_offset to NA for pins without
    duty-cycle support

 drivers/pinctrl/nuvoton/pinctrl-ma35.c    | 55 ++++++++++++++++++-----
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c |  7 +--
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c |  2 +-
 drivers/pinctrl/pinctrl-single.c          | 42 +++++++++--------
 drivers/pinctrl/realtek/pinctrl-rtd1625.c | 12 ++---
 drivers/pinctrl/sunplus/sppctl.c          |  7 ++-
 6 files changed, 85 insertions(+), 40 deletions(-)

-- 
2.56.0.567.gdb80ae8cd5-goog


