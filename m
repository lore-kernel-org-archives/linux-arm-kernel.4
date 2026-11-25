Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4794606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ASOuwny4;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=DK7NRn96
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vf7/fHh0NzQPgN07aJpbb1vB1DON0qR+F/6eyHLLiH4=; b=ASOuwny4e6baXajQZVA6dYmzQL
	ZOmNS0vWsSU5iN9HbaYMZQo+BGAKuM6AFGaZPt4m+FJUViRPIfmYdPeExZcAKsmd1Fs68uekIJGkF
	mBhJSpybyhHWJ7mCsau3AN8ECzZK0OMXWlCdQLBnx9KF2/E1cgCn+SJ4APEWRS15O/wbErrrRCIJo
	bopjz1YvD/Bqpdy19z12kaX5ZaZRnwtkdA3ERglz07dhFDjPnKqJ8qkz9sR2PWIJgPuHUtmgBPr10
	7IPHccGoxUv7bCm4bpucF1jPjs5PX6Z5S3YInphA5OPhm+k5SBFdSlZq1JaCco8Mi0o4W4obxfrKE
	kwV62aUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8KE-000000094L7-2WoX;
	Wed, 25 Nov 2026 08:25:59 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8KB-000000094KQ-3AAn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:25:57 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 1ED82200033;
	Wed, 25 Nov 2026 09:25:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795595153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vf7/fHh0NzQPgN07aJpbb1vB1DON0qR+F/6eyHLLiH4=;
	b=DK7NRn96Oj1tHB/4dbpzvEz4DtAw4NhD3t3OL4aWuayFHDoJOUN3GerlDRI0zcbcQKeK0M
	rCplB7PM66Y6wMOBKCxOTTIEEnyDfPCjGLROa3uoDK5NQ6d+zsROOjiBZaZzQJ6RQU/1CU
	8Lf61EDm75NTUSdRfrtQPkUtcLedoRMBHascSY2QBr7VGsPrdfcPuwVRyp+aFAtcyebl5T
	bB3eTi3A+fAXT+D6Xyo6fvSgyjkyjqmRi2HwBa5G21MT4Y0jEDeBRxQbOP0HKjjfFJvGjI
	J2TsQReQgToCpL6Pbfcabz+0595dw1nvYKl8fru9vZrsxUYjSyhwjs76lOpaNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795595153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vf7/fHh0NzQPgN07aJpbb1vB1DON0qR+F/6eyHLLiH4=;
	b=dH1o5gSshYaQL0r8M052ghsI9tZt1DM1lNqql6iJkrhQEr8ih/T8i5pi8STev3PGx63ono
	OiS6p2zRG3niHD/+rGyqSOx+Glc6EoCyllywde/AUm09kCsZPNUnxbrl5skdi4rmpybZrm
	J09CjQpA6eI/ppSnZBOLlNDFxbhiCRLBVDApwXRV11abj0itmhjQQmX8VOOtuG1LSusAyZ
	3DFm5Jp2jA7rJUxlCTLYIb48qkXqkktQRf0Q381yjco1eTnyEG1WM0q4D5vehb4NemJlPU
	6tLKnx5BS1llm9Euc1ThPePx/fVr0S8UCvNM247BX2rai3EYcuyVGgRiXiP9Kw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795595153; a=rsa-sha256;
	cv=none;
	b=Iwtij5vcPIjXIOS8P6aAEReqMFdBorMvASrFBM39btL8qFvmY0zi/n4UyhM5pC6Xok+Kry
	LtY+V9lrbK1VUCG9C55ZFJjkivqC8VCCbfYiO6jyw2Euy50xGaU7XsbjQGRwIycMjF6gtP
	GLsAzbY2Ecne60nomnhP9L1KRv3iZzWE7zTFdtB2FMl1wNWYLqTKpGAiPtyMOG7NciczUQ
	K0crHprErsAwZTg4HDqGHdQePTlfrxXZaaHlyvvio4OXWec/5PWQItche1SdJThMd/Avh1
	g0VW9YfMlp5KIeav5iYioF4NQCTaa+85aP2grWVhuPfLyof/dlk+w5DA4sU5Ig==
Message-ID: <bdca545f7b754d757cab225952d7f79ec5dd6519.camel@pengutronix.de>
Subject: Re: [PATCH] ASoC: SOF: imx8: Switch imx8ulp DSP control to reset
 framework
From: Philipp Zabel <p.zabel@pengutronix.de>
To: shengjiu.wang@oss.nxp.com, Liam Girdwood <lgirdwood@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>, Mark Brown	 <broonie@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai	 <tiwai@suse.com>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer	 <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Wed, 25 Nov 2026 09:25:53 +0100
In-Reply-To: <20261125073857.1402045-1-shengjiu.wang@oss.nxp.com>
References: <20261125073857.1402045-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_002555_942924_6F23695B 
X-CRM114-Status: UNSURE (   8.21  )
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

On Mi, 2026-11-25 at 15:38 +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
>=20
> Replace syscon regmap-based DSP reset control with the kernel reset
> controller framework for i.MX8ULP. The syscon approach requires direct
> register access and creates tight coupling to the system controller,
> while the reset framework provides a cleaner abstraction and proper
> reset sequencing.

What do you mean by the reset framework providing reset sequencing in
this context?

regards
Philipp

