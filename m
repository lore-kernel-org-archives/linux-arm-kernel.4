Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BFA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 04:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q+dpHPq7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=trJeqaN0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=plrZ8vTDv0ic8ndy6Hrgye3r/Sbw023qeByTZDduRDg=; b=Q+dpHPq7J1W7hh
	Z+lx2TRMDazyazd8qRyCdGBekRgeLiEQIb77kMqoVEXI6Q8uV/Q/grqz152J8NTeth991E9FLmqE3
	OwKWWLwXOZ/rHHdbJsRC9k2d/NpjmiZCgCiDAmsuv/HpOfKS3IxT98iZKzQqsLsErewTvwnzbtu7K
	RbFjdnIOICinaCjL+jQAT/0CIjpQOQXA+Qqup39BNZx8fvdKZgt6apQqv9nw9RXBZK5Tbdcwhx3O7
	iYciKRhIthk5WRtXsjSsilJfmUlmP1yQzVjn0/Ot3uuIZkf0+BVwzXNGWttUhgCitRbXg8/QI5v3x
	1Zniccky4vkqvNjBQ8kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWnWJ-0000000Eu40-3TzZ;
	Fri, 27 Nov 2026 04:25:11 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWnWG-0000000Eu3S-3nal
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 04:25:10 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-53dbe9b8d6eso5414233b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 20:25:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795753507; cv=none;
        d=google.com; s=arc-20260327;
        b=h8x+Sen9dORUMAZ4JlEbcKaY5fCnbvqzbFuecSF+w9eAF74YofcqSMHa1OLLJkwREL
         v+6XsaQRxxQV3Hv/ZgbEEz3SI8rOgBUdYLw9o61GeW4gTbPC+13R42RND/YQnegdfYrK
         uqrVEQu9/hWHZEjjRoEt8zrdrY687guBRRm2daoX0OgCyRRjB3jQsRxnN6c2GcypfQCe
         UL2f80Pb+ZYOc/+uKKW86VelHSuzvUu7jrt7yZUoWvDz7vbatlH3YBKCj3knsuBIF1jT
         u1j9N1rjAl/isBOlRAMlEz13DQ8BTytlb8IDoytqr7gWhABwFbh5WMYkIIJnEtw0BlGU
         OI8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=plrZ8vTDv0ic8ndy6Hrgye3r/Sbw023qeByTZDduRDg=;
        fh=bRtsVlHkwf5s4u6C8/eOUaucBVFHbzS5+OJkpznH/PM=;
        b=kYFy7NV277igh5TUy9kNZv6HemliqRh2b0y4SdSdvZc2lsFe8imY3IUDIgkDVPXbAT
         /w/H+oqfOgp8KaR4yRZFyn10YhoZZXwAPJ+kc5RrlfLqk7v1Gl7R8XGKh0KBMFbgIPYj
         KiBnuYqnCEvr2oVFLCeREIPEB0Y/ONiz6i+aSuXaSsF5+a+QSU17j71G7N7n6FZ4DRXb
         Inzjgnvw9esBwHcMJ9SvfTs1eXpPLm7HasZ1wByo1AQWssvxLteLGbudnJkn7QfEF+3f
         kd0al0mJw/KqJyuIJo4x7XIStElumkLxSfrtyQDbAZ6xEJo1sWxTLZ8q4SB7xGyqT7rl
         ZtBQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753507; x=1796358307; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=plrZ8vTDv0ic8ndy6Hrgye3r/Sbw023qeByTZDduRDg=;
        b=trJeqaN02sGgdn9vmiLsBgawQ38PoFAeWGWm6vMUbPPLirjrNu8fD/3tDjCLqdBFMb
         PL3PD48F4qfbhDapLS+H84nrdIXwTnAwmRgv2hUD6n6DM14pcyzH3a8Qzj5TkDnlPHi3
         dcaptu0snXANhOinPdkBxxQy75Xoj+TGpYWehjOc/IOdeyYPhEPJDfJSjMfpEo6eAaNa
         XgISn1zuOQ3Zifpp065VPBxkmFlgrYBLox/Su6ynb12HfYoTjpd1FfIs160uNapRYk1N
         kFZ2tYsYy6syOacQZxF4WEvUxbcdLJnOcKaRnfA8hZI4r1Bm21N0GlcF3mNntmE9lgIi
         NmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753507; x=1796358307;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=plrZ8vTDv0ic8ndy6Hrgye3r/Sbw023qeByTZDduRDg=;
        b=KGuguetPMOSGjYOBulOoeHH0avxiuhvV6vk5ulqBJkvnxIkqxwtEejJNhD/O3ZXWTq
         AZC59l7O4elePF4foIv+zCmt0B8sWq7xrABcz51ExkT4oJ9xknzk7qqrfUKCbP2oRboh
         MzDn6aFxUB4DU5ARxF2AhpX83vdW5l9FXR0U26295JXErsOdQ+jGtb2fmGdkVJfE1R0s
         fTRcceBxnuXfUpe/9nWHeHCRBeWK0nWpFOC2THLftdCgEfQAB4689Pol+waGfS0Nk8JZ
         KCc/auzLbFySyML7bE+cO6J/xjpmlf0uYipgfpL62mgUkVkhTju/DolnLfflDRjFhRZa
         n6ow==
