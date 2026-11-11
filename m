Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F996606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 16:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T6HUOcC3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l8RzmnPs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LstdQ1KayOvKvBdXTZ++PJBU/OdNbClhnjMs5/mc9b8=; b=T6HUOcC3ZPtfoh
	gxx8/G827raOPcOrK5n34F/ouVff1UVMwgNsEWhjfb1tznZTTn/Zo2csL1xJLXCYPhczrHlIU1omv
	FGjWlK5ht3NM2T87OmQLizYXfGwWRdDbXWqc3V6Z1He6q+uJWF9zKoIs05KbWNf8++bCRNHa4Bjms
	s1vHfXP28/xZjbPKxhfWlSJKfVtIMJHGox2Vl2BJIOrwqpAhewnDEK7PrjoY75qFEl/2XeiU6qOfW
	gjWMf5SnvtdaB8hrYTw7mONxa2twOJot+39OJ6RxnyVbb0fp7smPHWvxyl4QFPOUWKKGO+5jYwTpU
	1LPJmGjqmUcloqgERJKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRB0G-000000079vf-3xUn;
	Wed, 11 Nov 2026 16:16:52 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRB09-000000079ow-0U7D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 16:16:46 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-54f873cbe2aso33612771cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 08:16:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794413800; cv=none;
        d=google.com; s=arc-20260327;
        b=EqgwKLTSH/AIa9GoRk92AsxQwHJcfd+kF4bVyIAc96cvNjtrnPUsydpyZddrMsp2f9
         azLLzqZZOjrVQLCUjTUFoMyI4E6DJkZgsG8Kc7OxvFcZC4+7ZEAxaat8I4KrMKN/tJul
         V0Vs4QxejC76WUpTGn8zIPQ7sTijknedOv4mnLVG+VbFSjSICMmYsWkTOHRKwe5wtBDz
         5AE50IFAWDv9QZTDIOtP2TY2oNvPAgRMY+TFEhQyXAyHRao3RGpHmKGGZ+4YqtKeTgC7
         UM/LvsnPEgsI6U9H6LdsplSgFtJbhB11FqwtcBfGsR/ctyAxoDlGgqpaj0Y2iDLLL3hr
         mZ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LstdQ1KayOvKvBdXTZ++PJBU/OdNbClhnjMs5/mc9b8=;
        fh=ecavfxOdK+MszCdj548RHf1IEoSB0mtH6ORZ5KHPHvI=;
        b=JD/5OBzyqFao6jb6ayGvpGWz2Y0uuLpD7XdXbCy805853FV0/mmOC1z+7TjRSM2fpq
         n0KsAs9oME7FOJFRZpVFBv9WY6x2blVpZDLJdbEKB4AQ8AAiM9TORkADZFb7aa0B1NIQ
         NFZhZi6mEDnI5ZxhH4vGQKcSfZu/8GwlLugojk2GcOtQ/DnZJ2wDBxRilbfo731VAeSM
         5PH453qkR63htozSxUbzFN7c5xeS8vpz5oe3lzhYQplIZ56uKOMJHVs1Es2egiqrCj9B
         zoYFATBoJ619qEtzjZPJDMG4Y9cJvciHNNf88Mme2bLjIycQImjm6kpdgyHsJSspUdhP
         FoDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794413800; x=1795018600; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LstdQ1KayOvKvBdXTZ++PJBU/OdNbClhnjMs5/mc9b8=;
        b=l8RzmnPsjw99OLMSaYNiu7YhsRtf9cceCaUIsBcOB/RwYijpip9hWFQAxF/nSCs1tP
         yCmW4fY7w8T0BsFE8SQv7FtT2u9TOAParABoL7nvhO9y1C9SOi8bB4biSebULotWO0LU
         am/yUNRA1ge1ZI9keNJEdYaBOUk97q8y5GOMvgVzNVynzy+48RMxK3MihKxwhwOD85jp
         Sp/lV1nxCWV/KTDWOobyoQqTlfqiD3Kmao05uhuAB983tL5UXAcmZZ38CZCBavkm58US
         UToG9ZDrXD/aJZSflTP7If++VzruDJJAHlNh6uxjY6v20pxUcJZqDUWMh1nJ+OvGsfEP
         31CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413800; x=1795018600;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LstdQ1KayOvKvBdXTZ++PJBU/OdNbClhnjMs5/mc9b8=;
        b=VrFtxs5AmRm0bfX8/ZRfYGgLfs4k56HnF8GA0XUEg9xXxaflYJCZ/QGrXkTS+9rKeA
         UZInYdSSfSg553U3tahBrwn1JezA3XL2/6rWxwenuQI8JzNc2o5IvtaZYvgZq1UbHas+
         1GGFx3IHiaMIDHPTbQpRsUsrG8Db7cTCl7k+tZSLaVTaP9ujJ+rweocTV4eifep5fVSX
         ONoDGdFdJ60rVJmLsPAjFd207gMg4Ukdu0YHSsxTWkfj1uqdCvpVAbGjIxUVbkTtm4XH
         aC3zR962e2Yl0VBcAxiJbRNdWFEkCqynmQuntY/j+Q/cON3br5RO4O9rJax8lAq+BtPd
         KT4Q==
