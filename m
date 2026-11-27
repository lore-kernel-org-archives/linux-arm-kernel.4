Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6D1606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y9tc36mN;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=J0vOJ2rG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wRkg1D7v1brwh6BLcrTMSeTk04sUpCGspFqgyNeqWI8=; b=Y9tc36mNSiT8O61Mf0AqntY6JD
	dO+2dOfqoVqwIjPs0V2s8Z6rPTJ65SP22L/froIwfvta+C+kXx7Tv3DR2T2MQGojYJuT3Y/4vJDqp
	y2VNpZ68EaWKg74Kj56Hai+PLkAYKFNAnY2+vKX4VP0oKyjR1+qaoGjSQRO6ZoGgmARPeQz7i01fk
	+u4DAVHdjDC8Xb/rSWqJn1+vdZdDgdNLFUJwE3GPIDoGwIbSVevfXkP5Z1h8zKaETTR39h+a4Ohc0
	f5BVkMMtHMcqXMgrr2/e8T2fnCP4mwfTMOONyoTO+toDGcSYFDHhqAq8avLl/EesNZs0hr0MUs9Wy
	BDIjZfDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtO9-0000000Fddx-0s0c;
	Fri, 27 Nov 2026 10:41:09 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtNx-0000000FdUq-2cP1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:40:59 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so68118345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 02:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795776055; x=1796380855; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wRkg1D7v1brwh6BLcrTMSeTk04sUpCGspFqgyNeqWI8=;
        b=J0vOJ2rGqAc4/tnRDzJhnexeKV1Voy8IFAkkCyqWi/1Oh6TvT7tYw/wRSyyyeQ4qE7
         X7x+ZbH1J+lQ7VAmj0DHyH5Lc25Ir7B1I0jPfIra5PRhwoX/5dmOf6DbLYR0KKulQm1i
         PGJPPF5v+GyiCAPa/XW8fZfkuiJo6tXMtbUSkeGwji+YxlEiRO6x4dbTzH4d2uDNPDak
         R8O1ifCaZkQkNULau2/UwDbwdPw22sHzUwuPxmuecYBj3/8MBsBT645xbA62PW4fWikX
         hr4Z8hzRO7brQu7wUoc8NaeMzv7BMF6pSrQBVMUhPTaweoETLqxF80yUO8b1vzFlTPgN
         WE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776055; x=1796380855;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wRkg1D7v1brwh6BLcrTMSeTk04sUpCGspFqgyNeqWI8=;
        b=RCS2tPORO5tsK1kztoy6I4gePhtlgVduD4e+LFNlmLSOqQ9k1OhRA33PX+IpIVcFVM
         zUiTZP9nOnu7zT64kYvGyw1BKvArRafUv029Y8iyQG8PiibiiaK5RjGQAC3/ZWqeWTd6
         ofJ0DIVP20C0MMhSQGlC1mEeV4VfJ8cOdFtOqP9sBqG/ufFe3Q7+Txb/gLXXNWWzt3w4
         nRMD6/2+m5qQP8LLSj4cDK3bBkFLES0XgqlRVZJ5KEETrTiremM6R4uhz3dJDGvCuYGk
         AeNXJ/qCKj99EflGpVPxOlVBn1Bv8CnQLRGKESFXXj/D8vIISkOPppc2nqmlderZEnRd
         jjHg==
X-Forwarded-Encrypted: i=1; AL+hErFnFhDD62BKZoeyrfyLL5BL8t+pHat8B5MtMD+19gOaJZZX7keHGf68FgjXEAIOlfLLNpJZ7Jm3REcjnH02V/3C@lists.infradead.org
X-Gm-Message-State: APuU4Z926BL5YlESyiTcqYmI/Dm0B/iRu1Lxezfs3XJRBv1LsUp1JTJ1
	MwYH2Q03Di//GDlVKrJtLpRSJJFIL7B9oFPF9WFRtN3LVQYaZT8rIjX7/YLkh8VFgYQ=
