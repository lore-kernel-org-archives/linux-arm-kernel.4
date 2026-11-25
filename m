Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8D8606A338
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 18:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qhmGBpY1;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=Eq8Icb5y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PpDc8pLBtpg0emxjGkZmwsobsd8c7YGJx/bCDbNiMik=; b=qhmGBpY1EksRio
	ChaK+8ZxWafGZxkCP8X8gcnZmSdLJTKVscnNaf1LMHOnrG6udTr7HqIhw5fwNY0jzKEvIEdxzAfBa
	AlJaLqD9uVa2AnHlevbHsbks0Iy+/2nKNWIfugdWNmowI+StKs6yMpcg3p094swAKJjLFBYGTA3DE
	hd15E9Y9hjzv8//nPUyhLUPQJFK58BfUO+jinm3WfWT1Hme8Azmjz7se/aRUHKiRnR0MU6X7M7XnJ
	v7fTBuII/J8PPxrEVxtDUyT48PTyVe3c4Od21QHt+yy3Xwr8HTEJOr2laY4eJRHajoVv44ncSGvrs
	XZlo+CgxRCE+4iNAjbbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHK0-0000000AvHw-15UH;
	Wed, 25 Nov 2026 18:02:20 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHJc-0000000Av2j-2f8b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 18:02:01 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c511c0e2826so701579666b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 10:01:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795629715; cv=none;
        d=google.com; s=arc-20260327;
        b=eWluS7GF29kynJiL2qTwMh47X76N4UV0IgPSxdjtz9m0caNF6gffSgijfHcPhOh052
         sGy7nmfx2VZHa831yl080rnZc2oKMbFrm2SUNnsp8qWhFwzDUc5B30ph5EhYHOsWM/lQ
         qfdf3gyGFvT05ACQRlxSNG/b6rh7Wb9PQsI7wC0rMK036PXw+f6PT3oBHEAogaa+F8D+
         dkJFsPW38zwg1lZlftguYoRm7V+FiHryZ03olZxEi+y/rhJGDFmUY9krbl1qRQbv9qLB
         b0uKf65vBe8qTBvMCO60owAuJZ6t0NpW9QcIzjQ0IHocNFQ01HzMR/wNtwk4/YEJDdp1
         AIQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PpDc8pLBtpg0emxjGkZmwsobsd8c7YGJx/bCDbNiMik=;
        fh=8cy5spEOaWjx/jnTlYwITRtZCDUnlPuUCOee6kuRthE=;
        b=koMbhVS8f/CK2SyCXARNTcBQY2quqzb3wIH67qcE96YBJU919W9JvU7TYt9H774aoT
         un0gzRx96hcwcq6tgPvNDE2ts75ddBFiCVAinsAjlOB9Z7/ENl5UN9lLGCpXb6pj+eMT
         NAEuPq1N6pa46l9iABRifxmxk6UA0nUCHN045K/UM5cq/ngG7ijaEdBZnBLf34CXxLxz
         pVzYP+tsgWqyMUjbhCa7YKyKKY4qCOKh2mwzkLl7TgX6NnWtCvjl7ik45YFFFA02Hqb9
         KZdDzH1mt7UQpUY5ha1xOWxFZ8PEAHl0P8MYVVrWBZjG1Q6yi01XduBZAtce1v3zAlrn
         ZAZQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795629715; x=1796234515; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PpDc8pLBtpg0emxjGkZmwsobsd8c7YGJx/bCDbNiMik=;
        b=Eq8Icb5ycG9yowaKw2Mx7rdAGZ5Um01DYhGEawgeFUAP0JohdXJQbm6hBxpclhzgp9
         lrQwqifH3Mn3ylnEzBkiYWihwyX6ooVGiFXepfzVq6JSZbHh+b20weqC7lbX0TvYctfZ
         UdqTkbre5c8WmsGaQRtGO2d3NShL+4sQ2FNoG8AtCExrNwPZlzcLwzJi4D+NsnscDSt2
         OZndbu2T/Ga42ouLh0QOzAr6jaXR0tmWndoUdbkRZ00aDenj8uI0k5y2tTCH2p8t20xe
         wYyR6BbSQyu9sxG2DGSN+qJ+NOyVOVN1bs4RZDUBBTvobmxfgwXmPq6AHzsgxcOn7K9z
         /hpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629715; x=1796234515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PpDc8pLBtpg0emxjGkZmwsobsd8c7YGJx/bCDbNiMik=;
        b=hxP2yZBLNX8XX+v574MruKH2Rh+efgb9XhDiJQAsHRFawEjsuTsjladkS4QvETeV0l
         bVbRvtUjslEDe8tiTZbxFzppD9X+VdBB9j06iGyJnA3w0ZM8usF+1IlV69hFNHzjMI59
         W/Ry3tcOvifcZDQnJ8oUl6dZ0A1dxDSh5cSbEtL7r4QfqFZ/sXJMu4y7ncVaxsyXlE4g
         quGNclUdX1F5IhRAghTZViqRdSfUB+/Fr1tkcjmKchA1n3aBOuTMHv4HrhcR+/vo0Fnq
         G1fHteUrWplaJ16TZOmIQpdjoOgPBqMJhsiC/fxC174zmDjsjTUturocAKqK+bsbGSnj
         JUrg==
