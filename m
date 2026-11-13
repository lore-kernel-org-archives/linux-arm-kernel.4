Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B185B606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=THPE1lUM;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=BI6WdYdc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LiiTlo37cd7Mx61Wns5oLMYH6SZa01qZWw0uJ0Q/vyI=; b=THPE1lUMaPbD9jc/nZ+KHlpd3J
	oMIlnWPni8txrBs09iAyy1rY82UfgBNHrKz5vO/SEZkyxrPVei8AxqPKdp3U1oVAnJVKuMxKYQXt7
	9ckZWFspjlKNW+ZaDppo5eSW5C/+a81uOkR+12OqKdfT7bEwbC50KBoG3oe7qsCefowWeIgVHEdEy
	TFOeS6vcnMhDTbDeSO+l8RHH3qLV0a+OQxIMA45yRuTgcfy3ue/R65gaIRBIM0UVMt8B0IoIntanL
	mhKv0qcW7F3ktFC3DMAO18pjGNVtnyslnpT0ft5H+PmTs27LI8YT7ZllalsDQLBasJ2QsBvpmwGFI
	G2P0OEVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsfr-0000000DGEw-1rfX;
	Fri, 13 Nov 2026 14:54:43 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsfo-0000000DGCu-1EkS;
	Fri, 13 Nov 2026 14:54:42 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jR0f12vLvzKnQG;
	Fri, 13 Nov 2026 15:54:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794581673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LiiTlo37cd7Mx61Wns5oLMYH6SZa01qZWw0uJ0Q/vyI=;
	b=BI6WdYdcVedfGyuD296xwBOk3ei9OLFIatflNebZWNtoOt4Ka+eplP24Bk/aMI/yy99JnB
	qNHTlCEt1cnyPTTcXfeS0IU1QyigYJbfPDvOH/GV9U6G9MIlqvZM/3Hdr+zIZ6P0XD3KRS
	pR5PJ8Ly/DKeYRHS2f1XvrDSTBZ7tB8ETgJpyp/JMzB6LHpDtxXfE/NfAPR69zh3406dcd
	VtXbd5vl8UgQSX8PTtsRCDPyo4Hg9Xj9zz2UeRbPlO4VLDtxns8zffUnrgnz2trWDAKMsa
	fc4bXU/IWxtaqrxyovBEmruPacm9QfZmBeJQiDOZfhPtyriX0d9t2F2EfS62+A==
Message-ID: <0140bc0b3d1078bf8851340e0cb893b2907e146a.camel@mailbox.org>
Subject: Re: [PATCH] ASoC: meson: aiu-fifo: prevent sleeping when spinlock
 is held
From: Manuel Ebner <manuelebner@mailbox.org>
To: Valerio Setti <vsetti@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,  Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai
 <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>,  Christian Hewitt
 <christianshewitt@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 13 Nov 2026 15:54:29 +0100