X-Gm-Gg: AZFdTZdDW4VcQeAnmQYm7tpPWhRQdjc1RF8hHI4GTPPflBA77j+gtznXb/K3SQQkzkI
	O6Mld33MVWCTIOLC5X/hj3FENTDtj+hu+Un4vQt6dIW+wdLu0NR0ptjxeYZ8u0qSGpXmpI1IBq3
	2l7R4LGr246DUtgIt2Yf2xN6PZkkNIN9+nrBNQ08gIjwFCBOdDSlhIekhYE8hH8Ja2MJBjxYjj3
	AEeHIBd0r5QLMsT5hjUnllS9l44d1JDMik96wM/Il7tjMr6Vj38/tGms0/9Y1Pjh9Z4PccS6d4X
	GCMtAAYmmG4xu4ckUtDJd9TXAwYQO3/E1TbSs8gmlz+bhD5ZdPEG+6I4LJeGEHNQbJDED3ASVaz
	0brzRDwxfmqvPxMp6m3xghtHlL8pvGdKHc4hjgf2YEEIoHXzrwYTbydCdNshvjhMuQPBE7b6wHz
	mLC/Sex0FIb8DIpzoVB/DSw/lhhSYjvr4z213gjkO5O2mqAHb3zrYLZrY7cxT9ytL5ozukforNm
	s/KlIh90fDr1SoMC7Yj9q/g90Zh5g/EeEesjjI4pCkiSq6aUx75icDMOUVJKFyBLR+s5NweiXPB
	LmAYdPnHutkVTFSLAs1US+bRXuwC2AzajRRYROaY+V5ccpXWkJWjwGrxeZ9GKINisJesIhz0OS+
	qZS+ZdXQT
X-Received: by 2002:a05:600c:530e:b0:4ba:eb:eb9b with SMTP id 5b1f17b1804b1-4bb8880aba2mr474922345e9.8.1795776055138;
        Fri, 27 Nov 2026 02:40:55 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm45597649f8f.32.2026.11.27.02.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:40:54 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v2 0/6] usb: typec: fusb302: Make full PD 3.0 work on the
 2.0-only FUSB302
Date: Fri, 27 Nov 2026 14:40:45 +0400
Message-Id: <20261127-fusb302-getsourcecap-v2-0-6770eb1e7945@flipper.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WPy26DMBBFfwV5XVd+AHZY5T+qLDzjcXCVALEBt
 Yry7zVBfey6Gl1p7uPcWaYUKbOuurNEa8xxHIpQLxXD3g1n4tEXzZRQrZRC8bBk0OWeac7jkpD
 QTVxI1NYjgtKCFeuUKMSPZ+zbadd5gXfCecvaPvqY5zF9PntXuf39U7FKLrlqoYFArgYFx3CJ0
 0TpdaCZnR57S6LbUhjmvfoXoRDt6Zr3W7qUHB1ciON4vfK6DYqMoRql7cqav/DfTtn+7IrpxhM
 5zymlMXHrNLqGwoEAu1VtbnB5j45zV2nvLZqDcAaMUMaB901rSbceGrIqBEfOoDEF4vEFRhagz
 JABAAA=
X-Change-ID: 20261102-fusb302-getsourcecap-01c38dccb230
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Yueyao Zhu <yueyao@google.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5860; i=alchark@flipper.net;
 h=from:subject:message-id; bh=h+EGZKpp9eX6rEcjqbpyOrZBNDQRM7p40IXhJq9S+Co=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRzxpnZRDF+FFvcsye3+dqvFWKu5n4OixcGHnNZGvoyJ
 sHYy3x7x0QWBjEuBksxRZa535bYTjXim7XLw+MrzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFPd+ZThf0L64q3Tt568vq9BZ+W2DxOK7pjUffsmnzbz6bEL/kud/8gxMrxdvjz
 vF+vn+v4FN58Er/g23axd2HLH6V2b6kN2ra48MYcLAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_024057_708640_C21CFFB9 
