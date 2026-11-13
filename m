Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC528606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 18:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=au0FRpsd;
	dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=V54iMPyg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jKYJRfOSB0/5ZynWyHsKUs3Uiriv6+4ECNMHGysdRx8=; b=au0FRpsdeF27cp
	9X/I6HsVZIR4yNQJ/zaK5Zq3pwbhfe2JH51U73fyvyLxTs+4/IHbnpE62UNdCNYI6tEPMPp5G/cJp
	NQiXYhm2sNn4DFK8lnIkl+3ZcHIxX+mZQQ3/RTXvs79HmK386FBj2hBItMyOirnVzK73xDSY7yhhZ
	f23JVflKhroPHNWlFGNdf7gIhfOdYczGva5PHAzMOlWHXChE9qFmsWZUIEFAKI+SdbEkk7kza0yk2
	OhuDqJCpy3TlbxvyP97NFGK0EVXxEpL5MGdReyvemJ5uKwol+puD9IeeaCz/r9Ne37uFsaLwPSBeg
	hfahkQi5jcjw4WCTBBUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRviX-0000000Dpm1-3nVR;
	Fri, 13 Nov 2026 18:09:41 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRviU-0000000Dpl8-1uho
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 18:09:40 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5c1465bbbdaso1535151e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:09:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794593375; cv=none;
        d=google.com; s=arc-20260327;
        b=EWoipTgICj15bT05aC0DeonEMrpvYcfgR49ORuQEBR67seDQqWTNUXYFLsmaLpOB2z
         5i8YkUAFIu1yUe/J5kjuDS37Xl9A8usMPtsQwwxvmkPLiwQVpuYCKIDqhRfpP0sNG4RZ
         4EI23uqy0wqwrY5H8gx/DgtFapgytQLQR7pbSuvye9U6i+GOUUjRVSmawRAXV929RrEV
         XxmpQuBxKbqa8TmRiXu4CyEwAXZfFziFQptrV48Tmtdywban6MiFlkL0tycjTNb8LOxo
         +2GMuGKwzDz9a1Brzx/DJSG6ZkKSPL4jRvkiXcQHPb7GGNjrFG6GCllBP0e9+5F4fRZj
         dRFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jKYJRfOSB0/5ZynWyHsKUs3Uiriv6+4ECNMHGysdRx8=;
        fh=l5RKDn/9yCaY/6ZT6m03NPS97OxdN3/bvIeQn1Z98ew=;
        b=niEa569NY7wewTjhWZMIhKo4C2oARYE75jZpIzbL4C1sz9foci+4rM32WYtfJa2jex
         tRbuP7S9BO3uQ0Zp9hVw2VaVswYS/qljAyVH/Ph5UgHv4fcKaFgc+hxfiww4yRst+Tw+
         yq+AMh+CyoOPKCjW+Yn14s0XHrv8DEcptUuDXNPX/KbKdQkE8+ssh8gKxsLF1E6a5qCY
         Fn4flcL4ChojjfYLKyt+aaPtbotONw/YEMHRsyrnYEFULG165K9TznmfVdnEigi9+ev/
         2oOCoTiHRdSQ2RtrLy9cTb5DqjaG5JB3VHgklC7tp6kMrQmV4SNLP2Gd7DIOUCrI44g9
         Haww==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1794593375; x=1795198175; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jKYJRfOSB0/5ZynWyHsKUs3Uiriv6+4ECNMHGysdRx8=;
        b=V54iMPyghwbVX1jSqhsx9SmiCbvmOdg3E5GNZhhgNqfcJmR7Q0cnOdRtvyr81h0nHa
         yHU5F9a+65wJrv0D3WGpqBxi3+BC2cJx04FGPvsbmDKQNaB79An0ElhdURG1AB6Og4rN
         xKiFl27UEq84fkeoFOaJWw8YG09iYkp6UjndFTOteqG99yDTCrEgLNr8gt4pYht+ViJU
         mqsUKs0GOLedWDwt1LfMCf4PplXNXpL77k6Mr3V1ov/orxh+aIm5+Ay27aUM3aPQbGlb
         2BT2HEzKYxLWVfZtDvDxPRjI4/igCvih/fW8w7xqE1ivuDReet5wlSLQDJ8MVxD4AkAf
         alWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593375; x=1795198175;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jKYJRfOSB0/5ZynWyHsKUs3Uiriv6+4ECNMHGysdRx8=;
        b=tVi5AXFb792k8qBcWZIX5c8h9tlyrV2NodBA0CDLLWRpBeOZPpmJfCm2VIMzPJz+3t
         4WbY/Isw2axEUE3ZoFm7obzwwkufxoVmgGjyhL/BU6C+FdG7etIvx+5XKSqEWK51hrE0
         l7Lj/53Cd01oE04Pl3a+7ISlzDc3ZAwdrbC+ugRmHGCw6rx8/OHI2gIY5pA37RkOfdmN
         PZyoRrvqFF//lR/m/ftHWUElWbBUsDCOKOxSjI3uLrfQPITbPw+UFrjgi0yTJwdaJZsO
         hCBxPQqvwa6FMfCAjGEV4kBCytXRipQvnKkgEKNnNUbZVmwcXS2WdtXYRv9qIfIs7nSQ
         U3vg==
