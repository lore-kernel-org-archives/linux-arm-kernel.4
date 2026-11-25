Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F0C606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YqQ2eAJZ;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=RYoz/RvN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6hnBZan8g8LHddmledKC79LHYdm87y2KXTgu+jeeovk=; b=YqQ2eAJZHwpRfL
	tgEB/53+QlVqltKMLdQskqrnx6B5Qww/wi+vubpkAXkz/OHCdvTH2LMZFNcyx1FggsRShXaLzw5s1
	ky+YUb1gjBJMRbznfuRZF06M29fZ7z/p8if7PRzVyAvxbyQM+iKU2pbTkWL91C6qG7/ZQQicWdLxI
	yfGVoBP6HXQxLT+DhIy7XA8eGxcnvlCZ13u+5W6+hwABiYc7nfygK5qRPSwnrOxZQ69X+muffIedh
	TP/F8GafEluF5rreyzkKeU1gAvw+NDbkyQ5V7oNidZQ/qKrlFCJP3oAJuWpe8yWEqYXybDEEJFAks
	B32wrBMpF0VjPcWCFOcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFOr-0000000ATHB-1F74;
	Wed, 25 Nov 2026 15:59:13 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFOd-0000000ATDf-09JX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:59:00 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c51a14bd405so174773566b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 07:58:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795622337; cv=none;
        d=google.com; s=arc-20260327;
        b=Mdf+JS9n3AVP/RMo0M/+wY83fgld6IEWrOlVlZCu6/YpprYMIIJjtxVpNyveFmk+ql
         8yD/1MN9MDjP59qmyZCxos1sZYoIjIiDai0xRQLdZh6mcIOL/aQ08gwbxt6oT9yWjPSV
         /8mFQQAWz1DMjOvfxRidmRLS0rk2FeybX/eLln309fMuCO5RCRUGyIH/PnVs34dH9ZFD
         wRnQE8jTS9ikse/MspBzLtHtS6qmJO7gPfq1ji8XiCvTspIFKYwD9cHYKQILxJpkVC/o
         +UPrcfcXgQzYDM3uHVPsLkcelC9MWL7voAgv22eHkTDvfeZI+rLLPS2CT7PGaUpkq8ck
         NyAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6hnBZan8g8LHddmledKC79LHYdm87y2KXTgu+jeeovk=;
        fh=1yY1h/pY22/vktPGvaxxqtKZRSbhl4Koxn/v/qotSFU=;
        b=gxRUraddx8GbwPZnnjfpqK/KPqvx6lBFHtc+IsZuHJbRllQVIZ/NiM6WjYiBePB8RI
         PFHkSmFW2X6R7l7f0ZPGJ6rMboqZfBUP4E7V9AYrNbPYrlLxZI3GX+QPgkKCVeAIDohZ
         axzIVkle0zZnsN4ERzei+XIrzaWLXUCFuhLrN9wyblP0LqvF7YHBNOOyUCNOm0ma0Xya
         g55gTQ3iEBC41crKn2n21snnV15skikykBoEfdV/OIf0bj9KsbNi5MdLtj+j7hexyP8p
         ge+Ldbk3qKuAjhKqmoVeu+lp13l1zClyTsEbzCK0e+j91VPbRASL5ETvnQSvR/7GMkpk
         23aQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795622337; x=1796227137; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6hnBZan8g8LHddmledKC79LHYdm87y2KXTgu+jeeovk=;
        b=RYoz/RvNnb+QuM+kA6bl/luIuxurFMoKd5Wo6eqDeO+9ZX4e3XIdOXiFBDE6lGYQt/
         Uz3jP0NbAgIBfKuyCSWjDm9S94l8+vBYgfUSQCeuJefvDUersJelaen9gXICegFfb5P7
         92r0706ia11HVpqnGWxAJiMw679EI/0MOmHR+Ovtssrn04J3K1f+TZE/bx3Lj/0t25WZ
         LEpxSdf7IkdOzIyRRFL4dpaIWWKkPCsRUksCNRAEI3JXyxmlM+8elIXcMENFrbVtwXzt
         vYhTCulez4/rnG5a08PSEwMNyQqpoUWiyZIXgNdjmCwjfehxddB9wXcLzCxLn/bkwXkB
         Jtdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622337; x=1796227137;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6hnBZan8g8LHddmledKC79LHYdm87y2KXTgu+jeeovk=;
        b=1zT2ZWvILzn7Czca6IxHD6OdK3MeLMtVnOC0gHHVtSXL6vlowtu+cvwwvv2R1F5Vcp
         AyFgu4WUo5fx3928WOrqtJNNwtFrGVT3NDoWeQa1KYqRQaaoN2gzuCaCEQ9Cs+cGkIaB
         3TFyz2oPlm8bcD7F+ck1l5xndR0qv4Ava5BoD9pUXKh7NXzQN6UI+nWg7gmeMG6ueUuC
         5DQOc0a4hSJTmn1E4HWCVm0GBOt8EkIkf7fOC1Z9P4nKt+avXNqHNzjmnfJ3Ey9HQMLm
         HRsyyfqZWbQKJvPlj4h/jnQcGWMnVhEz/02CA2YtC+fpF35TlJ+H0Cj2iFq69/owUb1B
         AcIA==
X-Forwarded-Encrypted: i=1; AL+hErHYCb7xwp8xpqBp7zh+qSTgkh22wab2usent6CqnRrvl8idIiSZWwTv6RNKWFoIiBuX5CEaBaC5IvXPhO1GmayJ@lists.infradead.org
X-Gm-Message-State: APuU4Z/wCptFhgdDJXKrWdQyxRWsy9eVvCsckaEgVfneLw2fSrfCXAbf
	NJxc6HJZng/Jh6L023U/s+LSPzSIHXxDJJiccOJHoR9f9WSZBIzzMV5gchcIOvzkinO5U82RGpN
	yEZrss0k/7+uBYItkVAapn0EhHhnn/jvq0AH6sSFwDA==
