Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F80D606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VzRQdkl3;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=pNXYbyjt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Kz0XauTGdOgnd6tw9kPNk/ldh50fDY3LEXEPBQT0ngw=; b=VzRQdkl3GwCdao
	RIIxg9c3ei9z4j0D23Y4V03f4EYJoyByRrUFmx5Fxbv5BwzhyE8Pd8NL5LPmWhML66bVWlt62KoYw
	Y/miyops4iZJokzDzBG0ePbqQZ4XST2l3AP8Ut26BHpvdFFvJ5csezmBMIQ4x/mng9xFRCFNwaHfG
	WI0uYqK4yGUv5O6dGaPu7zym09nKzbVA0osCKflRfvbP2PmZAMcm1UsVNzPBk75+5+Sj/V4N1Smdh
	vjkQDO4ZGADQO9wF6jBMPwtebgp9SZxlbYImONZmZ8+YfGd/LaQSZ1qefG3FzVDI8PELvSk6/bldR
	DsGcljSdmJ43R5z/heOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxxU-00000007r7G-2OcG;
	Tue, 24 Nov 2026 21:21:48 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxxR-00000007r6Z-0Udc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:21:46 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-8b2d14968c9so47918097b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 13:21:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795555304; cv=none;
        d=google.com; s=arc-20260327;
        b=XNZ3wEpzzzNxVa3SeeM25+5bXqt6vh7CTGzHYa6FHv6sUI6+7dqhzPhc0gZ3mDZJYI
         uQkT2XsVcvVZanBz+rVTWFrluLEv0Lt630gKUiu3s9UYBg8HDUPsomwY2DmEmMTycYiw
         IGB/Sz7fk1k2Lo7PIVu+EOQuO2TTU3C+qTYVqDdzxTBmJIx96Rycksbr6Fi/Ir05URfg
         mkkO/k3uwu/1JNzqFQs1RGPPuICBCh2evKg3WUaWQPxFBZ4brWF8owB2wbfv/cgpekW8
         nrjVZuPeZUIjVUttldI06l24CH5cNiypKQd/ZTh4Ihsguxp9YETebT0Z5PCJhHs8bolt
         5xmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kz0XauTGdOgnd6tw9kPNk/ldh50fDY3LEXEPBQT0ngw=;
        fh=quaA9KkdAfXiOo+hZXXGcrVQPM2h6SRIZicC7IQWZNY=;
        b=RcBwr87oJYke1PQSXQJ8x49uOdxhBFhWAcvJd+4VNgXknUZqaCbls40qEn6koC6ohN
         CJ1dsbq0O56fk1Jz1UN0QtgqRwzh1BFFoozZaNYYxwkBEw56XuOhqxVbu+JLsbwpmjfZ
         WY9sBsBAIfCvYs3zuGhhLdoQI8r2u4aB8fDvR9nJ1mt8+Wv0Us2T5YnSHCtgzc2NG1rN
         DJ/5suSrrlCOGidRglRQELi4nFGELGklCh5rrT4i3RuatYsi0lcUMPvV6Ijepn8eSwyt
         +ZyX7KV9SHKupzGFfEOjC8Io/VxmRVH3NNB0mE2vet1JFiiB1KtcmKm5JSu9gU7t0MBr
         Ey8g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795555304; x=1796160104; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kz0XauTGdOgnd6tw9kPNk/ldh50fDY3LEXEPBQT0ngw=;
        b=pNXYbyjtKqLDELiwgdz1Rmi1CbE9r9tUAVMt0CU4BSXP/0GLUnFXWpUIK8jpumsalP
         yWcRPazpjzRgvssf2hqb7O5oZy2WQCigtAVnkw6GSgQehzju7d4p6al1EeuOMxB80BC6
         3Yq3eMkf2JdIcklStbxdniOPgW55QzBgyMOy3sXqmgaZQPQDAHXxjUPc12gU8WgOGx5g
         vXFvNZVqIU9dP53XKFBYs9GxmVaATjX6gEFKIUdy/WPrZbZKxI3YjBPoSICn4u92IHle
         34fF8o4gggMxH4qi/8r0k2K8cdD8IDURuVHe2nfHEWzi5BRN5deQaPDAByW+LBCwtEQg
         SnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555304; x=1796160104;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kz0XauTGdOgnd6tw9kPNk/ldh50fDY3LEXEPBQT0ngw=;
        b=bweTV6QyjzL49WmnVOgGM9T8s9d+L41Mf9pft0V9RjCs/NtgCdcx28xgnUWFnuniRr
         QBlErWuVXB+O9uxd8YTkVrTZ4MJ7GgX8uxeuBiWPiSHEa8etTGniyHiuyyk4jXkMJW6s
         mL7mSYZSFeScakIg2T7xjk1qEo9zhBFZcfDRFxaPkEVyEtx8hwzPhtUBn1PUkaJpJ+bb
         BA0Ohd93mUpWFL8f2FL5ps2WjdNkvlHnd9UmzHu1wMBAN5v51RadwfkfPha1ikCycogZ
         m4jAFIbPOyxJC6j4q5TgtqQsSQ6FZwlG+aSaa+5XJ3TgC+OBrExduFyJMDlJxZpe0uCJ
         2gmw==