X-Forwarded-Encrypted: i=1; AL+hErExPFbR35Vu5QGEkn82zBHnZiUFDV8MErzhuI4ESfoWQxrb+5MBsV0rL0PHbJje4cHQ5HJaVw5Hi4/V9lAijtgU@lists.infradead.org
X-Gm-Message-State: APuU4Z8CQmcT5F/MTQwgS7LnQ2SH3nyGlnjhHERiae0GWhxD/NEPyrV0
	khnNgRr6/RSXt5uzLA0ASVyCn4eEKo15B52Twm2lAk6jwYYCvuNeytdQnhGKzVJUJhrxwbRnqVe
	zCF3v1lw1Drkb6yjp9Q+jFvMCnujDqL8IzJTHq8pYaDkDXO8Ysq2TKhvV9zAK
X-Gm-Gg: AYBFou12pmdyAqzBMS6sMBBrbhC/4v7489aVGy+qMcAlb3J8ixwo6uDK70U4jivpZEl
	qF1kymbEia6AJVnllLtZfaup3JZOGOUNsNBvbxzlDVtYeeZ/bxeOpC0SUEBNKQAMEOSsng/RBra
	LYAb5GTp5OLTy0ZqokijX9YvCRUUaoPMd7dkEqhbPBdUhTvamRWzpkLMfNcWGwUjfxc73kD0tRA
	E4lljIFD+QbgYMIqUUlw31/PsuGQi77um/ysumCkczYd1xAYAuyFjnXF4967/loFn7FENsBgjw2
	k/fLSqMJl+h1+10+Ht+XTiTbzDb6GOllTjChcneR45vQWle2KrK0E8/gtIexlPxhpYV26NArS5M
	QmIUyv6IjTn3LH2+XRZ8EUSTbAbyM+9gq62sqaNXt2swbftxVZQlqZ+2zGMZH8q+x4jJ3
X-Received: by 2002:a05:6512:1188:b0:5bf:b93d:a85b with SMTP id
 2adb3069b0e04-5c17099fafemr1222262e87.25.1794593375264; Fri, 13 Nov 2026
 10:09:35 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261022082927.59030-1-martin@wetterwald.eu> <2026102218-vowel-plutonium-629e@gregkh>
 <CAFERDQ1GeAwFGBQ09eu8p69c_b3_CzAeEfTwiEaVCG_22RQdtQ@mail.gmail.com>
In-Reply-To: <CAFERDQ1GeAwFGBQ09eu8p69c_b3_CzAeEfTwiEaVCG_22RQdtQ@mail.gmail.com>
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Fri, 13 Nov 2026 19:09:24 +0100
X-Gm-Features: AclHuK_YnjdCkTrewni0BQPjUqpjzPPZv35V1L4cPB8ogSTTtBU8c_5Nldb95ug
Message-ID: <CAFERDQ2fm9u-Y3DGTFNMH+K95gnE=aox1YogRWPwGFX+6Vrghg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/raspberrypi: vchiq: register bus at subsys_initcall
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, Gaston Gonzalez <gascoar@gmail.com>, 
	Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Umang Jain <uajain@igalia.com>, 
	Kees Cook <kees@kernel.org>, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_100938_792702_C1E237B1 
X-CRM114-Status: GOOD (  19.10  )
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

On Wed, Nov 4, 2026 at 3:20=E2=80=AFPM Martin Wetterwald <martin@wetterwald=
.eu> wrote:
>
> On Thu, Oct 22, 2026 at 3:31=E2=80=AFPM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Oct 22, 2026 at 10:29:24AM +0200, Martin Wetterwald wrote:
> > > Hi Greg,
> > > this is a regression introduced by aa125180c673 (via your tree) in
> > > 6.19-rc1 and present in 6.19.y through 7.3.y. If the staging pull for
> > > 7.4-rc1 has not been sent yet, could you take it there? Otherwise,
> > > staging-linus would be great. Thanks!
> >
> > This is not a staging driver anymore, please route it through the prope=
r
> > tree after -rc1 is out.
> >
> > thanks,
> >
> > greg k-h
>
> Hi Florian,
> Now that -rc1 is out, could you take the patch?
>
> I've checked 7.4-rc1 and I confirm the issue is still present.
>
> Thanks!
> Martin

Hi Greg, Florian,

The file I changed (drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.=
c)
is currently listed with Florian as maintainer by get_maintainer.pl.
But Florian tells me he doesn't maintain VCHIQ.

How to proceed now? This file doesn't seem to have any maintainer as far as=
 I
understand.
Any pointer to someone able to take this patch would be appreciated.

Thanks,
Martin

