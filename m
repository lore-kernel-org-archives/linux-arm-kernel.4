Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95D3606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VsE/0CsS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bcvseT5h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bZnjmRjaw3mt+xCJw0WA+CLEo0XUahYdWgL+JaOD3TI=; b=VsE/0CsSntbU/D
	IeoVJ1c/7SzlD+32Mt50jYygPiGyPIKor/NRo0hR5pkCYMiAvNPdzyO/WCnQNfxj6YRmSUI9JIuHB
	aLWBbY4F7qQZOHdv8/MOH14OSJvdsyGZX3pzxCKa4Lr3OG16JoW8JUTGgQLLqXT5X9GZh8HrV3kGS
	BvNazXlDoPt/RXLsy30oBYoc1s/wsfHyz8EPd7Pnif8i/edmxpnc58Pyn0nYXRtZ/MZmwWrpStnGb
	0emGnJP8hI1v9nlCh+ewm9h0qITwguhoMXbVh2774D9kl810K9q1yTNN6jIW/R+lHI/1k/Nv2HqDt
	/7DX2AmgWJPQxzn12hMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPnd-000000091PC-0PRg;
	Thu, 12 Nov 2026 08:04:49 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPnS-000000091JH-2n7C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 08:04:43 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5c154a41f8aso47451e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 00:04:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794470676; cv=none;
        d=google.com; s=arc-20260327;
        b=enkYsJec5Ctu15CNd9fWPIR+WUFhqxARqx+x4QgPLKWmJoF6KTx+4An/b3iBDILzcd
         bmeLeDUfotau0XmvlW6KRS9+29saBjt/sPBzopEZKC9X3NomupE7cC5/UAoFvsYINrYD
         sbDgDoX+G3nbLZWhOttYMP6o6Twh+ly2pcKCIQiCLRQQfKCrv+YdBnBvCQDIwDk+Wu8x
         9iG8QCWu4FrrtJsB4NCoYzriJ5QjlLJVcHMc+oBaDu0XAA0BRqHUMKKFCcSH6L9AWdLJ
         HxO7YPDWh4KCCPIo+G7Rdk6FlgB9S7aDB4MqTkVaG84r4FKUO2pvqlf2vuoDKJbk55yM
         vq9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bZnjmRjaw3mt+xCJw0WA+CLEo0XUahYdWgL+JaOD3TI=;
        fh=kjwu8m7FLhuuZK4O7KzNamAI0NbV1Ql8HkuA6yiemW0=;
        b=AuMGk7TpI2rphaC/IcSZh+BHftpt1awX6FMB6cj+3BrN4EUO5vkDPpWTHUwxvU4+86
         Mz2sh4qlCYr3cV7J4eDddH5UJfmBcs5Av4lAfXbCm+Beky2vUGgoTs4wEOLGNqTr+rz1
         Axka9Xj9mjKLRj+kWxwwz37Nje6ewdvSuAzfS3hXTE44mr37a4ygrn3ghnZYArf+QRQW
         f9XvWfCze8auRTyFWXoSIR7g27+M8RFnoHROpQepcVI8KUVYG8UiEvH5DaAs0Kd5ZvoV
         ph7C90bNMy+rOUuMDw5nc1x1WO7d9tCYWf3r9Aa1KLlGnuw+4gXRLEE15w2T+Hkhxemt
         pGlQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794470676; x=1795075476; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bZnjmRjaw3mt+xCJw0WA+CLEo0XUahYdWgL+JaOD3TI=;
        b=bcvseT5hy7PMz3l7gmxv1S/zDNtvPKZrg+1JTU+qF4tg6xNYenMI1HUNnYNFaCj/cn
         4zhiBm6ql+2VENakgFoo2oqShxLdwzops278u2VrdASxOsA/EmqT0dJfz62kFVKJg24t
         ItRz2fOZeGMs1vVqdKZmhGFwyfWlKmSbOwKrgohSPBZMOEqY10dLTwrhm3lbrr9Gf4DU
         qwrmG5gdijkqWw5InQnY/sgbHTAo4JhkGRmuoXB6Tp5BkL7FytsXEZD6b+juEgHxw4sU
         //9+uBk4DVk8mW+yX/foJEpzvVAvKerHSxtHw+dKpLtEqhmEkK5dbNZ48c28dmbIvBQJ
         SzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470676; x=1795075476;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZnjmRjaw3mt+xCJw0WA+CLEo0XUahYdWgL+JaOD3TI=;
        b=rJbjP+3kqNJqOpFh46zgMmBUDyvNTvhN+tClTfLVYxOkCda2x1MKQbUNDw+Jf0oDLn
         1EqOFi3TPi/pAVOEZKHCRyuCFcpnkBvGSGgaMw6re4lRRv0liUmHU4vabgThErp9rBxp
         pnYRmwqYh5JzdOsIK4GzRC+oZsnEXRYTh5pfqLUug8Q4t8L20+lszPq5czzC2/U9tJAp
         RfVudxEzvdBdFkr9da1B2rDR+zKrZV3JMvEaknVE/Lg8leTUP4in8OFi6J2GVPDtv87T
         j9hOKBy0UfwH0dgpNN3zJC2giD8KwaKlxldApGh8zfHK/us/lR8rGk2V8VCddqOWZ4oJ
         6M6w==
X-Forwarded-Encrypted: i=1; AL+hErFNJ4IC38hWvl6VDHW7T7gNGKcnU6W6qq7R/bF1slLeTEdoXaWZNECQL/69QBR8ST9ncq5DN42T9pPGecylotc0@lists.infradead.org
X-Gm-Message-State: APuU4Z8sh77k1brIcg2YUUmJ57t9ZNgSQd70qyOSm8C8CygEV7tDlrJx
	hqOnsVJgztSzzg0KYBcp/UIsr9d1tIoDEdJ53NQGQqV+0Vpq8Cm7ENdNSLW+XbMUsa4MY3iAI5h
	TUEZY7xt+jzLmdHN0K2LMkol6KDTMSzE=
