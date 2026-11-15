Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97EA606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 17:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CEszrVtv;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Tnk8S8Ma
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MsnquGLE3pqzvl2AB6wbuvaSxBLJ6UrFg4ezX2gSrs0=; b=CEszrVtvt0xJL4
	ore+86UZyN1XMkf9gklTGTVF18J58lipQ1RQPM3xbYYTC1WaVqOgnfJsTJRg39fvMYfevy2Yq2zkZ
	GkMgwUnqUZ+swHAQGRDX6dW7pg9U15CWSZycyh8/fFFXSz1dYq5JgMeVmhdxqruyyNSJRjESO5NFM
	rLrjyb/yBwZJaVez+5+69u73buPUP9V04pyC1zfmx13gYrzjU2xaWtp2x8yzpW8GpdgkLlZHJP3bm
	jSZsiZLjjuHvV1v1qz5+pVrfACsJArCa+w9mCUD7yw7WaiOSjnuev63gHyhAujzfGR1kNIt2wzCkh
	ivJ7gXIVznoF8gT/41KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeSh-00000000HrC-2mOK;
	Sun, 15 Nov 2026 17:56:19 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeSf-00000000HqH-1BIY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 17:56:18 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-6798eb0d190so1875652d50.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 09:56:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794765376; cv=none;
        d=google.com; s=arc-20260327;
        b=RB9SCqLFqDAAD90a3fw//3tsV5IUP8RN1WTy7lj1uTMza4CCAEPUDuE4R8z7mGG1KB
         FDQi90pKkCi/6/DE4XR0We4ikPN3hIUgRUe9wzBY7hmdCjnL3MIG1cn9vWGdD/m0eeBA
         LXsVDbD57RIVHHtB97PAkjnCrUlajwNiXNvqrhI9yhvVtyOkyJcRup15Yj0wt22zVSGi
         j2SBGvjGW8ns5DwKVb4PUSI+Voy7Fo9mLI8QS+FsaEFJVhVXQozcQljMQgi/r5+WzDD3
         beizAmKyHu0HwLJlKcStktQswqrqBEiXUPFiQmcfXMVUu6AT3SgfhA5LykJQyoTOZWJ9
         8xmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MsnquGLE3pqzvl2AB6wbuvaSxBLJ6UrFg4ezX2gSrs0=;
        fh=LrSgRKAi6MlvcrZfGC94RUSd6/IgOE1tUz6RDPSsb2Y=;
        b=kpsiWOYwnvVNRdMz3PZMUeV9fgQgBVjxU39V8i9fuoxsKwLTnzLebk2Z3ksK8U7Irz
         ZboaOZX8mhtFOi+pRTQNqUd2s4IiIkctUgb4m2Nj6FqLhBWeozjyIA+4USOGsVg0G6wu
         sBgiZdK8cnugrAtKdBq7ALuzbq7mAZrGD4ft58E9jpVrBBjwSLTSVFItoSnQDkzLolcW
         lurg3Ek6789+izHjwCc2Blzbb9+hRugI2fUz2K69kXM6JIeHXTKL8VDBmA7MFDdCX8f4
         4qB5zzplhKOp+acQefgzW7mkdHzbSr2JSsci7IjdzPGTBhn0PUtM6PwST4ZxfArQNiFE
         bAmA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794765376; x=1795370176; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MsnquGLE3pqzvl2AB6wbuvaSxBLJ6UrFg4ezX2gSrs0=;
        b=Tnk8S8Ma4y+2LYOpQz5pELW3vVKcrd4XWZHYyct76whRhZYRIp/EUYQFFGWtParv9W
         Leskk8PWS/HGpaqz/8qPcDB8ezEyBmv1++TuOcUN6xbnVxf18ez2bIxe1w5MMS7V1KXv
         L/U09JehI0vniLzZqQixMIqeQOhcOrT4g2kWT9/PbIc4WSU/nArTzFv41bt1FlOiCYGP
         LwsiRkIBrmVJeRAUeNVso/o4l7UTKG58eAoy9864bC1UWBcndODf8KWpCBTxwAKwYZB9
         7SPn+YRup0ye5QTH1yAQBx1YYoE0Y2qbJAXBosEah7HSyWiW5H0cTU4zOanpXA/KTbl1
         EKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765376; x=1795370176;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MsnquGLE3pqzvl2AB6wbuvaSxBLJ6UrFg4ezX2gSrs0=;
        b=bYpCBPFwOAsoKbyvn1hwMAD1rp/ScULWUO3vBO50gBhP0AFksdRofJJKk4f4kfvGoX
         1ZLviRwH7ejYHu3EAO8TlFrE8x32nqNZk7RikdiHHMvlQ2rbM2SRPbHUbHNaupCJiEmf
         ZpzZNZu/3rYsIcboIOgszuwNsFtdRlU4qtjsDMpyDHL0/8C88vEVkRiQ0C5htBzAQtpa
         5styTG3zexjm4syjK2wS1DUMyU5LUex4R2cFF+DJii6eJ2ufT1szWD8dDeB8xek2tYJY
         jcyQW6dCx6dS0nCIQJSV11eElCY8s9qjDigoNAV+4TX1K5RGw1O+WBhVQKjO+HPc/gAL
         J/eA==
