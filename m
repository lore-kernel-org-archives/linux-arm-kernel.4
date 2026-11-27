Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB76606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C4rLh/g3;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=trvrwwFz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=o20Chm5YYzyaeShfBE58QenD/TWPt7pCsFjGMWvzNHA=; b=C4rLh/g3vUeLtv
	v1THPEVG5bl70dXlT9kJ0bkB/aIE++CHY3nFV2vRXHy0jYTPPHQpXGDoBQR4KZ+OwnkHmpDnesXkG
	PIadLWlFnP7kC4MgKgtDGwYiXDEWW05k+YjQGg2DdzHCt8oaO+lsQXh/KgZUf4ZJPgxCwOFrTX1i+
	IkAVXlGRmnXR0kJ13v0MGcByhVit7ThxOc2KomVR628edQsDp8VaHPaLdz3qu+YoW3mZNF3dI8lud
	odfKXu/BaXKaWfKKdFNJ6AGxxzyaM9uQhGS1tS5U6mEQHUw8xLnZA2nzCLCHvDvKnJ42xYAuLFrq6
	EYIhxnhek5GXnp+yp3mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsF9-0000000FRJi-1qeu;
	Fri, 27 Nov 2026 09:27:47 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsEf-0000000FR4A-0L1J;
	Fri, 27 Nov 2026 09:27:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C9BED4E41795;
	Fri, 27 Nov 2026 09:27:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95EA86049C;
	Fri, 27 Nov 2026 09:27:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F000911E68208;
	Fri, 27 Nov 2026 10:27:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795771632; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=o20Chm5YYzyaeShfBE58QenD/TWPt7pCsFjGMWvzNHA=;
	b=trvrwwFzIqo2mUgfCxEptebF7FC7y/AzHQOQ5RYBZaN48jnVYFsV/W4buUoneXleDhApJs
	vKj9Tb5BKKmMalB7t0LOb41kEqiwtLp5HFo9hMHopgo8OqljYBPJuJMXa25LEBh2INj+va
	DkmJxqNVBnIGI8opMsNR3eDy74fDKL+2EeLWr6H0DM2XZALMh206vlO6x0vp1kyX/JY9PH
	8UCnxY7D6c2rl2LrUicu9sNjUDirGuGp7ZgEUq1NLQNRX2kA6b7NyfK1tU7raQHJThee1E
	arIMOI6DDxRJ6iZD50GBDIPaMPaJ3j0kNzryMJKcEwlN/XLan7X4jHmV9lykbg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bough Chen <haibo.chen@oss.nxp.com>
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
Subject: Re: [PATCH RFC 10/16] spi: nxp-xspi: Consume dummy cycles directly
In-Reply-To: <20261127090720.2zu37yavojz7fze6@shlinux89> (Bough Chen's message
	of "Fri, 27 Nov 2026 17:07:20 +0800")
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
	<20261125-macronix-upstreaming-spi-mem-cycles-v1-10-fd036402fd37@bootlin.com>
	<20261127090720.2zu37yavojz7fze6@shlinux89>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 27 Nov 2026 10:27:04 +0100
Message-ID: <87tsl2tyjb.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_012717_255133_45799384 
X-CRM114-Status: GOOD (  10.64  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

> On Wed, Nov 25, 2026 at 06:51:24PM +0100, Miquel Raynal wrote:
>> The spi-mem layer is now capable of providing the dummy phase in cycle
>> units rather than bytes, provided that drivers advertize the dummy_cycle
>> capability. Since this controller is consuming cycles and currently
>> converts bytes into cycles, flag it capable to consume cycles directly
>> and drop the extra conversions.
>>=20
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> ---
>>  drivers/spi/spi-nxp-xspi.c | 12 +++++-------
>
> Hi Miquel,
>
> Can you help also add the changes for spi-nxp-fspi.c?
> flexspi and xspi of NXP have the similar driver structure.

Yes, flexspi will also be part of v2. I would be very happy if you could
provide test results for the NXP controllers!

Thanks for the feedback, I will send a v2 soon.

Miqu=C3=A8l

