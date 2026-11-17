Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C534606A880
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 08:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=In0IOZuG;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HLStbXKP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6oO12UtU+mARzb/f/lHQkDV3mWLu+MrESDSJBwclKIw=; b=In0IOZuGuIKqNeaKS+HpsWq7QX
	0hFxRl3x0+9skKuwBy9szww90Di12EhAS+VMcR7CURk/shcty8XzVarMl8qCdyyZhKXhzOnD1XmcQ
	f8rVlhjkyHsqvQGmL5jiSs4XmFXK1hJG+ERoCqlDOE1QicghffB6/6uHtTOa/yl1F2QRsapRJ30t2
	bnUxl4aCA8w6YizhY7HjLcRna/9I5GyJnpRMmAQj/E/Rmw4in4Oq2q01+ZjlMrEOIpU2HGD4QtIiV
	kDsP+SRrSTpQBAPKrh8Nt7S1miLwwl7vkfvRu6OuKNqO14XLcj8gYlTwbRYMufUQCy8io/dzn63C8
	A04xptyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEZ0-00000004t8R-2lWQ;
	Tue, 17 Nov 2026 08:29:14 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEYx-00000004t7B-3f70
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 08:29:13 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8c20d68c83fso381640b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 00:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794904150; x=1795508950; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6oO12UtU+mARzb/f/lHQkDV3mWLu+MrESDSJBwclKIw=;
        b=HLStbXKPyZBgX61QbW5DwSup6ovmI9C1CyElqSk2aC9HMams5xDGMhckLIF7JTggX5
         WxZ0Fahtl+1XACFsP+otpipGznVnDKRe3ZmSstGR7ZWh/g1qivpovqsDcHvTjxHkQzU3
         cggb8N8nUwDe+tL9vS91hcS96JJ0Qz7aYYO0pyngtt4e8rgePJFfJnM5iVKZyQ1RIY8U
         v/vFF2iBLPqYOknijY43yAk0UqMRtBmChEKl0oREc3JKR8Z9m/6kSBJrHRfBxoatPbtM
         KIJ9fneaYcWA/GUK7iow+W0dZ8SKUPMJjx2ga0ofPgBoF/04wZQuz72nDLEXbUBMgceu
         SvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904150; x=1795508950;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6oO12UtU+mARzb/f/lHQkDV3mWLu+MrESDSJBwclKIw=;
        b=Hd1StbktppClY1LVQ4YSIR5BugQ0K+kqresjD630uTVxo0fGLcm3yo94VmJ5cTqCoP
         R5wb2DiMaA6DM3MuoZMJp7wDAxJWtuRXmJt1mAwykYiQjfF7ZbBj2ZqF5Rs2hfogIPx0
         AqOkE7+N5IIQWfkRCIHekc/3XKA/AyWQhUJVRkfpgKqU5zsS4v7mprspFhzo5iCTGpSo
         ybdc2pts34VApgv4U1oSdPJxw33lreUlJZ+zCRU312fB+uAzSFr/t+KbzieGXo6I7d9y
         ZOpLkSKRQEMgy7J1wVBOS1KMdLg16QqY6Y1UqneEzMpeZOtN+V3JFa95xSkdGHESFjSo
         ZHxA==
X-Forwarded-Encrypted: i=1; AL+hErH/V8UM7IIjLUiwtV166Xm6QwLFKXhoyV+SBShM5rpleUVh0L7njPjpW353xYGZA0hCpQUMlvQGRDOumcVpr368@lists.infradead.org
X-Gm-Message-State: APuU4Z/2xUoFtVswPJ47VA8avVg5x2iiAHZsQYiDJZQE4LmTNnVlxcQd
	ZFKWNyot+y1zRq10H/I0W8g0DxmAKmCAvDKCVc5v4y8Mufj7vuOVHvRfjhe/gQ==
