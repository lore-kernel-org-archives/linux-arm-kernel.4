Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48439606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 06:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HZibibYz;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S25K4l1X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GmUggzBwh054ycyLcdU256fZfq9HoFB8UcP89KTzYog=; b=HZibibYzozf4PN
	xnXr7RJXRlStVLe0uwYHI1YYq142NhKJOeeNJ101zhrTx3hSnILX9TTG16v8DHgCh2P1YLQkLH70p
	o9hTbfANSX8vPUM0bO3+1bkKAXEWTcGZhGHTJ+nXLP+rF28Z7pAndSDh5K1VrC19G1o3Dgq84XcS/
	aoZG2p/aoK2E6gw45SOf5M4HXWRHTJf6/C1RK6Wah4Rsw5ZyBkzNxc0fWCToodHBg9slNijPxQitt
	1NE4hfLJHFarjn+jjapJ0aTN4iMnTKKEWOxUdk19lzN8qWCQ6XSsdt021+QNYo5vs4zT8NI6P2vsd
	sGlLPQkeHP/K8dwBN6fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROBi-00000008oPZ-2jSk;
	Thu, 12 Nov 2026 06:21:41 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROB0-00000008oGH-3yFS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 06:21:01 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6b7221c0f2cso3740510a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 22:20:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794464449; cv=none;
        d=google.com; s=arc-20260327;
        b=PZWrvZrIsN4OW+dEXtmnH/7Z8CCzVKwnLHMqrhRDl4evMeDwD/fw5xrFl+4DiLKJ8B
         5zkOGHyUKMQSQW4XHt06TmYk+mxbWqUzsiCCFxzYZ6kXQ+xoyPa4SDyXueVJZkGUf6Rf
         g9tcJtuk8+VCk7k/KbJWqN0y45eEgUhKlvxvBjepa+2yjbNIBlEUgumNs2CS/kzkHsa9
         WedaZ5wHfGkp7CwNiJuaCmj8IIB5jEju8Ipf7qorE+dfUb2skshz2NgbbOpWLDZuUBeZ
         VE1zpM4CS4iz6mHKjN/DPGAoxNDo7uog6Op/ZnJj7d3Xx/kKRDElFuXL0dwlrNIvJiGL
         l2DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GmUggzBwh054ycyLcdU256fZfq9HoFB8UcP89KTzYog=;
        fh=6cK8eSOh7QTgoOgFPmJdD6XlWqErjWWytYwh+UfceUk=;
        b=Pdro6pzYD7jUthfaKq6NCZp9yKhgJPlphi2Gz0dhC9gYbcfiPV62GaOaF6KTmJfGtP
         TSZuuuvy6CahlqqSqpSRpeZlIyfHBhADUBK8Ymu1qjtUD8AJjA8ipLrdMkzQQTYBl0f0
         +GS7DsAn+S2QCPhl0Eyi9qPz2S/9U94cS1PnBv/r5z8L1zWVEEWJhr1e/ZuwQzvWN5Lt
         W4ykHI07zuKKv6HCjXuoH4R8DQ0YNfQ3/f0pci+BJGIslw9yMv5fx+FvFk6cGkWf+Uv8
         PZft1vcwfPhD2iGDxE48qIIuxfBpxti78p+BMR/ZdMGP0ItTyUfQhRMkH7NUxsXdU9E3
         9w+w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464449; x=1795069249; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GmUggzBwh054ycyLcdU256fZfq9HoFB8UcP89KTzYog=;
        b=S25K4l1XjqUv2OhwPYAkYwn8xp8eTtkuubt3nyQolCPBXb6SYydb9z6M2il4r23+jR
         tZrPf4G3PwCPMckbVtiTY35IbwAS/F7a0tcXfk0QubNS89zOKKiqlhtN7rLUj06NVijI
         9+nGcZXcB1RN+EV4TVwPSEulJK9QlZcx94Ctxv02aBOcJCrdXlYbWtKHb3YdiHl5rY1T
         1qagYqQcQq40VNn4lr0NYEQU40eG2nRNHeOqMEqoT/+9H2dd1tnjXmKCLiI73EanYi1p
         PNegJES00pvY8zVc5M4NGB1R3/SHwvOYigMn9eaQfdDpEY+IPKg83Ec/tpqRgdWlBfZQ
         cPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464449; x=1795069249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GmUggzBwh054ycyLcdU256fZfq9HoFB8UcP89KTzYog=;
        b=pLLH9xPtzRW86nUeMOf2Seu0L8WoT1fYjOyiGe/rzpJpJFkOjtdTSoNn4Qeq4vBtQw
         cvGpuL2HxWokcEtzI+wU0TmjlYP19oeqwI3T9dcqYDrHrdEOqfXjeVrKPpBCYCqt1EwN
         tX09/q7pvMWdTPgokDM+OlyOENlnT61s1pJBv3IbYiYaZmvsE8Ge2zr2cl+pVbGf7wh0
         rMw5DnYf6kj7gJvFxwepeUP6avHvCmry0HHVNa52XK9AoJRjrYd6XpgtpsMzDUJSFxMZ
         Clqq5RBoTthaku/LM+pyIsuifW5nGKR0/vW9rKrj/YoCZI8kzJNoGTrbUuvVCB7hs2fu
         y18Q==
