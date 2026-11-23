Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D2C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pRJlQ+6c;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V3QYBQvh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zyPgU+0dBWL7BXreM1FRldzhzHUZdzcLgwKTYre8N3A=; b=pRJlQ+6clqy3eT
	luJ/J/jU8XCgJw9sC6lXtuzWIQz3/qPBa8apHtfL3+RLqFuNaaLIdTjsdhAZEg7Y10OepY/DzRaBa
	ObNcz/X3DLo0MogDUR1kg7PLCq7UTkwdYsFrthZfSYFWxFAssWD0B0wcAfSdwd6NCQ5BME1nYZWoQ
	lnaXCfZIXNBLxJFX4QYdkBrwL224UoySiJRsyjKvnq6ZXUBxGt+Ch2DaFHwjVvJlZ1pJClV60FXsf
	rGzvpgfXSKiYVFTI4mxEONfEy9jdn143N7TwvGgVbei97vVGauYI6LeBb+EhkzfUkVl3Yh084j64s
	5SJ6GkQFsXg2U39M7Q7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRa7-000000031w3-2AOl;
	Mon, 23 Nov 2026 10:47:31 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRa4-000000031uE-3ya2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:47:30 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1690919f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 02:47:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795430847; cv=none;
        d=google.com; s=arc-20260327;
        b=ldLI2Q69V+PSWwRJeM62eEyDREefYyB46wu2DSO2NPLoN/NegNpzmQ4l3XetyFvhhw
         s+9ZQw7rkuYm3Mo9r4IbRe/5eUZDGetQl6bt/vcP82Vo3FtkH+jt/uSbVu/SIUlekV1T
         v8G4640DBZM+uONSfwOueW9Zuz2Yl7Sb0ldvRb6snCzi7kJ8gYNkU5VXuCAxoTAA0Hdm
         caXGC/5lwyjiLJhp+eLeCi4aIYIDCpEkwHOub+wiWo6Vy9boE6gh/MIWGVmdfatFH4kM
         osEgrsQm+j86bejaeArgyIQYziKsLNpVd7XCHT3X0W4g5ob4c24akrfewY5z/8TqVdp5
         M+dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zyPgU+0dBWL7BXreM1FRldzhzHUZdzcLgwKTYre8N3A=;
        fh=ZKfgM26gx09bhgzHNF7cBIVAcCsNPMjk/1HTM+QmeXM=;
        b=hS9E/x0FWhZ/d1JxCAxTrSAHtPkYf/YwxA0irgFezfsYzFxzJXcU92L9N4BtKnHX8J
         eWF8eOoefaWvG4uKzMzb4akPBRY967/uqSgzQpB1k23/oaA7oxkDoIReldpJybYFTaDM
         wUX7J27ksv0gQMF9BkVNgzvmLpSfa977Pat4AIBSB9IEsoTH+xX6zbQ5o7XC7hjvqbXi
         UVjbOyqVJogwXaThRhix0VYEqMZjJjyeV8I9fbP+1jCfQh7TeP5kmj6zVoPWtgFwlz2Y
         JMpVQ/Idfj8LlOKXKypOFqgeTbe3foAG+nuM/3F0YSdaiW0hrrjpxFQRiuVLf5tBqtM4
         epDw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795430847; x=1796035647; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zyPgU+0dBWL7BXreM1FRldzhzHUZdzcLgwKTYre8N3A=;
        b=V3QYBQvhr9c763BK5EbPIgyFYvh8Bz4PIEReb/shZe+fxAIXjPtW6F1GdVFr2/0RuF
         YLRBpLBgTvAbm4gsrCU/qYNKZFz3LqG1tk9VU9JBYC4ZSPKSkoSLnN5cTUIi8eZCtK4Z
         mcqihBgxQ+ryQxKVuj19yPi4O5dB+fdDB3gvlCs55QYG5Rh3QOPP3UlfdpyQACWRHDN1
         2JlxT5qZARwVsooxdDITdvbROTz8ZfMDDhBNY+R6D/Wvbs7p7KR7Q47CEzHlydhwV78d
         zP1qWo0xmAwpRciaJCGWyOALjqHDH6bucgAtQQM4HyR7lsy1WCh0TcL893c/TSvt5aej
         O5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430847; x=1796035647;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zyPgU+0dBWL7BXreM1FRldzhzHUZdzcLgwKTYre8N3A=;
        b=1tANu2+5FbPM5cGNqtBaecMdFJUmmxKskPaHd0LWUueVyLhFmItc+jr8GbTXV5IxcP
         WBLQa5oEN0QGwVmyZN+Qx0MfToDbMJinX+KeUoX2LEBCkn+serV+cYd7s3IsVrVhkH6m
         qDcP6ZeDyid5mk3Ljs9P40r4Lrevzhc5278KJGyVXiTU07OjeWeCv9tbmubaUKX/WM7e
         s7cWe9oKINZVyREwKIGh219Pqse/6W2dD0+4Ho/s3tVwKTIBMkUbkzwi9Jvzj1M7a/+T
         Sua58HirReN04eLVfCHrdr0JW3683pEqqxv64UKe+JwzSiPnWqKTmhgJsdCkSk//atQ8
         4FSQ==
