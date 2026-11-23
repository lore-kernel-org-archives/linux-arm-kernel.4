Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26467606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 06:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cejSEuz7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B/n32vMV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RsghqF/m5W3+Sk6FDMeWBFDKibQsse7a2Bj9+KgEx1c=; b=cejSEuz78hbTyfPTREuIbr/lhv
	x9aaRox6To93AKBuXMzQy/l1q5B0mUUFN0UxNqNJOaIeykL34TkFEFgt5UM9fK14Eakj2sMXMvn7s
	V5/hzLDeq+PDloT40mre2GBCKcxXnKpEWPAKEAzgGSMDxvK9oWyJT/sYRRYjt6pCFb+UTGzLTtz9m
	XSlKPQ+M//dTcgOJbLEfJ+/++BTHHuC4M9LR1KPfazw8xeqtGOWkxK6kqH8X3S8ohHITIp/eBnRFs
	t2PdvfvUmXCC6ocpFoZehTd0Xu9UOrxdKDUu6ObxAaHASaJ2GO/18dIzotZr4ZWSpOi3QIfTUq8Uw
	tP0kr65g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVNuN-00000002Onq-0jQB;
	Mon, 23 Nov 2026 06:52:16 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVNtA-00000002OfJ-2FEK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 06:51:00 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3b4a93d0814so136377a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 22:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795416654; x=1796021454; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RsghqF/m5W3+Sk6FDMeWBFDKibQsse7a2Bj9+KgEx1c=;
        b=B/n32vMVEaq+/fhz90FyE6oJ2U2MMXD0dium/7QVhGpQuMcjKdEI1Ms5QwMkbNEoF9
         Df48OFnxFdNug9eOc/XSYqdo6MY4KyNkkFNpmiOh4BDJ4yns5CUVPSwfaEVAZ7pktCZZ
         s5m2rlw0xd2/nCC115sqEE+ADJyWEH555qlHSlE6iH306KwWisE03pq+MOZZBUxa71RK
         Nx6b5Dwf+A+o9Ddabb1+UkqKIvcDyxsfOrMQ1ROfu1wkU5DAWGRMdaJBQOzOVBF8f6cK
         DRA58GSRmnWFnIxphQM78j68fo3MHDwOsTt3CuCawvGcuCUaJ2RQBZ0WvyBolpyOWYuD
         xHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795416654; x=1796021454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RsghqF/m5W3+Sk6FDMeWBFDKibQsse7a2Bj9+KgEx1c=;
        b=CU1T67SA4EAyeJ7DImY3CuJbhX/+vxCS91lJppchm31U1kIb6CKekZq/2qoHN2ALkH
         JNFl5CnjVM4FHbJNrey5GAEpLXU/nopqRbdBpYRbtRZh3b/hHz8KWL24ZCvm+Cqiv3t+
         lOob5wtX4VuRo8aWTNDv3vAZIjeDB/FFnlnn3MGK1VTMe8JYJmVJrONS9lO/91ZwBp8w
         lveSUZ7ZaId2sdnkLprhwZk/W7iko+ctyIfa3W8Pj4aM4cDUf35ShDDbrMeLg0w5QSmN
         V7Z9VJMdB3vRsWQ3orQ1M9JfK6nGbOPvpUKqRHRCmf5ar5BrEp8bEtNCZ0UYFekt08JT
         F3jA==
X-Gm-Message-State: APuU4Z/skeDqjxk9Kxtl/56zRIUq8Bz21fO5jLAApggmJZtmenKczgW0
	c/8IDlfShga0oaIIkYO6I2XrBRpyWOZ5wjojEvXonkDkJG2TS8yaA5DV
X-Gm-Gg: AZFdTZfHxEGQjwYa3NkuQ7gazDXD2gVwq3T9mLphtIkFOcRG6i4VQs3uEPX78Wtra1S
	9F3AJwzaZ15qJPE9azkuvPAgyQEjIDbCjD0NGFY/F8dHIhj/5TIG7KoZ1jkLEf744jxp7H5BpeV
	+MtdwjnkAv9zOqg7GUBgJGm4vhwUlQ6Hr7+85fjVsrWJKrGZml+BoDLNcXA6JJjnDyz6SWv6gaR
	AhIsJZIY0SW1XPkpNvgP/wKzvxJoOoG7yoX0I6OUpCbIBIGD4YdkcIpWqyzDUwHU8GlCh3zyASw
	5/Lf44APIHg+jVGx+UqQbsiqkFcqnRdXL0ucSQFWfuhjeYc1SBlmJmXqRcUSBQmqhACzJswcM2I
	+k2dHlm0L/hVeivPU8I/5QtMkTUJtBLj6IRkPH51R+OM5NQ4Z/xgndXJCUvvYO2wz86YjrxIWME
	33QsfMGVF7VASxaMTCooKarb1d6pqk8prNZZ+Igk0DVQPCeSM8FUqcCtdNUwn4+B9I4d1gtiN4o
	lIB8UU4vd+i2BfKsr5r0OKWm/01ysQ7VUsk1PM9Q6oikd260Kcgs2sRfXfEHt0lNfQTrWSZ8//5
	S4kYE3WU3Vyex/1Vs84uuDJ1J6sa5T9/65iy7CJhhvscncSZ1xKCi6XDkUayFiIk5ZD88eL1QOJ
	dCRyBC019gTmjjNM=
X-Received: by 2002:a17:90b:55d0:b0:3b0:92be:ea4a with SMTP id 98e67ed59e1d1-3b41c9830demr9484321a91.45.1795416654083;
        Sun, 22 Nov 2026 22:50:54 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm5224811a91.9.2026.11.22.22.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:50:53 -0800 (PST)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v7 0/2] pwm: Add Nuvoton MA35D1 PWM controller support
