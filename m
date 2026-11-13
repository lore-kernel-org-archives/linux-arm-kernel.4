Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3982B606A889
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RlQsIHSC;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ip/KpXFt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=20q7fyL44IefQuhPWlx1GZf/JmbaLKjuNxOAz7TK1Bo=; b=RlQsIHSCyUE+H938+75EL2eJsE
	Lj4F/qKwNw+cUWpIOA1gAsG66eVd3rKNt7m8rtuBs0gdA2QdMHq40femGQybf+Czv20gFhImmTOUC
	p54WHTUAGvffc5/L9Z3SQyL7zYGzIEz4Oh349qmO7F/tQMozIn5x7Yn3EnE7AhPSpYxk9rqj9NHxm
	Y6K14epXphx1JzFKrslE8ckKkmB74YDm9jjTi6Kd3OUvBxOoasabTNPachIHg5pIpFYeE3YLceosz
	OAoDJWqwY5L2HKrabZqZ3eKk5iqIALBorDptAWFwPihsVV7n92/YTrEYctaLYmiMd/aAHqCJM5nY5
	g5XqpIlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrHJ-0000000CvUk-3XCc;
	Fri, 13 Nov 2026 13:25:17 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrGv-0000000CvHR-1bk7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:24:57 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c45551fa84eso253008866b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 05:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576291; x=1795181091; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=20q7fyL44IefQuhPWlx1GZf/JmbaLKjuNxOAz7TK1Bo=;
        b=Ip/KpXFtYL50PPk+thw8tRZwbusDYl4vqOZCkT92G9gqpyJvE0WIsfrWa3+E7wbQlH
         WF7VJGi41OCymULZSNAUQkxkdEy0CsCwEfva+ffzMwxnOimI5BzjM9kOqd4/Xgr936Yh
         s8qPccQ+oXXiGTx3uYbnL5VDRSH8BVic6+qqboqr+V2MhG3wD4f/N/Q9sZb91KoIdU96
         LssUTmPeVkpsjObNNsJuhBO6x7DIa68AB01sRwtA/xbtpI1GNPTVJlv52iKBD24S9JMy
         eDDfISwBoCZoNeqsxZ0nU1re9vG+slijh2W/FF2PrJVNrZIdcNdNwQD+bKyAdJMBH9mO
         VfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576291; x=1795181091;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=20q7fyL44IefQuhPWlx1GZf/JmbaLKjuNxOAz7TK1Bo=;
        b=AubZPwtOkWBGkz9CGMwFE6cc94vztKIOVnw3cFmPDYBIZ4bKnLMA5jU3Ch8USBCGFm
         EZHb03hYDRXnhj/DNTZuVUmrAiLbCQhTBMn6rbRPMOxOVnYP9W4RaDL3+zqkcU5VqIGz
         P7nFQTdHwokAIRjuwyzyDwwqrKu6WRhOOecQV4gSXQ3VJ/by4HrJFXlbpgGmpYvx59C8
         NHiVPzHpV7THArN7Oe+i2sEqPxgp5ZWu5N5+dvQXkql5UQsRrrO/RC+ntl5agHPZE8Uq
         ksLQ/sK358+2f/P1LdGoG79czDACgcaLEXQZtGCdbAnu89/lkxnTdaRnry0yWPuyq7fL
         Fo7w==
X-Gm-Message-State: APuU4Z9wtvTjSpngVboSG0kwxcADWA5EKsub/QtEHA+Xa1NWV4sdQ3lb
	pHwDG5LbYSTixF09gbgTfAg/aulUGSXUKL4xV2ufMEwPXgTpksKerJIa57z0F7tBoNgtUw==
