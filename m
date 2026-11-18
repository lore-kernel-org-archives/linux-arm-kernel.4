Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FBE606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 14:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w7moj3mR;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=JXaesICp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FYR6lAR4F/kvDycE+JdAzmdMYH84ljUk0yMV3grV5hc=; b=w7moj3mRZgeo1JWt1XavIil3tq
	vyqhYDaqwgmsYs/kuSj+ucqulVy4ewnSRs8zRpJ3ujbpE7JNE6W4hrTqwZyHrDJOSc6y06aHgEq9j
	hDns/DQ+CQW+lp20ayd2zYtGZG7RYPnX9wFPK9eUZK90wqf41E0OHdJIbGYPNfmIrcKq3vD9ASLfI
	ngFP4NrkPyg15lFKXXUb2S20LpNx83DctBZQrBB8LCpDbIwPAk5Af8Di3g777mhgsNTLEKTWftYmP
	Buc8JV3CB4Ei8th2b6Wb5LrPWm0RA5iFPe+j1VnAuiu2bBSPSXGBHGi5JyK66XN84IH4toat9e4Vj
	Oz1+saiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTh5a-00000009B26-1i9w;
	Wed, 18 Nov 2026 14:56:46 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTh5W-00000009B1I-2YO8;
	Wed, 18 Nov 2026 14:56:44 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jV4S43N4hzMlyX;
	Wed, 18 Nov 2026 15:56:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795013796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FYR6lAR4F/kvDycE+JdAzmdMYH84ljUk0yMV3grV5hc=;
	b=JXaesICprn2CjnyE3WbO0RBrhdYyl2dJwYp//aiyC6Noq2rjpsgib9XRUqsadUfJ9uE3w1
	dxKZ4GEUL34w4XtnHTnAwi13rpmb8PKj7zGdSXzlsiCD9G2PVmqwHjOY5oDfuAJx4L8QF5
	0RvWnV4O4slFX8sIiXhskD88hZGoP1PTC1TNbmI4I2fO4HJ85JuD/ej2kj2fPQH7XNE62x
	0oO0zKOrEQFharLAyIGSDgaYgzq1FO1uD4LaXfHJpo6hs+PckE4agQVPI8C4AJEqYYDq63
	B8rFp88zeKzw2PawoZKe1P4+8mAps2RRpoUlW0TKhNn1Kswdbm0DbAb3vpNBjA==
Message-ID: <d825fa6717dc907247cbaec6c7555eccb5676b9b.camel@mailbox.org>
Subject: Re: [PATCH] ASoC: meson: aiu-fifo: prevent sleeping when spinlock
 is held
From: Manuel Ebner <manuelebner@mailbox.org>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl	 <martin.blumenstingl@googlemail.com>, Kuninori Morimoto	
 <kuninori.morimoto.gx@renesas.com>, Christian Hewitt	
 <christianshewitt@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 18 Nov 2026 15:56:32 +0100
In-Reply-To: <34e02f23-1ace-4a13-9353-b73a1464a592@baylibre.com>
References: <20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
	 <0140bc0b3d1078bf8851340e0cb893b2907e146a.camel@mailbox.org>
	 <34e02f23-1ace-4a13-9353-b73a1464a592@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: b463c6fe2c6dcd9de92
X-MBO-RS-META: 1twaz6xuakpuacrj8wctghpe57hhkz9j
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_065643_404747_A0E9955D 
X-CRM114-Status: GOOD (  27.08  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2026-11-16 at 17:41 +0100, Valerio Setti wrote:
> Hi Manuel
>=20
> > I have read your patch and have a question.
> [...]

Ack.

> > > @@ -48,14 +49,22 @@ static int aiu_fifo_i2s_trigger(struct snd_pcm_su=
bstream *substream, int cmd,
> > > =C2=A0=C2=A0=09=09=09=09struct snd_soc_dai *dai)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0=09struct snd_soc_component *component =3D dai->component=
;
> > > +=09unsigned int val;
> >=20
> > Here is val.
> >=20
> > > +=09int ret;
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09switch (cmd) {
> > > =C2=A0=C2=A0=09case SNDRV_PCM_TRIGGER_START:
> > > =C2=A0=C2=A0=09case SNDRV_PCM_TRIGGER_RESUME:
> > > =C2=A0=C2=A0=09case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> > > -=09=09snd_soc_component_write(component, AIU_RST_SOFT,
> > > -=09=09=09=09=09AIU_RST_SOFT_I2S_FAST);
> > > -=09=09snd_soc_component_read(component, AIU_I2S_SYNC);
> > > +=09=09ret =3D regmap_write(component->regmap, AIU_RST_SOFT, AIU_RST_=
SOFT_I2S_FAST);
> > > +=09=09if (ret < 0)
> > > +=09=09=09return snd_soc_ret(component->dev, ret,
> > > +=09=09=09=09=09=C2=A0=C2=A0 "Failed to write register on trigger");
> > > +
> > > +=09=09ret =3D regmap_read(component->regmap, AIU_I2S_SYNC, &val);
> >=20
> > So as I understand val/&val is just there to listen and forget what get=
s returned.
> > That's kinda weird, but not an issue.
>=20
> Well, I understand that it might be weird from a software point of view,=
=20
> but it makes sense from the hardware one. According to the manual:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 A read from this register indicates that the nex=
t sample to be
> =C2=A0=C2=A0=C2=A0=C2=A0 sent out of the interface should go into the lef=
t channel of
> =C2=A0=C2=A0=C2=A0=C2=A0 the dac.
> > > @@ -37,8 +38,11 @@ snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_=
component *component,
> > > =C2=A0=C2=A0=09struct aiu_fifo *fifo =3D snd_soc_dai_dma_data_get_pla=
yback(dai);
> > > =C2=A0=C2=A0=09struct snd_pcm_runtime *runtime =3D substream->runtime=
;
> > > =C2=A0=C2=A0=09unsigned int addr;
> >=20
> > Here it's addr. It's not yours, you just kept it.
> >=20
> > > +=09int ret;
> > > =C2=A0=20
> > > -=09addr =3D snd_soc_component_read(component, fifo->mem_offset + AIU=
_MEM_RD);
> > > +=09ret =3D regmap_read(component->regmap, fifo->mem_offset + AIU_MEM=
_RD, &addr);
> >=20
> > Similar as above. But why is addr here and val above? I think it's the =
same role in regmap_read().
> > Would it make sense to name both the same? If it does, I'm in favor of =
val, because that's in the
> > kernel-doc of regmap_read().
> >=20
> > > +=09if (ret < 0)
> > > +=09=09return snd_soc_ret(component->dev, ret, "Failed to read FIFO p=
ointer");
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09return bytes_to_frames(runtime, addr - (unsigned int)r=
untime->dma_addr);
> > Here addr is used, so it's not same as above.
> >=20
> > Looking forward to your POV.
>=20
> Here I left 'addr' to minimize the number of changes in the patch.
> Looking at it again now, I'm more in favor of keeping it as 'addr'. I=20
> understand that the regmap documentation uses 'val', but in this case we=
=20
> know that the returned value is really an address of memory, not just a=
=20
> generic value.
> Also keeping the name as it is makes the last line of that function=20
> reading smoothly.
>=20
> However if you deem this unacceptable I can change as you requested.=20
> Just let me know.

I'm good with 'addr', thanks for the explanation.=20
 Manuel

>=20
> Best regards,

