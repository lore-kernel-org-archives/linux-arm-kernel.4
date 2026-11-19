Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD255606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 17:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KHNWHQn7;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KjSjqxQ1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Fl/qRlVbkzGh5AOELuRmj7c43ed3VCrTc64PhS5Pjy8=; b=KHNWHQn7yR4QFYRFxkE1Hzpqwv
	yBneRRqBHA/p99UExHCVEvZpwC9Qk+dbdAeZ2510qa8TUbjd8hPpKrUjDza+Mo9ARrnDGJm6bcfvm
	ChVsk7Yv/WSz6UyyPrWfyg0N4P6VtuatPRgb6JVaItVX4/BPzUiUXWapQlHyOIcVTYgyc9H5rmG++
	Q0cKuOon5lwd1gfJb5oHk27QoogYHyxo/eYQaF0YvogxM0nCJErnUwF/9CO73Lt2rYvMLpWHwrKmA
	0UXcPe2LaXqwsCA7H8CVyzLQutvzVfDBq1Flh5UiOgixTNv9sRQSGeFFJFEEjK97Xaxo5hMou/n4/
	bFGuO8+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5mZ-0000000Colm-05Un;
	Thu, 19 Nov 2026 17:18:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5mW-0000000Coks-1vQL;
	Thu, 19 Nov 2026 17:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795108721;
	bh=dsEcWBJuX2/l0d2U9vjAUEM3uepRgu228h79+k2iPNk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=KjSjqxQ1oFQ4LkgrbwOgmsHN23NFs0Y6hdSFuoEEFm2UGesCzlYbnYoyKv3Ot99SB
	 lQUJ+DaHY/kUrKNNermPHzgWYtmyWlqCYYQpFzuGGWIV9v31JjrZJRuKC6O9c7U9kh
	 rPvrpqGbq3qlfz5VoQdhfg8Xj3Quta9Uj1xxA59bZ/EnwMGQP7/6rJnBQUzXReTKrf
	 yjYi50nEQc+ehkKQEH03Fu0wmLHu0atgY08nTuk7IdsuJbYQQctQVFxc784L1IGpJR
	 rWQGmJBsDrmQ5KRkEdoartLIDnuzzaLmAf5X2t/xhBI3hJbEUS+qug6IrzKS1Q14NU
	 WkLWP2u2KiajA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8275D17E0311;
	Thu, 19 Nov 2026 18:18:40 +0100 (CET)
Message-ID: <f46de8ba86e45e44a3f26b2eb06627ae57a0064d.camel@collabora.com>
Subject: Re: [PATCH 2/4] media: rkvdec: Move vp9 functions to common file
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 19 Nov 2026 12:18:39 -0500
In-Reply-To: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-2-180fb2d1f10c@gmail.com>
References: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
	 <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-2-180fb2d1f10c@gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-MhVtI85+IIjy5xrl3Ple"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_091844_854533_91AE9398 
X-CRM114-Status: GOOD (  22.01  )
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

--=-MhVtI85+IIjy5xrl3Ple
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi,

Le dimanche 26 juillet 2026 =C3=A0 15:25 -0500, Venkata Atchuta Bheemeswara=
 Sarma
