Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270B7606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 22:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WwqL9/1L;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KrLJQwfD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=M6Yio2grdDoSc1eb/CDZh/DWvIwV4gCZrf/AWye7rNM=; b=WwqL9/1L9n9YQCFXSSD/Jowl+0
	Ur2GGPkltCJG7RUDzPGSXmJawz317ITKMTXc19tkjsc6935+73i1ZlRX6Kw5DG1JJtBndVDBK4Hci
	01KojQWbY4vlcufmJKcPwdestB7SK6pjoeGGKliSlgdu6B7n+8o71+oNfiacxEcyB1ofGxi7kJ88f
	wB6ZBVNLr0zVF0jGo7HGDjCDB2H9EFELerLeAhZTifBzDuH2/NcRPzDHyAywfuxbJOY6FRCaRnbkJ
	iG/S3Gtk0ZSzQaIMCTUJCdH8A2I7+sh8ZhyoC2/e0AKg8wiQmehjbTlcomEHW3sv5tsJdZekrGXw1
	Tzuqu3jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhXb-0000000Ec7U-3Zoo;
	Thu, 26 Nov 2026 22:02:36 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhX3-0000000Ec5f-1Qjn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 22:02:03 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so3620740b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 14:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795730492; x=1796335292; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M6Yio2grdDoSc1eb/CDZh/DWvIwV4gCZrf/AWye7rNM=;
        b=KrLJQwfDFdq2eDbmwUjX+1Wd7G6cY019ctJwsUIOT9Cm6ftUpw602FcbDxLvy168b4
         IhOl/p5HITEmHyJuy116IQQzex3dDReiQwQr3LRCsvu4ZSEfbRXFTv2tiTdBfn/dkRxb
         3084sJg5/CFaNShkdiQ6fvKZsD/bIlF59TOblYdEnd+Jg9e5esRUP+f/irLF3+Muk5HP
         aTRDWf2dtuEyiP1p+j64XgFRD7MYoMg34tjl/dFD9LT0nnPCRnvz8XnFBf+8Qsahsco8
         i6PA1vTCdpmfME91DlKtNAFxkGw2aM/OJpqvrpZI9wOHVnoe0soiipBElbWp1h9VXuzd
         hvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795730492; x=1796335292;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M6Yio2grdDoSc1eb/CDZh/DWvIwV4gCZrf/AWye7rNM=;
        b=xpZ5VItqOl+zNPE26EtGKTE92h8t+6sQyODg6nov/MycowAEywAYtq+a86M96gDYQd
         0ipOMHHG1kHy2SESGIKD4jbMCSWC2Ka5cO++lFT0dG67dG8VkVaw64SRV3RJi50ZAYR2
         B6H4C91BNJT2AYl1BBxgqHGijR89n3ZIkNObT/gDBEvCS9yyN8K5gWQHielewbYPaHJ2
         em/DGC5UU9bFQlAoqiHmumSyX6KPKsEBgMiUeVth/4DDtLqwJ5kfYEqm5M17+gdP6yxh
         gKXvncOXGyeq/PSFwoe24nAe2lpww/tFX0u/fuMKRlHmO832h+5ppYIc/Mlf9MpjeeIL
         FxdA==
X-Forwarded-Encrypted: i=1; AL+hErEo2/YnWGlPrnB5NcoC/XtEvhyhA7BwB5pNqPz1LW7ksUgF4Sbmp0GBj/SIaD/M6a0lmfuG1IAsSOpUjtLxNm/B@lists.infradead.org
X-Gm-Message-State: APuU4Z/9AwYXideMR+p34ppU24L0iTrC3TT7z5AuzZvYWg0cpr5/oW4e
	qqyfkIcRtvSbX5Y6JIxeF5MttQTP/xJTJUQz5RHXmq2ZbzHJwL7JEVLejz/BWdX19hbxnYtsKxI
	4EPDv