X-Forwarded-Encrypted: i=1; AL+hErHn+0SA9fkTVBZIuf4Vmh3sdkkapTmO87a/D2SqtDPm3oLtoYulsRlReHEu9bbrtfskc981HRqUvwelvLctrIqP@lists.infradead.org
X-Gm-Message-State: APuU4Z+LIbZ7+z6fxvLc26AzWoJEpJfpmeB9IcJmLgyJH0EshyhmoiS9
	NFAJOkm6iXyOOMd/MPQ0SuVo1ihKJvyunB/wkCtrxkiq8zURrmnjOXWYhPA+nWBMHBxR5irSQkW
	6ZFfD7ZjQVBuFCwBvOhIahEPUt2MM6g==
X-Gm-Gg: AYBFou2QouFjbCmMsRDwFURjQglYaq9u4NNXdUdmLWxcxa6Kt/64XJ7bNGKkUhLwH6w
	U42Gp+02yUGdaXkeD2DmeXITIuMqPHOYJJ+xGEydAKWbkBz95Cgw1pEMyhgWpra6UmRbX/03eVd
	WYw53kjJJuMV16Kn3OeQn5mR2K+wl75Upi4OMRLiyaI55RI7po7vcWyDFXyKZGncUhELlWjfuSv
	NOr9WrxFL5x8mJaXXhF03ZG5uQTyrgz7v9nCC23RppBFeHx/oVIPX1N0Dmw9FanmulIPN8+nUZp
	n2Vr7N2bdc4U4Gv5AvU1ksR+cXQ0/xuVyNlzGMiLgwgQolcSg2CXVj9G2mo8xJMqBrL+oWWobN7
	PlYMxXTN/2gZ1KOv/kNisbGRwaVtV19wBf/IACBWHZTbw/r12FVxQGPfjY/30jZ0QmSV6DmjOtR
	tfOcbv3X0ojF08Cr4UQ+7V3NnsJwcX/XW07KEvrRag+Q7+ZVo=
X-Received: by 2002:a05:6402:2809:b0:6b4:21c1:21a9 with SMTP id
 4fb4d7f45d1cf-6b7778159cbmr3839503a12.31.1794464448878; Wed, 11 Nov 2026
 22:20:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261011222234.2098904-1-mhun512@gmail.com> <179406798190.3424803.7064068903462702662.b4-review@b4>
In-Reply-To: <179406798190.3424803.7064068903462702662.b4-review@b4>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 12 Nov 2026 01:20:36 -0500
X-Gm-Features: AclHuK8iacxlbWVlhHrmZf4nXYKveYZX5zn-UdiKOJPEhizJAmxWAuRAURZ4Y8g
Message-ID: <CAGEsz8FAOrkf7AzjfJS+ZXnU5eZdTbSjYtVtceBimH=RyMz7YQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] ASoC: mediatek: fix AFE IRQ registration and removal ordering
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_222052_624532_41A00C7C 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thanks. I've rebased the series onto your for-next branch and resent
it as v2 in a new thread.

2026=EB=85=84 11=EC=9B=94 7=EC=9D=BC (=ED=86=A0) =EC=98=A4=EC=A0=84 11:13, =
Mark Brown <broonie@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> > The AFE IRQ handlers access regmap and PCM state. Register each handler
> > after its inputs exist and release it before the final remove callback
> > or managed component teardown releases those inputs. The mt8186 patch
> > also balances IRQ wake settings on probe failure and removal.
>
> This doesn't apply against current code, please check and resend.
>
> --
> Mark Brown <broonie@kernel.org>

