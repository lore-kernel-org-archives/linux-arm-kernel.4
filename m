Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31081606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 07:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DuaTyFVf;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cSzIx+mV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Fgm5ZvS0zUq+ILWdJEIWmTetdq2Cml8WgKwtmZG127A=; b=DuaTyFVfHbA2mJUvvC2T1OwKen
	t4HR2+UBGjt/+22jegjiR/9+c+4qgDsTNpC1nuUcyZc+JrP5lQdVDJeAgSM9CgpegTY4C/GOhSTZY
	57T2RH40W/UkBQguMGPjlWWeAnP9y6FfyrZaexeTMqoflgHCTbi+g+NJ7E/pOQG71NEqHe9uinrf0
	FHdo/ARjdvfHU0cp7nkFMDMx4Q1CxNyUb+nYeZQlHKwJ1VRLdtn2x61s25/AgRYkBne39iBNIuXNZ
	E3vTuja6NjtYNJB7Az0Kky7GUfeInxO8F8MwLAxd+AesrxvHcuZFE6iVt42yTDyHMAJUMa64r91zp
	oyGIIsyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO4N-00000002Q12-2XD2;
	Mon, 23 Nov 2026 07:02:31 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO3b-00000002Pr4-3CIQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:02:10 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1758594f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 23:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417282; x=1796022082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fgm5ZvS0zUq+ILWdJEIWmTetdq2Cml8WgKwtmZG127A=;
        b=cSzIx+mVPM9IVXmaR5LDPofWiV0dtNSShkssQSa5uAfvy+TPeDJaduii1HN2O7Udwo
         yH4kQ64aDXn8jncp5kMKvkjv+VqVRPesO4qwjMAj7itYsw9L7Q6jjezy7Ip2LQQ0d7zd
         PRSXz6SnuxfNjeHCv1K/qleEYjnkb/dVuL+xo4yroyNfESZEVPW3JGI0SUsyYIwBgS2H
         gCCGLmShRhbyjZ9zZxuEuyUFdFKtIdFT01XsgOYhbJmx3CSKkFsfviKGMpjq9JUAXZ40
         sA43tnB3gHhTJcpt+RAHL/kFp5sw6dGGmgXZORkghLo/yzGxkqkwTsEvyfScC5daoxZT
         P4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417282; x=1796022082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fgm5ZvS0zUq+ILWdJEIWmTetdq2Cml8WgKwtmZG127A=;
        b=BTF9Ui80S99uAyal7+JEqEkZ19LdpLoV/IT4SGF0Mjk6/BY9RVxgn5ImKLKjVepuKq
         zgos0HjHezuebgH/OzIjTlkYZFPxi3i6+Uw3JQ049feg7QvFEaU9QwMtz+3H8RSaSTJ5
         5M+Ox/+G9050szWPYVqtVs9mj8Gkz3WwIuZYb7HGcNcT3ReCzj4R2Gqtydi/iZulCEYf
         Pjue7YuhsqSnwo3Q1Q5mpQ/h/6giEywhB1nQ4HW9Lpgp0DhdxCF3sm8lhqkcGPkGhfAI
         w5FEXDzjreRqE8j1QxgcvsBgzAyxmcXqGCWUqhtnKdvFVBmqb925zTZp241giGDw2Ewe
         7VRA==
X-Forwarded-Encrypted: i=1; AL+hErEnnf15F04trQAUdNM285BeY8cqm9rbTpbVnys/OoXfLHJ1C/PZaEvte3z0/RsWfg7cQGi9gDimuSc7bcoq9Z9a@lists.infradead.org
X-Gm-Message-State: APuU4Z/+3TcWqBlLC93H/+VKcn+FjxD7Hbjtd7wKvaCWZ3gTcvvMt5+L
	zOOqWzbvW+zhgvmuaJ4LPWcmTF6XrIc8ZHJB6zIW3crs9ByYYJjFipng
X-Gm-Gg: AZFdTZcLYN5nOGBiOzEqKXg3TgQ7ZrUBAD/ly7vu2Dy5KLYGh/7QJw76OiW8JFA6yoD
	HhxMWjmZoC7Whuuz5ZhcBM5ZbQqp8LUk/hF7PwaV7M3gBRtM+ogNKGSJ73hLxzYZaJ4boICtToM
	V4E93XMPXGJEUYpI1gPyTafXmnUTtN8zg1cvzXaXCINp9qsU0SksZC91AyGhiw69jerPFPRnpG5
	D5cHU4+lTDVafiYhDv4/p1juiUh0SuSr3O/k783vyTUiVnngywVgwXs9EoYrM8IkQ//8ox+Ut1q
	Vm3nmLoflkebQ5nypNvL1NThtGK29mExMQH3I1fs7VaCYKf+7jZeClC2wMXAjybZGchq4+QEQ7O
	IrE68Y5cw1LPfQmaf/RxmMNqTi1dtB/1v5TgQxq4fBD6ZCaKk6ACT1S9yO7vXuORlybIfFIK6Zo
	WNpQQjVPqKWDYzlB6pgdtDprJy63jzk77I22na5uh+tXYr42jyZcTcS8MF/5LELPqfnDGEDtWsw
	WWeC4pb4gClyKolWXDRFXnWxlXR5dSWaxpVGe6hfNMS/oIs1VHOT41lP1MOInGeLxkNOfVcvTY7
	MhAitKRXjLdukkVLJjmcSw==