X-Forwarded-Encrypted: i=1; AL+hErGATuBeGenF6/r247e55REUJ4ssMhg+t/epnkrpqy94C4yCAz079EIcXFopecaOD2psTKJqKiWjdFDnipTd5oR/@lists.infradead.org
X-Gm-Message-State: APuU4Z/faqoHyKLiVCpbrcsjKC8C7zrSz5pxhsSsBa4VBCW3ZuhWvRRX
	10zTE2snDsG0YGhvb2AQOjID50aU1pL3gxqYoGsMGeE8QBephlXgWBNoIY5BOyUZO0iX68haHWi
	vxvimWTqimN4Gm8/kLdIHdF0nI/ON9sI=
X-Gm-Gg: AYBFou2+e8VsI5ydt5UdZcNm3lLUyLsn8KxUqCMb2xlcb8tdJgU603EPRn1FLvqACjf
	rfImoL8CDuD5Apm6pU3rEBLatFmUkhfAG6ZOVZYoOgBI00X6KiFyadUmHHJX3AMsNynwf5ms+O9
	3j1FjCiBVWdyyiVx2+lctIBSzzkEnsgEHk+4f5w5J99AYc61wH/LM9Sa5hX010HOYkcOtabz4La
	1uvyMIhLcBDwvpXCcEJ5LDWnn6YL1g3OWIat/OTbjv/Lp3W8p6NrPw+lFQNr6K9tAyenT6w3u61
	5noEpIWF+TcdGm8LjE30eSRgYUj7Zjojl4TQaLcLKX/YP8f1jVe3RNmkz1dECjMxRQHwgSMAs7J
	kFPAmzDd5wlpCu4kBEMsAZlgKWH1zH0etWVU/6kSlyZVLNmLJoOFvnSGsB06nZT0KnSrn
X-Received: by 2002:ac8:59cc:0:b0:537:f05d:abef with SMTP id
 d75a77b69052e-556c1d519e6mr45516351cf.54.1794413800061; Wed, 11 Nov 2026
 08:16:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260917155834.2161361-1-vulab@iscas.ac.cn> <CABjd4Yy-9A0xWCDfZemHOTZDrDdtdO05nUjmN=w=sLwYjzZn8Q@mail.gmail.com>
 <1794138380.2883200.vulab@iscas.ac.cn>
In-Reply-To: <1794138380.2883200.vulab@iscas.ac.cn>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 11 Nov 2026 20:16:29 +0400
X-Gm-Features: AclHuK_TvAgrqod0P7IPbUF8DOI19D1hjrLWu98p4t7n70-06Rpy9qCBuSwEasU
Message-ID: <CABjd4YxYzrxakckCaNODgrCWUfx77J0h3D+gbV95p7_gt1kiog@mail.gmail.com>
Subject: Re: [PATCH] serial: vt8500: Use devm_clk_get_enabled()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux@prisktech.co.nz, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_081645_204810_9F9FCC8F 
X-CRM114-Status: GOOD (  29.39  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Wentao,

On Sun, Nov 8, 2026 at 4:15=E2=80=AFPM Wentao Liang <vulab@iscas.ac.cn> wro=
te:
>
> Hi Alexey,
>
> Sorry for the very late reply. Working through the review comments I got
> in September has taken me far longer than it should have.
>
> Your suggestion was right, but the leak fix went in before I could act on
> it: it is commit 9d8955281d92 ("serial: vt8500: Fix clock reference leak
> in vt8500_serial_probe()") in mainline, and it kept the clk_put() you
> asked me to replace. It has been backported to the stable trees by now as
> well. So the patch below is not a v2 of that one, which would only resend
> something that is already applied, but a follow-up that does the
> conversion on top of it.
>
> devm_clk_get_enabled() gets the clock and enables it in one call and
> registers the disable and put with devm, so both the manual error handlin=
g
> and the clk_put() go away. Probe now returns the error code from the cloc=
k
> lookup instead of a hard-coded -EINVAL, and the clock is released
> automatically through devres. The success path is unchanged and nothing
> else in the driver is touched.
>
> For the record on where this came from: the candidate came from our stati=
c
> analysis tooling, and DeepSeek and GPT-6.1 Sol were used to audit it and =
to
> help write the change. I reviewed the result and I am responsible for it.
> The patch is build-tested only: it compiles cleanly with W=3D1 for arm
> (vt8500_v6_v7_defconfig, CONFIG_SERIAL_VT8500=3Dy) and passes
> checkpatch.pl --strict; I have no VT8500 hardware to test it on.
>
> Thanks for the review,
> Wentao
>
> From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> From: Wentao Liang <vulab@iscas.ac.cn>
> Date: Sun, 8 Nov 2026 11:41:30 +0000
> Subject: [PATCH] serial: vt8500: Use devm_clk_get_enabled()
>
> vt8500_serial_probe() gets the clock with of_clk_get() and enables it
> with clk_prepare_enable(), so the reference has to be dropped by hand on
> the error path, and the clock is never disabled or released afterwards,
> even though the rest of the probe is devm-managed.
>
> Use devm_clk_get_enabled() instead, which gets and enables the clock in
> one call and registers the teardown with devm. The manual error handling
> and the clk_put() can then go, and probe returns the actual error code
> from the clock lookup rather than a hard-coded -EINVAL.
>
> The clock still stays enabled as long as the port is in use, so the
> success path is unchanged.

Thanks for the patch, but you missed the sign-off line, without which
it cannot be taken any further. The concern raised by Sashiko in its
reply is also valid. The whole bitmap is quite an eye sore frankly, so
it should probably just go anyway.

Let me take a stab at these - I'll put you in Cc.

Best regards,
Alexey