X-Forwarded-Encrypted: i=1; AL+hErHqPFsy1HjMDZ9B9/FFAjKHB3y/+VFsUWvfU3kR+kmJTQpMmfqTK420dexcScL6bQG5+D8rLLu61TNfckSu+cOx@lists.infradead.org
X-Gm-Message-State: APuU4Z+GKadwHnZDg4/JGXlTsgg/5MlYnQbD/qVbT9xt1nfPzXeEWDwX
	9AfaIOqlBGoDn1gLVTxr1yzWj8P91p4kURfPVe02xyAXGK3/rhNgTDrFLgE4G+J2Ky7CmGD/8PJ
	H5T+mKZ6TKHrELlPbR6qvq8KsFK2jrD0hYWz3
X-Gm-Gg: AYBFou00/daMkFxokXemdRg0OfQylnNa5FUi9bVNBQ7hR/6ToEfMkK2OE/2MmPoDBkk
	ySTmLNTfPyppgHeZOm4tn999xVtkaT7gI31hhK5glFoy4jXm836uvLXNdeB2Z24z/24mMOQSrfJ
	QRUmNfUE10/szEFgA1kfhL73bdW++43dtyt/CyH8euBB4J3CJeRUS01kPuWelYUZ+03pzuCODF4
	IUdLn8bXJU5EAlwcIcBde44jUK6AGMr6rpbWKNFFqALTq0v6+2VFE4RUGGKgbQ54MSaGK+FCXZh
	3s2Z8Ayn5nyCvp0b7xop2TbKb+9+//5JI4NABv2EeMpRJTB8t8l7+Oz4cM4Mkjnayg2uClqvuX2
	jgciY7pgjpi1tIogqvThD341DiNvx0KK1/TusAJgJDTtkjiUTjnPyk9f9lgYaFQQKMd/ebg==
X-Received: by 2002:a05:690e:4852:10b0:67b:abb9:3d15 with SMTP id
 956f58d0204a3-67d895d195dmr3505161d50.24.1794765375839; Sun, 15 Nov 2026
 09:56:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-3-tanure@linux.com>
In-Reply-To: <20261113121852.334604-3-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 18:56:05 +0100
X-Gm-Features: AclHuK_UkljuS9ciZHxa_G9-g5ueKP83ug6GjLSD0viVWSMIsEbzxQPrFL8LXzo
Message-ID: <CAFBinCB+DkFDwXm9L+NYgtsUNR2F01xhJJnHN_8ydcRjcpNU3g@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] dt-bindings: net: add amlogic,t7-dwmac
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_095617_356930_8DA73DC4 
X-CRM114-Status: GOOD (  14.64  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 1:18=E2=80=AFPM Lucas Tanure <tanure@linux.com> wro=
te:
>
> The T7 has the same ethernet glue as the G12A but needs two clocks of
> its own. The controller reaches memory through a pipeline stage with
> its own gate; nothing else claims it, so it is switched off as unused
> and transfers never finish. The glue registers share a gate with the
> MDIO multiplexer, which probes after the controller has programmed
> them: the writes are lost and the port keeps the bootloader's delays.
>
> With a newer core, a clock list of its own and delays that follow
> ethernet-controller.yaml, the T7 gets a binding of its own: the PHY
> adds the 2ns, and only the receive delay line offers fine tuning, so
> only rx-internal-delay-ps is valid here.
>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Looks good to me in general

[...]
> +      - description:
> +          APB clock of the glue registers PRG_ETH0 and PRG_ETH1.
> +          Without it, they read as zero and ignore writes.
Please give Chuan Liu a few days to clarify this clock input: [0]
It would be great if he could provide more details on it. If there's
no reply then I suggest going with Lucas' testing finding though
(which means that clock input is correct)


[0] https://lore.kernel.org/linux-amlogic/CAJX_Q+0seFwDvd6zksLnJjWYJJY1QcLc=
1gAjr=3DFN1p+aTdumpw@mail.gmail.com/

