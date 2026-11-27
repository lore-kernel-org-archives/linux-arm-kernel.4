Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F71E606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ogQ7bxbe;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=eU5PjGfK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Qefky8DlOTxPLdU0/wjWVMxmJw9tcsyvpnNkmobea1s=; b=ogQ7bxberljvIe
	TJ3hZoeMHoLHu4p0v4AwYPKIlHZeqPAjBz/Mfch0I/ZLg/+sNbzPFflYxhN5ojrL+ldYTRtJhAyUT
	0zSUM3Rq8wgvUZMmyUPuKztbkz6GDPyXw4EEBvpc9tH/PJiRNeawFK0dpxeTHJfmgmSQj4dx5bbDz
	kBLFA/j2aOqot6td7yw4OJIe5NjRlRNi6iOmF7eERkrX8sIhcfEOZnzTcciyawi6odp/PHwIPBGnj
	1qNfzjRhQePCrmT4UfhnxGhP8wYVKETz/v+TwH3/M2CPMFWT/7659Gbr3DjKnAB5o0eysHYXQUbnx
	MYqJhUjAFUsOvPXtsqkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWs6V-0000000FPGb-3NU7;
	Fri, 27 Nov 2026 09:18:51 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWs6R-0000000FPEq-0VVR;
	Fri, 27 Nov 2026 09:18:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CDA5F4E41787;
	Fri, 27 Nov 2026 09:18:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9DB3C6049C;
	Fri, 27 Nov 2026 09:18:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8576D11E69295;
	Fri, 27 Nov 2026 10:18:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795771121; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Qefky8DlOTxPLdU0/wjWVMxmJw9tcsyvpnNkmobea1s=;
	b=eU5PjGfK1Jl0gedKPU+OWMgLDwNMSEJI7XN2PpMliih5+m/3v/15bPtoXKqnsIg1adOG9b
	CX+1sL8sBWMl8FCR2Q1oZXjeuEazaHOJF7d0DBG0D4OK0chVYD9dL3txls4r1kGcE9HATF
	G9eGFbs5Ldi1vJ/asLwHUmi3vbXWtdFbVeGH+JeyOa7gLemLsls7CTjOCUskn3q7I2yp7x
	zDpxxm7HjFc9pvXIJ6jOKHdFsylL0Xww2reWHt31RQuZ65TBRg3s4SFFRHa1kWrHm6/OWp
	oHUl7ffFwhYj/ayjOmKF90LDZzTRdFAyout1I03RP2ifRDoc32vCilMejmHuTw==
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
Subject: Re: [PATCH RFC 01/16] spi: spi-mem: Handle a corner case while
 sanitizing ops
In-Reply-To: <20261127084643.ekeao335mv5n5kow@shlinux89> (Bough Chen's message
	of "Fri, 27 Nov 2026 16:46:43 +0800")
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
	<20261125-macronix-upstreaming-spi-mem-cycles-v1-1-fd036402fd37@bootlin.com>
	<20261127084643.ekeao335mv5n5kow@shlinux89>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 27 Nov 2026 10:18:33 +0100
Message-ID: <87bj7avdhy.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_011847_479774_E7F128A3 
X-CRM114-Status: GOOD (  18.37  )
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

> On Wed, Nov 25, 2026 at 06:51:15PM +0100, Miquel Raynal wrote:
>> Some mixed mode operations (such as 1S-xD-yD) will be flagged with
>> op_is_dtr but will not enter the ODTR checks. As a result, the number of
>> command bytes will never be checked.
>>=20
>> Reorganize a little bit this helper:
>> - If the operation contains a DTR phase, sanitize it.
>> - Then sanitize the op, should it be:
>>   - ODTR (8D-8D-8D)
>>   - anything else
>>=20
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> ---
>>  drivers/spi/spi-mem.c | 28 ++++++++++++++--------------
>>  1 file changed, 14 insertions(+), 14 deletions(-)
>>=20
>> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
>> index 8047b7508c8d..c64e906ba919 100644
>> --- a/drivers/spi/spi-mem.c
>> +++ b/drivers/spi/spi-mem.c
>> @@ -170,6 +170,7 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
>>  	struct spi_controller *ctlr =3D mem->spi->controller;
>>  	bool op_is_dtr =3D
>>  		op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr;
>> +	bool op_is_odtr =3D op->cmd.dtr && op->cmd.buswidth =3D=3D 8;
>>=20=20
>>  	if (op_is_dtr) {
>>  		if (!spi_mem_controller_is_capable(ctlr, dtr) && !ctlr->dtr_caps)
>> @@ -177,23 +178,22 @@ bool spi_mem_default_supports_op(struct spi_mem *m=
em,
>>=20=20
>>  		if (op->data.swap16 && !spi_mem_controller_is_capable(ctlr, swap16))
>>  			return false;
>> +	}
>>=20=20
>> -		/* Extra 8D-8D-8D limitations */
>> -		if (op->cmd.dtr && op->cmd.buswidth =3D=3D 8) {
>> -			if (op->cmd.nbytes !=3D 2)
>> -				return false;
>> -
>> -			if ((op->addr.nbytes % 2) ||
>> -			    (op->dummy.nbytes % 2) ||
>> -			    (op->data.nbytes % 2)) {
>> -				dev_err(&ctlr->dev,
>> -					"Even byte numbers not allowed in octal DTR operations\n");
>> -				return false;
>> -			}
>> -		}
>> -	} else {
>> +	if (!op_is_odtr) {
>>  		if (op->cmd.nbytes !=3D 1)
>>  			return false;
>
> Hi Miquel,
>
> So this change means no nbytes limitation for mixed mode oparations, such=
 as 1S-1D-8D. Is it correct?
> I go through spi-nor and spi-nand driver, seems for spi-nor, for DTR mode=
, it only support 8D-8D-8D mode,
> but for spi-nand, I notice some winbond W35N chips did support not only 8=
D-8D-8D mode, but also some mixed
> mode, including 1S-1D-8D. Does this 1S-1D-8D mode really has no such limi=
tation for address and data length?
> Address and data are indeed in DTR mode.

That is a very good point. I don't think the sanitizer ever did check
that though. I believe we should in the end have a more "per-phase"
approach, where we check all these individually.

There is also an implicit assumption that buswidth will only increase
(eg not 1-4-1) and DTR capability will not disappear (eg no S-D-S).

I guess we need to add more patches to make all these situations covered
and avoid having drivers checking for them.

Thanks,
Miqu=C3=A8l