X-Gm-Gg: AYBFou2vHdjI+eL+NCN5IXowT2heCWCRZS64PrM0dfU5RYfm4QgqaTsYBy4RjZqDTvf
	6y2LqPLZVLbl3cte9/sKHcxaOVsYDBuZHtlt5mfJQ1reYi6Fs+NhRAvaT07fGMuvqvKNF59pHoa
	M5B3s4MLQcl623a84W6NntADoUkmKnIkUv1dEAxlPVluYLGMiCrHmEHWSfz+rhgeYItGIolYrXG
	8R8cIbRxKoSEPRkCVmS1JfT9exdE0ycc0T3eP9H1Oz95KNt2XAhkUxL2BG1fwpP8Z1xtUkHTsuz
	Ps32ZrSF+sRsv2oext7VNzW5Ejv0y4zpsERv3C9TrCdOz/ZlCzxpysTTYXAjtnJrG0FH4pmL5vR
	5Us0qKVQXktLYvlLjK0AeLeuAxtJtdVw40HrcUtAzPi3ypNFECNzOpCQlwiKTQSiRW+AYnQvQZP
	nHUFmsOyg1DpXnBtwS/DBFNGaeJIKgyPvNcu5HzZnNJtSc2bL5KMKvL9ba0QgtpFayBUfOHVjgL
	4QtR/EyiooDXzMZ+8UfSLzgBCmMSzqIQpNbN60+gXbII5M00zoksjZ1fxRpiQsvtdMCeT77g/d2
	BiZUIFptXmN+/bvfwHYahgztYKp1YeriwtzkhAQGGULSRQw2o1fnXb0DrMuE6VwODPOdv0V7v3O
	q83pyilCMrmGXYak=
X-Received: by 2002:a05:6a20:431f:b0:3e2:3de2:5947 with SMTP id adf61e73a8af0-3fd2d7d033cmr1617615637.16.1794904150073;
        Tue, 17 Nov 2026 00:29:10 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18a2191sm5422907a12.21.2026.11.17.00.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:29:09 -0800 (PST)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chernyakin.victor.j@outlook.com,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v5 0/3] iio: adc: Add Nuvoton MA35D1 EADC support
