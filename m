Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FC0606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A5yJbxSW;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D7N1RxeY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UA99tMdzwZI6vPjr4l2t8uq5YE/+8SMplB7ARc+Cy2I=; b=A5yJbxSWdAR8cv
	vJY6tnC2m4pz3VBv1vyPHTNcDj0IIi5Mq3SgIxZXNrtuCBdZHre2KR9inwi9jFBur8z+GdAXMWqMY
	7LUJN9g3AFD/bEke93KRUX4qwrKFu65kwCOMGbXqceT2jzmOUngqUcYNXw0LU8Itp92aNqnnKyQDM
	tOSMfnm7bZsXzdbiy4IBGSP9ZrtikgkJKaJSy4wNticvDPfktD7+g9uQjEB2hBEkoFx9p4tiCCl1g
	HlUpbO1SkrY54aHH+bSBCNCIzOq2Ew7l88Luzf5NU4VizHK436jq/ntyR6jzAaiFq342L8A3OUR87
	dAkQlRTgX2b9eIYIUn3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVeY-0000000CWnI-3ivo;
	Thu, 26 Nov 2026 09:20:30 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVe0-0000000CWTu-0AxM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 09:19:57 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-91e7fc8265aso13670386d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 01:19:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795684794; cv=none;
        d=google.com; s=arc-20260327;
        b=fZ6VzJIL3hbHMtO0kXwBDyhvrCqFxAeH4gRUEj0LngdhyZ/QNxBQalX7RUUsAMqVTn
         xwNpnKB0eP9XCraiaRtEbOMb/aJMM6CNxzu8vheBuNAD2Vgoz5oy90a9m+faM73o5s6m
         Audas1NUYfinXWjq2CnnDTWkF6ixo/pigkokxkNmzXY2b0x82CTNKB0zScuGqYerbpTa
         ACRcxkTj3EfW6oUpTf23gIDox35V/yEB7rMRQrIj+G3aj/WJyZ51ZFD/EXgX4OSdyDs4
         JWqK2A2Su5N8LgysHbxu/2ibz6flMhF7IJrW0A+NJHFuoM11DnAz7a/chrD/Zrr6z6hW
         wIWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UA99tMdzwZI6vPjr4l2t8uq5YE/+8SMplB7ARc+Cy2I=;
        fh=zDYV7JHGdKjPzeSr3kkMTrlrWSD6hB4okzLU9gy9GGA=;
        b=GE2r+ScxI0Sk0Zhf+b161TpBFgUsiVGkjiN1hFccayWru5u80zcfgyhTqcrPO68/Aq
         WQyZ19KJd2+jEyxc7BSNBoEYdAlYGlMDRqB/SfL4udbYi0QvaE70Kp7PMdO4Ly9MNdRd
         NCz1pGQ1bwTlia9ycfDUlhZzI/KxWy0QcrYj2EMqwPi2Xp6xAEHsbf+yTQ9qcym3v/Sv
         2b+t09mZ0Ly8R4HxZE6q9DgOBDEP+kCFTDaXCZDROx5335C5HkHXo9n5q4aJ4Nv20dxq
         7qU2VTDrfbDjC8cX9n2oU/ZynaWvywJ2S1XHZqviPrKXaBbvaL/xW5+tbKtnAuIUcf5b
         l5tw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795684794; x=1796289594; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UA99tMdzwZI6vPjr4l2t8uq5YE/+8SMplB7ARc+Cy2I=;
        b=D7N1RxeYJMscwA5bTwHkyZJWIKqn/FN1HeOFAt1Bq/daiRgdoA30tWykfQL/x+ttkU
         31KfqwCqj0SqzxNhmbwOE7mkbLXnw70sUOA+9KFZnDobOdFnTsRHsrn311QkttS5kv0j
         KrqwBE3grUOOiv9v5rBV5NOrf/Pd+Xy+maTlLJs3+oJY7BoTW+jv1pVzfi9UG6lV5iqY
         qIzjMIrx9bTgogTSEgcS028iAiAQ4tqFWLdSlnogloSXR6FEDP+63FDz4hqNlbYhOygh
         JCl6mkfxRyNbYHqEyZRSw3CHUxhDYqXkN4Oi8MB2+JNBnqUktFqeGd+aizhoYOuWydv7
         rglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684794; x=1796289594;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UA99tMdzwZI6vPjr4l2t8uq5YE/+8SMplB7ARc+Cy2I=;
        b=JOWFPZYgVHtrpGD2XfMHjlkHPPFnOyc7nNZeELi2kR9dFuEfj9OXf9V4yCe3rKhMKS
         iN5uZmSGDpFELr7bk51VP3b7P7UL0pD6KuQrId1owYC5JCaKYgqdZNuDEAglVHc4u5Ld
         wUaWqSnFbltKXK6g3VGZ9aELmozhY9IkuKlrbuqzFDHhabY3vdZPj7WtaoFgYK7xXSxP
         VUCzHVTIDj0O6DoT0Q+VmV6Bu6VNX3yhxn6VnCw14VAD+1ewurNx+vxizX5fky/h7u36
         o0qKbvu+Tri/VgOC++ihGDzcCCHw+I9MtOI6EGHxWTQsTvufHjUzsmLNtjgO/wkYWmuv
         yZxQ==
X-Forwarded-Encrypted: i=1; AL+hErEtNZa4ifrTYSdokyxUfYBdlSx6Fb/6jwdTAhC/yMnMIZw/cEA7Koh2bAPBrlQ4AA4Oa2IU2qeB2ltlNtRNFRDs@lists.infradead.org
X-Gm-Message-State: APuU4Z9jQH3+EL7zeSkAvMDZOKTY4qQ3u4AUnTx8TTZe3pHmQBxuCd0Y
	k22KJuaCWwNL3HPPn7WHUJd9JIR8ykpFxGhNrX2/cpqZMk7/fB32gGtUptG/9xk+HPHkV13RsyC
	9k+KQzzn/v1EtumcIhD1DJrwe8Y8SKL8=
