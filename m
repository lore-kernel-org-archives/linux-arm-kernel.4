Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE636070F51
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 18:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FuCN7SK7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LHspGkHi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Lmv+SXFI0Fqj2caWzKa5TPeKY9FER/v63fJ59fdwvcA=; b=FuCN7SK7p+AQQLR2fSQrWil2WK
	/Qb6cP1Aq/jqWkTaSG1XWvHT8yJE/v/6hlmkmfPnKhif6wdYJ0SF+pDxaOxNXoufVYOB2FGaEknq7
	Alqf3kSLlgJbYYmyNPEv3NYzaCbqQN/QsD/coWNaE42BvwCHIa2agk0iU2hyaN3lv9pdNRWP3JWqu
	9xxdY3Xlq2kfqQQGTDAGU+tiE8xWx+5V3T6I3X4SphgG2arqSEhcW9/9kY4SzFNambq/r06CM0ecz
	xO8vn/lfC1WDKmDhBPSkm6kfSiy2iNrAePx7j6r6hWflZaHuIPr6jkqPBaS9f0+NPyT0Ya8GwNuih
	85IaDDqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZxL-0000000Atli-0mRa;
	Thu, 12 Nov 2026 18:55:33 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZxD-0000000Atiq-0Wq6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 18:55:26 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so797785e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 10:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509721; x=1795114521; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Lmv+SXFI0Fqj2caWzKa5TPeKY9FER/v63fJ59fdwvcA=;
        b=LHspGkHijmxJlo2mXJp9aaspGZ1ij13f5seQ0diSrPsBKms01FRWmRJgg6knLHz1xI
         E4XaCLbMgjxbdwZ3Ccjo4VSPEJhH/kYvvKjIoAGNlT2HT1wxoeTb2zvzBABENNGZln91
         CIiNVlkmhongpI8KO3dy3cH2rsbGtmVcsLXFC6Fpsp8r7MI6mls8ub8RKuV6bDbsYp4D
         0OYl1qAXH/m1lrDzsuZzVTkDU1+a6YzKgFtmQlzL+Svtjgs367fsuDbghCIdRAG9SCdl
         3lUzq0vj3pz1r5UwDazr1A3hhXp80cFVcb+hABc+SpZREnNjgbEyYqL8WazLT0KXjKLm
         mGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509721; x=1795114521;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lmv+SXFI0Fqj2caWzKa5TPeKY9FER/v63fJ59fdwvcA=;
        b=EmhO+Bf3qFqBLCAp44zj+FwZqm3uNeIEIaVS8DBy+Cj44FZQfpniEKdZQLOJzqFNlB
         zFvV9e78k9yAv3WweBmXbuqxsqDJslKLtD6HY6dOv106u4p+lhKQlJw9US1XaIkrmBd9
         KZh9SCd0XsNYxC+lxh3jh1Nf99HN987aQuum1eWhqs58woX43erDg0ldQ82RtwHSLm1e
         P1w8tn2D10zb2DyktV+UjX40kY8ADCCSnPTSpvOaID/c/WdnV5yBJK68YhvXOJw1NT9n
         cQhua7WyH+Zgw1PLTtUh2lXcYwBb8WIKARNhgGQrqkn18+oc6RXHMaE7cMtdZo6SNEhi
         ZmOw==
X-Gm-Message-State: APuU4Z9yr3H+HrgQVJKmNGvBRRaSqidwv9dGPUBWpJ+HQJ5kvipGq7cZ
	YeTi2+KdmgW6PnSC7g5hhMxTvo7Q3DrRxiVAgDzehQ9BYDoENORAHhLF
X-Gm-Gg: AYBFou2nVKFta65z451Mr3mqWCvBbY8qpMZfubFWK+p9A2S3mNLxPM7JM8eVo7RwUuO
	oUf90TgAVyUd0L3bkyn3eSevI9LN3x3IdtAH7lpKuoy9OZ2CyHwTo+935WYhpmyT8phQm0BsPwq
	2upQTA/ErFEOeKU2NX8Z6aAhFr/yfGRO46H0Z6NA2UMYYP9uRgRV9ukJ6LJq6xHTcrfJhjDpBw7
	LHCjP/2M1Abq5nir4m7yWToZ3pN1+vCwyq0RpNd+hNHcyiH8ceCn4qfmQXMw7fI4bn2jtAxwIng
	cIdognBDRYd6FKT/DEfFHyk1RvXDx+ORxH+1VKqbGcBSxvCV9Z62V6nxMYn5O+ofd5YnrjlGVrW
	ApxMIvNhRq12Vb3rlakDh4Y4Rtz6QXgv9gmaH3I2fQaumcp7GUZuN8MFn2Gy3cvrpWiuh6NZwQi
	JBA0n3yW/T8BfrUc+hQWEV/QnqGAiYAyO2Vm5fqZMThgUJetMVA5G3PeEamaoSERVrE+1hCfoht
	UrWA+LfvKcB20j88u+NAE8sXLWlFH4DBSHNk3ZgYwttdyEBCMDSIIWec/Hy4fWJZFE3lvTg03+p
	RBekmzcCDzVZA+mnWTNeXzoYscZy58HUy3Hd6ZJrVhyYDo4FHVSXlsFJtY6BDI0MD+kMci7aha1
	1xDhBnAw=
X-Received: by 2002:a05:600c:5395:b0:4ab:e27d:e241 with SMTP id 5b1f17b1804b1-4bb55a95d09mr2276655e9.15.1794509720587;
        Thu, 12 Nov 2026 10:55:20 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e28d0b2sm71734755e9.7.2026.11.12.10.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:55:19 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v6 0/4] clocksource/drivers/timer-vt8500: clean up and add
 watchdog function
Date: Thu, 12 Nov 2026 22:55:07 +0400
Message-Id: <20261112-vt8500-timer-updates-v6-0-fd1cea645d1f@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43PwWrDMAyA4VcpPs9DViy762nvUXZwIqU1LE2xM
 9NR8u5zCoMurNDjL9AndFVZUpSsdpurSlJijuOphnvZqO4YTgfRkWsrBCQgcLpMWwLQUxwk6a8
 zh0mytjYAI3bsEVRdPSfp4+XG7j9qH2OexvR9u1LMMv0F/f9gMRq0a73rfd9YCO79MIT4+dqNg
 1rAgs8guCAkxKaFLZGskeYOMfQAaSqC5s2HijhseY3YOwTNA8QuCNsGXDAuiF0j9AxCFfFiWza
 Ge49/3pnn+QdMa2BjzAEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4679; i=alchark@gmail.com;
 h=from:subject:message-id; bh=mq9dCgZxRcstSjZiALPf7wdNd0P1Pq/qf9rQUdUH1kI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR94556t32HgVnXyc4S+97MMxUabwX2bD9kxfx7hhnHm
 p8x7ga2HRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy1/B2Gv9Jp/VHhdyMT98yzjHpx1+LNjx+3nThfWxkFGXadaPxxzpThf9g7/vV
 snI3Oi6yOBH/Mz9n2MeC2Jo/ormLhWouSPBlrbgA=
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_105524_616409_43C2B02E 
X-CRM114-Status: GOOD (  22.90  )
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
 drivers/watchdog/vt8500-wdt.c                  | 145 ++++++++++++++++++++
 include/clocksource/vt8500-timer.h             |  22 +++
 8 files changed, 342 insertions(+), 27 deletions(-)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20250506-vt8500-timer-updates-44a0d22cd720

Best regards,
--  
Alexey Charkov <alchark@gmail.com>