Date: Tue, 17 Nov 2026 16:28:29 +0800
Message-Id: <20261117082832.1551574-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_002911_958015_4C74418B 
X-CRM114-Status: GOOD (  30.22  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

This series adds IIO support for the Enhanced Analog-to-Digital
Converter (EADC) found on Nuvoton MA35D1 SoCs.

The EADC provides eight external analog inputs which may be used as
single-ended inputs or as four fixed differential pairs: 0-4, 1-5,
2-6 and 3-7. The VBAT input is internally connected and needs no
devicetree description. It is not supported by this initial driver.

The initial driver supports direct conversion and triggered buffered
capture using sample module 0. Although the hardware provides multiple
sample modules, this version uses only sample module 0 and therefore
supports one active voltage channel per buffered scan.

The series also fixes the common ADC channel validation to reject
configurations specifying both single-channel and diff-channels. The
corresponding redundant constraints are removed from the MA35D1 binding.

A reset control is required to put the EADC into a known state at
probe and resume, and to recover from power-up failures without
clearing ADCEN while the start-up sequence is still in progress.

The series is based on Linux v7.4-rc1.

Changes in v5:
- Fix the common adc.yaml channel validation by replacing the existing
  anyOf constraint with an explicit reg requirement and a mutual-exclusion
  constraint for single-channel and diff-channels, as suggested by
  Rob Herring.
- Remove redundant channel-level validation constraints from the
  MA35D1 binding.
- Require a reset control in the binding and driver to reset the EADC
  during probe and resume and to recover from power-up failures.
- Clarify that the VBAT input is internally connected and needs no
  devicetree description.
- Do not specify the internal reference voltage in the vref-supply
  description.
- Use folded YAML scalars for prose descriptions.
- Reorganize register definitions so register addresses, fields and
  values are grouped together.
- Describe the individual INTSRC0 sample-module interrupt-enable bits
  explicitly instead of treating them as a single field.
- Add paired ADC interrupt enable and disable helpers and simplify the
  conversion error paths.
- Document the ordering used when aborting a timed-out conversion.
- Correct the comment describing PDREF.
- Remove the trivial differential sign-extension helper.
- Validate the effective scan mask in update_scan_mode() so callback
  buffers and merged masks cannot request multiple voltage channels.
  Commit the selected channel only after validation.
- Wait for PWRM.PWUPRDY after enabling the ADC.
- Use a full module reset to recover from power-up failures instead of
  clearing ADCEN before PWUPRDY is set. Preserve the original error and
  report any reset failure.
- Read DAT0 during timeout recovery to discard an unread result and
  clear stale VALID and OV flags.
- Reset the whole EADC module at the start of hardware initialization
  in both probe and resume, replacing the control-circuit reset and the
  register-by-register clearing of inherited interrupt, compare and
  trigger configuration. This also removes the access to the
  non-existent SCTL8 register.
- Split single-ended and differential channel parsing into separate
  helpers.
- Initialize local channel-tracking bitmaps directly using = { } instead
  of separate bitmap_zero() calls, as suggested by Victor Chernyakin.
- Remove the unnecessary raw variable in the triggered capture path
  and read the conversion result directly into scan.channel.
- Rework suspend and resume hardware handling around scoped mutex
  locking.
- Remove the buffer predisable callback. Every conversion path already
  leaves the ADC interrupt disabled and ADIF0 cleared, and the callback
  could access EADC registers while the clock was gated after a failed
  resume.
- Make repeated suspend handling safe after an unsuccessful resume and
  avoid unbalanced clock disable operations.
- Only call iio_device_suspend_triggering() and
  iio_device_resume_triggering() while the buffer is enabled.
  pollfunc->irq is not initialized until the pollfunc is first attached
  to a trigger, so calling them unconditionally, as v4 did, could pass
  an uninitialized IRQ number to disable_irq() and enable_irq().
- Drop the redundant clk_enabled flag pointed out by Andy Shevchenko;
  the suspended flag already tracks whether the clock is gated.
- Add a comment explaining why the EADC register map is left uncached.
- Describe the readable, writable and precious EADC registers in the
  regmap configuration.
- Apply the requested structure layout, variable scope, formatting and
  control-flow cleanups, including the if/else chain in init_vref().
- Drop the unused linux/io.h and linux/iio/trigger.h includes.
- Require at least one external channel child node.

Changes in v4:
- Use the common ADC diff-channels property to describe differential
  inputs and keep reg as the logical channel index.
- Restrict differential inputs to the four hardware-supported pairs.
- Restrict channel child nodes to the ADC properties supported by the
  MA35D1 EADC.
- Prevent single-channel and diff-channels from being specified
  together.
- Document that each single-ended input and differential input pair
  may be described only once.
- Remove interrupt-names and simplify the interrupt descriptions.
- Update the binding example to demonstrate separation of the logical
  channel index from the physical ADC inputs.
- Update channel parsing to match the revised binding semantics.
- Store physical ADC inputs in the IIO channel/channel2 fields and use
  address for the logical DT channel index.
- Reject duplicate physical single-ended inputs and differential input
  pairs.
- Use the physical positive input when programming the sample-module
  channel selection and the logical index for firmware-node channel
  translation.
- Use interrupt index 0 instead of looking up ADINT0 by name.
- Add the standard one-hot scan-mask validation callback.
- Use iio_for_each_active_channel() when selecting the buffered
  channel.
- Use a fixed scan structure for the single-channel buffered layout.
- Limit conversion results to the 12-bit ADC data width.
- Always report -ETIMEDOUT when a conversion times out.
- Make timeout recovery best effort so interrupt disable, control reset,
  IRQ synchronization and stale status cleanup are all attempted even
  if an earlier recovery step fails.
- Use devm_regulator_get_enable_read_voltage() for the optional
  external reference supply.
- Rework clock management to explicitly balance prepare/enable state
  across probe, suspend, resume, error paths and driver teardown.
- Improve suspend and resume error-path handling.
- Remove the redundant explicit REGCACHE_NONE setting.
- Split interrupt status read failures from interrupt-source checks and
  handle failures when clearing the interrupt status.
- Use symbolic definitions for the ADC resolution and differential
  scale width.
- Use cleanup guards for mutex handling in buffered capture and keep
  trigger notification outside the locked section.
- Use more specific error codes for channel capacity, duplicate channel
  definitions and out-of-range physical inputs.
- Apply the requested regmap, control-flow and coding-style cleanups.

Changes in v3:
- Document all four ADINT0 through ADINT3 hardware interrupt outputs
  and add interrupt-names.
- Document ADINT3 as the shared conversion and result-compare interrupt
  output.
- Remove the redundant minItems/maxItems constraints from the fixed
  interrupts items list.
- Rework the channel binding for the fixed differential pairs and use
  single-channel for single-ended inputs.
- Add #io-channel-cells so the EADC can be referenced by DT IIO
  consumers, and define the cell as the logical channel index.
- Add firmware-node channel translation so sparse or reordered channel
  child nodes are mapped by their logical channel index.
- Restrict unsupported generic ADC channel properties including bipolar,
  common-mode-channel, settling-time-us and oversampling-ratio.
- Explicitly configure INTPOS for end-of-conversion interrupt
  generation.
- Explicitly configure the ADINT0 sample-module source and clear unused
  sample-module routing.
- Reset the EADC control circuits during hardware initialization and
  clear inherited ADC interrupt enables, result-compare interrupt
  enables and sample-module trigger sources.
- Add timeout recovery using the EADC control-circuit reset, followed by
  IRQ synchronization and stale status/completion cleanup.
- Use iio_push_to_buffers_with_ts() for triggered buffered capture.
- Avoid mixing cleanup guards with goto paths in the trigger handler.
- Add ARCH_MA35 || COMPILE_TEST and HAS_IOMEM Kconfig dependencies.
- Drop redundant linux/bitops.h and linux/mod_devicetable.h includes.
- Use direct regmap helpers, explicit REGCACHE_NONE and
  regmap_assign_bits() where appropriate.
- Use fixed-width register offsets and kernel time/unit helpers.
- Use size_add() for channel array allocation.
- Request ADINT0 by interrupt name.
- Improve system suspend and resume handling.
- Address review comments from Jonathan Cameron, Rob Herring,
  Andy Shevchenko, Uwe Kleine-König and automated review/testing.

Changes in v2:
- Reworked the driver to use regmap.
- Added optional external reference supply support and IIO scale
  reporting.
- Added optional reset handling.
- Added externally triggered buffered capture.
- Added signed differential conversion handling.
- Added fixed differential-pair validation.
- Added system sleep support.
- Added optional DMA properties to the binding.

Patch 1 fixes the common ADC channel property validation.
Patch 2 adds the MA35D1 EADC devicetree binding.
Patch 3 adds the MA35D1 EADC IIO driver.

Chi-Wen Weng (3):
  dt-bindings: iio: adc: Fix channel property validation
  dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
  iio: adc: Add Nuvoton MA35D1 EADC driver

 .../devicetree/bindings/iio/adc/adc.yaml      |   17 +-
 .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml |  174 +++
 drivers/iio/adc/Kconfig                       |   14 +
 drivers/iio/adc/Makefile                      |    1 +
 drivers/iio/adc/ma35d1_eadc.c                 | 1036 +++++++++++++++++
 5 files changed, 1232 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
 create mode 100644 drivers/iio/adc/ma35d1_eadc.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.25.1


