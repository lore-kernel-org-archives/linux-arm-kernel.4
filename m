Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A6C606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nZXZTibI;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R3jbylAp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=bTb1smPdfs50/CV1iZiOqwdrQ4Jj2ruXAAIegallcVI=; b=nZXZTibILrcgtAkTOWGHm5Vw6Z
	aB4Pw1jesKqQ8r1TrglTwgbVB4Io0N6qeAeVW5sIca2dOqnBPSvp9v1AX84tKHGfSLkHWUGAUEJlB
	QmWiEk7LQt72+uHVh0HlYMw3Z517xAXdsFl4+8fc0jMmlU6OxmwqrsGEb/uPyJta5p2kpzS6x+DMC
	L+mOlbBr6QRfMchesMlX+FET/wgqwKzL5WAMgw5fGnHKX9WciBHa8LCVLEM3rdPHzfRGMGV01qHsL
	yVHWSol38JYLkKWQV+qVN1MjY77cGR2QHs0VO0thgoi2m9vHMXc+RictqkU8OHQ1hhnQSmpQ5zso0
	RVR+FtnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxJZ-0000000GdQy-0OjI;
	Fri, 27 Nov 2026 14:52:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxJX-0000000GdQf-40rq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:52:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B48B140897;
	Fri, 27 Nov 2026 14:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D0E51F0089B;
	Fri, 27 Nov 2026 14:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791159;
	bh=bTb1smPdfs50/CV1iZiOqwdrQ4Jj2ruXAAIegallcVI=;
	h=From:To:Cc:Subject:Date;
	b=R3jbylApfBTW21TdCAV4Cy5N3QARTW2U9U2NaJY8SCsIco5R5nloYZeuCSq5+6wTg
	 8PsZm4+cByWTsCGJLJ+DllijCPcEXnwlYk9toGyMuUvQpopfDhWqrvHFfnD11kmwWn
	 RR5n2PFB+94/WhDqlb8wk0lvgMmO9cCKL4buSTO0H41ft2rhVtVcTgPNqlI5gDxKzn
	 G9Y6nQZ81zvLDe3voH1zYl14yFYqoS6be4hfA5L0jPj0FP8F5M2aJP8Hsx/pxHGeKM
	 qsTsFC5iwkw1+WYsEKBENFbutF+0z8l0g651TfmpiAzF+HEEynYIyOhgFI6ONNTWdz
	 6ix4TIfbIFEPg==
From: Michael Walle <mwalle@kernel.org>
To: William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Petar Stepanovic <pstepanovic@axiado.com>,
	SriNavmani A <srinavmani@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Long Zhao <longzhao@ambarella.com>,
	Joseph Telaak <joseph@telaak.dev>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFT PATCH v2 00/14] gpio: regmap: IRQ domain cleanups
Date: Fri, 27 Nov 2026 15:52:17 +0100
Message-ID: <20261127145232.814492-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The gpio-regmap provides two different variants to attach an IRQ
domain to the gpio-regmap instance, either via .irq_domain or via
.regmap_irq_chip. The former even has a small window where a
consumer requesting an interrupt leads to a NULL pointer
dereference. This also came up during sashiko reviews [1].

It turns out, that it is impossible to create an external IRQ domain
without a race while the gpio-regmap instance isn't created yet.
That is because it will already use the gpio-regmap provided
callbacks. Thus, with this patch series, gpio-regmap will now
provide a callback for the individual drivers used to create an IRQ
domain when all necessary fields are filled.

To move even further and cover the most common use case of having a
regmap-irq domain, gpio-regmap now provides helpers that can be
used in the .create_irq_domain() callback.

We need Long Zhao's patch [2] not only for ACPI but also for the
regmap-irq handling. If the IRQ domain is removed before the
gpio_chip, gpiochip_remove() would use the already freed domain to
free the remaining interrupts.

All the users of regmap-irq are switched over to this new helper.
Finally, the last patch removes the old variants.

