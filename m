Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61730606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 06:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lGZarYZu;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N4qMx+yp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Bv8z5Io8RhbyyeuDISboM7YRSTMS03SBG0kjxtz0W9A=; b=lGZarYZue4l8K8
	RxjqhuCukjr+rrZm3ySErzzCoLG1u6EzpByFccZiXlKxw+4fI3ZfqgfosNbj8bPiz/hNZUNi2iIvI
	MthhIZxVhCXRc6EZxutOg4/NN9IGE4FEMUKCfUldErK7Pnu+xqemZBqo3/w9Z6ToqsP5MoWjGoRwt
	mK5REbHp4+GULfK7RtBsgG1BnUf7xu3E7RUDQP1lN5aGaZivwsm/9G0pR9vO8sqcZaGFtrvBQF95P
	DvVjtatPqjEvxWPyG9zRyLCR4Luz5DWZtP2EvOowOjovP5KbyKfMLEMOYrWvfXYiodRbrgKO4TKM6
	WuunRVVnMmrPTUuxHscQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTCc2-00000004fPx-0hbv;
	Tue, 17 Nov 2026 06:24:14 +0000
Received: from mail-ej2-x05.google.com ([2a00:1450:4864:34::5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTCbz-00000004fP1-0pvG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 06:24:12 +0000
Received: by mail-ej2-x05.google.com with SMTP id a640c23a62f3a-c50489cdf7eso158536366b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 22:24:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794896649; cv=none;
        d=google.com; s=arc-20260327;
        b=hpf2BsiCaxGxWHIcj0SgRzDsryZ/fb+uxfsxCK8CnomZD1Y9xqgeryc4AtaM6FoFLR
         W0M3DWDDE9UMtVjYYiJS4q9NdQr+0a00dAHtf3Yf267+ux8Y4l4BWDx+QuRewvLdkb1G
         uJM4Hppu4/MwIGJ9otixK8J6N+esPhKkjUcx4cGZuj+RtPWZ8NiVB4LMAWaWOLxDu4QE
         T/Wx9Ckj8DBhKuGg4TZCaf/Wv3r6ODlv575NTlFCn6wBQMLp85P/KyeH1EHdQ1vDfSiM
         d/IfgCPoYcVxkAek0WrI+aJXdza59WvbDAtX+w5/Ly/seFzDvHeR/DtgnB3k75KJJ9hN
         Q1Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bv8z5Io8RhbyyeuDISboM7YRSTMS03SBG0kjxtz0W9A=;
        fh=33/E1fyQajcN2zIfNysqjC1D2XgH0ri623AdheU6JaY=;
        b=qtd7vJFZoxbhVkI6RNP8x7nOfwt+lJfNTx6cHVDWqWzOm/6iFiYQ3fplzFF8najVsA
         /zyAqihV4GN0+bU2n8Kr5XsxdSAJir+xRDMPZyIfy/+CmuU5CO+3fvs8ArsP7PsLF1zh
         TfDf0mscA/OWG8vPWYg6gY/4/3Zov8Scb7gZkncvisoX+c1Z7sZrk44x/12zYdxnMmAM
         vcpk+86c0wDRJ4e5X+UojKZc1r4h9AciDAXdhIKJaGlNGPzbhtRcy3Z8XkZIDHTjC0Ht
         1vM0JvpNOznknxArzHU79sMHsiChXOjFZ4d7A0OaCRHQVW9KCjDTmuP+xww6p2AiLXo3
         m5mw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794896649; x=1795501449; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bv8z5Io8RhbyyeuDISboM7YRSTMS03SBG0kjxtz0W9A=;
        b=N4qMx+ypgI5gc1ixpD74oZdnRIHbyhvsSEFOi551vqFqEC9XRrImO2ZX+I1Fllqfoc
         Ue3zTiALgl5bYIPAY5JOkQMWxwIWzpPakHdf6vBMdhlCSAmJis8NMxOVMREl+QaY6AO3
         qWrTL+WjJGDeiTyypWt6AWfHaCOhIxRTlTSTEZpVFVGZVJRU2iQamcKSanZbtTm8g9sE
         cyM8NSmwrlDZhf2Y/tZZYhYZeGokyZWdxN/9wlBbuqbzvCxne24H+9Ct2ZDEPfVxmIPb
         hXUlK0oKwYEpXxe2k9TbbeT25D0Xz+Ak+9/c1MMhuDW+A8CNgeeYOo1FcX5QibuAoAsE
         AvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896649; x=1795501449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bv8z5Io8RhbyyeuDISboM7YRSTMS03SBG0kjxtz0W9A=;
        b=0WvorM14S+/s5Muwu4NapYJ4fcSnVp4UPLFovNh8oxF10cK21TW1CJ8iKv7Tkdwoye
         cKts0wsLdh2LSEXNV2Q5ztKrLa0kdu0mVE2dK3cvBihCnLbMLmtuqxQ6nbMgp45DF3I1
         NqH2t3PRPj8m3twcp2ho7dhuw5irC+Z+bM+CUmv1cktGq2gkrPDxtq3TMA1r2BlHmuFL
         grBY0AIOgPRAmHUcXHzkshSkUSGT4z8dDZuIo4JfhmWhstV1Y40Xl1zvUm/JjmXhHGRX
         OUVlo/3z4W9f4FEq2WvEE6nVc3FfVdm+DlHvwBQkNUtTwPnqDF7QJSefQeZkeg/9T0zV
         hK1Q==
X-Forwarded-Encrypted: i=1; AL+hErGQridpAE1dnRAFRX/3eIi0endsuXquG3AscJHKq1ziwxFtiMIOgId6az6PaqFhvxwFM1ERfEknwdA4qbEQcJ7Q@lists.infradead.org
X-Gm-Message-State: APuU4Z+RDjBed3QWtU+pfSbbNpFnWZCO6C+4A94RjS1q2AEs/5TpVc3Q
	26I0V+dM/V2LAIj0p9h3Cf/6UGL5v4ntIFeE2fi0/yTPGzDj8ciiOBqkRsiEAKbEPt7PzN3v00D
	1YT/3RJw77WlLyDZW/43L5Zx91DvMos4=
X-Gm-Gg: AYBFou3+B8IQvKqybRdPjGH3D70qM9Uc8FC3+S+IPSB5xyobtAMzBEWgNcY+DXu7Vr4
	CvZ20F+px5IqYkz2oOIDd6JGwKqZxBrqMbqJjxIwzBWdHdKTvoXt6MKowOGkgII7d2JvqEr+sWa
	OJjqYfZ3Qe1MrM87xqroiZwMW2u+og0EllpjsDjAYY+P7SBq8P1meHu2u9Xe9lNdStRtusBkCsc
	lajD04f+2TE4kh8nvtoorN+zwZmWnscd82wyW8nspoM7SPQ1bqxdo1W6SOz6ucAIINCExoM1etQ
	79dYckqp5ceEAqZ5+tBnGniP7MpaLW5QElENneJlr4NeNLh5oYfunJucd/t9dt1HG7m0DaxH9C9
	TSN197+RfNPX35rXAPVC6cysP/SklTgVPzL348m/p5A48BIrAUunmHILjA2ByvGDw3mXclcgilH
	cv/jQ0O34lpzU=
X-Received: by 2002:a17:907:7ba3:b0:c25:91bc:ff55 with SMTP id
 a640c23a62f3a-c509636a832mr966830466b.23.1794896648621; Mon, 16 Nov 2026
 22:24:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110160554.918652-1-coiaprant@gmail.com> <20261110160554.918652-2-coiaprant@gmail.com>
 <20261116183012.11a7ba72@kernel.org>
In-Reply-To: <20261116183012.11a7ba72@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 17 Nov 2026 14:23:56 +0800
X-Gm-Features: AclHuK_nLO104gw1yCZjvRwQLJzYX6sO8gDm56OtDyoqEcCmc11J_KEsaJmWM1U
Message-ID: <CALj3r0gTuJEDd==WzAQ+cK3Og-2zMqvmBrhrd2ARbKJctG5ZAQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/2] net: phy: move DECLARE_PHY_INTERFACE_MASK_ZERO
 to core
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Paolo Abeni <pabeni@redhat.com>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Heiko Stuebner <heiko@sntech.de>, Aleksandr Loktionov <aleksandr.loktionov@intel.com>, 
	Fabio Baltieri <fabio.baltieri@gmail.com>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_222411_254510_14DCD403 
X-CRM114-Status: GOOD (  15.80  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=8817=E6=97=
=A5=E5=91=A8=E4=BA=8C 10:30=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 11 Nov 2026 00:05:53 +0800 Coia Prant wrote:
> > --- a/include/linux/phy.h
> > +++ b/include/linux/phy.h
> > @@ -159,6 +159,9 @@ typedef enum {
> >  #define DECLARE_PHY_INTERFACE_MASK(name) \
> >       DECLARE_BITMAP(name, PHY_INTERFACE_MODE_MAX)
> >
> > +#define DECLARE_PHY_INTERFACE_MASK_ZERO(name) \
> > +     DECLARE_PHY_INTERFACE_MASK(name) =3D { 0, }
>
> I wonder who suggested this, hiding the init inside the macro seems
> a bit subjective. I see no such defines today. We'll need an Andrew
> ack for sure.
>
> Please try to add lore links to previous versions of the patchset
> in the cover letter.

Hi Jakub,

Thanks for the review.

The macro was originally introduced locally in the Wangxun (txgbe)
driver (commit 47f848aac4e7) to handle the uninitialized stack variable.
However, their local version incorrectly uses PHY_INTERFACE_MODE_MAX as
the array length instead of BITS_TO_LONGS(), which allocates far more
stack space than necessary.

I was just trying to fix that bug and move it to the core header so
both txgbe and XPCS can use a properly sized, zero-initialized bitmap.

I understand your concern that hiding the init inside the macro seems
subjective. Since you mentioned an Andrew ack is needed, and he is the
net PHY maintainer (who also looks after the WX driver), I'll keep it
as-is for now so he can review it in context.

If Andrew also feels this doesn't belong in the core, I will drop the
macro entirely and switch to explicit manual initialization using
phy_interface_zero() in both drivers.

I'll also make sure to add the lore links to the cover letter in the
next version.


Coia