X-Gm-Gg: AYBFou3+7SLJnSQvxLVzcneBGjyhPfdDMhLjGeyxD148NlnHyLq9hY6CjTfX0WHEnuX
	Efsd/JzalVXN0w+GgoEGzSoeP8JDTt7Fkez8JveKIiCTTajx3YNoOF4AViTmSdgmb4Zt2+8telR
	1uBnt0QfO3vMmUjPqsWrlDKv/rKkfCAJwc7nwbytmvoAKur3w+ZnBiNmzVzNGxjFNfkTmLblBhB
	IJvAXlIDAyT6XWlWBKkky0a0QgMfYSefp1MZcMOnVGb/MMO3CMKPUGXiibYSiFU8Ca6dOQXOsKe
	Q5liGrl2kTyx9C/dhay33xRXAfSckURKHaZLZS9HbeO9kstRz2H84s9InXW8bQewd5KYcX2xQc7
	VbVclKkZNpQAY/LfvctYBtB8Pp4caOGOnOQp8L/Ny4jA7oSIs5cVdNEIAnWD4Hx4O7gnc8Uk=
X-Received: by 2002:a05:6512:228e:b0:5c0:62:7fc3 with SMTP id
 2adb3069b0e04-5c15d65ace3mr1565808e87.5.1794470676380; Thu, 12 Nov 2026
 00:04:36 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110-sun50i-iommu-prefetch-v1-0-43428e792ef6@gmail.com> <XuGVSzNrS7KQLWfGI0rB-w@gmail.com>
In-Reply-To: <XuGVSzNrS7KQLWfGI0rB-w@gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 00:04:24 -0800
X-Gm-Features: AclHuK-rZwZBd82aiWDx-zqymsN3quC1b31liF4avq8uA1RRs7r6BZowIVjwmt4
Message-ID: <CAEy9hNUi0EmC4BC=TjpahO=jyKXBnAxHz-0C1KYPb7ZYfxDN_A@mail.gmail.com>
Subject: Re: [PATCH 0/2] iommu/sun50i: Don't report TLB prefetch walks as page faults
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_000440_151402_EC173F45 
X-CRM114-Status: GOOD (  27.60  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jernej,

On Tue, Nov 10, 2026, Jernej Skrabec wrote:
> First off, display engine isn't in merged yet. Second, I don't observe an=
y
> such issues with my wip H616 code.
>
> I think it's best to wait until driver is merged and can be retested and
> merged then, if needed.

Agreed, thanks. In mainline the only H616 IOMMU master today is the video
engine, and the faults I saw came from the display scanning out a
framebuffer through the IOMMU, with the out-of-tree DE33 code I use. I'll
drop this series for now and retest once the display driver is merged.

Out of curiosity: does your WIP code map the framebuffer through the IOMMU?
In the boots where fbcon takes over the display, the fbcon buffer
(1024x768, 3 MiB) is the first IOVA allocation, so it ends right below
the top 1 MiB, which stays unmapped, and the prefetch walk for the page
after it fails.

Best regards,
Arun

On Tue, Nov 10, 2026 at 8:04=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne torek, 10. november 2026 ob 07:05:16 Srednjeevropski standardni =C4=
=8Das je Arun Iyengar via B4 Relay napisal(a):
> > On an H616 with a display scanning out, the IOMMU reports page faults
> > with master -1 at the IOVA right after the end of the framebuffer: once
> > at the first fbcon frame, and then once per frame for a while after
> > each TLB flush, e.g. while a video decoder frees its buffers. They are
> > failed walks of the TLB prefetcher, which the hardware flags with bit 3=
1
> > of the page table interrupt registers and no master bit. Patch 1 stops
> > reporting them. Patch 2 makes the remaining fault messages say which
> > walk failed and what the interrupt register held.
> >
> > Tested on an Orange Pi Zero2 (H616) with HDMI forced on at 1024x768 and
> > three 4K H.264 decodes through cedrus, on 7.3 kernels with and without
> > the patches:
> > - without: 214 "Page fault ... (master -1, dir rd)" lines;
> > - with: none, no "Page fault" line at all, and no decode errors or
> >   timeouts.
> > Since the patched kernel prints every fault that is not a masterless
> > prefetch walk, this also shows that the hardware sets bit 31 for these
> > walks.
>
> First off, display engine isn't in merged yet. Second, I don't observe an=
y
> such issues with my wip H616 code.
>
> I think it's best to wait until driver is merged and can be retested and
> merged then, if needed.
>
> Best regards,
> Jernej
>
> >
> > These patches were developed with Claude (Anthropic) as a coding
> > assistant. It investigated the problem and wrote the code and the commi=
t
> > messages; I reviewed them, and they were tested on an Orange Pi Zero2
> > (H616) as described above.
> >
> > ---
> > Arun Iyengar (2):
> >       iommu/sun50i: Don't report TLB prefetches of unmapped pages as fa=
ults
> >       iommu/sun50i: Print the page table level and status of a fault
> >
> >  drivers/iommu/sun50i-iommu.c | 50 ++++++++++++++++++++++++++++++++++--=
--------
> >  1 file changed, 39 insertions(+), 11 deletions(-)
> > ---
> > base-commit: 2cf4be57b301ed2d7af82e70cff5dfd96894d8de
> > change-id: 20261110-sun50i-iommu-prefetch-85cc9ecff559
> >
> > Best regards,
> > --
> > Arun Iyengar <aiyengar1990@gmail.com>
> >
> >
> >
>
>
>
>