Date: Mon, 23 Nov 2026 14:50:04 +0800
Message-Id: <20261123065006.28768-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_225056_614156_BB1C5753 
X-CRM114-Status: GOOD (  23.44  )
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

This series adds the device tree binding and PWM framework driver for the
Nuvoton MA35D1 EPWM controller.

The MA35D1 EPWM controller provides 6 PWM channels. The hardware supports
up, down and up-down counter types, auto-reload and one-shot modes, and
independent and complementary output modes.

The initial driver supports independent output mode only and configures a
channel for up-counting and auto-reload operation when an explicit .apply()
request is made. The waveform generator drives the output high at the zero
point and low at the compare-up point.

In up-counting mode, the counter counts from 0 to PERIOD inclusive. With
the selected waveform actions, CMPDAT = 0 generates a 0% duty cycle and
CMPDAT > PERIOD generates a 100% duty cycle. The driver keeps PERIOD one
count below the 16-bit field maximum so that CMPDAT can be programmed
greater than PERIOD for the full-duty case.

PERIOD and CMPDAT use the hardware period-loading buffers. Since the two
registers are written separately, if a period boundary occurs between the
writes, one transitional cycle can use the new PERIOD value with the
previous CMPDAT value. The following period then uses both new values.

The driver selects period loading mode by clearing IMMLDENn, WINLDENn and
CTRLDn. When a PWM is disabled, POENn and CNTENn are cleared. Clearing
POENn disables the output driver and puts the output pin into high
impedance.

The driver does not modify the PWM controller during probe. This preserves
PWM outputs that may have been configured and enabled by firmware, such as
a display backlight. The counter and waveform configuration is changed
only for the channel passed to .apply().

Since the independent/complementary mode selection is shared by each pair
of channels, the driver refuses to change an active complementary pair to
independent mode when the paired channel is active.

Changes in v7:
- Rename register macros to match the EPWM register names in the
  reference manual.
- Rename bitfield macros to use the corresponding register name
  as a prefix.
- Rename CNTTYPE and related CTL1 field macros to match the reference
  manual naming.
- Keep short register update calls on a single line.
- No functional changes.

Changes in v6:
- Document that clearing POENn disables the output driver and puts the
  output pin into high impedance.
- Document that a period boundary between the PERIOD and CMPDAT writes can
  result in one transitional cycle using the new period with the previous
  duty cycle.
- No functional changes.

Changes in v5:
- Remove the probe-time controller initialization to preserve PWM outputs
  configured by firmware.
- Configure the counter and waveform settings only for the channel passed to
  .apply().
- Keep the disable path limited to clearing POENn and CNTENn.
- Check for an active paired channel before changing a complementary pair to
  independent mode.
- Return -EBUSY when changing the shared output mode would disturb an active
  paired channel.
- Document that the initial driver supports independent output mode only.
- Remove the unnecessary <linux/mod_devicetable.h> include.
- Simplify the WGCTL action field handling and remove the associated static
  inline mask helpers.
- Rename the PWM field and period limits to clarify their different
  semantics.
- Configure period loading mode explicitly in .apply().
- Preserve the pair-shared clock prescaler and account for it in period and
  duty-cycle calculations.
- Limit the period to 0xffff counter cycles while reserving CMPDAT = 0xffff
  for the full-duty case.

Changes in v4:
- Add a Limitations section to describe the hardware capabilities and driver
  limitations.
- Add a link to the MA35D1 reference manual.
- Replace register address macros containing the base pointer with register
  offset macros.
- Add readl/writel/rmw helper functions.
- Rename TOTAL_CHANNELS to NUM_CHANNELS.
- Use unsigned long for the cached clock rate.
- Use devm_clk_rate_exclusive_get().
- Configure polarity before enabling the counter and output.
- Add controller initialization for up-counting, auto-reload and independent
  output mode.
- Configure the waveform generator for zero-point-high and compare-up-low
  output.
- Fix the period conversion because the hardware period is PERIOD + 1 cycles.
- Limit the maximum PERIOD value to 0xfffe so that CMPDAT = 0xffff can be used
  to generate 100% duty cycle.
- Use CNTEN and POEN bits to report the enabled state in .get_state().
- Disable the PWM by clearing POENn and CNTENn.
- Fix error message capitalization and trailing newlines.
- Fix coding style issues reported by review/checkpatch-style tools.

Changes in v3:
- Update nuvoton,ma35d1-pwm.yaml:
  - Add maintainers entry.
  - Increase "#pwm-cells" to 3.
- Update the MA35D1 PWM driver:
  - Organize include headers and macro definitions.
  - Rename REG_PWM_XXXX macros to MA35D1_REG_PWM_XXXX.
  - Add register address macros.

v2 resend:
- Remove incorrect Reviewed-by tags.

Changes in v2:
- Update nuvoton,ma35d1-pwm.yaml:
  - Fix maxItems of reg to 1.
  - Remove unused label.
- Update the MA35D1 PWM driver:
  - Remove MODULE_ALIAS().
  - Add chip->atomic = true.

Chi-Wen Weng (2):
  dt-bindings: pwm: Add Nuvoton MA35D1 PWM controller
  pwm: Add Nuvoton MA35D1 PWM controller support

 .../bindings/pwm/nuvoton,ma35d1-pwm.yaml      |  45 +++
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-ma35d1.c                      | 382 ++++++++++++++++++
 4 files changed, 438 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-ma35d1.c

-- 
2.25.1


