Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E3F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yryfQGQI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y5OqPKI3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=373Q6XKV7D4BGtZOuwgJiXk7Z3A+A6WU4sQOoM0c/Xg=; b=yryfQGQI2gp+9j
	NzmDw7KSoxxjN1/mgDiac4LonYrbqzyhW7a57FFOgyLeSj6pC35e9CCO7EnP+5LZnDICJCBOYMAn4
	ndjbvsL4fsWxsoDAqxWH+PZbkKPbESPWP+7UARcaZxObf5Z5S8C64jLw/YqyIJZkgpRb8vLSNwZFu
	PGFzY3UJtoTgc4pXp7ymysDv4REDy1DdBqDSHsGFiGOkJgHSG3MZJOwA2h2sehbtnT0cpyL3+65ZP
	SLfk5tjTVnpX5v3Is7G99oZYGmlabbO+kcCwYnf4nKtdXAD4jdJrNj5HXliUyVdUDJx8OxLKgUkZl
	ZrI/48BgoqhqcUhK5kUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMwX-00000006Yg6-2KCV;
	Tue, 17 Nov 2026 17:26:05 +0000
Received: from mail-ej2-x09.google.com ([2a00:1450:4864:34::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMwU-00000006YfK-2Ba1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:26:03 +0000
Received: by mail-ej2-x09.google.com with SMTP id a640c23a62f3a-c504fffd8b3so245687066b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:26:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794936360; cv=none;
        d=google.com; s=arc-20260327;
        b=JEr2F8DBts5LsoF43cQAmoGr3Vu8cEVP0mziLZEzmj9X+N1GIrfN6VscD10p1Alv9S
         tyMTtfkO/TRSqR0xcmEKuLyhTVEA6yt+oBTnvSb3pS/94O1WnIOfUFwWCdwkZWyhYHXx
         NRyKU1ne3eeI9F0g3HGYUBPjd1w/QO5qd2RLmMY/yGO5M89p/EJ25o9sKOl+ZvdfZDW9
         PDIWckoUEzvi3w8s6XX7p/45aivjFXhwgkxH4SraebpLSbjEf2V9dHa2xPWQJyb6kNKj
         9gukVvSMzApK9H4CcnwxKbM4lBseGjkvyF4yzJrImfu8ZXPUx5t12lwO8lQwAuuNs3lr
         WMqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=373Q6XKV7D4BGtZOuwgJiXk7Z3A+A6WU4sQOoM0c/Xg=;
        fh=yAqDQyw4vnn9su5M5TrUAyzAG7cdinCouHFRedae4Eo=;
        b=IQbVnW/wMU+zNA9pq7a+mICyKwgi1l2aAEcSHm6msiae24DBtOKqSVYLk2EneCsapK
         QJPFIDFgwkqYmBWCaAu/OSFvKovOETPr2x/2NfWMoVNTK+pAvWqzG/x6fsw2GSWwf0XF
         /N5gJi3IKMvPGUTX7xp9CCPwkoFnQyEOK9soVGOE1vfQ3qXDD4Qk9v1wX0J1PMeEk4o1
         7ycZJY+US58fSYmk2N+oD4ogGgnKODGpP6AJa3yd963FDcD3K8c2p2bsf7+hMU7UhoSa
         pDvUb7GP07HxnaU4a5kbWeRLrvpqlFreMANNYKIn/jDuyrDrsPvvCaEwrW9zmUx7/KUD
         Nfvg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936360; x=1795541160; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=373Q6XKV7D4BGtZOuwgJiXk7Z3A+A6WU4sQOoM0c/Xg=;
        b=y5OqPKI3h/Z+o5wJIOZuQ9750nFEd72EF/jMoBqK2AUIYGqV8kr93ISbixeI3e4vmO
         2r28wQisWFGgdpVX5K1x8r3m611sb1YhqLu4plQvraqFlIFZsRyNT/4281wqGKpGTAcu
         ymY9Uw4ir85wi8g3mHuSz1k3+boQ14IF1AlW9fFLLuZvhSPHGRLy2MZxGEfUmEf6Yl53
         /A1UkZCT7oGOHkkkX2dTxyFNxAFrZxv0a2Kp5hD0323AodJm0bFqR+/viH644MIGqfoV
         1n/TOBM773wgRMknrDVno4vLh9bUSkf04L/RP53PwfaZFxs/kqmikGQZwKkWeYN9yPAt
         UeSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936360; x=1795541160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=373Q6XKV7D4BGtZOuwgJiXk7Z3A+A6WU4sQOoM0c/Xg=;
        b=L+Qb4/BNJnEeMnEyVU6/bdx8f9f+ip/tIFAtfeb1CId5xLxHVZ5CKH7gcv9m7sK02o
         vhVJB2ABBCL/MOwIFG0xLlatfVuZSH6zn2pOCLPmdNuaSIw4t4lqVqKq0is++OTH2cY8
         6p8xoAlBqQJ1UnBK1gM1X56aD3cbmMeKTSyRjtuSmPDepF843oF0gNc06/GtiM14yPgF
         dHnlR0gC6D9keh9WVwK1OogTf6ZHGfEFjBxtd4wms76aQOilVSsAjfchUxZUhs+I4Hbc
         0PCAnbEgix0oArEBNFcjeiol2J30Yezv6d3qFKX4cukP1mV84tJeUcoPfb2ZYrXKwaK5
         9aXg==
X-Forwarded-Encrypted: i=1; AL+hErH82qneAr5RHhmctNdUm53RLE9V2JzQM1vCCoqQjmsd4hUkQJrPkOGDKFyDZg5sjUcKun2nC/Z2YvfajQ0/KkIX@lists.infradead.org
X-Gm-Message-State: APuU4Z8U9SEDXMIxO3gaBO4U3oTRkBIOgG+5wnxGAGALHufnb3UPEOcZ
	+Cq544uF6G8i3e6GmbLfF00HWNWhDQ1CxRBQgqlgfaPHG5uEdc02iqCuuIrEeRCoxPbdMR3e4E+
	d65MbmRGGPfGRY6TJ9J9ZS5lEsibIqJE=
X-Gm-Gg: AYBFou2PzV27lOMbB5XnFUx63XpILXUouK8u0gSFdLdpNCBUxC6OzQTeg0HSz56H8hJ
	2jt5cDBTvLU+hQbWZdG7UuWWI8aCDv/jbFo/2eXjCaAUiVEWvLF8Xz0cI4Lwg+PIep0uxTNJ9Cg
	dgNzqdbwFUmNelpf2CDMxR8HXaQdvRoCSpD7pH7nEYpuTt3UUKG3gU0bt9hJUFpsKDqwb87FNRL
	4vQPkdhFhuk09rcSgnaUmrzGhpyxldfD6W40+jAwTGAJYSNpFkUet1W9yMmvsnWmS8yRXW2XAW9
	r3ISIZPucPAO6CUP/S2GjOtVbWTZXkfQffv2ujz6jAOScMZg0WvcYmZk01w8eSj7eF8kShiidsH
	2/qFX4VEvYZDgjFL8LlYEQGap39JZ28rkMHzw3YLjmCT3tJ6iiP9zV5Ne4WqC+FgOesnzAIZdXw
	pOdf/bM8uPISc=
X-Received: by 2002:a17:907:3e9e:b0:c40:4848:f7fa with SMTP id
 a640c23a62f3a-c50965421ebmr1292812966b.44.1794936360337; Tue, 17 Nov 2026
 09:26:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110160554.918652-1-coiaprant@gmail.com> <20261110160554.918652-2-coiaprant@gmail.com>
 <20261116183012.11a7ba72@kernel.org> <CALj3r0gTuJEDd==WzAQ+cK3Og-2zMqvmBrhrd2ARbKJctG5ZAQ@mail.gmail.com>
 <e3c5f034-1b05-4fcf-bbe1-8b473a8d2a0f@lunn.ch>
In-Reply-To: <e3c5f034-1b05-4fcf-bbe1-8b473a8d2a0f@lunn.ch>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 18 Nov 2026 01:25:47 +0800
X-Gm-Features: AclHuK_-ty3BkaDRY6TNyMVy_fEf9UBHYFECA18oX_curJlczmmtv3pUHIwGjA8
Message-ID: <CALj3r0iwtmfZAN9iS8yN9fic0Q9jVnbYP_Hz1VDheVvmh2GcrA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/2] net: phy: move DECLARE_PHY_INTERFACE_MASK_ZERO
 to core
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Paolo Abeni <pabeni@redhat.com>, Jiawen Wu <jiawenwu@trustnetic.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Fabio Baltieri <fabio.baltieri@gmail.com>, 
	netdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_092602_609169_D97E2775 
X-CRM114-Status: GOOD (  16.48  )
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

Andrew Lunn <andrew@lunn.ch> =E4=BA=8E2026=E5=B9=B411=E6=9C=8817=E6=97=A5=
=E5=91=A8=E4=BA=8C 22:04=E5=86=99=E9=81=93=EF=BC=9A
>
> > I understand your concern that hiding the init inside the macro seems
> > subjective. Since you mentioned an Andrew ack is needed, and he is the
> > net PHY maintainer (who also looks after the WX driver),
>
> I don't look after the WX driver. I comment on it, as i comment on
> lots of drivers.
>
> > If Andrew also feels this doesn't belong in the core, I will drop the
> > macro entirely and switch to explicit manual initialization using
> > phy_interface_zero() in both drivers.
>
> Using phy_interface_zero() is what current code does. I would also say
> using explicate =3D {0, } is O.K, but i would not hide it in the macro.
>
>       Andrew

Hi Andrew,

Sorry for the misunderstanding, I won't make assumptions about the
maintainership next time.

Thanks for the clear guidance on the macro. I'll drop
DECLARE_PHY_INTERFACE_MASK_ZERO() entirely.

In v5, I will use the explicit initialization directly at the
declaration site in both txgbe and the XPCS driver:

    DECLARE_PHY_INTERFACE_MASK(supported_interfaces) =3D { 0 };

This removes the buggy macro from the WX driver while keeping the
initialization completely explicit and visible.

I'll send out v5 with this fix and the lore links in the cover letter.

Coia