X-Forwarded-Encrypted: i=1; AL+hErFPCO/XLuN9RMqJanIgjdV7ByB+wRXI3CQzjthPUzzDtsWVB812e4no3YMOK665fZ1ScoslwO2lY7epQTB2+5nC@lists.infradead.org
X-Gm-Message-State: APuU4Z+pu6cWdoaBEM8y0Omkgtipgr7P2hoobZpUkvO+WNfFUh/Yu6Dv
	D/FAnVKfi9yEp/Vtae6owGev0T7y0eQiB2g1rCmn3aZkNhCUZB0iCrQMT9qxs+TEv8gbfow57ps
	P3IKPAFTiXzo2oOERDsXE+PfkolXT6Vw=
X-Gm-Gg: AZFdTZf+HFMrctUVmDz4t9B+TD+ug3d/ycMx+wkH/1dt/mWOriF8/2qHO1vq/wqGyZy
	p/lFnRHejxbdbsgH38gtKBswigXc+i/EJ0LX9FttWEuYsKM8BYhoLoLRcB9SjLZpMSfTTjhu9il
	xaCrufrNo4Ps8PXbQgwdXA3u/KprhQzd06K7h2e3Ga8kc6iSXq6Xa0fTD+hBrAqm94o1rReECSi
	GDGiIfZ8U98P3FpKtyd5Tcq056wM9mA/rmnsdXaXSDHqUNXEG1w8SqDgQJ1YfWxpP7434W6GBpA
	wlEuAjFbRlr6HdyKlazOtQzOxPQ6g+1zLII4hNoQdOtINY0w8/PY3iotUsXTC8XwmES8hEb/MVp
	3OvChknZYd1wdhtQ2TTWedzP8mss2afyPrwSwO36FlDFJbdgXDcKwTD0pPUpkgMD9KJY5KaMrgp
	GmjgCF3cyONxxmz9lFOXq10to5
X-Received: by 2002:a05:6808:2383:b0:572:f8ec:5340 with SMTP id
 5614622812f47-5797dd97e12mr17446004b6e.40.1795753507571; Thu, 26 Nov 2026
 20:25:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016113846.8602-1-arash.golgol@gmail.com> <CAMxPZkhRKB8uGL3L4K43aU4pqH+FdZdB829yaw6WDF-h4RW7oA@mail.gmail.com>
In-Reply-To: <CAMxPZkhRKB8uGL3L4K43aU4pqH+FdZdB829yaw6WDF-h4RW7oA@mail.gmail.com>
From: arash golgol <arash.golgol@gmail.com>
Date: Fri, 27 Nov 2026 07:54:38 +0330
X-Gm-Features: Aa3M54oshEKj1zUWUb4kWDxcGN9dYz2vo17SWP_9ajtYh-JXJ1CIiIPrqckXMbs
Message-ID: <CAMxPZkjXrHYT8DNwGCiFDfxRYxpxu1VhM2m0MrdTjG2_LPJFBg@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] media: sun6i-csi: Improve capture and bridge
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com, paulk@sys-base.io, mchehab@kernel.org, 
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_202508_949213_0F99CD27 
X-CRM114-Status: GOOD (  18.71  )
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

Hi,

On Fri, Nov 6, 2026 at 4:24=E2=80=AFPM arash golgol <arash.golgol@gmail.com=
> wrote:
>
> Hi,
>
> On Fri, Oct 16, 2026 at 3:08=E2=80=AFPM Arash Golgol <arash.golgol@gmail.=
com> wrote:
> >
> > Hi,
> >
> > This series improves sun6i-csi capture and bridge.
> >
> > Patch 1 fixes sun6i_csi_capture_format_prepare() to align both width
> > and height to 16 for NV12_16L16, as its 16x16 tiles require.
> >
> > Patch 2 adds vidioc_enum_framesizes() to sun6i-csi-capture, using the
> > same alignment.
> >
> > Patch 3 removes duplicated mbus codes from sun6i-csi-bridge. It was
> > posted earlier and carries Paul's Reviewed-by.
> > Link: https://patchwork.linuxtv.org/project/linux-media/patch/202605271=
24552.33815-1-arash.golgol@gmail.com/
> >
> > Tested on LicheePi Zero Dock (Allwinner V3s) with:
> >   ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-csi-capture
> >
> > As ov5647 only outputs Bayer, streaming HM12/NV12 is not possible on
> > this setup, so I did not test real streaming. I checked that
> > v4l2-ctl --try-fmt-video, --set-fmt-video, --get-fmt-video and
> > --list-framesizes report the expected sizes for HM12 (16 aligned) and
> > NV12 (2 aligned).
> >
> > Arash Golgol (3):
> >   media: sun6i-csi: capture: Align size to 16 for NV12_16L16
> >   media: sun6i-csi: capture: Add enum_framesizes support
> >   media: sun6i-csi: bridge: Remove duplicate mbus format entries
> >
> >  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 12 -----
> >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 45 ++++++++++++++++---
> >  2 files changed, 39 insertions(+), 18 deletions(-)
> >
> > --
> > 2.34.1
>
> Just following up on this series.
> Link: https://patchwork.linuxtv.org/project/linux-media/list/?series=3D32=
161

I appreciate your feedback on this series.
Link: https://patchwork.linuxtv.org/project/linux-media/list/?series=3D3216=
1

--=20
Regards,
Arash Golgol

