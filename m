Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD87606A880
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 14:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d7xo5sgN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mz+siG7D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Yjh8Gm7XLBcgfYiYP3LTQh3dAygMMLi9uTvlwpldUyI=; b=d7xo5sgNAMdUXXR1cPTMRu2ESB
	emRQK4pHeq2teFIA6YaIYsOKyJa6yUPGojWVeaVvYk1z/uTiAleb/+/dBYdVVlvWiTDIGV8Z/+gN+
	E1/UDQiejZRqL9Rlfl5WjG/zibimiyFExcLKCAJlZJSlQYaVH99p56doA6vH51unH1+4mCezQ+cEd
	sQ5WKGmZHtSGZZkmIGiFyhCIz2H6gVOqYOqMbUU1ulzoopRNBJ93j9itaTf9+nPceWIHaskVaf+b7
	n50D8iFeDhc7WGtD5qXTpGJoCPijNWJgAyPFZ1ddXw2O86dLDtxeml/sMP87gkAEJowgSRnkHu0vF
	V//J1q2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSasH-0000000019l-2zIj;
	Sun, 15 Nov 2026 14:06:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSasG-0000000019f-3qkk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 14:06:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 986D645A6E
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 14:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D6C1F000D0
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 14:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794751588;
	bh=Yjh8Gm7XLBcgfYiYP3LTQh3dAygMMLi9uTvlwpldUyI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=mz+siG7D/yfCsaQUtmvyh2TtPp6RSL+xZHuVfQQpgQhiqnFA2hy66sFqJDYv/zhNN
	 PZdl2f5jnz2cqc1ntx0TIL/cO1Z0Kh+VIfLZI8tPEkRNIx2NwRPylPxwO04vLWiK/C
	 S/tzsizO2aQtz305oM/Q/OG/w+H4MHYJduUfF7hKbiu9ouFFLGxed4MMPRDyLH/eDG
	 hMtlbugIRv5AqQQEF5MAIKv7X7WhfHNaoVQIgvD4XmINyiuNwknyiWuDimQGiag2xB
	 vmscKeRolp3ztysYOwCMZUOKT9oN5lIzDVQYCH3SP/dTdMtB1CQAPEP/qgiHKxh2iZ
	 XHTmXMjR20iDA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ae2fb3fe2fso21801141fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 06:06:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGL73TGgAUeh6puy6rEWUZvGzIEopCwLMfFKlu23sBlaBzxKW7Ox53SjI0UOHoOx111XV5CEpnkm+q+oeXddUDI@lists.infradead.org
X-Gm-Message-State: APuU4Z/9GzY0PsetHk8iqWcbxgiM6Sgfj4VxVEeEaXTYVCPV0dH7VWyo
	3OwF/7AZmfQKC/a2DbmWnVvGkMZRewng2EPNjq1SnCf8ZWvws2gKyVYrqjC+n52LozbacCnzZB7
	xHaQP9kN8AP6JwsvxkWD/TsVf5Wp7FaA=
X-Received: by 2002:a05:651c:41d1:b0:3ab:1207:bd2f with SMTP id
 38308e7fff4ca-3ae2b4bad8cmr29149331fa.11.1794751586867; Sun, 15 Nov 2026
 06:06:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261115061102.229680-1-jernej.skrabec@gmail.com> <20261115061102.229680-8-jernej.skrabec@gmail.com>
In-Reply-To: <20261115061102.229680-8-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 22:06:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v67Kkiz=ns+DGS-nGeX7c_nT61B-CkXggqq0K2uxXGQ1UQ@mail.gmail.com>
X-Gm-Features: AclHuK-7yda1JGDc_9OgA1yiAcJwBx1hvDReZ63bJlhLUfk9UlCfGoWhOH0aQLI
Message-ID: <CAGb2v67Kkiz=ns+DGS-nGeX7c_nT61B-CkXggqq0K2uxXGQ1UQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] dt-bindings: display: allwinner: Split H616 DE33
 layer reg space
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, sboyd@kernel.org, 
	Andre Przywara <andre.przywara@arm.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 15, 2026 at 2:11=E2=80=AFPM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> As it turns out, current H616 DE33 binding was written based on
> incomplete understanding of DE33 design. Namely, planes are shared
> resource and not tied to specific mixer, which was the case for previous
> generations of Display Engine (DE3 and earlier).
>
> This means that current DE33 binding doesn't properly reflect HW and
> using it would mean that second mixer (used for second display output)
> can't be supported.
>
> Remove layer register space, which will be represented with additional
> node, and replace it with phandle, which will point to that new, shared
> node. That way, all mixers can share same layers.
>
> This change is intentionally not backward compatible and the old binding
> will not be supported by the driver, for the following reasons:
>
> - It can't describe the hardware. Plane register space is shared
>   between all mixers, but the old binding puts it in the mixer node, so
>   only one mixer can ever claim it. The second mixer can't be supported
>   with the old binding at all. It also has no way to reference plane to
>   mixer mapping registers, which live in display clocks register space.
>
> - Supporting it would mean keeping a second, mixer-local plane
>   management path in the driver, with hardcoded plane mapping, which
>   doesn't match the hardware and which can't be tested, since nothing
>   uses it.
>
> - It was never used. Upstream H616 DT has no Display Engine nodes and
>   the rest of H616 display pipeline (TCON, HDMI, PHY) is not supported
>   upstream yet, so the old binding never produced a working display.
>   Vendor BSP kernels use a completely different DT structure and no
>   other known DT consumer (U-Boot, *BSD, Zephyr, TF-A, ...) implements
>   H616 display support. Only out of tree WIP patches used it and those
>   are updated together with the kernel.
>
> The driver will print an error, asking to update the device tree, when
> the old binding is detected.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  .../display/allwinner,sun8i-a83t-de2-mixer.yaml  | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a8=
3t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun=
8i-a83t-de2-mixer.yaml
> index cbd18fd83e52..064e4ca7e419 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-=
mixer.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-=
mixer.yaml
> @@ -46,6 +46,10 @@ properties:
>    resets:
>      maxItems: 1
>
> +  allwinner,planes:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle of Display Engine 3.3 planes node
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>
> @@ -74,22 +78,22 @@ allOf:
>        properties:
>          reg:
>            description: |
> -            Registers for controlling individual layers of the display
> -            engine (layers), global control (top), and display blending
> -            control (display). Names are from Allwinner BSP kernel.
> -          maxItems: 3
> +            Registers for display blending control (display) and global
> +            control (top). Names are from Allwinner BSP kernel.
> +          maxItems: 2
>          reg-names:
>            items:
> -            - const: layers
> -            - const: top
>              - const: display
> +            - const: top
>        required:
>          - reg-names
> +        - allwinner,planes
>
>      else:
>        properties:
>          reg:
>            maxItems: 1
> +        allwinner,planes: false
>
>  required:
>    - compatible
> --
> 2.43.0
>
>

