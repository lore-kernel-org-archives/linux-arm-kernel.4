Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57969606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 08:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OKDLNRaG;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v8N5SCaM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bw6nyEiSIkuUi2FfPQWVcCbleSg58qLNpgEdKu/3YUI=; b=OKDLNRaGEat5gH
	PH4jDx+YclxCkVbzV8v5KMwBYjntIdPIF7ShlDRMSJP4kD8+60PiS95pnso0Dr2JHISKy9fLd8DJY
	NiOuOolUNf9ghja19786+6qakaWRvoP3/iZT8WA85EwdOewwQovYPE+KvSI67/OtVw9bnVQ6qiGit
	bN+kb29FyXiI4XtkCoVfz42+T2Nry1llqxuJwR8B2eBhGWpcio2AoWoEw2sgO1FQmlw4f6tu5PyyS
	/0CI1PjnNMN9K0XpJHOz71UGPxShCHzEYPh9ES99+GHZLCpCgMZztxSlZKRvmKzoZHHNs2G+zGhM9
	ztCbr7t9EKUgilpVMJ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlYK-00000005qYg-34zT;
	Tue, 24 Nov 2026 08:07:00 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlYH-00000005qXM-2oI3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 08:06:59 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so3092832e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 00:06:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795507616; cv=none;
        d=google.com; s=arc-20260327;
        b=rAgO2e7C1Q+eO4rSKD/mTKmR0WSgoo/CY+hz+MZPfQtHluHi5pDF8LMgJ2PVgPWJCl
         TE+bjidMeK3eAF6PhMB6ZvLxFgr7rSlVf0OK7m4j7T93liHnHTT6YwSgKvlB4lcPl+e7
         IpCwTAN3DGpxPWs7eIDeDp2ke5bwqCbbljghKHPp3rwD6jfT6FNG6IQ7jKCZ6J9YAg7Q
         SRRfnRgL25h8zmKCvVNAumM17YcaQOlU7t/p9l3xUMP5N5FZqikx4ruwHmA1XI0VXYuI
         bVRY/PZ2bOC88RoFv9V+mbp7PyM/1cXpBr1hHZGFiq6fXUG3+oW9MW69jv+p8My6uqj2
         jgaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bw6nyEiSIkuUi2FfPQWVcCbleSg58qLNpgEdKu/3YUI=;
        fh=Mo8q6OoRQKmcFKbHHHyHqloMocjzmZQ/cQtJwCfZ228=;
        b=MExtLW9r6MRkuRmSJ6hFteQC5WVOCxlDIQEyoyPfTqcm6V30AktlsLhuAI/O9p9DS7
         4ch1p6QW/RyVEHkSXsX+UFtR9sM5BBsNlD0YYm9gAU3h3O3ORXqZpe5aGNXqMKQLtI6o
         8K8fL0SNOyLJOGKtkuvk8HQbHCmQ0W+1aJj5a5xt/yubvrFgSgbfAU4Xle4ACvBvzFlF
         PM0lgzRcFcHhPNYPm4wY719Yx7SO7E51+S9D0R/F5pXFuczkT4a23GHQ9ukf7vvltCqI
         cQ6EomdAjn4juV9BHi4G3APEiW9lERiHmX6y1fEJMWd22PJ+coISwId5x8QteUph1+s/
         B2JQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795507616; x=1796112416; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bw6nyEiSIkuUi2FfPQWVcCbleSg58qLNpgEdKu/3YUI=;
        b=v8N5SCaMOEdV5ChBiHzp+XfMOLIBp9sKcyjp28ZBWPq3RzmOumI3dqWOCTkywI7ke7
         qKGtHfYSy4I7IFA+tdA5gdPgF9/RE5tDMPfYYOz5TFyGUTtDnNlbOh/zi4s/3tkWVQPI
         eR6+Wx/dKypSswEdn2mDZtKnQDY7NDosNqWiVUw/ZPJPsjSMlVW2HEaf60aKweya3uqy
         yYPRMp1kEvR4K+RbMDxquww59o7SCi1Tj0WcAa1z5Ac1ePiLToAdms/EnSAzS1TIfEXP
         dcxqn1kIqhsmMO+1/JlngkPXSm8wg/HG9HsggOkHNzm0Js7k3SdJ4/sh6uX+RxYbdD3y
         vQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795507616; x=1796112416;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bw6nyEiSIkuUi2FfPQWVcCbleSg58qLNpgEdKu/3YUI=;
        b=pM7M1yRsxov4ipVJKoqVHr21FK6Zw7dAmjodZZvNx2wPxoIIJmWrNXkBMcOyjL21cG
         P6GV6YRfHnijBEkhvV1AMC39l2GJ/uzj+WJEMqn1Gg+6iA/PQ4IsbXlxOrycdwjQUdMn
         hcxxZltjyvJttNrF4Bo/bMHZ7X4IIWcZi8TCh+VOcZ4ao1SQEeAg81fMKNHGvqUZpK8Z
         jK7hyd4sXz3J4GwO59ZYG9XZ+12zVPJdRb+JVC6YuGNDUqnKauj9c6swuWgD0MPuZ2bY
         02fRBvJYz1WZZ3eXibO+xyeqbxUs3zmnzNakJZrAhbQbaw+AHcjYNqm1X7qORdD6Xka8
         E2qg==