X-Gm-Gg: AZFdTZd4PsHZcBLVv8xasgVz4FCiR50JHCZ4KoJRprMgFGaO8YBRuM4wXm9V8CTpwSG
	52uuxxmoWeTP0JJGVoxmZAXviqSv+ySzfkNidkxE9C2GPc/CUWPR5UNbEdahfuB5TXu8K/XkhrU
	O0yVQoy0o/8Gx8lAt9SU65xwBhlAXk4jnFwrcs9gEVwCjDZijEE0l2DIuRxBUmWKwbXswh4UmI0
	SW7FnMFsQhL8natJOtGxLKmkRKQDekwXySgT5fw2dWvAI0QTsgVbSD9txT6eyb8AQ5eu4HpgSZs
	IT2CxYbLrwvu3T1UgslPhd8EX5iEPLzJHmBcuGp6KWTbbQXq6/Gour11Htd8PQqDgXPP4BCs2yW
	17TIspbPd4KybMcMRiewCxpiuQ0j9F5+K14jswSuTnM3yzA3ZnFCOuYs3u5OhWJafXqTDFwQWv1
	awh6OnqCL+03x9D1GW8xXd/zFpNH6DJuggdvowJdRIWHusdlIvsriHVfVhFl2EST1ytB+FoUGnd
	+h+QVpUspQ6W1cPKyeAeJaJQZfS9dKDQBM8ArXDgUQnPPvalAh7DkZMDLuI8uSqOPRNw1/Z5ifi
	NzopiajN95M0TdZ5cbKM+jPK+gj2egALSTSX54SlN3JU3imtIe8+O3uF
X-Received: by 2002:a05:6a00:14cc:b0:886:a52a:316f with SMTP id d2e1a72fcca58-8c8792b6925mr20638537b3a.4.1795730491886;
        Thu, 26 Nov 2026 14:01:31 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1d71dsm11509363b3a.53.2026.11.26.14.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 14:01:31 -0800 (PST)