X-Gm-Gg: AZFdTZfa5w5MQ0TrGpHltNJsKakbEPXLN4r5tTq/QseOkW44S4TUbhbuapb/TcNiJtI
	XqmWGifvDN1g1Jq4lfgu08rtTuBUWKuQ1P7hpnOo9XB7v5Hx8t+gzV/3cDqIApp0b7sL4kLQzrP
	Eld05C/cbWo+55S+1lzqGA3S9uO6bGlxYyAcxha2GzXRWuFmscGPNhwn5V2vVhsiInRDi0gMkus
	ZFKr36si0nh+Y3xp0RNGGxOOeug/tJN7hUHmBiTnCjZ/5UyM8HqRDffFf2omNUz2+46Pxl2n+kE
	LTsTl73vFUiDpBlZjdJrKGb7vx90rpEtAkeesXFqoXcdV2Hl1LPNg4+qdC0qYeywMbVFavaZc2l
	Nb9mXaC8VjQblE4Alwz+Cj4gBmdEq9xO9bm9xbY6VTM2kVrs4p5cEnkohRfkYUimZZaSX
X-Received: by 2002:a17:906:81da:b0:c51:1d9a:323c with SMTP id
 a640c23a62f3a-c513a88b0d1mr1175280566b.15.1795622337011; Wed, 25 Nov 2026
 07:58:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
 <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net>
 <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
 <2f8da604-36af-4944-8168-02b046e97699@lunn.ch> <CAKTNdwG1sSBVKcKpHBj24nFCdc6WVKabV5=K4sJFucWpTLqRQQ@mail.gmail.com>
 <1defc5c8-ba61-40d2-99f3-6654f1743af1@lunn.ch>
In-Reply-To: <1defc5c8-ba61-40d2-99f3-6654f1743af1@lunn.ch>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 19:58:42 +0400
X-Gm-Features: Aa3M54rEPfqgE6y_yyyGlUyi0QUCYRvYug-ToPvauBq7tha0wq3SQqIuKn74zqk
Message-ID: <CAKTNdwFktkMtdLW2GzqzLH+LO4kF0uY0jWpnvO5vbWmd-e4iWw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261125_075859_130174_D66BD829 
X-CRM114-Status: GOOD (  30.19  )
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

On Wed, Nov 25, 2026 at 7:23=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Nov 25, 2026 at 06:41:42PM +0400, Alexey Charkov wrote:
> > On Wed, Nov 25, 2026 at 6:21=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > > > +static int rockchip_otp_cpuid_pp(void *priv, const char *id, int=
 index,
> > > > > +                            unsigned int offset, void *buf, size=
_t bytes)
> > > > > +{
> > > > > +   char cpuid[ROCKCHIP_CPUID_LEN * 2];
> > > > > +   u8 digest[SHA256_DIGEST_SIZE];
> > > > > +   u8 *mac =3D buf;
> > > > > +
> > > > > +   if (!id || strcmp(id, "mac-address"))
> > > > > +           return 0;
> > >
> > > I don't know OTP drivers. But to me, a function called
> > > rockchip_otp_cpuid_pp() which does not actually return the CPU ID is
> > > architecturally wrong.
> >
> > There is precedent for this at least in IMX [1], [2]. To me the
> > interpretation is "Rockchip CPU ID used as a MAC address base with
> > offset X", which is exactly what the derivation does. IMO, this is
> > less clunky than the alternatives (e.g., a custom NVMEM layout which I
> > used in v1-v2; a "virtual" NVMEM driver referencing the real cell and
> > returning the processed one, which Ryan proposed in v2 discussion, or
> > caller-side processing).
> >
> > [1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/nvmem/imx-=
ocotp.c#L224-L238
>
> I would say this one is different. The cell specifically contains the
> MAC address. But its endianness is wrong. Nothing about CPU ID here.
>
> > [2] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/nvmem/imx-=
ocotp-ele.c#L115-L129
>
> And this seems to be the same.
>
> As i said, i don't like the concept that a function called
> rockchip_otp_cpuid_pp() returns something which is not a CPU ID. The
> two examples you give ask for a MAC address, and they get a MAC
> address.
>
> Does nvmem support aliases? Can you put two different names on the
> same cell? If you access the cell via the name cpu-id, it calls a
> function _cpu_id_, it gives you the CPU ID. If you access the cell via
> the name mac-address, it calls a function called _mac_address_, and it
> gives you a MAC address.

The cells themselves can't be aliased, but what you're describing is
pretty much what the current code does. The id field is exactly what
the consumer used as the cell name when referencing it, and the
postprocessor callback checks whether it was "mac-address".

Shall I perhaps just drop "cpuid" from the callback name to avoid
confusion? The special treatment is only applied to cells with the
compatible string "rockchip,cpuid" anyway, because only Rockchip SoCs
use this particular algorithm for deriving addresses from cell
contents.

> That way of_get_mac_address_nvmem() just works, so the MAC driver just
> needs to call of_get_mac_address() or of_get_ethdev_address().

They still need to relax the size check as done by patch 2/5 in this
series, because the CPUID cell is 16 bytes long. Srinivas rejected a
prior version of this series that attempted to return cell contents of
different sizes depending on the use case. Currently any cell size !=3D
ETH_ALEN gets rejected by the net core, not just < ETH_ALEN.

Best regards,
Alexey