Darbha a =C3=A9crit=C2=A0:
> Refactor common VP9 functions in preparation for adding the VDPU381
> variant
>=20
> Signed-off-by: Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmai=
l.com>
> ---
>  drivers/media/platform/rockchip/rkvdec/Makefile    |   1 +
>  .../platform/rockchip/rkvdec/rkvdec-vp9-common.c   |  65 ++++++++++++
>  .../platform/rockchip/rkvdec/rkvdec-vp9-common.h   |  92 +++++++++++++++=
++
>  .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    | 113 +--------------=
------
>  4 files changed, 159 insertions(+), 112 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile b/drivers/me=
dia/platform/rockchip/rkvdec/Makefile
> index e629d571e4d8..2bbd67b2db11 100644
> --- a/drivers/media/platform/rockchip/rkvdec/Makefile
> +++ b/drivers/media/platform/rockchip/rkvdec/Makefile
> @@ -12,4 +12,5 @@ rockchip-vdec-y +=3D \
>  =09=09   rkvdec-vdpu381-hevc.o \
>  =09=09   rkvdec-vdpu383-h264.o \
>  =09=09   rkvdec-vdpu383-hevc.o \
> +=09=09   rkvdec-vp9-common.o \
>  =09=09   rkvdec-vp9.o
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9-common.c b=
/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9-common.c
> new file mode 100644
> index 000000000000..a802f0acd27b
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9-common.c
> @@ -0,0 +1,65 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip video decoder VP9 common functions
> + *
> + * Copyright (C) 2019 Collabora, Ltd.
> + *=09Boris Brezillon <boris.brezillon@collabora.com>
> + * Copyright (C) 2021 Collabora, Ltd.
> + *=09Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> + *
> + * Copyright (C) 2016 Rockchip Electronics Co., Ltd.
> + *=09Alpha Lin <Alpha.Lin@rock-chips.com>
> + */
> +#include <linux/v4l2-common.h>
> +#include <media/v4l2-h264.h>
> +#include <media/v4l2-mem2mem.h>
> +
> +#include "rkvdec.h"
> +#include "rkvdec-vp9-common.h"
> +
> +void write_coeff_plane(const u8 coef[6][6][3], u8 *coeff_plane)
> +{
> +=09unsigned int idx =3D 0, byte_count =3D 0;
> +=09int k, m, n;
> +=09u8 p;
> +
> +=09for (k =3D 0; k < 6; k++) {
> +=09=09for (m =3D 0; m < 6; m++) {
> +=09=09=09for (n =3D 0; n < 3; n++) {
> +=09=09=09=09p =3D coef[k][m][n];
> +=09=09=09=09coeff_plane[idx++] =3D p;
> +=09=09=09=09byte_count++;
> +=09=09=09=09if (byte_count =3D=3D 27) {
> +=09=09=09=09=09idx +=3D 5;
> +=09=09=09=09=09byte_count =3D 0;
> +=09=09=09=09}
> +=09=09=09}
> +=09=09}
> +=09}
> +}
> +
> +struct rkvdec_decoded_buffer *
> +get_ref_buf_vp9(struct rkvdec_ctx *ctx, struct vb2_v4l2_buffer *dst, u64=
 timestamp)
> +{
> +=09struct v4l2_m2m_ctx *m2m_ctx =3D ctx->fh.m2m_ctx;
> +=09struct vb2_queue *cap_q =3D &m2m_ctx->cap_q_ctx.q;
> +=09struct vb2_buffer *buf;
> +
> +=09/*
> +=09 * If a ref is unused or invalid, address of current destination
> +=09 * buffer is returned.
> +=09 */
> +=09buf =3D vb2_find_buffer(cap_q, timestamp);
> +=09if (!buf)
> +=09=09buf =3D &dst->vb2_buf;
> +
> +=09return vb2_to_rkvdec_decoded_buf(buf);
> +}
> +
> +void update_dec_buf_info(struct rkvdec_decoded_buffer *buf,
> +=09=09=09 const struct v4l2_ctrl_vp9_frame *dec_params)
> +{
> +=09buf->vp9.width =3D dec_params->frame_width_minus_1 + 1;
> +=09buf->vp9.height =3D dec_params->frame_height_minus_1 + 1;
> +=09buf->vp9.bit_depth =3D dec_params->bit_depth;
> +}
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9-common.h b=
/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9-common.h
> new file mode 100644
> index 000000000000..0d042215fad2
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9-common.h
> @@ -0,0 +1,92 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip video decoder VP9 common functions
> + *
> + * Copyright (C) 2019 Collabora, Ltd.
> + *=09Boris Brezillon <boris.brezillon@collabora.com>
> + * Copyright (C) 2021 Collabora, Ltd.
> + *=09Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> + *
> + * Copyright (C) 2016 Rockchip Electronics Co., Ltd.
> + *=09Alpha Lin <Alpha.Lin@rock-chips.com>
> + */
> +
> +#include <media/v4l2-h264.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/v4l2-vp9.h>
> +
> +#include "rkvdec.h"
> +
> +struct rkvdec_vp9_run {
> +=09struct rkvdec_run base;
> +=09const struct v4l2_ctrl_vp9_frame *decode_params;
> +};
> +
> +struct rkvdec_vp9_intra_mode_probs {
> +=09u8 y_mode[105];
> +=09u8 uv_mode[23];
> +};
> +
> +struct rkvdec_vp9_intra_only_frame_probs {
> +=09u8 coef_intra[4][2][128];
> +=09struct rkvdec_vp9_intra_mode_probs intra_mode[10];
> +};
> +
> +struct rkvdec_vp9_inter_frame_probs {
> +=09u8 y_mode[4][9];
> +=09u8 comp_mode[5];
> +=09u8 comp_ref[5];
> +=09u8 single_ref[5][2];
> +=09u8 inter_mode[7][3];
> +=09u8 interp_filter[4][2];
> +=09u8 padding0[11];
> +=09u8 coef[2][4][2][128];
> +=09u8 uv_mode_0_2[3][9];
> +=09u8 padding1[5];
> +=09u8 uv_mode_3_5[3][9];
> +=09u8 padding2[5];
> +=09u8 uv_mode_6_8[3][9];
> +=09u8 padding3[5];
> +=09u8 uv_mode_9[9];
> +=09u8 padding4[7];
> +=09u8 padding5[16];
> +=09struct {
> +=09=09u8 joint[3];
> +=09=09u8 sign[2];
> +=09=09u8 classes[2][10];
> +=09=09u8 class0_bit[2];
> +=09=09u8 bits[2][10];
> +=09=09u8 class0_fr[2][2][3];
> +=09=09u8 fr[2][3];
> +=09=09u8 class0_hp[2];
> +=09=09u8 hp[2];
> +=09=09u8 padding6[3];
> +=09} mv;
> +};
> +
> +struct rkvdec_vp9_probs {
> +=09u8 partition[16][3];
> +=09u8 pred[3];
> +=09u8 tree[7];
> +=09u8 skip[3];
> +=09u8 tx32[2][3];
> +=09u8 tx16[2][2];
> +=09u8 tx8[2][1];
> +=09u8 is_inter[4];
> +=09/* 128 bit alignment */
> +=09u8 padding0[3];
> +=09union {
> +=09=09struct rkvdec_vp9_inter_frame_probs inter;
> +=09=09struct rkvdec_vp9_intra_only_frame_probs intra_only;
> +=09};
> +=09/* 128 bit alignment */
> +=09u8 padding1[8];
> +};
> +
> +void write_coeff_plane(const u8 coef[6][6][3], u8 *coeff_plane);
> +
> +struct rkvdec_decoded_buffer *
> +get_ref_buf_vp9(struct rkvdec_ctx *ctx, struct vb2_v4l2_buffer *dst, u64=
 timestamp);

