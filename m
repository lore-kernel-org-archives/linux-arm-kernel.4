Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545DF606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rLxtWKtK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2yQ698D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JVZec+P0ncDLVtLUbU8V9WfHdjX3mnAfmKUvh9J6NzY=; b=rLxtWKtKdRs6w9
	6QfNBB9CM5fOkgNLurAP5+sxj6H/CGqMBTzKe1HRWvlci4A/bmvE1E7Nzw5Pd6DNbI6aJxinUHOzz
	9G0fMzaBFIweRM0WvnzCjXUoiOM4C+DYlI55/qZ7y7Onmmvwpge2HBN9mRwptZGiSnx5XDgQVMVkA
	zPUgqSlb2AXUVZanCo2YajMDY/tD8X2J7Q08WeoMjwzHRBPYkYLHQ1mVUN2GZ046TfJnRv0dmcPfd
	t0iZiSFb31Wnefa+OSbOVi1iPq40BLLZWiMsoDPtkPmi7IMi4ASo4DO9zgCRc2atKZaMvK8zIWRyn
	NwUQf6MH2bbQfCdOCBkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8jF-00000009Avl-0Dvk;
	Wed, 25 Nov 2026 08:51:49 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8jC-00000009Att-39KF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:51:47 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-92116a3ef3cso72385866d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 00:51:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795596705; cv=none;
        d=google.com; s=arc-20260327;
        b=FFQjTlbvhKHcIx1d6NAIO2EtBA6zDFaGchDbgQkoKnhD4IOkLni4bAs0fs3TF7fxhc
         9/QZT4JjWbBgrAMe1wYPXbqzvfngBXLEaBcugulE/GyM0WN35PHmp6CVMbYTfziqzykM
         HUZLD7yoEh5OoourJGzAxOvP7BpJ2HAElN4pIjPjboTCxc4WIU6voJOaKiVo+3vTP0DV
         kIzJhyBwr673qZVHqmPW6TZqF0Fn+BMwa2T4p518fJHiVgup0YHXQ1kh3XmVxzbIVNdj
         lUtF5Ka0gh9vkYCANzYsc+36ls9TTq6+F1V1n8EWfH4Xz5pPO0Gy6ZfAAR+fYFX0Abbn
         RlMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JVZec+P0ncDLVtLUbU8V9WfHdjX3mnAfmKUvh9J6NzY=;
        fh=Y3ol2hoBwiUtyXAMkK0ZWpk3xvEXcSDfL3idco1me18=;
        b=LtktKA6LNX+j7uMLRS3+6Tq59In4npk2Fnq/AzBAf0aZUtu3Ajkqi2y6Lsi2H+6Lv5
         CabpJ/VZTE1dpwOG3lGEs8YQjQ4WsufIMmCFeyR8PDTsx3Xi5d+UtW7jXgCe+yLV/OX+
         PPHjzLD9UGRTLlHjujfe8Bqd2azLXnl0iSDfYwhYdMpepkOOXV3TB92X3lKb7mTw2EkR
         ZqXBAG1QoaSARe3vgitv8QLCMmAWMLztkm1cwcmM4bgnagrFKMrupdofYX4dTa5jfwvV
         Az8SFuh10wQ/TVq8xAnmhn887jy/fXtmuC9FtfC+v8Zp1It/fFqyI+fXb1NJ0aF54Ewb
         XMHw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596705; x=1796201505; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JVZec+P0ncDLVtLUbU8V9WfHdjX3mnAfmKUvh9J6NzY=;
        b=w2yQ698DPMWwjW57IuhTLlnKgSxk307OOkaOgNJTFZoaoqDBchmA4atnXJvx8kMoi1
         wwAEKdM6UeEO8HlepXzWMb8Ww7EP6WBQTYWyEbYbz/pay3LKwVbu0uz+K0/qH/OO7WMC
         /VyH/CydV1QjoGCoMRuXDcaopPtsrzw7DB9E3NcP16tp5/UkgXxTxZrTz2CEYMHrALoa
         UzcabapnY2zrpHIx4D5JFxTmJ36ULIefDSDwmaTMMH3lDRxX630erdB+NKfosDZUkH5C
         tgRISNVBU758B/TGFdDSwzQV1fW1MIz7fwjeGhaTrKPpx3WV2vA4dnR/JBy8nL1UxaF1
         P3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596705; x=1796201505;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JVZec+P0ncDLVtLUbU8V9WfHdjX3mnAfmKUvh9J6NzY=;
        b=0HP/+WNQ1NAlteaCg3bMN5ZNUxbDI36vs5j0Q3962gIle6EajldNRwAziRB6RvU4k+
         2D+/yFgKvkEOQA1G6uJdJeTdyBe9GoC+Yiw/+DYuC7vbfmG5MZIuko3ji2tUIMBFxOXF
         FNi//JocUuI+YgoLayYvLYUwdQD8xpfIGGqKp+qmLnAiuZbtWCyDfi3lAlr9rSE5Y9lx
         PStHKYbi+vS29ctEo+W9xIifGWYagFBC8DUHqf/klcq2wZSeyS5ZLBvQTfP+G7cvxQsw
         J3pmADHcz5n3HvfYsUMVXa/Z79WWOgX9WgkPgck9XrsRx7svVitkKjh6go23tf1xjQz6
         UjaQ==
