Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AF5606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wTU7DVdO;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=MkilFKre
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sPLFwhIcT/MvzLNNSK/4rlL74eBqG/2kXsTllYHm22A=; b=wTU7DVdOBIdtfP
	8mw9sGyYHCgrFd6YgcrifhOzW6KzYS6GmoKOXtgsvVxl7ztapYKmWAjJo1NrLI7ErsPtrfN1MrAAa
	VAhhkiBsjapfifFLSrr/zdtSywWfLyBctAoBvcpeO49WHqMHBS+u+YSfewSAE4Z2mA7gRnbb5jCxY
	Jec87jUuPy5BnPw/c4c+qOKQhXGH/xT/dRjgFfynAAU9YXnPHhAPssfZnQyPizeXgPsYFKocichwD
	I6RsLsSWIQRK2rZaJFNeuKW1NhzRGiJ1xLV9y9nocPGWpoubXZ+2SxFAjGKGi1PDtg/7PNAGvdMK+
	9TrmIlQVBR9iXFweVuhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMae-0000000ElVc-1SFG;
	Fri, 20 Nov 2026 11:15:36 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMaW-0000000ElR5-0TBG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:15:34 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso6593797b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:15:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795173327; cv=none;
        d=google.com; s=arc-20260327;
        b=eLCBoRKa/Mt6kQME6KMyz5Lo9/OtbDnymzk9yIibOblsnKpJ+OaOGuhBwOPmOqXOXf
         yX9H+uspZDzbno6q4ZMpcSLqA3WwvkeSmfh52UVHGbaYQgWuqVWBv1v7BWARfrN4PxQu
         dxt5nMwyX47HAgrRy3XclItnUqdRu/Opj78dr7YSVw2IDUPqHVNTIaghL9yN1ehtkRXI
         9j9h8ttnJp1zY/kGZhJSXjk9IxlcZQwdGC47SD3V8v/9JSZ68AlUfkjogLs3t39c96+6
         efoziAsRAQZHjGObRoAv8CWnQA/CXzZ8Rg0K++qnINSslw/3Qw852tR7Y/wtsPRFAl40
         0Ilg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sPLFwhIcT/MvzLNNSK/4rlL74eBqG/2kXsTllYHm22A=;
        fh=OTULFEzWNJq/wIlDgtrMY2r7+Ust4P4lWj1WvuHPoYM=;
        b=fyk6UVBi3Y7Qps4tQ/eHhXOztCnORBfUe8paXk+mx24LNKzYup84h6wI/TC2U6+Gyp
         AtcQkxkNvC4tSKyCSnnBNJX31HOVFpeRuzAY057oMHW5fRoIwcDE/Ug9kl3Tw+GP3xit
         0WntcF80YovsqGGLzauD8aVy6JPonqgwZxPqxmEKK4xT2B7wT+ATKMzRKjV5Zc3uH5C4
         DEoNUD6Vuv+dYTmMaDlnbP1cTrcwV/VbAnyFTzpWWaZPzdenrllThy5n+rGe8w6I9XI6
         rZg/ai/gGZDOaX61Xr7JbbzOQGCnUJwWTLkiuC6/9PAzJL8yZ6XS147x3Qs9xNE592ZW
         e+Ew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795173327; x=1795778127; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sPLFwhIcT/MvzLNNSK/4rlL74eBqG/2kXsTllYHm22A=;
        b=MkilFKreZ2GHrlrYyd/l5LoUbISzGMYZ8EaPSJJIOrdFqmTC/WNqTy7R2BSKJ0AR3Q
         0hvZIZsmmnnCeO5ZHXAoudbFoJQdCk4f38392yd223cM/NFV2VoPw2fO8iNnE6ZG8s5E
         snYQW8l0jEcTInB/v6u0qi3MiYgKC2tMOyy+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173327; x=1795778127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sPLFwhIcT/MvzLNNSK/4rlL74eBqG/2kXsTllYHm22A=;
        b=0u7zgF98OFVicrrygjunec0OGFkLILO7jKhsvBQnfhjwNxOQdm7PIaKQnXS4uEqClM
         JRjBU/Gm78/zKkSbUKQsD3nEx/z2a9ynbXB96d/9yF3tfCREVKSmG1nesX52DXHit0az
         rnIDzZnp4jA7as0hR87jP23RRM27cGRgidVHD/5HUV/cEMKFVwpzip6qGipzfOC4hu6G
         QHhHMeHWb05Ni2f53D+63rZK6oywZWoDUJu5+Xz8vMBMr3Uq4k1NPKUmm6fARB3Ylzcd
         7NxcXMk+JDZLLE65NqDar7y3syHxILljhYb48D75dnVlchdNElqp0N+aUmefKxuDUYA+
         WLwQ==