X-Gm-Gg: AYBFou1OmFxAWiWPwvZECWduMu6DncjGQ7G98dmIsnhft0ylbxie2g+HBAEKzDeUhK6
	i4MmLFePrhNzQwr2SkLUbZmkV3s+5CqD0Aj31zAjnAsIQWZQlRRS+RTwzKSTBfatb5CRrSpSCcp
	GzTg2bB5rjNdEO867DmxLzNOdbhlh8HAMS8pm1nq8QfzjU95AAGAk38H8At67MHFBWGOsWtxiUv
	jXVc/mPKg4/wOK6fXx4Xmec+JWyGoGZCtlBS6wVDiFTAKBCRDDy1CALnwKpYjQQqs0fDD7CM+bR
	P78jDk6SOp5ajb0BQ/rVg1IY9qs4hw6ihntfGl9xsAKKUj5lxPzuYZTRYMdDxGu4qPbsXxrP3NZ
	RLKMfGcwqBbBOUB2JNctjHbx/fqZCPkjkYG+/qpNr72FTVts8ZBM046mNxV1kc5R2M6VIIxeVXG
	BhOmoCt1oMnxkcY2mOpg2X+9U20P4TokewzlCVL2u4q3LE7lA5M1I8/n7zuSAZm3m0J8ms+g2Oo
	cJIIgc/6Eg8sdL63QnsarDK88dc6uqEy8xPhRZKiZbehtFUWaXs94KaAgHMRNm12VnC+gW0BM6t
	ExX8+s1sWeYkMmOSBchTOtspWphj2YPxRY+40eCf3gBu/4faYPMhhVZGQzPagI5JXXGi8W3SsIc
	CqPr0fuA=
X-Received: by 2002:a17:907:72c8:b0:c2d:c98f:4824 with SMTP id a640c23a62f3a-c509640e213mr207866666b.30.1794576291197;
        Fri, 13 Nov 2026 05:24:51 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm4680211f8f.57.2026.11.13.05.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:24:50 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v7 0/4] clocksource/drivers/timer-vt8500: clean up and add
 watchdog function
Date: Fri, 13 Nov 2026 17:24:39 +0400
Message-Id: <20261113-vt8500-timer-updates-v7-0-a1dcc4031b12@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43QwWrDMAwG4FcpPs9DUmy522nvMXpwYrk1LE2Js
 9BR8u5zCoWQLdDjL9D3I91Ulj5JVu+7m+plTDl15xLcy041J38+ik6hZEVAFiywHoe9BdBDaqX
 X35fgB8naGA+BqAmOQJXVSy8xXe/s56HkU8pD1//cW0acpw/Q/Q+OqEFz7Ti6WBnw/HFsffp6b
 bpWzeBIzyA0I1ZswBr21soaqRYI2g2kKgjhm/MFYarDGjELhHADMTMSTAXskb2YNWKfQWxBnJg
 6IIbo6M85/EAYEWkD4YLEgI14NuUxcYlM0/QLYQlwPxECAAA=