X-Forwarded-Encrypted: i=1; AL+hErHtl8FxuLC6k0t3nvSRP+5sSKdQta3gv6p9CtLn/Rhn9YdhvJMvUi5dV74KylQX+ge655GpkWPnj62ckELpnI4j@lists.infradead.org
X-Gm-Message-State: APuU4Z/GQPmYByI6JdwFIISzGYm9aFj4EMOM0klOT1Z6eykISEgV6fYZ
	KeOOeOpX02e13N8+vCm8Sl5/fSCfKe5FTJZTirA44j+W6LTzmw66Kb9Wubomc/GaaFvmkoj7fGb
	X7YtzSdr7zlWpofmo3JxpfmoGMM3LjVs=
X-Gm-Gg: AZFdTZc7DA0B6aXMHFW22K5ngpDW4o9jpywyUZNJCHAmSBJbdzTSD81Cw6wCxZchjNa
	YvlClknPym30taniGFzq4Y41Iifyih5U74xxLdGJ6Vg9G8y9e6ordXlfYiO9DEuUa9AMwgp1sFm
	ZEnfHpYFKl5vALqBqZgbaBQtQWHacjUHYYMi93TRpVCsVh5eJir0UI2nHxAZB248wAWf16pRCmg
	BqxapYAzkC233en42H/XRDcRSRoIFMOZ8HLhB8Ihi0XZKGfla/y923aPhLs6jsyR3knO2mPax9Z
	AgrqWNypTCIWvW28aDKDFaYbXie9yrcPVVvIULyg9lELUomLKHdldg40Al0YPlmkZvICMXyMtzI
	i/F5XkGSEeBLM9XDE2MxyfI75/WtsKy+t3Jm10I78pnXHhiqJlKRVnvudxozQBUk3zQL0RoSK18
	rPQbFG+Zh/xfP49qDJrahW36x/+aQ6priDhUjzziZFt3BEjjGrWTc/Ew==
X-Received: by 2002:a05:6000:200e:b0:4aa:76ce:4b9f with SMTP id
 ffacd0b85a97d-4abb6746af3mr21461877f8f.56.1795430846438; Mon, 23 Nov 2026
 02:47:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123-dma-chancnt-v2-0-241b1672883e@gmail.com>
 <20261123-dma-chancnt-v2-2-241b1672883e@gmail.com> <awQMCxhy6BurLowU@ashevche-desk.local>
In-Reply-To: <awQMCxhy6BurLowU@ashevche-desk.local>
From: Wong Steve <shyckless@gmail.com>
Date: Mon, 23 Nov 2026 18:47:14 +0800
X-Gm-Features: Aa3M54oppWHvQUNnUqJl7rdU_k7WIXS2zavZqioNamwXEqP2RCrMovzITl6Zh_c
Message-ID: <CA+X8Sdj8OygFXHMMs8mTj5RF5WuBW1uvsGcaMff92X6k_4U=qQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dmaengine: idma64: Kill the channel tasklets in
 remove again
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ludovic.desroches@microchip.com, vkoul@kernel.org, Frank.Li@kernel.org, 
	dave.jiang@intel.com, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	allen.lkml@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_024729_010427_674BA7BD 
X-CRM114-Status: GOOD (  22.12  )
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

> You have to wait a sensible time before resubmission.
> Look at the v1 and act accordingly.

Sorry, I sent v2 too quickly. Sashiko found a real problem in the
at_xdmac patch (1/2), and I resent the series without waiting for other
replies, so your Acked-by on v1 is missing.

This idma64 patch (2/2) is the same in v1 and v2. Vinod, could you take
Andy's tag from v1 when applying:

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

About marking chancnt __private: that makes sense to me, but it is a
change to the dmaengine core, so I'd keep it out of this fix.

I'll wait for more review before sending anything else.

Thanks,
Suyuan

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E4=BA=8E2026=E5=B9=B41=
1=E6=9C=8823=E6=97=A5=E5=91=A8=E4=B8=80 17:49=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Nov 23, 2026 at 01:17:38AM +0000, Suyuan Wang via B4 Relay wrote:
> >
> > idma64_remove() frees the IRQ and then kills the channel tasklets, as
> > the comment there says, so that no tasklet scheduled by the interrupt
> > runs after removal:
> >
> >       for (i =3D 0; i < idma64->dma.chancnt; i++) {
> >               ...
> >               tasklet_kill(&idma64c->vchan.task);
> >       }
> >
> > Since commit e81274cd6b52 ("dmaengine: add support to dynamic
> > register/unregister of channels"), dma_async_device_unregister()
> > unregisters each channel and decrements dma.chancnt for it, so the
> > count is 0 when this loop runs and no tasklet is killed. A tasklet
> > scheduled by an interrupt can then run after the devm-allocated idma64
> > and its channels have been freed.
> >
> > Read the channel count before unregistering the device.
> >
> > Found with a static analysis tool and checked by hand.
>
> You have to wait a sensible time before resubmission.
> Look at the v1 and act accordingly.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