X-Forwarded-Encrypted: i=1; AL+hErFEfdCBEDewBe9XO7RXv5mNvAf/pSRtreQY64i3FrzK4i8SvewJi/0FEIj/OpQGH4QHE32/bDmRp144eJdOvVrQ@lists.infradead.org
X-Gm-Message-State: APuU4Z8tvxrP9+cRkWB/BJfHKp0OhNVezzotMTjV473MOCEK7k3Laj1c
	cPyJKLlB7wdWc0T+jcK7zwyCYpdS77P5K6LeeyDOJXH48a9V4pc6Icqs/qcJJleCE4LakmhA9MV
	IEz8CPmiRBwtyV12zFl1cVNnkztW3ocI=
X-Gm-Gg: AZFdTZfWMOao+3gbl6wK4Gb8+Xe+sIhGHmIzo7hVLjepPxL557eixKo2e2XBaGsV8Sh
	pPE1ik2TfW1/E4zEMI1YLGqOk+6hd2d72ZTXFsyLPV+9UufmDxXMAJIhU/R+nUvQ/kL4G2kJYaS
	LgnYE5XVIHXzcCvDboG7bG+o31oETMnv9Jps1jYZGkE1qH1zlEZ1JdJ0fmKD0RU2GlRtvy3ft2J
	BBkFStJKrRbxbRgm/X35nbTMMtyy/l5RWbgpfGa+XitF58kU4NAsiZ81hJaH5ZwmocgBrSWlsk1
	KMS2p1RWLqnMIvG3O377WDnzQx3jgccACh6twGr1pmhJExO7xscPvm/7He8Uiwn93mxRuDKePHK
	8xLDG0XkcyohUbLB8nxcaqsGcK/2PysQy938HraXRivFZOEY89vVJVJUrH4UDYmqkzZLlgebmnc
	cEkcSiKzE0mSV/wHw=
X-Received: by 2002:a05:6122:130a:b0:5e9:721c:72a8 with SMTP id
 71dfb90a1353d-5ee8ad0f9ebmr7298180e0c.0.1795507616075; Tue, 24 Nov 2026
 00:06:56 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123235154.315460-1-gahing@gahingwoo.com>