X-Forwarded-Encrypted: i=1; AL+hErG0Cbzp07iLtCv36wauhJUBAWRvYmw78dabhU7cbWuVvh7DHmIVU7B5+t0Ief9MDqMfZc07ZJpWwGtHluf7s6cq@lists.infradead.org
X-Gm-Message-State: APuU4Z8FOTpdjGkXWugh9sAyFojO/tIOYn+wgzHioSaxB6s+tjxG3Z22
	W68TZ9qTPtECWmX+584/Qk66VNWm4CItA4ngwHeGYefKe+pruDKPhkjlJbH52UbcApT7IkeKgCq
	RkK1Rx4C2Sh/k9hmV45owZFSKDHUJt1bFWXZ+6IQWSw==
X-Gm-Gg: AZFdTZc0qeEL0LSWp4dd5LtPt8EHZ21/KFAjl9NuVD2jaTjQpf4bJwFUugKkrRSPWuK
	8p0SP8G6ZMO/Mr7tEUUBUtwK0jhRdn1jlH601G4ze4dyV//0LSAL5O5gwkYOVpYXItUtD3HJ7FC
	xvdIniCdYHXDckAJRpOJFWuzgzDhoVvlOIATMrn9c8Hg8gYV3a3Vh1+jueP9wK+aGL2NT0V/j1W
	xlMNHu01Rr+OQMy7es9FMh9pJhoG+a2kemYPPRlfgTVl7tYWlZp6TMU0sDZ1o7yf/0eD0rfghDG
	E97buJXr2HQZ8dNdCCCbShWnAp8Csdd/roYJskCTZY4Pm6T9ggAFdsQHLTjSBrsq+ChBy3xrXUQ
	6CimMyJCox9le7PDaBF/jY0mp4p6tl0Cj5S3jrVZ53Bh+0g3QTYGfWyPlZR78unWrL0k=
X-Received: by 2002:a05:690c:f0a:b0:8b0:a8c1:b203 with SMTP id
 00721157ae682-8b5204a4d62mr11865107b3.29.1795173326740; Fri, 20 Nov 2026
 03:15:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028105807.2567225-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20261028105807.2567225-1-dario.binacchi@amarulasolutions.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 20 Nov 2026 12:15:16 +0100
X-Gm-Features: AclHuK_lul2WkB_GKijVQqX2Biher4WJINl3HIKsyICsb3rvDVwYFNAUZr7v3UE
Message-ID: <CABGWkvq_iUWQCVphJa1yuCJpekseUEHwme-Uj2Wpq7z8A2TKag@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: st: add firmware reserved memory to Engicam MicroGEA-STM32MP257
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-amarula@amarulasolutions.com, michael@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_031528_342535_CE06D5BD 
X-CRM114-Status: GOOD (  18.17  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alexandre,

Gentle ping on this patch. Could it be queued as a fix for v7.4?
The SoM support went into v7.4-rc1.

Thanks and regards,
Dario

On Wed, Oct 28, 2026 at 11:58=E2=80=AFAM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> The first 64 MiB of the DDR are used by the secure firmware (TF-M,
> Cortex-M33 firmware, BL31 and OP-TEE) and are protected by the RISAF
> firewall. Without a reserved-memory node Linux allocates pages there,
> and the first access triggers an IAC exception and an OP-TEE panic:
>
>   E/TC:0   stm32_iac_itr:197 IAC exception ID: 137
>   Faulty address (IADDR0): 0x80000060
>   E/TC:0   Panic at core/drivers/firewall/stm32_iac.c:212 <stm32_iac_itr>
>
> Reserve the region, as done for the stm32mp257f-ev1 board.
>
> Fixes: c5ce8d7bcc78 ("arm64: dts: st: support Engicam MicroGEA-STM32MP257=
 SoM")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---
>
>  .../boot/dts/st/stm32mp257-engicam-microgea.dtsi     | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi b/ar=
ch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
> index 5b4287e86def..6cd64587ecdc 100644
> --- a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
> @@ -19,6 +19,18 @@ memory@80000000 {
>                 device_type =3D "memory";
>                 reg =3D <0x0 0x80000000 0x0 0x80000000>;
>         };
> +
> +       reserved-memory {
> +               #address-cells =3D <2>;
> +               #size-cells =3D <2>;
> +               ranges;
> +
> +               fw@80000000 {
> +                       compatible =3D "shared-dma-pool";
> +                       reg =3D <0x0 0x80000000 0x0 0x4000000>;
> +                       no-map;
> +               };
> +       };
>  };
>
>  &scmi_regu {
> ---
> base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> branch: stm32mp257-engicam-microgea-fw-reserved-memory
>
> --
> 2.43.0
>


--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com

