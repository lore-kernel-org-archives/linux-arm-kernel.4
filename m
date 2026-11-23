Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9743606A337
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 08:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V+PQKsMv;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qoJca/Ag
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vnRwo/ZsMPpWSsncariS2yc/xAKn3Nxe+Kux6J8DtAg=; b=V+PQKsMv5AJ8iAVSixthLoi//g
	DI2y4BKBhAEJjHgRdjHjlsKNK7FeRIf/BFQ48dhGzLtj4+6yLKF/+dNhyFJml5qFcqx9VE/QbElVI
	YDqaWTUgbhqj7b2dWUqkedDYv9Q93tYsWftIxx7zTLqSUVOcmzXEk3HJlP38CJ+8LkIdReZO0CD8t
	5D9NNUFP/JVdGPoVsOHc5q61a85vidiuUC6mLu7nrpAG5V5sZJE+49iU6dLzFlFZi5O3h9T3IqPDl
	i4d2Vs8tYzdWKizaGKFKMybg70JjoP+8aH6SL+GabWmAAuLyq/euyKQFjk11TkfUDtMg7DDrdK66f
	jolRPN/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPpJ-00000002c8l-0o4N;
	Mon, 23 Nov 2026 08:55:05 +0000
Received: from mail-ej2-x08.google.com ([2a00:1450:4864:34::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPol-00000002c0l-2EM8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 08:54:42 +0000
Received: by mail-ej2-x08.google.com with SMTP id a640c23a62f3a-c410cdcab7dso90306466b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 00:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795424068; x=1796028868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vnRwo/ZsMPpWSsncariS2yc/xAKn3Nxe+Kux6J8DtAg=;
        b=qoJca/Ag9vZlkgdKbW2sQN40jABKgrczFKmZlJA8c/a5Lbd3TOfN8H6rWMyHxrW/2k
         49VM/5KaUjO4xIHK++kNx/qiurjEoCqvz0V1nOGYe4kp0YrKM1LzI55n8nfH4O/aqAAO
         sjjxxRdMfQnkDdOdf2LfnWYsyjmyqUKZPPF+VH3H8KgPV4ASbBtJY2oSnQATCH0tK1g7
         tS4ZSbA+NPS9uALcDT/vfpJcKQd0G8t4gPKIS6a5rwYe3IPvE9BdPrZv9NEuNzLNzBsE
         1U5LlCD/lVmIRdnKtTdfI23gspq/5imfcnBtXYnVJhTkoHZaIEyJiICHPwipYrK5sQsD
         eJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424068; x=1796028868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnRwo/ZsMPpWSsncariS2yc/xAKn3Nxe+Kux6J8DtAg=;
        b=NfGGwqQ/Jv5sTs5PlWBFYIhD34OCEnOH1UmaMLT5dr3gonzXw7tuqr0qToIQK1PBCr
         Hpm7O9+SEJYMdxLjRBjNLNtxZ1TXrU8qluDoD/jhWmCxKFSar4/NMXCuRdhn+ROj0wpJ
         En3pe3m3nJLhPRmqZZtRCcxywCJbw+nB+YiOiRhSeu+0IiZG1O+YQSam1GIz5T7qylJ6
         DcDI/QXXfLYte9CWouphvnRdl1rHzzFKhqmIQ+jDnMkBrC9Cyu8PFWaTo+R8BxZ+jq5O
         QWEcmTnT11HUtYLt0sGgPCer5aBUXRkRufeuALQfznn4EC0lG4xReniiuFM0rRiqQZY1
         Ir/g==
X-Gm-Message-State: APuU4Z/A3DpqjR9JROBWLC4rIPLZXIxHwHeFeVtuyu8vBheWscedirmC
	76J+KHP6pARRsroXQmn3HIF1CZM8V9YcA/GiZk9oXqC0oXDKlxPaPtJSGNrTjP01
X-Gm-Gg: AZFdTZfexzi03FJNzlNzJH7H37qosTuETGVmyaH4hoipK8ZtjpUg/1ww5VprPvZQnWp
	CetL8RPTHPqkYlSojBRvJmiC25I8aNQ2H2nK6wT7fVumy6gTfY+Fw4V0NrguuQeZy1JKJuO58MU
	+X9AchqC9bo8aP8wLXTwEkFf/W6R8Em85jHuFOhmvO5FEDf6+nfFQbWSI4V1uP3Namiyx9jtf52
	r2bsyY/z9PKNfFe5diFL4cHNClDo236LYyThND+Kho3YB1sa0fYfYOXMzdyI2qPu6HC2pEl3J0G
	0kbLQOM0a7lF5gW6hLjmzQ4FWMDlcdbxZms50y/qzBhIIoHjalUlDqfPT3neLHYn+zo0P7cGUkV
	+MC7pj/fZbdH7aqL/fvAyI4XJD/F/vxXL0L3xj6wyPgd9fNJVlZOC6ceD89eTfoRy5kMKViRkqL
	Ok95Y/KyBw0/Ri0tNbiXraMZRsucKySy20ECYlg/HfsvzXV0J5N07nU5XecgMr+HSxIEqYxE2Wn
	XgdV2tbZ9/r18tBdwnuRryRwOsK5lRlyEh8MnFZZA/jA+MAf/0tAdgARMqru48dtT2Z8KlMomP6
	Ql7htmZM5Pp4/eG8KoxSYpqtV3xyENx8gYqM1/xV9jB9Xb9vrqP8wZjDTn5NJJMyoCLaIkz1yU3
	jL5Rokvj+EwXn3xu+809cKcTJ8hIW73aHWVYbUiIosDgZK17vxCyigAA=
X-Received: by 2002:a17:907:da0c:b0:c50:5545:b66f with SMTP id a640c23a62f3a-c513a803353mr781995666b.23.1795424067352;
        Mon, 23 Nov 2026 00:54:27 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-092-047.092.076.pools.vodafone-ip.de. [92.76.92.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdf022sm377880166b.67.2026.11.23.00.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:54:26 -0800 (PST)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [PATCH v5 0/2] i2c: i2c-xiic: fix clearing of bnb irq and waiting/ clearing while atomic
Date: Mon, 23 Nov 2026 09:53:50 +0100
Message-ID: <20261123085351.3415122-2-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_005431_588230_CA370D01 
X-CRM114-Status: GOOD (  10.09  )
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

Dear all,

This patch-series fixes the clearing routine for the bus not busy (bnb) irq
plus the waiting and clearing routines while in atomic context.

The bnb is used to indicate that the current transfer is done.
A high level view of the software flow for tx:

* init i2c controller
* prepare all registers ( fill fifo, enable irqs, ... )
* start i2c txfer
* clear and enable bnb
* wait for completion
* ( serve interrupts )
* ( bnb interrupt ): complete completion

The datasheet ( pg090-axi-iic, Interrupt-Status-Register ISR)
states that the bnb bit can only be cleared if
the bus busy bit in the status register is set.
So the iic controller must have recognized that their is some activity
on the bus. ( Start condition )

Currently the bnb bit is cleared without checking or waiting for this
condition. This can lead to spurious bnb interrupts.

Andi suggested to use an atomic-save function to wait for bnb.
This was applied for other waiting/ clearing functions, too.

Kind regards,

Thilo Zirnstein
---

Changes in v5
- Fix timeout for polling bnb bit, set to 4us
- Link to RESEND v4: https://lore.kernel.org/all/20261118101147.3350796-1-thi.zirnstein@gmail.com/

RESEND v4
- Add Reviewed-by Tag

Changes in v4
- Fix timeout argument of polling in atomic context

Changes in v3
- Use atomic-save functions for waiting and clearing.
- Fix intendation
- Unintentional changes removed

Changes in v2:
- Unintentional changes removed.
---

Thilo Zirnstein (2):
  i2c: i2c-xiic: fix clearing of bnb irq
  i2c: i2c-xiic: fix waiting/clearing while atomic

 drivers/i2c/busses/i2c-xiic.c | 70 ++++++++++++++++++++++++++++-------
 1 file changed, 57 insertions(+), 13 deletions(-)

--
2.43.0