X-Change-ID: 20250506-vt8500-timer-updates-44a0d22cd720
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5147; i=alchark@gmail.com;
 h=from:subject:message-id; bh=3vAzwPDkYxTNwi1y600ys71JIPozJFxUEKDzhpDEevY=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR951/gm5FW4ql5f+uZDRHicla7csud7AXEX+1MMN0w8
 ZlwwYLajoksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKb6XTgjw/ELNnuFw3d4sX+siLK0nWdl6lOyc/2n486z8s7mhOrW+zMyTJoa+em
 67ec5S36t888P91ylOvWsxpXfSUrrjuye7HRFnhcA
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_052455_403491_D262BBFF 
X-CRM114-Status: GOOD (  24.11  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add named defines for the registers and bits in timer-vt8500.
Move the system events timer from channel 0 to channel 1 when enough
information is provided by the device tree (i.e. more than one IRQ).
Use channel 0 for the system watchdog, and let the watchdog restart the
SoC, which the machine's own restart hook fails to do on WM8950.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v7:
- Rebased onto next-20261112
- Register the restart handler at priority 0, the last resort, so that
  it runs after the machine's own restart hook regardless of
  registration order (thanks Guenter)
- Wait for the reset to assert after arming the watchdog in the restart
  handler, rather than return and let later handlers run (thanks Guenter)
- Link to v6: https://patch.msgid.link/20261112-vt8500-timer-updates-v6-0-fd1cea645d1f@gmail.com

Changes in v6:
- Dropped the binding patch, which Rob has applied
- Rebased onto next-20261111
- Moved the shared header under include/clocksource (thanks Daniel)
- Pass the watchdog a single register base, and keep the watchdog
  register offsets in its own driver (thanks Daniel)
- Build the watchdog driver in rather than as a module: the timer it
  depends on is always built in, and the driver is tiny (thanks Daniel)
- kfree the correct structure upon aux child release (thanks Daniel)
- Return -ENODEV rather than -ENOMEM if the timer failed to initialize,
  and drop the message on allocation failure (thanks Daniel)
- Unmap the timer registers if its interrupt is missing, so that no
  watchdog gets created on a timer that never started
- Improved code comments and commit messages (thanks Daniel)
- Give the watchdog a default timeout, so that opening the device
  before setting one no longer arms it for the next counter wraparound
- Wait for a pending match register write to settle before rewriting it,
  as the clock event code does
- Honour the nowayout parameter, and disallow unbinding the watchdog,
  which would leave it armed with nothing to ping it
- Added a restart handler, so that reboot works on WM8950
- Link to v5: https://lore.kernel.org/r/20250521-vt8500-timer-updates-v5-0-7e4bd11df72e@gmail.com

Changes in v5:
- Make sure the watchdog timeout value is clamped to hardware limits
  before writing it to the registers (thanks Guenter)
- Add a comment about the watchdog match value (deadline) wrapping around
  the U32_MAX boundary, which is expected behavior (thanks Guenter)
- Avoid moving register definitions to the shared header file to reduce
  churn: the watchdog driver gets direct pointers to the two registers it
  uses anyway, so it doesn't have to know all those offsets and bits
- Put the watchdog Kconfig entry with other ARM platforms where it belongs
- Link to v4: https://lore.kernel.org/r/20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com

Changes in v4:
- Changed the watchdog driver to use auxiliary bus instead of platform
  (thanks Guenter)
- Split out the register definitions into a header file shared between
  the clocksource driver and the watchdog driver
- Replaced -1UL with U32_MAX in watchdog max_heartbeat_ms to make builds
  on non-32bit platforms happier
- Link to v3: https://lore.kernel.org/r/20250515-vt8500-timer-updates-v3-0-2197a1b062bd@gmail.com

Changes in v3:
- Dropped the DTS patch already applied by Krzysztof
- Rebased onto v6.15-rc5 as requested by Daniel
- Split out the watchdog code into a dedicated platform driver, like
  timer-gxp does (thanks Daniel)
- Link to v2: https://lore.kernel.org/r/20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com

Changes in v2:
- Included the previously reviewed binding change that is directly related
  to this series as the first patch here (thanks Krzysztof)
- Created a separate config symbol for the watchdog function to let users
  build a kernel without forcing watchdog functionality upon them
  (thanks Krzysztof)
- Link to the previous binding submission: https://lore.kernel.org/all/20250506-via_vt8500_timer_binding-v3-1-88450907503f@gmail.com/

---
Alexey Charkov (4):
      clocksource/drivers/timer-vt8500: Add defines for magic constants
      clocksource/drivers/timer-vt8500: Prepare for watchdog functionality
      watchdog: Add support for VIA/WonderMedia SoC watchdog functionality
      watchdog: vt8500: Add a restart handler

 Documentation/watchdog/watchdog-parameters.rst |   7 +
 MAINTAINERS                                    |   2 +
 drivers/clocksource/Kconfig                    |   1 +
 drivers/clocksource/timer-vt8500.c             | 179 +++++++++++++++++++++----
 drivers/watchdog/Kconfig                       |  12 ++
 drivers/watchdog/Makefile                      |   1 +
 drivers/watchdog/vt8500-wdt.c                  | 150 +++++++++++++++++++++
 include/clocksource/vt8500-timer.h             |  22 +++
 8 files changed, 347 insertions(+), 27 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20250506-vt8500-timer-updates-44a0d22cd720

Best regards,
--  
Alexey Charkov <alchark@gmail.com>


