Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38395606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 13:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mp0Ombvo;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cM5VgeY6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7UVakvOp4wpiznroxVZYXkTEATKSGQujHq3lj0XSlRk=; b=mp0OmbvoLeDcE1
	xIpak3FlVpKWvevRhkT7tQGUvdtVPo7bwZt+OBZyaN0ZP4jhXSJOJ8E5UzoYvmeeddyDCsu5td6ch
	ArXLJZTVKdMS2Ikp/FnunhOWZf1IbpRmzF6CZaFBDeA3a+nlle4Q54rR6dDkv4Hafyg+PyBiNJQme
	RU0RvP8LoMgc5S0rQdQnw9YED5ORDhLBqq2Q9TxE21IJH8LiuQDQypwEIkjrYG+CaQ5pU5NK+OFq6
	Mqcn9z5k4cwLxLc6pY2KOxu9I0GVvzmCkSK4iipKgC82ISt5GnNiqfcEzG+uQe5sgN23QqqQ4eqEV
	l+wKNZR//sRTorshDrVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvbg-0000000GDbS-1YU0;
	Fri, 27 Nov 2026 13:03:16 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvbd-0000000GDaL-1far;
	Fri, 27 Nov 2026 13:03:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7E46C4E417C5;
	Fri, 27 Nov 2026 13:03:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4DDF06049C;
	Fri, 27 Nov 2026 13:03:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F79011E68760;
	Fri, 27 Nov 2026 14:02:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795784584; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7UVakvOp4wpiznroxVZYXkTEATKSGQujHq3lj0XSlRk=;
	b=cM5VgeY6Qci2ljmxqJH2dWDlf8hXi2XInC/iuzimk3N43ziiTXtiMMiKedJf5R5pYNvGxo
	Ba144VRx1Z4nzcfrgeAwVxPCnf67yr8iKuUVCrqJhp8X8vYXfT7cuoRwDd++MeDSNAYXqB
	dcrSTVCBTamAakYw3wbGqr6fxQZufiwpAjnm1GQh990665j2EmAE3ONzv+S26KrJozd0CU
	uE5nvBl438K4yS5xx8AciV3xr3B1IjR5frJp3hnbF2Fbsr7xDsk98qp9HhCPupN0sWxEzN
	XAe4fBjrLxm8X48WHk4LSNUBBZvWJApyARHisZtjduTr56v2v3QlnPTY4BIAbA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Mark Brown <broonie@kernel.org>,  Liang Yang <liang.yang@amlogic.com>,
  Feng Chen <feng.chen@amlogic.com>,  Xianwei Zhao
 <xianwei.zhao@amlogic.com>,  Han Xu <han.xu@nxp.com>,  Conor Dooley
 <conor.dooley@microchip.com>,  Valentina Fernandez
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
In-Reply-To: <41962155-e78d-46b2-a58d-45282fdf1cca@linaro.org> (Tudor
	Ambarus's message of "Fri, 27 Nov 2026 11:33:09 +0200")
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
	<41962155-e78d-46b2-a58d-45282fdf1cca@linaro.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 27 Nov 2026 14:02:54 +0100
Message-ID: <87cxrqtojl.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_050313_572362_728F4B07 
X-CRM114-Status: GOOD (  10.05  )
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

On 27/11/2026 at 11:33:09 +02, Tudor Ambarus <tudor.ambarus@linaro.org> wro=
te:

> On 11/25/26 7:51 PM, Miquel Raynal wrote:
>> This is only build tested for the moment and sent as an RFC because this
>> topic has raised a lot of questions, there may be things I have
>
> There's no ambiguity that this is the right direction, change bytes with
> cycles. As a matter of fact I tried this in the past as well, posted

Thanks!

> something and then couldn't allocate time for a new revision. You may try
> to search the set, if you haven't already, and check what the feedback was
> at the time.

I haven't found your series, but I found some of your answers to Sergiu
(iirc).

Let's see until where this version goes :-)

Cheers,
Miqu=C3=A8l