X-Forwarded-Encrypted: i=1; AL+hErGNz8OS0UgPgQAW6GDzU5nPbAOBkt3qqLS/RH+Diy4izRUOKt1LnRNscSVsvskX15/I5s4cdnfF+SEsWAfahGfH@lists.infradead.org
X-Gm-Message-State: APuU4Z+dh1Vkavbn0+th08Kv4A6ioNeoGzgBUna8Nk/+a/zC+hXmSQvf
	eOeXOvrHSy/AcnjsEXwJTO/424XyyEEu0cUBMtuCXLUL6GP9UMq0Gf2qPvn4tSrZ8p8Z3XtZC0x
	61fufKjaPC5DmHXaKpSOG2kDWP7AQNswW+/2RjQjM6Q==
X-Gm-Gg: AZFdTZeyh+/R4/zdPiUGR4uZ6VdJs/dyKg/YfZcq4yNDk8/C8dKmFcWFGc3a/zxrO6f
	JR4etaNb5wW9aMYAK0EKRJ+F3YBmHgYYPyQXiNt5QjnhKQTtsPV0ouc4PM0ddmTCUx1fjCWQKnj
	WMsAHun5HB2gs8sKyGl5pJFyRJz1i+qCV9ODwMYT9nvyN3QPqFT/d8Pjq7bNNV4hNKqzjH4Gi2h
	uwTeuCROPyURTGP8i/xdemfy3sTrFhVvyC4MZL4H4hDkKCIIwihYE03TZcTvbUB5jkCN7XXiF1u
	yYHuRxduztt+AHtHPC3yh66HcuX6oIDp+4loAaSYKmjc/fLnEMeKAqZm2kCARKsf5kv8jIBg2U+
	DIjunHY6yFmRNssyMk07KGEKqaVQNMMm2nupY+p72mCGbBqI7g2jp/BokdEqKCYp/+T6H
X-Received: by 2002:a17:906:af85:b0:c3f:dce3:20c5 with SMTP id
 a640c23a62f3a-c513ac496d8mr1123543566b.44.1795629714600; Wed, 25 Nov 2026
 10:01:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
 <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net>
 <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
 <2f8da604-36af-4944-8168-02b046e97699@lunn.ch> <CAKTNdwG1sSBVKcKpHBj24nFCdc6WVKabV5=K4sJFucWpTLqRQQ@mail.gmail.com>
 <1defc5c8-ba61-40d2-99f3-6654f1743af1@lunn.ch> <CAKTNdwFktkMtdLW2GzqzLH+LO4kF0uY0jWpnvO5vbWmd-e4iWw@mail.gmail.com>
 <789d3358-81cf-4276-9f8e-4787df120059@lunn.ch>
In-Reply-To: <789d3358-81cf-4276-9f8e-4787df120059@lunn.ch>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 22:01:39 +0400
X-Gm-Features: Aa3M54rXKAuPqQg_Ygp0o8wODv5WUBqheLR9BXAdmhPLGte_-jSen4aa0CPalg8
Message-ID: <CAKTNdwHugVHb7hBzKHdorrCNmBanZ+k21GdMJieD7=_Z7446bg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] nvmem: rockchip-otp: Derive MAC addresses from the
 CPU ID
To: Andrew Lunn <andrew@lunn.ch>
Cc: Ryan Leung <untilscour@protonmail.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_100157_782314_4D8F3858 
X-CRM114-Status: GOOD (  25.80  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 8:41=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > That way of_get_mac_address_nvmem() just works, so the MAC driver jus=
t
> > > needs to call of_get_mac_address() or of_get_ethdev_address().
> >
> > They still need to relax the size check as done by patch 2/5 in this
> > series, because the CPUID cell is 16 bytes long. Srinivas rejected a
> > prior version of this series that attempted to return cell contents of
> > different sizes depending on the use case. Currently any cell size !=3D
> > ETH_ALEN gets rejected by the net core, not just < ETH_ALEN.
>
> Ah! I had not looked at the whole series.
>
> Having to change the core like this is an argument for doing it in the
> MAC driver. It asked for a MAC address. What it got back is not a MAC
> address if it does not have 6 octets.
>
> Please throw this all away and do it in the MAC driver. If there are
> multiple RealTek MAC drivers involved, you can put it into a little
> library and share it across the drivers.
>
> It is actually an interesting idea. Maybe it should be placed in
> of_net.c, so other drivers can use it. How generic is it having a CPU
> ID in the OTP? Are there other vendors doing it?

From a quick overview, Allwinner does a similar thing [1] by reading a
"SID" from its eFuses, and Amlogic [2] by reading its secure-monitor
serial number - so it's a reasonably common pattern. Everyone uses
their own derivation functions though.

I think I could try and add another branch in of_net.c to parse an
NVMEM cell called e.g. "unique-id" with platform-specified derivation
functions selected by the cell's compatible string. Then derive the
MAC index from the OF alias, so that the phandle argument can go away,
and the numbering cannot drift apart. Will send a v5 with that
approach if it works out.

[1] https://elixir.bootlin.com/u-boot/v2027.01-rc2/source/board/sunxi/board=
.c#L783-L828
[2] https://elixir.bootlin.com/u-boot/v2027.01-rc2/source/arch/arm/mach-mes=
on/board-common.c#L79-L107

Best regards,
Alexey