In-Reply-To: <20261123235154.315460-1-gahing@gahingwoo.com>
From: Anton Sovetov <anton.sovetov@gmail.com>
Date: Tue, 24 Nov 2026 11:06:45 +0300
X-Gm-Features: Aa3M54rUMtJHW-VAq-3nFFJeEzc6wZ6Xr6IR4ySmynSenaDrr1lXVW8oN5BrzrI
Message-ID: <CANLiQWot44KOq8A8dQGt0JNoX=BvH2T+HryMEV05qC6iLydidA@mail.gmail.com>
Subject: Re: [PATCH] iommu/rockchip: Disable paging on banks that still page
 before a force reset
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, heiko@sntech.de, 
	tomeu@tomeuvizoso.net, ddrake@baylibre.com, sidong.yang@furiosa.ai, 
	chaoyi.chen@rock-chips.com, iommu@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_000657_763216_6EBD564B 
X-CRM114-Status: GOOD (  33.74  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thanks, that description matches the end state I see, so it is worth tellin=
g you
where it does and does not fit my board.

Mine is an RK3566 with a single bank. The MMU node is 0x40 bytes of
registers and
the driver ends up with num_mmu =3D 1, so two banks cannot disagree. I took=
 the
nearest analogue of your fix that exists for a single bank, the one in the
Android tree: acknowledge a latched page fault with CMD_PAGE_FAULT_DONE bef=
ore
sending CMD_ENABLE_STALL, because a bank sitting in PAGE_FAULT_ACTIVE with =
no
stall ignores the stall command and the poll times out.

Measured on 6.18.24, twenty separate processes, five runs each, IOMMU mode:

- before: 3 ok, 4 wrong output, 18 timeouts (the failures are sticky, only =
a
  reboot clears them);
- with the stale-fault ack: 2 ok, 0 wrong, 18 timeouts.

No change, and more useful: dmesg has no "Enable stall request timed out" a=
nd no
"Disable paging request timed out" line at all. So on my board the
re-enable path
is never the one that fails.

What I see instead, at the first failure: the job is submitted, the
kick registers
hold what the driver wrote, and the core never runs it. INT_RAW_STATUS read=
s
0x10000 while the required mask is 0x300, task counter 0. The MMU is health=
y at
that moment, paging enabled, no fault pending. Later failures sometimes lea=
ve a
fault in the register, but the first one has none.

Two questions if you have the logs at hand:

- on your RK3576, does the hang start the same way, with a job that never
  executes, or does the MMU re-enable failure come first?
- do you ever see bit 0x10000 in the NPU's INT_RAW_STATUS on a hung
job? I cannot
  find what that bit is in the RK3566 register map, and the driver does not=
 mask
  it in, so it never raises an interrupt.

For the record, the other three things I ruled out by measurement on the sa=
me
board, in case one of them is what your patch really fixes: TLB staleness (=
full
ZAP_CACHE and a domain detach/attach before every kick), cache coherency fo=
r the
task and regcmd buffers, and the iova width (limiting the dma mask to 30 bi=
ts).
None of them moved the failure rate.

=D0=B2=D1=82, 24 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 02:5=
2, Jiaxing Hu <gahing@gahingwoo.com>:
>
> After an RK3576 NPU job timeout resets the core, the banks of its IOMMU
> can be left in different states: bank 0 is still paging while bank 1
> has been reset.
>
> In this state the existing stall and paging helpers do nothing, so the
> force reset that follows fails as well. The IOMMU can then no longer be
> enabled, and the NPU stops working.
>
> When the banks disagree, stop paging on the banks that still page
> first, then run the existing sequence.
>
> Tested on a ROCK 4D with repeated forced job timeouts. Without this
> patch, one in every 2 to 10 timeouts was not recovered from; with it,
> 20 out of 20 recovered.
>
> Fixes: cd6438c5f844 ("iommu/rockchip: Reconstruct to support multi slaves=
")
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> ---
> Not tested on the RK3588.
>
> LLM-assisted.
>
>  drivers/iommu/rockchip-iommu.c | 61 ++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iomm=
u.c
> index 1fa3110b142a..5eabefb0ad14 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -507,6 +507,64 @@ static int rk_iommu_disable_paging(struct rk_iommu *=
iommu)
>         return ret;
>  }
>
> +/*
> + * The helpers above only act when every bank agrees. After a reset of t=
he
> + * master, one bank can still be paging; stop it bank by bank.
> + */
> +static void rk_iommu_quiesce_paging_banks(struct rk_iommu *iommu)
> +{
> +       int i, ret;
> +       u32 status;
> +
> +       for (i =3D 0; i < iommu->num_mmu; i++) {
> +               void __iomem *base =3D iommu->bases[i];
> +
> +               if (!(rk_iommu_read(base, RK_MMU_STATUS) & RK_MMU_STATUS_=
PAGING_ENABLED))
> +                       continue;
> +
> +               dev_warn_ratelimited(iommu->dev, "bank %d still paging, s=
tatus %#08x; disabling it\n",
> +                                    i, rk_iommu_read(base, RK_MMU_STATUS=
));
> +
> +               if (rk_iommu_read(base, RK_MMU_STATUS) & RK_MMU_STATUS_PA=
GE_FAULT_ACTIVE)
> +                       writel(RK_MMU_CMD_PAGE_FAULT_DONE, base + RK_MMU_=
COMMAND);
> +
> +               rk_iommu_base_command(base, RK_MMU_CMD_ENABLE_STALL);
> +               ret =3D readl_poll_timeout(base + RK_MMU_STATUS, status,
> +                                        status & RK_MMU_STATUS_STALL_ACT=
IVE,
> +                                        RK_MMU_POLL_PERIOD_US, RK_MMU_PO=
LL_TIMEOUT_US);
> +               if (ret)
> +                       dev_err(iommu->dev, "bank %d: stall timed out, st=
atus %#08x\n",
> +                               i, status);
> +
> +               rk_iommu_base_command(base, RK_MMU_CMD_DISABLE_PAGING);
> +               ret =3D readl_poll_timeout(base + RK_MMU_STATUS, status,
> +                                        !(status & RK_MMU_STATUS_PAGING_=
ENABLED),
> +                                        RK_MMU_POLL_PERIOD_US, RK_MMU_PO=
LL_TIMEOUT_US);
> +               if (ret)
> +                       dev_err(iommu->dev, "bank %d: disable paging time=
d out, status %#08x\n",
> +                               i, status);
> +
> +               rk_iommu_base_command(base, RK_MMU_CMD_DISABLE_STALL);
> +               ret =3D readl_poll_timeout(base + RK_MMU_STATUS, status,
> +                                        !(status & RK_MMU_STATUS_STALL_A=
CTIVE),
> +                                        RK_MMU_POLL_PERIOD_US, RK_MMU_PO=
LL_TIMEOUT_US);
> +               if (ret)
> +                       dev_err(iommu->dev, "bank %d: disable stall timed=
 out, status %#08x\n",
> +                               i, status);
> +       }
> +}
> +
> +static bool rk_iommu_banks_disagree_on_paging(struct rk_iommu *iommu)
> +{
> +       int i, n =3D 0;
> +
> +       for (i =3D 0; i < iommu->num_mmu; i++)
> +               n +=3D !!(rk_iommu_read(iommu->bases[i], RK_MMU_STATUS) &
> +                       RK_MMU_STATUS_PAGING_ENABLED);
> +
> +       return n && n !=3D iommu->num_mmu;
> +}
> +
>  static int rk_iommu_force_reset(struct rk_iommu *iommu)
>  {
>         int ret, i;
> @@ -947,6 +1005,9 @@ static int rk_iommu_enable(struct rk_iommu *iommu)
>         if (ret)
>                 return ret;
>
> +       if (rk_iommu_banks_disagree_on_paging(iommu))
> +               rk_iommu_quiesce_paging_banks(iommu);
> +
>         ret =3D rk_iommu_enable_stall(iommu);
>         if (ret)
>                 goto out_disable_clocks;
>
> base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
> --
> 2.43.0
>


--=20
With respect,
Anton Sovetov (co-Founder and CEO of 3d-club LLC")
https://3d-club.ru                        tel:+7 (999) 246-78-36