This and all the -common are completely inconsistent. We even have twice
rkvdec_rps. I would personally suggest to do more prep work, and fix
consistently everything. My personal preference would be to have rkvdec_<co=
dec>
namespace everywhere. Not randomly a suffix, or prefix, or nothing.

Nicolas

> +
> +void update_dec_buf_info(struct rkvdec_decoded_buffer *buf,
> +=09=09=09 const struct v4l2_ctrl_vp9_frame *dec_params);
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/driver=
s/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> index d4243ce230c7..495738762713 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> @@ -23,71 +23,12 @@
> =20
>  #include "rkvdec.h"
>  #include "rkvdec-regs.h"
> +#include "rkvdec-vp9-common.h"
> =20
>  #define RKVDEC_VP9_PROBE_SIZE=09=094864
>  #define RKVDEC_VP9_COUNT_SIZE=09=0913232
>  #define RKVDEC_VP9_MAX_SEGMAP_SIZE=0973728
> =20
> -struct rkvdec_vp9_intra_mode_probs {
> -=09u8 y_mode[105];
> -=09u8 uv_mode[23];
> -};
> -
> -struct rkvdec_vp9_intra_only_frame_probs {
> -=09u8 coef_intra[4][2][128];
> -=09struct rkvdec_vp9_intra_mode_probs intra_mode[10];
> -};
> -
> -struct rkvdec_vp9_inter_frame_probs {
> -=09u8 y_mode[4][9];
> -=09u8 comp_mode[5];
> -=09u8 comp_ref[5];
> -=09u8 single_ref[5][2];
> -=09u8 inter_mode[7][3];
> -=09u8 interp_filter[4][2];
> -=09u8 padding0[11];
> -=09u8 coef[2][4][2][128];
> -=09u8 uv_mode_0_2[3][9];
> -=09u8 padding1[5];
> -=09u8 uv_mode_3_5[3][9];
> -=09u8 padding2[5];
> -=09u8 uv_mode_6_8[3][9];
> -=09u8 padding3[5];
> -=09u8 uv_mode_9[9];
> -=09u8 padding4[7];
> -=09u8 padding5[16];
> -=09struct {
> -=09=09u8 joint[3];
> -=09=09u8 sign[2];
> -=09=09u8 classes[2][10];
> -=09=09u8 class0_bit[2];
> -=09=09u8 bits[2][10];
> -=09=09u8 class0_fr[2][2][3];
> -=09=09u8 fr[2][3];
> -=09=09u8 class0_hp[2];
> -=09=09u8 hp[2];
> -=09} mv;
> -};
> -
> -struct rkvdec_vp9_probs {
> -=09u8 partition[16][3];
> -=09u8 pred[3];
> -=09u8 tree[7];
> -=09u8 skip[3];
> -=09u8 tx32[2][3];
> -=09u8 tx16[2][2];
> -=09u8 tx8[2][1];
> -=09u8 is_inter[4];
> -=09/* 128 bit alignment */
> -=09u8 padding0[3];
> -=09union {
> -=09=09struct rkvdec_vp9_inter_frame_probs inter;
> -=09=09struct rkvdec_vp9_intra_only_frame_probs intra_only;
> -=09};
> -=09/* 128 bit alignment */
> -=09u8 padding1[11];
> -};
> -
>  /* Data structure describing auxiliary buffer format. */
>  struct rkvdec_vp9_priv_tbl {
>  =09struct rkvdec_vp9_probs probs;
> @@ -136,11 +77,6 @@ struct rkvdec_vp9_intra_frame_symbol_counts {
>  =09struct rkvdec_vp9_refs_counts ref_cnt[2][4][2][6][6];
>  };
> =20
> -struct rkvdec_vp9_run {
> -=09struct rkvdec_run base;
> -=09const struct v4l2_ctrl_vp9_frame *decode_params;
> -};
> -
>  struct rkvdec_vp9_frame_info {
>  =09u32 valid : 1;
>  =09u32 segmapid : 1;
> @@ -166,27 +102,6 @@ struct rkvdec_vp9_ctx {
>  =09struct rkvdec_regs regs;
>  };
> =20
> -static void write_coeff_plane(const u8 coef[6][6][3], u8 *coeff_plane)
> -{
> -=09unsigned int idx =3D 0, byte_count =3D 0;
> -=09int k, m, n;
> -=09u8 p;
> -
> -=09for (k =3D 0; k < 6; k++) {
> -=09=09for (m =3D 0; m < 6; m++) {
> -=09=09=09for (n =3D 0; n < 3; n++) {
> -=09=09=09=09p =3D coef[k][m][n];
> -=09=09=09=09coeff_plane[idx++] =3D p;
> -=09=09=09=09byte_count++;
> -=09=09=09=09if (byte_count =3D=3D 27) {
> -=09=09=09=09=09idx +=3D 5;
> -=09=09=09=09=09byte_count =3D 0;
> -=09=09=09=09}
> -=09=09=09}
> -=09=09}
> -=09}
> -}
> -
>  static void init_intra_only_probs(struct rkvdec_ctx *ctx,
>  =09=09=09=09  const struct rkvdec_vp9_run *run)
>  {
> @@ -348,24 +263,6 @@ static void init_probs(struct rkvdec_ctx *ctx,
>  =09=09init_inter_probs(ctx, run);
>  }
> =20
> -static struct rkvdec_decoded_buffer *
> -get_ref_buf_vp9(struct rkvdec_ctx *ctx, struct vb2_v4l2_buffer *dst, u64=
 timestamp)
> -{
> -=09struct v4l2_m2m_ctx *m2m_ctx =3D ctx->fh.m2m_ctx;
> -=09struct vb2_queue *cap_q =3D &m2m_ctx->cap_q_ctx.q;
> -=09struct vb2_buffer *buf;
> -
> -=09/*
> -=09 * If a ref is unused or invalid, address of current destination
> -=09 * buffer is returned.
> -=09 */
> -=09buf =3D vb2_find_buffer(cap_q, timestamp);
> -=09if (!buf)
> -=09=09buf =3D &dst->vb2_buf;
> -
> -=09return vb2_to_rkvdec_decoded_buf(buf);
> -}
> -
>  static dma_addr_t get_mv_base_addr(struct rkvdec_decoded_buffer *buf)
>  {
>  =09unsigned int aligned_pitch, aligned_height, yuv_len;
> @@ -446,14 +343,6 @@ static void config_seg_registers(struct rkvdec_ctx *=
ctx, unsigned int segid)
>  =09=09(seg->flags & V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE);
>  }
> =20
> -static void update_dec_buf_info(struct rkvdec_decoded_buffer *buf,
> -=09=09=09=09const struct v4l2_ctrl_vp9_frame *dec_params)
> -{
> -=09buf->vp9.width =3D dec_params->frame_width_minus_1 + 1;
> -=09buf->vp9.height =3D dec_params->frame_height_minus_1 + 1;
> -=09buf->vp9.bit_depth =3D dec_params->bit_depth;
> -}
> -
>  static void update_ctx_cur_info(struct rkvdec_vp9_ctx *vp9_ctx,
>  =09=09=09=09struct rkvdec_decoded_buffer *buf,
>  =09=09=09=09const struct v4l2_ctrl_vp9_frame *dec_params)

--=-MhVtI85+IIjy5xrl3Ple
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav8vbwAKCRDZQZRRKWBy
9ISpAQC3CBRFoTOTTnkhG1O7ChiQP0FhnEaB9VFgWVZ8inwjxQD/bIlhTC88XWNu
W8MTN2z+GkLKWSo/7W+VdhjJ4nN71QA=
=jRd6
-----END PGP SIGNATURE-----

--=-MhVtI85+IIjy5xrl3Ple--

