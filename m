Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FAD606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GCFBEaY9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B5l8uDp4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GxX6GErs7QQNQqod0faT6hBpHKAJuPF4BZU8osTn3JQ=; b=GCFBEaY9NNschKSDiufkCc/qNC
	Re45RrwJqCF0Fn3xWs7QKYuh/JXSh0IEDE5SLg7M+dqB7/VoWTx42RQn9AzMpNFfU16WAJvK7Oi8h
	kytD7eCgwdAa3JBQCSwQtaoo9iaQcoxa2k70zXQhjZjHzALRr4HjfIdaL8nDcX71Jgn2i4oYgUZDg
	iZKMs6itewyCIXgmxUMJSic5sw+YdbC9nS9Fw5QYrgcFvkSSUXDRH7UPasgngArhUE+1EHViPNwge
	GigqdATMWIypw5a10lIg3rDXbmj5sBZ/5SHuGBpK5CGGqVrA4AG+azQ88X5ftp3hetXsAXtZs041U
	xNWwulDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbX1-0000000DkcV-48UM;
	Thu, 26 Nov 2026 15:37:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbX0-0000000DkcD-35AS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:37:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 32E3D45EA0;
	Thu, 26 Nov 2026 15:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193791F000D1;
	Thu, 26 Nov 2026 15:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707426;
	bh=GxX6GErs7QQNQqod0faT6hBpHKAJuPF4BZU8osTn3JQ=;
	h=From:To:Cc:Subject:Date;
	b=B5l8uDp4yMH1IV35KDLPpI7URgvTGkwgfwMUbyLQkSOYHlQ2cEgQMGSBQln8+k3pE
	 RAQ8tlHMAqASocL2dgRaZoKQvO/l1dzFOy5V2i+c9dyMgN9sxVyD72/NkCyU6mB4eE
	 shan97s7H6xVowq8RRnlK30rUF/UD0K5PvrDZeI7GTWc1HHQyRHWWzE6nK/bebQntM
	 xuPXx1CxfCEbeJPItwsq6uGutTphaZJLhv1DJnZwwzfBS0gDnEH1BwJ75DM7MSKpN0
	 LHEpKQsTuX1mmR/HzV+OOPOjmzLiOMuNB98saL/enfxdLKPtDc5vxxlls1VqXuLGNQ
	 ThfnilD+gjsGQ==
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
Subject: [RFT PATCH 00/13] gpio: regmap: IRQ domain cleanups
Date: Thu, 26 Nov 2026 16:35:11 +0100
Message-ID: <20261126153600.299724-1-mwalle@kernel.org>
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
regmap-irq domain, gpio-regmap now provides a helper that can be
used in the .create_irq_domain() callback.

We need Long Zhao's patch [2] not only for ACPI but also for the
regmap-irq handling. If the IRQ domain is removed before the
gpio_chip, gpiochip_remove() would use the already freed domain to
free the remaining interrupts.

All the users of regmap-irq are switched over to this new helper.
Finally, the last patch, removes the old variants.

There is one change in behavior: because all regmap-irq domains use
the gpio_regmap_irq_{reqres,relres}() helpers now, interrupt lines
are now locked and cannot be switched to output. But that shouldn't
be an issue anyway.

This was mostly only compile-time tested. So please test. I'll do a
proper test on the sl28 board tomorrow, but since Long already
asked, I wanted to have this out for comments and testing.

[1] https://lore.kernel.org/r/20261123040142.48880-1-joseph@telaak.dev
[2] https://lore.kernel.org/r/20261118-cv75-gpio-v15-3-e3c563673fe1@ambarella.com

Long Zhao (1):
  gpio: regmap: remove gpiochip before tearing down irqchip

Michael Walle (12):
  gpio: regmap: add a callback to create the IRQ domain
  gpio: rtd1625: create the IRQ domain from the gpio-regmap callback
  gpio: axiado-sgpio: create the IRQ domain from the gpio-regmap
    callback
  gpio: regmap: add a helper to add a regmap-irq chip
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

 drivers/gpio/gpio-104-dio-48e.c  | 31 +++++++++----
 drivers/gpio/gpio-104-idi-48.c   | 38 +++++++++++----
 drivers/gpio/gpio-axiado-sgpio.c | 64 +++++++++++++++-----------
 drivers/gpio/gpio-i8255.c        |  3 +-
 drivers/gpio/gpio-i8255.h        |  8 +++-
 drivers/gpio/gpio-idio-16.c      | 28 +++++++----
 drivers/gpio/gpio-max7360.c      | 62 ++++++++++++++++---------
 drivers/gpio/gpio-pcie-idio-24.c | 36 ++++++++++-----
 drivers/gpio/gpio-regmap.c       | 79 ++++++++++++++++++++++++--------
 drivers/gpio/gpio-rtd1625.c      | 74 +++++++++++++++++-------------
 drivers/gpio/gpio-sl28cpld.c     | 34 +++++++++-----
 drivers/gpio/gpio-ws16c48.c      | 36 ++++++++++-----
 include/linux/gpio/regmap.h      | 34 ++++++++------
 13 files changed, 351 insertions(+), 176 deletions(-)

-- 
2.47.3


