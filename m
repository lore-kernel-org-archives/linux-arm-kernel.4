Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC3F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 11:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vuNP09wV;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qzhUnvXL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sHi5V+1hpRfrxl1HVLwRyrTDDCQxfUTOQX4vPNFhHb8=; b=vuNP09wVVYcyk7
	82nQw5jZxRARl/qtwB85DmtBISBKA0DgP4fO12aX+keEToE7K9NmNbajar9/CRhXUHAOacSD6tUIx
	Z/fmXzhGoSLApo+8sYfaOb/x71OzO2/dyV3ROTBmX618TPHVByYGuwa4JADh2+ChZ14nJFyLwRjM1
	twxi+Ql+XffFXqGOJEnVC2JMCI9T7indBO7K846O1KH4gAdsCHa6GFGSJaI7Nk7TYWQlh88m6czj3
	h5WzlyGz4ihd32s3xo2hdDnpddQmluI+8TBnCsmr2RQKtrpP27nEezUoGaKgICTrN9K6vyiaUuW+F
	GmCTtv7tOIg5pEsei7bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdbM-00000008gZc-3X4U;
	Wed, 18 Nov 2026 11:13:20 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdbI-00000008gZ3-1PZt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 11:13:19 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-67be4f2f4d4so814489d50.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 03:13:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795000394; cv=none;
        d=google.com; s=arc-20260327;
        b=rhSqpV55J95Kq+sODFh82DYHCPSCLOpDvOD7vIX2AA02OrwxYevAlVLErRrZDidRUw
         BMEHIHEPcKPAdgpzRTeNK5aSJ87OGHNF7Kl9JbA3kZRB3m9YRLjWiDRcpD+fyhDlnXtw
         oPoE8H6VCoyK/R8Uiy1/gX8yXFti1wFZaIF2lF+0RBRFM8yIWPA9j+Y7NhqNM0e3dfKu
         7LRIq680QIkAeq5zUx7Q0KwgUmUxGNDSGEdYg4bVHip1JEB1GOOBuOdg7xd/WTnGvGQI
         g4oCfmxU+4WINhTj+BZJMZ9jibeoo53c1htow1M2H98FpmkTzt/N2ohjOrS5tWBE9g9w
         pA1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sHi5V+1hpRfrxl1HVLwRyrTDDCQxfUTOQX4vPNFhHb8=;
        fh=yM4aIXZHfT7ai3EjN7RC49StNwlUJ3ffucCdLafHm3I=;
        b=Lc7eI7vNnHbq55Nkge5a/IRM76xnqcCIFQOTYcWscCNEA608/fRZCtAYUHSH6YaNxE
         1x9ABgetwrVOLTaY5o32AWbEKSXQ4KUJXJCNceXoPaZCcYH067gIKEQkq14/8Lg54jDI
         OZBJHQuk2C5kIDMdlgyf87zIR7O10sRRTF0lxzlkkKsGAWVS5k2X/l441+5yyX7BoCd0
         3V5lEp/Mcam6BRCq021tV3YNv2mY2iey0mVYsKNH7uBC+HzA3JwOcqoxwtszTUMVcgWk
         AuhXwUuZ1ZJ3CJG3vdyDAlMVShVUufr0/kbSUucWQZyf+8uSUXw/zVgsls1BTKpR5/xf
         sNKQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795000394; x=1795605194; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sHi5V+1hpRfrxl1HVLwRyrTDDCQxfUTOQX4vPNFhHb8=;
        b=qzhUnvXL/7BSEHonOYmD8Cd9ED3P3I7jNGa4WyDKx356/h/tyD9gRr03LdQNGQ9Rou
         0hcpxeEUS7PHDUg2lZ5kD3W91iBjJfb2K59tNYW7RBJ8lrG3+MyHBsVOyuKH1lXoUj1v
         TTkaTMpTnB7aSqXyY6hrp6bzYRhOMe3ot9LEEj/0mznFEwHjQT7zvKEHD57wE0MdvUIY
         bMaeScvRpgHhydRH/8T4fHYRJNhFWeD8BPGxYGwLX1wiLa2kcgEWcG+z/BSfW/hy3DXX
         wwDJxNT7VTqxSAEPvDVhL/Aj3tR83be91amFkF8SWaVg8i0c3uMzpTwbjBic4R5BmO0B
         EYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795000394; x=1795605194;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sHi5V+1hpRfrxl1HVLwRyrTDDCQxfUTOQX4vPNFhHb8=;
        b=OIsc7fgTUmxyO02FHd/Z/o0llnas9C+lgwQK0zgA+dJq1dEv9bFxBjwZ4VFhltBKdn
         RJS4CjRhWlowsLCHAcHRaKeDKXnAPyFvqkQgbmjOWVrZa+LB47If4RJ35qIKcpMwkR4t
         q6N8GLBuw6QTUXIcQHMdPurXMHzNPo5Mq6GDih83kek0vZLq0HEIplaHrxhifugJZKG8
         zRmht8ZVNl0iYJC7h+xzJDcq3WeH/nl5uXaKEJ+DQLBZBJtrRp36GzPFJezqcXQQvxmk
         AX0Jm3wMRCE2LXncFop7EXVifnaux6ohTKp7YMEbU5u8smgSS/mNYm0u3QBKip7Jl/O8
         8JDw==