In-Reply-To: <20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
References: <20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 1e7b1d7ce8dec38f883
X-MBO-RS-META: cfbo8tz5cnod83gdmbzdxxfiyfdwomg3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_065440_662395_E0411A81 
X-CRM114-Status: GOOD (  26.99  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Valerio,

I have read your patch and have a question.

On Wed, 2026-11-11 at 11:09 +0100, Valerio Setti wrote:
> dai_links in the gx-card are atomic which means that the DAI trigger
> callback is called with the spinlock held. This means that usage of
> potentially sleeping functions (e.g. mutexes) is not allowed here.
>=20
> 'snd_soc_component_write'/'snd_soc_component_read' take the component's
> io_mutex on entry.
>=20
> Replace usage of these functions in:
> - 'aiu_fifo_i2s_trigger'
> - 'fifo_spdif_trigger'
> - 'aiu_fifo_pointer'
>=20
> This is meant to resolve the following runtime bug found while starting I=
2S
> playback on an OdroidC2 device where the kernel was built enabling
> CONFIG_DEBUG_ATOMIC_SLEEP and CONFIG_PROVE_LOCKING:
>=20
> [...]
>=20
> Fixes: e8712315c44d ("ASoC: soc-component: use io_mutex correctly")
> Fixes: 6b59c53c8adc ("ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF=
 datapath on start/stop")
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
> ---
> I found this issue while working on [1].
> This patch is independent of [1] and they can go in in any order. They
> are fixing the same problem in different modules.
>=20
> [1]: https://lore.kernel.org/all/20261021-gx-formatter-use-spinlock-v1-1-=
71ebc9224c03@baylibre.com/
> ---
> =C2=A0sound/soc/meson/aiu-fifo-i2s.c=C2=A0=C2=A0 | 15 ++++++++++++---
> =C2=A0sound/soc/meson/aiu-fifo-spdif.c | 14 ++++++++++----
> =C2=A0sound/soc/meson/aiu-fifo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 6 +++++-
> =C2=A03 files changed, 27 insertions(+), 8 deletions(-)
>=20
> diff --git a/sound/soc/meson/aiu-fifo-i2s.c b/sound/soc/meson/aiu-fifo-i2=
s.c
> index eccbc16b293ad..8f785241585df 100644
> --- a/sound/soc/meson/aiu-fifo-i2s.c
> +++ b/sound/soc/meson/aiu-fifo-i2s.c
> @@ -5,6 +5,7 @@
> =C2=A0
> =C2=A0#include <linux/bitfield.h>
> =C2=A0#include <linux/clk.h>
> +#include <linux/regmap.h>
> =C2=A0#include <sound/pcm_params.h>
> =C2=A0#include <sound/soc.h>
> =C2=A0#include <sound/soc-dai.h>
> @@ -48,14 +49,22 @@ static int aiu_fifo_i2s_trigger(struct snd_pcm_substr=
eam *substream, int cmd,
> =C2=A0=09=09=09=09struct snd_soc_dai *dai)
> =C2=A0{
> =C2=A0=09struct snd_soc_component *component =3D dai->component;
> +=09unsigned int val;

Here is val.

> +=09int ret;
> =C2=A0
> =C2=A0=09switch (cmd) {
> =C2=A0=09case SNDRV_PCM_TRIGGER_START:
> =C2=A0=09case SNDRV_PCM_TRIGGER_RESUME:
> =C2=A0=09case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> -=09=09snd_soc_component_write(component, AIU_RST_SOFT,
> -=09=09=09=09=09AIU_RST_SOFT_I2S_FAST);
> -=09=09snd_soc_component_read(component, AIU_I2S_SYNC);
> +=09=09ret =3D regmap_write(component->regmap, AIU_RST_SOFT, AIU_RST_SOFT=
_I2S_FAST);
> +=09=09if (ret < 0)
> +=09=09=09return snd_soc_ret(component->dev, ret,
> +=09=09=09=09=09=C2=A0=C2=A0 "Failed to write register on trigger");
> +
> +=09=09ret =3D regmap_read(component->regmap, AIU_I2S_SYNC, &val);

So as I understand val/&val is just there to listen and forget what gets re=
turned.
That's kinda weird, but not an issue.

> +=09=09if (ret < 0)
> +=09=09=09return snd_soc_ret(component->dev, ret,
> +=09=09=09=09=09=C2=A0=C2=A0 "Failed to read register on trigger");
> =C2=A0=09=09break;
> =C2=A0=09}
> =C2=A0
> diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-=
spdif.c
> index a9861c5d66374..297834bce1c7a 100644
> --- a/sound/soc/meson/aiu-fifo-spdif.c
> +++ b/sound/soc/meson/aiu-fifo-spdif.c
> @@ -69,15 +69,21 @@ static int fifo_spdif_trigger(struct snd_pcm_substrea=
m *substream, int cmd,
> =C2=A0=09case SNDRV_PCM_TRIGGER_START:
> =C2=A0=09case SNDRV_PCM_TRIGGER_RESUME:
> =C2=A0=09case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> -=09=09snd_soc_component_write(component, AIU_RST_SOFT,
> -=09=09=09=09=09AIU_RST_SOFT_958_FAST);
> +=09=09ret =3D regmap_write(component->regmap, AIU_RST_SOFT, AIU_RST_SOFT=
_958_FAST);
> +=09=09if (ret < 0)
> +=09=09=09return snd_soc_ret(component->dev, ret,
> +=09=09=09=09=09=C2=A0=C2=A0 "Failed to write register on trigger");
> +
> =C2=A0=09=09fifo_spdif_dcu_enable(component, true);
> =C2=A0=09=09break;
> =C2=A0=09case SNDRV_PCM_TRIGGER_SUSPEND:
> =C2=A0=09case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> =C2=A0=09case SNDRV_PCM_TRIGGER_STOP:
> -=09=09snd_soc_component_write(component, AIU_RST_SOFT,
> -=09=09=09=09=09AIU_RST_SOFT_958_FAST);
> +=09=09ret =3D regmap_write(component->regmap, AIU_RST_SOFT, AIU_RST_SOFT=
_958_FAST);
> +=09=09if (ret < 0)
> +=09=09=09return snd_soc_ret(component->dev, ret,
> +=09=09=09=09=09=C2=A0=C2=A0 "Failed to write register on trigger");
> +
> =C2=A0=09=09fifo_spdif_dcu_enable(component, false);
> =C2=A0=09=09break;
> =C2=A0=09default:
> diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
> index 8b54f9681d00c..f3cdcce1ebfe3 100644
> --- a/sound/soc/meson/aiu-fifo.c
> +++ b/sound/soc/meson/aiu-fifo.c
> @@ -5,6 +5,7 @@
> =C2=A0
> =C2=A0#include <linux/bitfield.h>
> =C2=A0#include <linux/clk.h>
> +#include <linux/regmap.h>
> =C2=A0#include <linux/dma-mapping.h>
> =C2=A0#include <sound/pcm_params.h>
> =C2=A0#include <sound/soc.h>
> @@ -37,8 +38,11 @@ snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_comp=
onent *component,
> =C2=A0=09struct aiu_fifo *fifo =3D snd_soc_dai_dma_data_get_playback(dai)=
;
> =C2=A0=09struct snd_pcm_runtime *runtime =3D substream->runtime;
> =C2=A0=09unsigned int addr;

Here it's addr. It's not yours, you just kept it.

> +=09int ret;
> =C2=A0
> -=09addr =3D snd_soc_component_read(component, fifo->mem_offset + AIU_MEM=
_RD);
> +=09ret =3D regmap_read(component->regmap, fifo->mem_offset + AIU_MEM_RD,=
 &addr);

Similar as above. But why is addr here and val above? I think it's the same=
 role in regmap_read().
Would it make sense to name both the same? If it does, I'm in favor of val,=
 because that's in the
kernel-doc of regmap_read().

drivers/base/regmap/regmap.c:
> /**
>  * regmap_read() - Read a value from a single register
>  *
>  * @map: Register map to read from
>  * @reg: Register to be read from
>  * @val: Pointer to store read value


> +=09if (ret < 0)
> +=09=09return snd_soc_ret(component->dev, ret, "Failed to read FIFO point=
er");
> =C2=A0
> =C2=A0=09return bytes_to_frames(runtime, addr - (unsigned int)runtime->dm=
a_addr);
Here addr is used, so it's not same as above.

Looking forward to your POV.
 Manuel

> =C2=A0}
>=20
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261111-aiu-fifo-fix-sleep-on-spinlock-0ecec8d64a9b
>=20
> Best regards,
> --=C2=A0=20
> Valerio Setti <vsetti@baylibre.com>