X-CRM114-Status: GOOD (  22.18  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The FUSB302 implements PD 2.0, whose Message Type field is four bits wide,
so it decodes the PD 3.0 Get_Source_Cap_Extended (0x11) as a GoodCRC (0x1)
and never acknowledges it. v1 dropped the message, which keeps TCPM in
step with the partner, but leaves partners such as an Apple Studio Display
soft resetting over and over. This version acknowledges it from the driver
instead, resulting in a proper PD 3.0 contract with no resets even with
strict partners.

Patches 1-3 keep the RX FIFO in step, which the rest relies on. Patch 1
resyncs the RX FIFO by CRC after a flush cuts a packet short, patch 2
drains the FIFO on each interrupt, reading only while CC is idle, and
patch 3 reads the FIFO out rather than flush it as PD RX goes on. They
fix behaviour as old as the driver, which also causes resets on attach
with no Get_Source_Cap_Extended involved, so they carry Fixes: and
Cc: stable. Each builds on the one before, so they go to stable together
and in this order.

Patch 4 handles interrupts in the IRQ thread rather than a work item, as
suggested in review of the switch to a threaded handler [4]. This has a
nice side effect of slightly reducing the latency, as it cuts out a
context switch and makes the actual IRQ handling code run at realtime
priority rather than in a normal kworker thread (which sometimes queued
behind other tasks in my testing, causing missed protocol timings).

Patches 5 and 6 are new functionality for PD 3.0 partners. Patch 5 sends
the GoodCRC from the driver, 2.2-2.8ms after the interrupt over a 400kHz
I2C bus. That is too late for strict partners (such as an iPhone 17 Pro
as the source), but still often produces a PD 3.0 contract, because the
partners retry unacknowledged messages three times, and the software ack
sent for the first one lands in the window of one of the retries. Patch 6
is a pile of black magic to make it work reliably in protocol specified
timings, as long as the I2C bus runs at 400kHz or more. It reads the
status and the head of the RX FIFO in one transfer and keeps the GoodCRC
pre-staged in the TX FIFO, all but the TXON. The GoodCRC then goes out
0.4-0.9ms after the interrupt, and gives 100% success rate in PD 3.0
negotiation with the iPhone in my testing, with no resets at all.

Patch 2 was sent on its own before [1] and is folded in here, as the
rest builds on it. The issue Sashiko raised there, an unacknowledged
Get_Source_Cap_Extended reaching TCPM only ahead of the Soft_Reset that
follows it, goes away with patch 5, which reads and answers the message
as it arrives.

The series applies on top of [2] and [3] (also recorded in b4 metadata).

The verbose code comments are there to keep Sashiko from suggesting,
over and over, things that are not true of this chip or the broader setup.
Happy to trim them down if required. Note that I ran the local Sashiko
over Claude Sonnet 5.5 CLI, so it probably raised slightly different
issues than the upstream Sashiko would have (it runs over Gemini 4).

Tested on the FUSB302B ports of two Flipper One boards (RK3576), one
sending Get_Source_Cap_Extended, Ping floods and other messages to the
other at either power role, with RX FIFO flushes forced mid-packet, PD
RX turned on late, and suspend to RAM with interrupts arriving through
it, and against an iPhone 17 Pro, which is the strictest PD 3.0 partner
I have seen so far.

[1] https://lore.kernel.org/r/20261102-fusb302-drain-rxfifo-v1-1-bd9b232ab345@flipper.net
[2] https://lore.kernel.org/r/20261103-husb311-cable-comm-v1-0-6217dabc1a85@flipper.net
[3] https://lore.kernel.org/r/20261123-fusb302-irq-read-error-v2-1-5539a09127d8@flipper.net
[4] https://lore.kernel.org/r/20260312120418.99U0NPWL@linutronix.de

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v2:
- Acknowledge Get_Source_Cap_Extended from the driver instead of
  dropping it, so the partner sees it delivered (dropped Heikki's Ack,
  as the patch is new), and in time for the partner to accept it (new
  patches 4 and 6)
- Fold in "Drain the RX FIFO on each PD interrupt" [1], now reading only
  while CC is idle (dropped Sebastian's Reviewed-by, as the code changed)
- New patches 1 and 3 to keep the RX FIFO in step, which the rest
  relies on
- Added Fixes: and Cc: stable to patches 1-3
- Rebased onto next-20261124, on top of [2] and [3]
- Link to v1: https://patch.msgid.link/20261102-fusb302-getsourcecap-v1-1-26b5bfea4b2b@flipper.net

---
Alexey Charkov (6):
      usb: typec: fusb302: Find the next message when the RX FIFO is out of step
      usb: typec: fusb302: Drain the RX FIFO on each PD interrupt
      usb: typec: fusb302: Read out the RX FIFO rather than flush it as PD RX goes on
      usb: typec: fusb302: Handle interrupts in the IRQ thread
      usb: typec: fusb302: Acknowledge Get_Source_Cap_Extended from the driver
      usb: typec: fusb302: Acknowledge Get_Source_Cap_Extended in time

 drivers/usb/typec/tcpm/Kconfig   |    1 +
 drivers/usb/typec/tcpm/fusb302.c | 1036 +++++++++++++++++++++++++++++++++++---
 2 files changed, 955 insertions(+), 82 deletions(-)
---
base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
change-id: 20261102-fusb302-getsourcecap-01c38dccb230
prerequisite-change-id: 20261103-husb311-cable-comm-46f2e77e4c18:v1
prerequisite-patch-id: 2ea442b68dfeee84c38efb27749d2f40487d2fff
prerequisite-patch-id: 00acfb9e5b26f7f594c64b6ec87fbc5badcb59ca
prerequisite-patch-id: 398e6c15de4f0c6fe4751176bc4ffe0fd1a4e58f
prerequisite-patch-id: 134a18c9c2e06dc019aba39387bff53c94dc415b
prerequisite-patch-id: b2e7a13203fd30a8c71b71a4856e7cee7a1bef19
prerequisite-change-id: 20261116-fusb302-irq-read-error-8a3ca5ef9ebc:v2
prerequisite-patch-id: b484440b7ee2dc68c6e5561a71804b5de607f178

Best regards,
--  
Alexey Charkov <alchark@flipper.net>