X-Forwarded-Encrypted: i=1; AL+hErHHEpMKNrA7Kh5cb7IiWusjcOuo1XN1QhLJb6XarnrwPg6r3goYXJYRc++zNnWK6B6uFWnoJhgqL9hEOo0GzSg5@lists.infradead.org
X-Gm-Message-State: APuU4Z+Kw0rpW35tEnjMIgQ8F7ecdjVkOS3cOv4Pm7/mhjFp4F+3CY2g
	K8+/KBg3tto+bUNnKXKZy2i1mxRL+9EeaWWXezR1ZHTaL2KE6o86DGAHjaXABTpHEqvOmkO3Goe
	Y2H6UyCAKJIg8iXvjHDysM9RlbOjYLU62dJ93KA==
X-Gm-Gg: AZFdTZfL8f7ZGjlZn7oXI4ozxQObbPJ+BCyQgBA+tjbCvbRG2mBVJ889WPFACmr+Ecz
	mFGR0ICg1F/IyffeqorqVT6atuBt9IILodQbMo2dTvoDoRHmbMDmpGTPnALetnAEw/S2mdgCB4C
	IigrIvPx7irrQ/1Egal8+AKnGppBaQVlSwkQgJ1HRkxL3ve9pgqa7RHjZy7baWfTkLuo/7FJHkH
	nAnT+TmzjNALOqXFD0r6Y9oTCAHjIOWgInAMvlHVQrnDlVVVK+MiGzmtRion8rxBghuLRoQ370/
	5lTX05i5Vq+pnnL5andOLfnKkbFbDIauamJsb0KItppNIeBh+e+0hF58jo2Ve93vEELlyyjnnM5
	y3MGBzCGc5ogG3EegL94h5akn1+4MwQe9qQ1hM6+EjP+rMTG4dVZymzBrItwOV3qIBJ4M/lF8Ch
	ypjBZ8InHYXr162Zw=
X-Received: by 2002:a05:690c:720a:b0:8b4:fc2d:2fbc with SMTP id
 00721157ae682-8b4fecfa8fdmr6432697b3.17.1795000394419; Wed, 18 Nov 2026
 03:13:14 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
 <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com>
 <CANxy8yTbu63ykQnqa_XA=HhV7JTDZd3ac2XWGzYNwuHBAd2DuQ@mail.gmail.com>
 <CANxy8ySZ_ErH4gi3PbWv6bb+uLvvUV4_-WmBkDrMw+RJqazA5w@mail.gmail.com> <CAGb2v65D6ACO83fAm5_Jh4RC5X3H=26EQYHAz8tVOWEVerSPXA@mail.gmail.com>
In-Reply-To: <CAGb2v65D6ACO83fAm5_Jh4RC5X3H=26EQYHAz8tVOWEVerSPXA@mail.gmail.com>
From: Rajan Yadav <rajanyadav0307@gmail.com>
Date: Wed, 18 Nov 2026 05:13:03 -0600
X-Gm-Features: AclHuK9n1arnwuviwRTqKqG6GX0B1k9jEh54QwQkpt5LgjUFE7LwWPEIi0qBPfo
Message-ID: <CANxy8yT4E474NpEZPE_6QHh1UJvj7xQEVR4mOxW759y75SBd2g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: wens@kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_031316_383727_CB38D36D 
X-CRM114-Status: GOOD (  18.84  )
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

Hi Chen-Yu,

A gentle ping on this patch. It has Andre's Reviewed-by and still
applies cleanly to sunxi/for-next.
As agreed, the OPP fix comes first: v2 of the A133 speed grade and OPP
series is now on the list [1]. Its thermal tests rely on the 90 C trip
from this patch, so it would be good if this one could go in first.
[1] https://lore.kernel.org/all/20261118-a133-series-v2-0-8bcec9c9aadf@gmai=
l.com/
Thanks,
Rajan

On Tue, Nov 3, 2026 at 9:33=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrote=
:
>
> On Tue, Nov 3, 2026 at 10:47=E2=80=AFPM Rajan Yadav <rajanyadav0307@gmail=
.com> wrote:
> >
> > On Tue, Nov 3, 2026 at 7:07 PM Chen-Yu Tsai <wens@kernel.org> wrote:
> > > Does the downstream BSP have this? It would be nice if we could port
> > > it over. Then you can properly use the power allocator and/or the
> > > schedutil governor.
> >
> > Yes. The BSP (sun50iw10p1.dtsi) has dynamic-power-coefficient =3D <190>
> > on cpu0, and sustainable-power =3D <1200> on the CPU thermal zone.
> >
> > The energy model uses the OPP voltages, and Andre points out that the
> > current OPPs are A100-only and don't fit the A133. So I'd like to fix
> > the OPPs first, and then add the coefficient as a follow-up, tested wit=
h
> > the power allocator on the K5C. Is that okay with you?
>
> That works.

