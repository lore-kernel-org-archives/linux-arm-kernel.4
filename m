Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0DD606A939
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 20:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2EwAhtAW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B7g3URJj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9kpI7Vq4supsYlMGRpz50aG63c4CSQV96+wn8mS3O4I=; b=2EwAhtAW+7rwHnuYuZA9FPNvvJ
	IhP25KyOFSq13zLYYkUzm8HFlYTdTu9Bp7r4pl9B7FQcpkyO1XtOjc6hbmtR5s9fCGygWqnM2trpm
	AkihN7vBbJ72KOrKe58d4lqYMTRqtFiXAflfYxECmJCe1M9SFOQQitavJ9gSoeEtir8r0k4HHQJdB
	jVMDcL5LK6VPj2VA0Hzj/nwcQ8Xyit9SP31om2U+LXT+GZ5HASThw3R+yNgVU75lCNY3brxe9Dnng
	AWNNK2qxjU4TCiN1ji8EfS2gbLJO/fqMWtQJAWOmL5YteqKeACwUYHfKBQtdVAT0xKlzwC/BecuOP
	xKEPrI6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU95J-0000000DQDn-3vKU;
	Thu, 19 Nov 2026 20:50:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU95I-0000000DQDS-1nBr;
	Thu, 19 Nov 2026 20:50:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 325494739D;
	Thu, 19 Nov 2026 20:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6122D1F000C6;
	Thu, 19 Nov 2026 20:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795121420;
	bh=9kpI7Vq4supsYlMGRpz50aG63c4CSQV96+wn8mS3O4I=;
	h=From:To:Cc:Subject:Date;
	b=B7g3URJjIH6bQfbnjExdaBIFhBZy+ITUC6TvmuTsYjj9Ev6hyn8K/sM3jmzyhXran
	 dXDMiO2QjapDv+UTqIv0OuJZN7FM5Vki90dte4g5d+aaaT1k8ZYX4SfegB7R6A3AtH
	 c1m/TX5wzsegJeN1t7uXFQl2Ae7d56oSf8tvh+hpvVro4EWtYoWIZh3x2ALcupEP2V
	 7nBltUj2R3fZA1bUvKOVZwXO4huEeRgCOU6F+a6SHZG4WZ5jbkxmFCnGJODJk+hKc9
	 JFz9yAeqcEMbQuWNdxOcVgDkXwJEdnvXa8ZNXQz/Mdyds5ZJ34C6HfSQizlRv6PZY7
	 UyJGIDXNhDLAw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Alexander Sverdlin <alex@sverdlin.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.com>,
	Andrew Gaylard <ag@ffroot.co.za>,
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
Subject: [PATCH v2 00/12] pinctrl: Fix resource leaks, out-of-bounds accesses, and error handling (batch 2)
Date: Thu, 19 Nov 2026 20:48:56 +0000
Message-ID: <20261119205013.2563811-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
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

v1 => v2:
 - Rebase onto pinctrl for-next, dropping the manual fwnode_handle_put()
   in npcm7xx_gpio_of() now covered by __free(fwnode_handle)
 - ma35: Explicitly include the I/O mapping header for iounmap()
 - ma35: Retain a reference on bank->fwnode in ma35_pinctrl_get_soc_data()
   (Sashiko)
 - ma35: Correct the description of commit 3fd976afe974 in the
   dt_node_to_map commit message (Sashiko)
 - npcm7xx, npcm8xx: Release GPIO bank fwnode_iomap() mappings via devres
   on error (Sashiko)
 - single: Switch *map and settings in pcs_dt_node_to_map() and
   pcs_parse_pinconf() to unmanaged kcalloc()/kfree() so devres teardown
   cannot free *map before pcs_dt_free_map() runs

v1: https://lore.kernel.org/all/20261111215256.1982044-1-lee@kernel.org/

Cc: Alexander Sverdlin <alex@sverdlin.org>
Cc: "Andreas Färber" <afaerber@suse.com>
Cc: Andrew Gaylard <ag@ffroot.co.za>
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

Lee Jones (12):
  pinctrl: nuvoton: ma35: Unmap reg_base and release clock on probe
    error
  pinctrl: nuvoton: ma35: Prevent out-of-bounds write in
    ma35_pinctrl_get_soc_data()
  pinctrl: nuvoton: ma35: Retain child firmware node reference in
    ma35_pinctrl_get_soc_data()
  pinctrl: nuvoton: ma35: Assign fwnode to gpio_chip in
    ma35_gpiolib_register()
  pinctrl: nuvoton: ma35: Avoid leaking map when parent node is missing
  pinctrl: nuvoton: Unmap GPIO bank registers on error in NPCM7xx and
    NPCM8xx
  pinctrl: nuvoton: npcm8xx: Propagate npcm8xx_gpio_register() error in
    probe
  pinctrl: nuvoton: npcm7xx: Fix fwnode_irq_get() error check in
    npcm7xx_gpio_of()
  pinctrl: single: Reject invalid register width in pcs_probe()
  pinctrl: single: Free pinconf settings array in pcs_dt_free_map()
  pinctrl: sunplus: Validate pin_func index in sppctl_dt_node_to_map()
  pinctrl: realtek: rtd1625: Set dcycle_offset to NA for pins without
    duty-cycle support

 drivers/pinctrl/nuvoton/pinctrl-ma35.c    | 70 +++++++++++++++++++----
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 20 +++++--
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 15 ++++-
 drivers/pinctrl/pinctrl-single.c          | 49 ++++++++--------
 drivers/pinctrl/realtek/pinctrl-rtd1625.c | 12 ++--
 drivers/pinctrl/sunplus/sppctl.c          |  7 ++-
 6 files changed, 126 insertions(+), 47 deletions(-)

-- 
2.56.1.750.gf70dc682cf-goog