X-Received: by 2002:a05:6000:258a:b0:48e:720a:ccaf with SMTP id ffacd0b85a97d-4abaab633d2mr21602958f8f.5.1795417282236;
        Sun, 22 Nov 2026 23:01:22 -0800 (PST)
Received: from fedora ([154.182.66.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm20779007f8f.3.2026.11.22.23.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:01:21 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	giorgitchankvetadze1997@gmail.com,
	amin.gattout@gmail.com,
	antoniu.miclaus@analog.com,
	gregkh@linuxfoundation.org,
	mripard@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v5 0/8] iio: adc: at91_adc: fix NULL trigger dereference and convert to devm
Date: Mon, 23 Nov 2026 09:00:53 +0200
Message-ID: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_230200_858953_699B4847 
X-CRM114-Status: GOOD (  12.86  )
X-Spam-Score: -1.9 (-)
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

This series fixes a NULL pointer dereference during trigger teardown in
at91_adc and modernizes the driver to use firmware-agnostic property
APIs and device-managed (devm) resources.

When the "atmel,adc-use-external-triggers" property is omitted from the
Device Tree, at91_adc_trigger_init() leaves external trigger slots in
st->trig as NULL. Patch 1 provides a minimal fix in at91_adc for easy
backporting to stable kernels, while the subsequent patches modernize
the driver and convert it to devm_* APIs (removing the manual teardown
code and the st->trig array altogether).

Changes in v5:
- Patch 1: Keep the minimal NULL check in at91_adc instead of modifying
  iio_trigger_unregister(), and explicitly note in the commit message
  that it is a minimal fix for backporting before devm removal (as
  requested by Jonathan Cameron).
- Patch 2: Drop the redundant dev_err_probe() message after
  devm_request_irq() in a separate patch.
- Patch 3: Switch from of_device_get_match_data() to
  device_get_match_data() and check for NULL in a separate patch.
- Patch 4: Convert of_property_*() calls in at91_adc_probe() and
  at91_adc_probe_dt_ts() (renamed to at91_adc_probe_ts()) to
  device_property_*() APIs, removing the local device_node pointer and
  dropping "in the DT" from missing-property logs.  Since no OF APIs
  remain, replace <linux/of.h> with <linux/mod_devicetable.h>.
- Patch 5: Introduce local struct device *dev in at91_adc_probe() and
  switch devm_iio_device_alloc() to sizeof(*st).
- Patch 6: Pass struct device *dev instead of struct platform_device *pdev
  to at91_ts_register() in a separate patch.
- Patch 7: Replace raw 1000 with HZ_PER_KHZ from <linux/units.h>.
- Patch 8: Convert the remaining buffer, trigger, touchscreen input, and
  IIO device registrations to devm_* APIs, use unsigned int for the
  trigger loop index, drop the now-unused st->trig array, drop the
  redundant input->dev.parent assignment, and remove at91_adc_remove().

Changes in v4:
- Split the series into 3 atomic patches: (1) standalone NULL trigger
  teardown fix for stable backporting, (2) local struct device pointer
  cleanup, and (3) full devm_* conversion.

Changes in v3:
- Address review feedback from Andy Shevchenko on v2 (drop redundant
  -ENOMEM log, use local struct device pointer, scope loop index to the
  for-loop, and convert error paths to dev_err_probe()).

Changes in v2:
- Drop the simple NULL check approach from v1 and refactor the driver to
  use device-managed (devm_*) APIs as suggested by Jonathan Cameron,
  removing manual cleanup functions and at91_adc_remove(), and inlining
  trigger initialization into at91_adc_probe().

Abdelnasser Hussein (8):
  iio: adc: at91_adc: skip unpopulated triggers on teardown
  iio: adc: at91_adc: drop duplicate IRQ allocation error message
  iio: adc: at91_adc: switch to device_get_match_data()
  iio: adc: at91_adc: convert to device_property_*() APIs
  iio: adc: at91_adc: use local struct device pointer in probe
  iio: adc: at91_adc: pass struct device to at91_ts_register()
  iio: adc: at91_adc: use HZ_PER_KHZ instead of raw 1000
  iio: adc: at91_adc: convert to device-managed resources

 drivers/iio/adc/at91_adc.c | 266 +++++++++++--------------------------
 1 file changed, 77 insertions(+), 189 deletions(-)

-- 
2.56.0