X-Forwarded-Encrypted: i=1; AL+hErGoyqlMCdRik//pI6C7EBksK3UmvFalgJaq3oaXmSHCJqSkbinobhxtkZnsXpeBcFq/jXBG70kkOpq0xhLcdK4i@lists.infradead.org
X-Gm-Message-State: APuU4Z/i51phEqJVJmW5GX8Oz5rVY2ERCZ9auCcs1nDzh/ddvszBIWeu
	AxcwGzcgHFOJYLAR/yEkCM9H5X9lIPQQmKXW8gSBrp4tlzU1imUXkt2QOcYoDBiO57ioWA30lRh
	KaWnCC06quVa7Ue1Aiy5e3sVCYx2Qwh3JMet4
X-Gm-Gg: AZFdTZeVlvjPePA8mt6PKJblPVI5XaOv6dQVRanIaHWZCBXq6MUpHllMTEVD5QRmr5Y
	UAFg7QTwKr7KalK9uveaMRjloAQCuu/ySsATbOn8dEhUf+tXSD9SD2RjIuoXLgBq4iXsTzgpBqK
	YzjzfvmYMzIXkaAbGROZKGt3mr8Cpo8WcURoudgYbNEZMSYbd+bfqy2p2XH0ARYbcUAv46Qhadf
	V8xXHFboDju1qQJqjKcu3AgKBeb93TeTnI17Q7GIbapEaeraIObNxDW7Tp/nI8y1TEBm5yUoVNz
	9RwVL/zFrU+aaE2TofIYNnPR8nHV7Ie5UQto+k+5hJKjsy5rr+AUj2/NGbYT4v2hEIJqeGakUtQ
	QeFbj6Dlx/O5iVKpop1TQtG7SIpo4wclTN97W+9wb3NTv7EgA6dG4pZlS21JwSAMbaNxn1Q==
X-Received: by 2002:a05:690c:6213:b0:8b4:dd2b:10dd with SMTP id
 00721157ae682-8b52050f0demr45322637b3.64.1795555303828; Tue, 24 Nov 2026
 13:21:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com> <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
 <0949591a-63cb-4bb3-a7de-cf59ddbaafb7@baylibre.com>
In-Reply-To: <0949591a-63cb-4bb3-a7de-cf59ddbaafb7@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 22:21:33 +0100
X-Gm-Features: Aa3M54qIikBwR4PI-ZQunVxuxoqfwLNl1dfjIK5NjVa_KqUN1kcswl51cnQYi_s
Message-ID: <CAFBinCAjFb7yS4VQp+BqLw2dG61To+iU4aiBvaVE9B9bWe=oUQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] ASoC: meson: gx-card: add support for audin FIFO
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_132145_164555_2EDD3554 
X-CRM114-Status: GOOD (  17.70  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 12:06=E2=80=AFAM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> On 11/15/26 10:28 PM, Martin Blumenstingl wrote:
> > On Sun, Oct 18, 2026 at 12:18=E2=80=AFPM Valerio Setti <vsetti@baylibre=
.com> wrote:
> > [...]
> >> +       if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gxbb-audin=
", "FIFO"))
> >> +               return meson_card_set_fe_link(card, dai_link, np, fals=
e);
> > I suggest using the "audin" prefix. AIU / audin seem close enough on
> > all supported SoCs that we don't need a SoC generation prefix  in
> > there to handle this differently.
>
> Do you mean using "meson,audin" instead of "meson,gxbb-audin" for the
> compatible?
> If so I'm not sure this is allowed nowadays. As far as I understood
> "meson,aiu" is a sort of legacy naming. 'writing-binidings.rst' says
>
>    "DO use a SoC-specific compatible for all SoC devices [...]"
Let me use an example as I realize that I wasn't very clear:
  compatible =3D "amlogic,gxbb-audin", "amlogic,audin";
Does fulfill the criteria (as far as I understand it).
What doesn't work is "amlogic,audin" alone.

The GXL example then would be:
  compatible =3D "amlogic,gxl-audin", "amlogic,gxbb-audin", "amlogic,audin"=
;

And for Meson8/8b (sorry, I didn't get around to testing) I would then use:
  compatible =3D "amlogic,meson8-audin", "amlogic,audin";
  compatible =3D "amlogic,meson8b-audin", "amlogic,meson8-audin", "amlogic,=
audin";


Best regards,
Martin