X-Forwarded-Encrypted: i=1; AL+hErEEKGavswOjkN8OiEatjBhsJNGxfHb053O0mO+rBHmBUKxhgwOzPiOlAUhgXmouVVRA7I6EXXetkLZN4MgWy5nD@lists.infradead.org
X-Gm-Message-State: APuU4Z9SH3KhdaGBZvfBnvp62TFOU9TCiFnJRoryCOq/dOrQg/s7XLfm
	mQGkmWGCTFyhnxGhERxtDAVzXpAK+J+iWr/oWck5d669JEQT/R4x6DWPxRs+eiZ/qVnY/HC0xrD
	DLEvLcyZDEzh0g3RKLffeJsB0lcP7Nn0=
X-Gm-Gg: AZFdTZcmQ8Wb4HT6mUQ0GVH0z6mICcLahWLSIvIR1WpubBO/QO9JP8zBXHQLRavWsyc
	ePfX0ccg/Hyk6AgXN4VO1Hu3H8Q/OL+vG016iJWVh0y+iOM0w+a+9J97uNZD/OOp6oTu5Js2gmK
	pjAohlkF+vv8d6UHrKss5lbm9RsuugJqBF8duE4WZlIJ0QY+/nxi6oEi/jbVBJLQOjxCysq/c16
	eBiDyKyXzCz+uEWkazcUJexTn0SI5sqJrMb3R5F+9TvXF5cyWXtrfN0mhf31EM5FmbreN8+g6jo
	0Ey6LMFXAUrGZ8KBVY0TaNVD4xnaMbIjG3GfnCj+fjTfkQOxYm4OBCtne3/lL5mbqR4/xZ0yOB1
	KlAFSAqvbHDx9ZeqLbPsirTVKef59Sus3lJP0JA==
X-Received: by 2002:a05:6214:c2b:b0:921:1e3c:efeb with SMTP id
 6a1803df08f44-9212e0d16a1mr304088126d6.18.1795596705319; Wed, 25 Nov 2026
 00:51:45 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118025528.2703790-1-zxyan0222@gmail.com> <179520945915.3135.14304625182301747705@kernel.org>
 <500079e9-e626-4e4b-9880-adeea0724338@bootlin.com> <CAP7veT+EjJabWrvczNwcZQ16P_SyH_rAQkTz+nf1G+FjxMvgNw@mail.gmail.com>
 <e44876ec-4f91-4120-bbf3-3a1eb330a2dc@bootlin.com>
In-Reply-To: <e44876ec-4f91-4120-bbf3-3a1eb330a2dc@bootlin.com>
From: zhu xin <zxyan0222@gmail.com>
Date: Wed, 25 Nov 2026 16:51:34 +0800
X-Gm-Features: Aa3M54oVZ8QH8baEESvpsl4u2Q4IYlXKuxY1eSxFeiZgwZmn4Zh87ziubRwHQe8
Message-ID: <CAP7veTLioytfJYQ-BDc4+CrRMrMMjprR32f0CzN_uL0TschNbw@mail.gmail.com>
Subject: Re: [PATCH net-next v4] net: stmmac: program the FSM timeout timer
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rmk+kernel@armlinux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_005146_798035_9C02E0F0 
X-CRM114-Status: GOOD (  16.88  )
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

Hi Maxime,

On Wed, Nov 25, 2026 at 4:28=E2=80=AFPM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
>
>
> On 11/25/26 09:22, zhu xin wrote:
> > Hi Maxime,
>
> > Separately, I'd like your take on the hardcoded 1s timeout. At 10 Mb/s =
a
> > PAUSE frame with the maximum 0xffff quanta stalls the transmitter for
> > about 3.36s, longer than the ~1.048s NTMRMD programmed here. If the Tx
> > FSM is still timed during a flow-control stall, that would raise a
> > spurious FSM timeout and reset the interface. I don't have a 10 Mb/s
> > link locally to verify it, and the databook only hints at a large-mode
> > (LTMRMD) without being explicit. Would you prefer bumping the default t=
o
> > 4s to be safe, or is 1s acceptable?
> >
>
> Yup, this should do the trick. If I'm not mistaken, you'll add some
> better controls once you start upstreaming the glue for your XGMAC
> device, right ?

Right, I'll use a 4s timeout for now, and add a per-platform timeout
config along with the glue once that goes upstream.

Thanks,
Zxyan

>
> Maxime
>