Message-ID: <c6636294b5ba0961469c0762e78778ed0256c46e.camel@ndufresne.ca>
Subject: Re: [PATCH v3] media: rkvdec: vdpu383: configure the reference read
 cache
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: vlry.bkv@gmail.com, Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Heiko Stuebner	 <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 17:01:28 -0500
In-Reply-To: <20261030-rkvdec-vdpu383-cache-v3-1-ae188ccda977@gmail.com>
References: <20261030-rkvdec-vdpu383-cache-v3-1-ae188ccda977@gmail.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-2bEUTAQ/xCDECf1C479E"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_140155_287235_406A8B2E 
X-CRM114-Status: GOOD (  49.38  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-2bEUTAQ/xCDECf1C479E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 30 octobre 2026 =C3=A0 10:40 +0100, Valerii Bokov via B4 Relay =
a =C3=A9crit=C2=A0:
> From: Valerii Bokov <vlry.bkv@gmail.com>
>=20
> The VDPU383 has a reference read cache with its own register region,
> "cache" in the device tree, which the driver does not map. Its
> configuration and read limit are therefore left at their power-on
> values, and those differ between power-ups. On RK3576 this makes H.264
> decoding of a 2688x1520 stream take either 22.5 ms or 65.4 ms per
> frame, depending on the power-up, while the values the vendor driver
> programs bring it to 3.6 ms per frame.
>=20
> Map the "cache" region and configure it statically: enable cacheable
> read-allocate accesses with 64-byte lines and set the read limit
> (MAX_READS in the vendor driver) to 0x1c. The registers lose their
> configuration whenever the decoder is powered down, so they are
> programmed from runtime resume, which also covers the first use after
> probe. As the vendor driver does (rkvdec_vdpu38x_run() in
> mpp_rkvdec2.c), the cache is still cleared before every frame, because
> reference buffers are rewritten between frames.
>=20
> The region is optional: on a device tree that does not describe it, the
> driver probes as before and leaves the cache unconfigured. It is mapped
> for any variant whose device tree describes it and configured through a
> new per-variant config_cache() callback, which only VDPU383 implements
> for now, so other variants can add their own cache setup later.
>=20
> Decode time per frame for a 2688x1520 H.264 stream on RK3576, within
> one decoder power-up, with the registers set between runs:
>=20
>   MAX_READS  CACHE0_CFG  ms/frame
>   0x0        power-on        65.4  (slow power-up)
>   0x2        power-on        22.5  (fast power-up)
>   0x1c       power-on         7.2
>   0x2        0x13             8.6
>   0x1c       0x13             3.6
>=20
> The decoded output was bit-identical in all five cases. These numbers
> were taken by setting the registers from user space through /dev/mem.
>=20
> The read limit is a 5-bit field whose meaning is not documented; 0x1c is
> the vendor driver's default. With the cache configured, decode time per
> frame of the same stream against the read limit:
>=20
>   MAX_READS  1     2    4    8    12   16..28
>   ms/frame   12.8  9.2  6.3  4.6  4.1  4.0
>=20
> so the default sits where decoding stops getting faster.
>=20
> The registers were identified with the help of an AI coding assistant
> (Claude, model claude-opus-5-5), which diffed register dumps of fast
> and slow power-ups and matched the result against the vendor driver.
> It also drafted this patch and its changelog, which I reviewed. The
> measurements and tests were run on an RK3576 board.
>=20
> Link: https://lore.kernel.org/r/20260619111810.564384-1-laszlo.fiat@tuta.=
io
> Signed-off-by: Valerii Bokov <vlry.bkv@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> Testing on RK3576 (Smatek T10PE) with v2 of this patch applied, on top
> of 6.18.34 with Simon's priming patch (v3 only restructures how the
> region is mapped and configured, and renames a define):
> - The cache registers are programmed on every runtime resume: zeroed
>   by hand while powered, then suspended and resumed without decoding,
>   they read back 0x1c/0x13 (4/4).
> - 2688x1520 H.264: 4.0-4.2 ms/frame on a 257-frame clip across 8
>   separate power-ups, no fast/slow lottery left.
> - Output is bit-exact against FFmpeg's software decoder (per-frame md5,
>   all 257 frames) for that H.264 clip and for an HEVC Main clip with
>   B-frames encoded from it.
> - 10 minutes of a live 2688x1520 H.264 RTSP stream at the camera's
>   25 fps: 24.4 fps average (23-25 fps in every 30 s window), 14% of
>   one CPU core, no kernel or decoder errors.
>=20
> Open questions:
> - I have not checked whether the decoder's soft reset (after a timeout
>   or error) also resets the cache registers. If it does, they need to
>   be reprogrammed after a reset as well.
> - Simon's out-of-tree priming patch also modifies
>   rkvdec_runtime_resume(), so the two will conflict textually there.
>=20
> Possibly related, not part of this patch:
> - VDPU381 (RK3588) may have the same problem. The vendor driver
>   programs three caches there before every frame (CACHE0/1/2 in
>   rkvdec2_run(): cacheable, read-allocate and 64-byte lines, plus a
>   clear of each), and mainline programs none. I have no RK3588 board to
>   check whether its decode speed also varies between power-ups.
> ---
> Changes in v3:
> - Rename the read-limit value to VDPU383_CACHE_MAX_READS_DEFAULT, set it
>   apart from the register definitions and document it, with measured
>   decode times for values 1-28 (the field is 5 bits wide).
> - Map the "cache" region for any variant whose device tree describes it
>   and configure it through a per-variant config_cache() callback,
>   instead of checking for VDPU383 in probe.
> - Link to v2: https://lore.kernel.org/r/20261029-rkvdec-vdpu383-cache-v2-=
1-859bb44e03a0@gmail.com
>=20
> Changes in v2:
> - Configure the cache statically from runtime resume instead of before
>   every frame, as suggested in review. The values are constants, so
>   "restore" is a plain rewrite; there is nothing to save.
> - Keep clearing the cache before every frame, as the vendor driver
>   does. Happy to drop it if that is preferred, but I have only shown
>   bit-exactness with a single clear on one clip, which is not enough to
>   rely on.
> - Make the "cache" region optional. v1 returned an error from probe
>   when it was missing, which would make the decoder disappear on any
>   device tree that does not describe it.
> - Map the region only for the VDPU383 variant, since the configured
>   values are specific to it and are now applied from shared code.
> - Link to v1: https://lore.kernel.org/r/20261028-rkvdec-vdpu383-cache-v1-=
1-d3548d3b3586@gmail.com
> ---
>  .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c |  2 +
>  .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c |  2 +
>  .../platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h | 16 ++++++++
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c    | 47 ++++++++++++++++=
+++++-
>  drivers/media/platform/rockchip/rkvdec/rkvdec.h    |  4 ++
>  5 files changed, 70 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
> index 5ec755733..efb1f6975 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
> @@ -441,6 +441,8 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
>  =09timeout_threshold =3D h264_ctx->regs.common.reg013_core_timeout_thres=
hold;
>  =09rkvdec_schedule_watchdog(rkvdec, timeout_threshold);
> =20
> +=09rkvdec_vdpu383_clear_cache(rkvdec);
> +
>  =09/* Start decoding! */
>  =09writel(timeout_threshold, rkvdec->link + VDPU383_LINK_TIMEOUT_THRESHO=
LD);
>  =09writel(0, rkvdec->link + VDPU383_LINK_IP_ENABLE);
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> index 3462d995d..6223b89e2 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> @@ -568,6 +568,8 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
>  =09timeout_threshold =3D hevc_ctx->regs.common.reg013_core_timeout_thres=
hold;
>  =09rkvdec_schedule_watchdog(rkvdec, timeout_threshold);
> =20
> +=09rkvdec_vdpu383_clear_cache(rkvdec);
> +
>  =09/* Start decoding! */
>  =09writel(timeout_threshold, rkvdec->link + VDPU383_LINK_TIMEOUT_THRESHO=
LD);
>  =09writel(VDPU383_IP_CRU_MODE, rkvdec->link + VDPU383_LINK_IP_ENABLE);
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
> index 04eb23297..da46f8601 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
> @@ -42,6 +42,22 @@
>  #define VDPU383_STA_INT_SOFTRESET_RDY=09(BIT(10) | BIT(11))
>  #define VDPU383_STA_INT_ALL=09=090x3ff
> =20
> +/* Reference read cache, in the "cache" register region */
> +#define VDPU383_CACHE_CLR_CACHE0=090x10
> +#define VDPU383_CACHE_MAX_READS=09=090x18
> +#define VDPU383_CACHE_CACHE0_CFG=090x1c
> +#define VDPU383_CACHE_CFG_CACHEABLE=09BIT(0)
> +#define VDPU383_CACHE_CFG_READ_ALLOCATE=09BIT(1)
> +#define VDPU383_CACHE_CFG_LINE_64B=09BIT(4)
> +
> +/*
> + * Maximum outstanding reads, a 5-bit field. Its meaning is not document=
ed;
> + * 0x1c is the vendor driver's default. On RK3576, H.264 decoding stops
> + * getting faster from 16 upwards, and is several times slower at 0, whi=
ch
> + * is what the register holds after some power-ups.
> + */
> +#define VDPU383_CACHE_MAX_READS_DEFAULT=090x1c
> +
>  struct vdpu383_regs_common {
>  =09u32 reg008_dec_mode;
> =20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index fbcd0f175..65b84e34a 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1158,6 +1158,29 @@ void rkvdec_schedule_watchdog(struct rkvdec_dev *r=
kvdec, u32 timeout_threshold)
>  =09schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(watchd=
og_time));
>  }
> =20
> +/*
> + * The reference read cache and the read limit lose their configuration =
at
> + * every power-down and come up with values that vary between power-ups,
> + * several times slower than the vendor driver's. Program them whenever =
the
> + * decoder is powered up.
> + */
> +static void rkvdec_vdpu383_config_cache(struct rkvdec_dev *rkvdec)
> +{
> +=09writel(VDPU383_CACHE_CFG_CACHEABLE | VDPU383_CACHE_CFG_READ_ALLOCATE =
|
> +=09       VDPU383_CACHE_CFG_LINE_64B, rkvdec->cache + VDPU383_CACHE_CACH=
E0_CFG);
> +=09writel(VDPU383_CACHE_MAX_READS_DEFAULT, rkvdec->cache + VDPU383_CACHE=
_MAX_READS);
> +}
> +
> +/*
> + * Reference buffers are rewritten between frames, so the cache is clear=
ed
> + * before every frame, as the vendor driver does.
> + */
> +void rkvdec_vdpu383_clear_cache(struct rkvdec_dev *rkvdec)
> +{
> +=09if (rkvdec->cache)
> +=09=09writel(1, rkvdec->cache + VDPU383_CACHE_CLR_CACHE0);
> +}
> +
>  static void rkvdec_device_run(void *priv)
>  {
>  =09struct rkvdec_ctx *ctx =3D priv;
> @@ -1729,6 +1752,7 @@ static const struct rkvdec_variant_ops vdpu383_vari=
ant_ops =3D {
>  =09.irq_handler =3D vdpu383_irq_handler,
>  =09.colmv_size =3D vdpu383_colmv_size,
>  =09.flatten_matrices =3D vdpu383_flatten_matrices,
> +=09.config_cache =3D rkvdec_vdpu383_config_cache,
>  };
> =20
>  static const struct rkvdec_variant vdpu383_variant =3D {
> @@ -1807,6 +1831,19 @@ static int rkvdec_probe(struct platform_device *pd=
ev)
>  =09=09rkvdec->link =3D devm_platform_ioremap_resource_byname(pdev, "link=
");
>  =09=09if (IS_ERR(rkvdec->link))
>  =09=09=09return PTR_ERR(rkvdec->link);
> +
> +=09=09/*
> +=09=09 * Optional: not every device tree describes the cache region. It
> +=09=09 * is configured by the variant's config_cache(), if it has one.
> +=09=09 */
> +=09=09if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "cache")) {
> +=09=09=09rkvdec->cache =3D devm_platform_ioremap_resource_byname(pdev, "=
cache");
> +=09=09=09if (IS_ERR(rkvdec->cache))
> +=09=09=09=09return PTR_ERR(rkvdec->cache);
> +=09=09} else if (rkvdec->variant->ops->config_cache) {
> +=09=09=09dev_info(&pdev->dev,
> +=09=09=09=09 "no \"cache\" region, reference read cache not configured\n=
");
> +=09=09}
>  =09}
> =20
>  =09ret =3D dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
> @@ -1875,8 +1912,16 @@ static void rkvdec_remove(struct platform_device *=
pdev)
>  static int rkvdec_runtime_resume(struct device *dev)
>  {
>  =09struct rkvdec_dev *rkvdec =3D dev_get_drvdata(dev);
> +=09int ret;
> =20
> -=09return clk_bulk_prepare_enable(rkvdec->num_clocks, rkvdec->clocks);
> +=09ret =3D clk_bulk_prepare_enable(rkvdec->num_clocks, rkvdec->clocks);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09if (rkvdec->cache && rkvdec->variant->ops->config_cache)
> +=09=09rkvdec->variant->ops->config_cache(rkvdec);
> +
> +=09return 0;
>  }
> =20
>  static int rkvdec_runtime_suspend(struct device *dev)
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.h
> index a24be6638..c4b9a2211 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -30,6 +30,7 @@
>  #define RKVDEC_8K_PIXELS=09=09(7680 * 4320)
> =20
>  struct rkvdec_ctx;
> +struct rkvdec_dev;
>  struct rkvdec_rcb_config;
> =20
>  struct rkvdec_ctrl_desc {
> @@ -75,6 +76,7 @@ struct rkvdec_variant_ops {
>  =09irqreturn_t (*irq_handler)(struct rkvdec_ctx *ctx);
>  =09u32 (*colmv_size)(u16 width, u16 height);
>  =09void (*flatten_matrices)(u8 *output, const u8 *input, int matrices, i=
nt row_length);
> +=09void (*config_cache)(struct rkvdec_dev *rkvdec);
>  };
> =20
>  struct rkvdec_variant {
> @@ -136,6 +138,7 @@ struct rkvdec_dev {
>  =09struct clk *axi_clk;
>  =09void __iomem *regs;
>  =09void __iomem *link;
> +=09void __iomem *cache;
>  =09struct mutex vdev_lock; /* serializes ioctls */
>  =09struct delayed_work watchdog_work;
>  =09struct gen_pool *sram_pool;
> @@ -180,6 +183,7 @@ void rkvdec_run_preamble(struct rkvdec_ctx *ctx, stru=
ct rkvdec_run *run);
>  void rkvdec_run_postamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run=
);
>  void rkvdec_memcpy_toio(void __iomem *dst, void *src, size_t len);
>  void rkvdec_schedule_watchdog(struct rkvdec_dev *rkvdec, u32 timeout_thr=
eshold);
> +void rkvdec_vdpu383_clear_cache(struct rkvdec_dev *rkvdec);
> =20
>  void rkvdec_quirks_disable_qos(struct rkvdec_ctx *ctx);
> =20
>=20
> ---
> base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> change-id: 20261028-rkvdec-vdpu383-cache-8fbbf8313da3
>=20
> Best regards,

--=-2bEUTAQ/xCDECf1C479E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawisOQAKCRDZQZRRKWBy
9MU2AQCcLosx59v9uR8zf9j3PjZ1SNyTTTQh2WJjS1r1bLuGXAD/Z3k4E2B7Pd+E
QPG5H7DfNpK0jruSUlhuDxNPwIRRvAc=
=0CkT
-----END PGP SIGNATURE-----

--=-2bEUTAQ/xCDECf1C479E--