There is one change in behavior: sl28cpld, ws16c48 and 104-idi-48
now lock their interrupt lines and cannot switch to output while
they are locked. The remaining ones already used the locking or now
use the _nolock() variant and retain their current behavior.

Also, resource management is hard. I didn't find a good/simple way
to have a correct ordering for releasing the resources. So we now
mandate that there must not be any device resource managed
functions/allocations in the .create_irq_domain(). It has to be
undone manually using the .remove_irq_domain() callback.

Furthermore, rtd1625 and axiado didn't dispose their mappings;
that's fixed, too.

This was mostly only compile-time tested. So please test. I've done
a quick smoke test on the sl28 board.

[1] https://lore.kernel.org/r/20261123040142.48880-1-joseph@telaak.dev
[2] https://lore.kernel.org/r/20261118-cv75-gpio-v15-3-e3c563673fe1@ambarella.com

Changes in v2:
 - new patch "gpio: regmap: use the correct number for .ngpio_per_reg"
 - add a .remove_irq_domain() callback and use it for rtd1625 and
   axiado-sgpio. reported by sashiko
 - rtd1625: split interrupt setup into fetching the info in probe
   and setting it up in the callback. reported by sashiko
 - max7360: make the callback look nice and keep the irq lookup and
   the regmap_irq_chip setup in probe.
 - add Fixes tags
 - new gpio_regmap_add_irq_chip_nolock() for devices where
   hwirq != gpio offset, use it for idio-16, pcie-idio-24 and
   104-dio-48e
 - collected any tags. Andy, due to some major changes, I threw some
   away.

v1: https://lore.kernel.org/r/20261126153600.299724-1-mwalle@kernel.org

Long Zhao (1):
  gpio: regmap: remove gpiochip before tearing down irqchip

Michael Walle (13):
  gpio: regmap: use the correct number for .ngpio_per_reg
  gpio: regmap: add callbacks to handle IRQ domains
  gpio: rtd1625: create the IRQ domain from the gpio-regmap callback
  gpio: axiado-sgpio: create the IRQ domain from the gpio-regmap
    callback
  gpio: regmap: add helpers to add a regmap-irq chip
  gpio: max7360: create the regmap-irq chip from the gpio-regmap
    callback
  gpio: sl28cpld: create the regmap-irq chip from the gpio-regmap
    callback
  gpio: idio-16: create the regmap-irq chip from the gpio-regmap
    callback
  gpio: pcie-idio-24: create the regmap-irq chip from the gpio-regmap
    callback
  gpio: ws16c48: create the regmap-irq chip from the gpio-regmap
    callback
  gpio: 104-idi-48: create the regmap-irq chip from the gpio-regmap
    callback
  gpio: i8255: create the regmap-irq chip from the gpio-regmap callback
  gpio: regmap: remove irq_domain and the regmap-irq configuration

 drivers/gpio/gpio-104-dio-48e.c  |  31 ++++++--
 drivers/gpio/gpio-104-idi-48.c   |  38 +++++++---
 drivers/gpio/gpio-axiado-sgpio.c |  75 ++++++++++++-------
 drivers/gpio/gpio-i8255.c        |   3 +-
 drivers/gpio/gpio-i8255.h        |   8 +-
 drivers/gpio/gpio-idio-16.c      |  28 +++++--
 drivers/gpio/gpio-max7360.c      |  35 +++++++--
 drivers/gpio/gpio-pcie-idio-24.c |  36 ++++++---
 drivers/gpio/gpio-regmap.c       | 121 ++++++++++++++++++++++++++-----
 drivers/gpio/gpio-rtd1625.c      |  91 +++++++++++++++--------
 drivers/gpio/gpio-sl28cpld.c     |  34 ++++++---
 drivers/gpio/gpio-ws16c48.c      |  36 ++++++---
 include/linux/gpio/regmap.h      |  49 +++++++++----
 13 files changed, 424 insertions(+), 161 deletions(-)

-- 
2.47.3


