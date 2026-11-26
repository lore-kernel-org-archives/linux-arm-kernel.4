Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F43606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 11:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W9G0Ja5q;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CT0q90WV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=y1/wD7Wi9STowuQTsl3HDTiGkdek0lFr2Qc9ETyKkHc=; b=W9G0Ja5qYH54BD
	2NCRp9bY368qVZVWlrNztQiBDbpsy+/emnndvXMfN3rwkh9b6Laq50NFrH2l9w+KG/ZtiXwhzQEnD
	78aqpMvJl14Dw6CuubkS3PvNsCKaXLRwObHxmtm0HkHWIYWZheMdJuL9iPttqMg5Lpsj/JMzZxDfq
	+7IsN7JB33ojC1w++X9qkGyIbbEb4iyrRruaZItIkWG2XPv5qeA8UhJ22pWJjMiL8SZ5avRafcxcM
	Rwqvoe9jO47cguA6v+RAFRHOAj+CnDTQUniNQDOecxfDGPa0W1S6nET7IRJURziE0YDEDZl9MT0cy
	dYG15jwm1aTPQu5PW5UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXLx-0000000Cp0q-22cn;
	Thu, 26 Nov 2026 11:09:25 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXLt-0000000Cozf-40iS;
	Thu, 26 Nov 2026 11:09:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AEA2C4E4179C;
	Thu, 26 Nov 2026 11:09:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7CAF460237;
	Thu, 26 Nov 2026 11:09:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A61D211E6B368;
	Thu, 26 Nov 2026 12:09:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795691353; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y1/wD7Wi9STowuQTsl3HDTiGkdek0lFr2Qc9ETyKkHc=;
	b=CT0q90WVIJc4zyZoQOxtFRwovUp/lD1tvYC8y28IdlSTZHylCR+SJOmgbdnavDoSIkKJZ7
	UQHzhfp1dRSy6+1mQ58pLkQKWb6rDLC50feZHn9Pd5znOcWpj7D5Q9l8chtedbMZd2oDLJ
	ZmLDRvMzlrHQxZPH5Eic6XzwoJQMgIXhdfgkIsLG7EiBT8CbTTjEdoIHRCvVjU+Te4B3r8
	AQFb4tWn9rZC2cYUS3f3KjYpHTHLUb6guHhBk2tbVLMW1Bfs4Eaee4bo7sjgUwuMgJ4yos
	1IXLZNk6X6lqfWFueUY4owHyk7QJ2sJAxW6L5yGfOuj+wpDnU0wIA23rihiUPw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liang Yang <liang.yang@amlogic.com>,  Feng Chen <feng.chen@amlogic.com>,
  Xianwei Zhao <xianwei.zhao@amlogic.com>,  Han Xu <han.xu@nxp.com>,  Conor
 Dooley <conor.dooley@microchip.com>,  Valentina Fernandez
 <valentina.fernandezalanis@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Haibo Chen <haibo.chen@nxp.com>,  Jyan
 Chou <jyanchou@realtek.com>,  Yu-Chun Lin <eleanor.lin@realtek.com>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Alvin Zhou <alvinzhou@mxic.com.tw>,
  Cheng Ming Lin <chengminglin@mxic.com.tw>,  linux-spi@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  imx@lists.linux.dev,  linux-riscv@lists.infradead.org,
  linux-stm32@st-md-mailman.stormreply.com,
  linux-arm-kernel@lists.infradead.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH RFC 00/16] spi: spi-mem: Express the dummy phase using
 cycles when relevant
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
	(Miquel Raynal's message of "Wed, 25 Nov 2026 18:51:14 +0100")
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 26 Nov 2026 12:09:05 +0100
Message-ID: <87wlpzx31q.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_030922_128792_9EA3DE7A 
X-CRM114-Status: UNSURE (   9.80  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


> Convert spi-mem, all the trivial spi-mem controller drivers and then
> SPI NOR to use dummy cycles instead of dummy bytes. SPI NAND may come
> later.
>
> This is only build tested for the moment and sent as an RFC because this
> topic has raised a lot of questions, there may be things I have
> forgotten about, so I would like all parties to agree on the direction
> before I commit into something cleaner. I bet Sashiko will also have
> interesting feedback to make...

I made several trivial issues in the controller's conversions which
triggered a lot of Sashiko answers expressing the feeling that the
patchset was not ready. The important part clearly are the spi-mem
changes, the modifications on top are almost independent follow-ups
showing why this may be useful. Nevertheless, I'm gonna address all
those issues and send a v2 with hopefully less obvious issues.

Thanks,
Miqu=C3=A8l