X-Gm-Gg: AZFdTZcg9RE9WJkKZvjM2utaDQ9WYgBICtUrLZl2rxvwpTXbC1w9Vd1Mif3VWzFTT3z
	/WbpxaR/fJ3BzErGla67Vy021vlT4A5U6COvFbXTZV63XKt1y+3EtO+91+ybWtRr+11cvQly2v7
	TigiAqA+rrScgSSQOznZrWJFTVbEtyaay0kc0p02gGRuc9Fo6REWKpX9DCu+cjEYEm7ErfJ0cfA
	8fjq/eFfBX8JHCkf4AjVYtp8Sp4HuUbLYHBSWXyg0vHm1aebFuOVjd3JEGb5sAm5uXf9XdU4i4r
	R81sT6BsRsoQsrVdCU2G+ZzyzrifQhPm9N6tG93IsehDdcsWvn5W6yyPjdfLZYEXe5z3HRcPdVm
	S+lAaDhK5aqejQhbvOzd4M8o2jCjfsyiurB+BjixmxzagOLkoribm4Hu2Fw==
X-Received: by 2002:a05:6214:4704:b0:921:21ed:f9d5 with SMTP id
 6a1803df08f44-92134af8629mr316655716d6.38.1795684794393; Thu, 26 Nov 2026
 01:19:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261125111929.3395740-1-zxyan0222@gmail.com> <544205c7-7590-4a6a-8abb-0199768ed283@bootlin.com>
In-Reply-To: <544205c7-7590-4a6a-8abb-0199768ed283@bootlin.com>
From: zhu xin <zxyan0222@gmail.com>
Date: Thu, 26 Nov 2026 17:19:42 +0800
X-Gm-Features: Aa3M54oz8uKYvBtRCaFsIkKluWFn0wSjjEFxOCH-vgc1j273HD6pimb83pZTgGg
Message-ID: <CAP7veT+ZJ_oW=PueTUwrZ9jGj=oYmRxYNRfeVeM2Rkr-RThkeg@mail.gmail.com>
Subject: Re: [PATCH net-next v5] net: stmmac: program the FSM timeout timer
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rmk+kernel@armlinux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_011956_103956_9D0926B6 
X-CRM114-Status: GOOD (  23.91  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Maxime,

On Thu, Nov 26, 2026 at 4:07=E2=80=AFPM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi,
>
> On 11/25/26 12:19, Zxyan Zhu wrote:
> > stmmac enables the FSM timeout checker (TMOUTEN) but never programs the
> > MAC_FSM_ACT_Timer register.  Per the databook the checker only fires on=
ce
> > NTMRMD is programmed with a non-zero duration; NTMRMD =3D=3D 0 disables=
 the
> > timer, so with TMOUTEN set but the timer left at reset a stuck FSM is
> > never reported and the advertised timeout protection is ineffective.
> >
> > Program MAC_FSM_ACT_Timer right after TMOUTEN is enabled, deriving the
> > TMR field (CSR clocks per 1us tic) from the CSR clock rate and using a
> > 4s timeout.  4s is chosen because a PAUSE frame with the maximum 0xffff
> > quanta stalls the transmitter for about 3.36s at 10 Mb/s, and a shorter
> > timeout could wrongly report a flow-control stall as a stuck FSM.
> >
> > The NTMRMD field holds a power-of-two microsecond timeout per the
> > databook: 0x0 disables it, and 0x1..0xa encode 1us, 1.024ms (~1ms),
> > 16.384ms (~16ms), 65.536ms (~64ms), 262.144ms (~256ms), 1.048s (~1s),
> > 4.194s (~4s), 16.777s (~16s), 33.554s (~32s), 67.108s (~64s).
> >
> > The issue was hit in testing on dwmac4 and dwxgmac, where a stuck FSM w=
as
> > not reported through the safety interrupt despite TMOUTEN being set.
> >
> > Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
>
> [...]
>
> > diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> > index 00be2df63d22..659f5db528d3 100644
> > --- a/include/linux/stmmac.h
> > +++ b/include/linux/stmmac.h
> > @@ -170,6 +170,18 @@ struct stmmac_safety_feature_cfg {
> >       u32 tmouten;
> >  };
> >
> > +/* MAC_FSM_ACT_Timer.NTMRMD timeout durations */
> > +#define STMMAC_NTMRMD_1US            0x1
> > +#define STMMAC_NTMRMD_1MS            0x2
> > +#define STMMAC_NTMRMD_16MS           0x3
> > +#define STMMAC_NTMRMD_64MS           0x4
> > +#define STMMAC_NTMRMD_256MS          0x5
> > +#define STMMAC_NTMRMD_1SEC           0x6
> > +#define STMMAC_NTMRMD_4SEC           0x7
> > +#define STMMAC_NTMRMD_16SEC          0x8
> > +#define STMMAC_NTMRMD_32SEC          0x9
> > +#define STMMAC_NTMRMD_64SEC          0xa
>
> This whole patch starts to look good, one last comment, sorry I
> didn't spot this before. Can you put all these definitions
> in the "common.h" file in the driver folder ? These are some
> register values (same on dwmac5 and xgmac, but still), so they
> should go there.
>
> With that changed, you can send a new iteration with
>
>   Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Sure, I'll move the STMMAC_NTMRMD_* encodings to the driver's common.h.
v6 follows with your Reviewed-by.

>
> Thanks,
>
> Maxime
>
> pw-bot: cr
>
>

Thanks,
 Zxyan

