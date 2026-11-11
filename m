Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7866E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mhp6PAMU;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gkfvFqY9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=E0NJ0Tjdg/pYbIbqMZNbeV94Mj/dKmq8NmNovao9J/o=; b=Mhp6PAMUtaVfQA
	WFr3PFpMhWDF8EtLrOGLclj/wuHZ2xx83TIL5OIqxImC1TlHD+eaB4nculoGD7eOfl8byFa6AwBm+
	HCRhoz5l2ip8lgIxyGNQB+lYemDWTvia/JLgBnK1qenW5pHm1noA1zvhAmxnkNAkFnoPIyMM2EQYY
	YPk57Bb8Jq8V1SNqAoup0oclCUetqo6KLZAf+2d3886UYIB+7kz2BUA5A0p5ABRSnOhUCbwEb1T1/
	c9FPJBAAxh3B3TFvGcPFHh1y5mv/hnAn9kpdwiQOvhRLBVrQv55lXPks3hlUrpD4doe1tLZBx75ig
	IN5qKWOoMIRBWZNtyjZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR79U-00000006cuB-1MPL;
	Wed, 11 Nov 2026 12:10:08 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR79G-00000006cq4-2uYB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 12:09:56 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-82380b0f55dso1405989a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 04:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794398993; x=1795003793; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E0NJ0Tjdg/pYbIbqMZNbeV94Mj/dKmq8NmNovao9J/o=;
        b=gkfvFqY9aF6qvOBMNzJJMq1OChHzBbVsVG2xzUmFRDqktZDpm8B3IwjOmllSmx+iHY
         8mehWZshmESSbp0DdrTFZWIeg+Y/slkwnjvNbRiHuy2S7Yt6XuFV9b+gdv7Kra+6s92H
         0FHtbBQK97QVoU6R2XQ2HX0IoWch1yykFRNI8nakYq/CIMPM5SWVqSTxbbHpmy/+OLBg
         W1PpehQpBKA6DWwaBJ6jIWDpSBNyCHs4VFpbE9UTs0pS4dNvMCeYeUf8rXNlR/kdO5YX
         UwuuYvYYt7ZsXMUxHTwQZ7og4wxgHD0oPjLN56nj0ec4xG/rzPKdD+JVL3H2UH/GAsVX
         voYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398993; x=1795003793;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0NJ0Tjdg/pYbIbqMZNbeV94Mj/dKmq8NmNovao9J/o=;
        b=qghBekwiRcKsFHZ6FdhSZtdYRiJNmIoI/WdF8O+rcMkbhpDF0dbSZgae7JYfE6w3R3
         TfZpZl8AHOTUqrbWHBWZo3ya0TxMtu38hmv6QvKr96AtxGT2ogVs1fcnE9AyTDYNGA46
         9TKC4EsgpQ6DAbrWqPewDwgHvr/eTgZznTnE2KmNk1A6zqC+mbTLRdYdkqn3EFZWKFYf
         eyic33ZaUH/ZqYbDfZmtNJ0ShBRhPcQ2jJDA/KP68iYH9QGRkWyGuIS1AS3Cfv3v6iIs
         fMSW3qqFa1Wo4RlPQ0k48jw3iY+DodIA2i7T13N8ij5gt2AIcspvXtdaZAa8wmgtkwge
         c5DA==
X-Forwarded-Encrypted: i=1; AL+hErFwDm5SjBM+uGLZjGMBSnfJ7spKpEwe4duY9RfBSed2eAzdOWrje0xXUa2H2OIU1SVPGFHRmjvBv9ih2bal5iLy@lists.infradead.org
X-Gm-Message-State: APuU4Z+N+H7FnMZ3j7atIPwRUB8Wu/MD9Xgj+CJ7e2OOUWXwUb1Amiws
	iOTMJSUWY+QKVy9p5M177YyKlM1JvlYDRYpCFu6yUVqUuSbu9sQmhnlt
X-Gm-Gg: AYBFou3AYZTlICvwmpyrrSZ/7WvP3XRnM7cd0QP5/60NPKUsCxpVUE5i/wAUSrY3WuK
	fjN2ud9rCwWmD1fz7XDSZ/LqWpUrJrEDf3fV12e3gaUfxHjdnS6oO86p+sOyuWDwwvBEgZBNwsW
	TsCEYHrvWLUWgJSIRREq0Ag3xvx0iDtTs/VoXpHr+2Qk21Oadf6Sk2jMF2DHJSCLsgRTnV/M3Eo
	JTOamET40nnGzsBdX6LK95AZIyIc3weQrBj47hhl9m/27UO9HjELEK6RgIrVblnXzdqLbymEXE2
	qqmH82JrQoqqpyq3y90hgkW6FWZXNk7ySdtcznexRI6CalKnAQH4PKxvdTKRyPOEZtd5s/R+ToV
	E00BN2TiE8dYUMC4BcJ13m5JAPMBrGEevQHvbaE8XqlxGRV3bGyKaolcmQ7Ub12N5DhBgPcObOR
	q+IaIpcpRnt0GzAWgPZBGr7X3xXOLmST4ZOPOrfdFcStR1H/alsXumqX3Co8eCx9TovrkIWLPHG
	1cgdo2JnZWjBmGDz4iPJRyBCbPlON2WXI5uucWQ9D4fF4/phMnt94rrago1jNeV1nfrY5Tq6XZZ
	+DV8h/Hte2vaG/rejy8KlTiVyWjaWFkssmTCuzqPc9TAnGnmL0p+LBMLxwFVGhDufllgZAbI0Rz
	KX/+qEPNGncVplzShIKijE+fBgA==
X-Received: by 2002:a05:6830:25c6:b0:829:8a9b:de79 with SMTP id 46e09a7af769-860f268b747mr1620889a34.4.1794398993361;
        Wed, 11 Nov 2026 04:09:53 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dc85a9e8sm4218356a34.0.2026.11.11.04.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:09:52 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v3 0/3] arm64: dts: allwinner: add A733/Cubie A7S support
Date: Wed, 11 Nov 2026 07:09:50 -0500
Message-ID: <20261110-a7s-dt-v3-deps-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794227241.git.enzo.adriano.code@gmail.com>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_040954_744103_964B82CC 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> [4] A733 8250_dw v2, patches 2-4:
> https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com

Correction: the runtime dependency is patches 1-4, the complete posted v2
series. Patch 2/4 needs context introduced by 1/4, which is absent from
v7.4-rc1 and the checked tty-next and next-20261109 snapshots; all four
applied cleanly together.

AXP318W PMIC v8 5/5 also needs a context-only change on v7.4-rc1 from
sizeof(*desc) to sizeof(*new_desc), introduced by b53a09c957b68.
After IRQ-bank v3, pinctrl voltage-mode v3 needs its hunk context adjusted
to the IRQ-bank map; its voltage-mode change is unchanged.
The older clock helpers are already in v7.4-rc1; no other input adaptation
was needed, and DT v3 itself applied with ordinary git am.

> Untested: boot with pinctrl v3, card writes, hotplug, 1.8 V switching,

DT v3 with pinctrl v3 reached an initramfs shell on one Cubie A7S with
vendor firmware. In these boots, warm reboot returned to vendor Linux only
with bus-r-riscv and bus-r-msgbox marked critical (firmware-clock patch [5]).
No card-write, hotplug, 1.8 V switching or other functional coverage was
added, and no new schema check was run.

Thanks,
Enzo

