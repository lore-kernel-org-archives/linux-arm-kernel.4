Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1BE606A883
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 22:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=orjlhg9d;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=P17xzKtE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=v0pad5rhFZNVf/DcwG2P+Ojp8s+P0GwyLe5Cg7QYVCI=; b=orjlhg9dTGaKel+B8luRe4xHdv
	QOvKWQt9wJpdDqRagRFaLNICOepihMGaIlKOrCZomb308OnltrDdzGpRisKj61lWO4eZFunUKeOnf
	PYBCU/hR4AhGb1977g/DRnPQtWhb0DS+xYx3UAHeuFC45IzMc5Fc9UgXrgmb6YNxJ3J0uto/cD/5x
	7YtIcemfDwIEw0iGIY4aFTlbkXwhmZUofTEu1+d9wvgIWE/bQhmkBu4aWjDzAscE40aNoKIQ3ynhf
	A1GAODkb2LBtNXd7NmwA8WrwtK8xn7CgxWyYlJ83h1YQJ5xnbp8pgYsq+BGTIYBfm3eAG2f0eP2GV
	oUF4EeDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRLy-00000007C7l-1pBV;
	Tue, 17 Nov 2026 22:08:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRLv-00000007C7K-3dn4;
	Tue, 17 Nov 2026 22:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794953312;
	bh=YKI1+orUhC7UVyTNXTw2Fvdl/90JM9tFKLlKjK3PlCM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=P17xzKtEYoIkyovYIg//JNQKvg/4GEj5FVwp99jX0cDdTXC9lQb/W9EhSjy4qC5rs
	 SWkD0sCZu5NTMCaxzxbsJL19dNuSkifRrI8fGB3BPCDj1XvojM2cG4QDqghRjwLaIu
	 WTiessdUsZfL+VwYjKirmOfUXFqlqB5PGPdvMmVtjcQDYEDr5UvG6zzjlWgGO33Dvg
	 LMPhArW19gbGU4LJpPydyQF9KKMw0CqrDVR0ciJLhS/nyPJR5GfoST5B90V96R/6IG
	 DFRH4M2kpdKrojE9CszMkgTUQ6iEyN+G1hUOLh0K+s2tSgrKDzDD41OygH0Uq2jUjV
	 qrnTFlt0Q+w2w==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF37017E00E8;
	Tue, 17 Nov 2026 23:08:30 +0100 (CET)
Message-ID: <fa76c2a0093bc0c75702dcdbfacbf0b2adc8ad9c.camel@collabora.com>
Subject: Re: [PATCH v2 0/9] v4l2: Add tracing for stateless codecs
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, Daniel Almeida	
 <daniel.almeida@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
  Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers	 <mathieu.desnoyers@efficios.com>,
 Benjamin Gaignard	 <benjamin.gaignard@collabora.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,  Heiko Stuebner	 <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Date: Tue, 17 Nov 2026 17:08:30 -0500
In-Reply-To: <20260610-v4l2-add-ftrace-v2-0-9756edf72ac1@collabora.com>
References: <20260610-v4l2-add-ftrace-v2-0-9756edf72ac1@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-+9L0I7/vQ9auKcdun9Ph"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_140836_133270_D18CE473 
X-CRM114-Status: GOOD (  23.62  )
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

--=-+9L0I7/vQ9auKcdun9Ph
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 10 juin 2026 =C3=A0 10:33 -0400, Detlev Casanova a =C3=A9crit=
=C2=A0:
> Hi !
>=20
> This patchset aims to improve codec event tracing in v4l2.
>=20
> The traces added in visl by Daniel Almeida are moved to the global trace
> events.
> They are adapted to trace each each field separately and not just the
> whole struct so that userspace can filter on different fields and
> libraries like libtracefs and libtraceevent can be used to list the
> fields instead of parsing the trace printk's.
>=20
> The trace event templates are also reworked to avoid long lines, but
> quoted string splits are kept as they don't cut words.
>=20
> To each trace event are also added a tgid and fd fields, helping
> userspace track different decoding sessions (contexts) based on the given
> file descriptor used by the given process id.
>=20
> Also for better tracking, stream on and stream off events are added as
> well as HW run and HW done events to track decoder core usage.
>=20
> The main focus is to be able to generate perfetto traces to show VPU usag=
e,
> a perfetto producer using this can be found at [1] (it will be renamed to
> match the more generic approach than hantro).
> Other controls can be traced later as well, this patch set only focuses o=
n
> mem2mem type drivers.

This is getting old, can you rebase and fix all the checkpatch and smatch i=
ssue.
There might be some build issues too?

https://gitlab.freedesktop.org/linux-media/users/patchwork/-/pipelines/1683=
571/

cheers,
Nicolas

>=20
> [1]:
> https://gitlab.collabora.com/detlev/hantro-perf/-/tree/hantro-improved-in=
fo
>=20
> Changes since v1:
> - Don't modify the printk format
> - Trace all fields of the structs instead of the whole struct as a buffer
> - Remove fdinfo patches (they will come in another patch set)
> - Fix long lines
> - Rename v4l2_requests.h trace header to v4l2_controls.h
> - Add basic documentation
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> Detlev Casanova (9):
>       media: Move visl traces to v4l2-core
>       media: Map each struct field to its own trace field
>       media: Add tgid and fd fields in v4l2_fh struct
>       media: Add tgid and fd to the v4l2-requests trace fields
>       media: Add missing types to v4l2_ctrl_ptr
>       media: Trace the stateless controls when set in v4l2-ctrls-core.c
>       media: Add stream on/off traces and run them in the ioctl
>       media: Add HW run/done trace events
>       media: hantro: Add v4l2_hw run/done traces
>=20
>  drivers/media/platform/verisilicon/hantro.h        |    1 +
>  drivers/media/platform/verisilicon/hantro_drv.c    |   10 +
>  .../platform/verisilicon/rockchip_vpu981_regs.h    |    1 +
>  .../media/platform/verisilicon/rockchip_vpu_hw.c   |    4 +
>  drivers/media/test-drivers/visl/Makefile           |    2 +-
>  drivers/media/test-drivers/visl/visl-dec.c         |   76 -
>  drivers/media/test-drivers/visl/visl-trace-av1.h   |  314 ---
>  drivers/media/test-drivers/visl/visl-trace-fwht.h  |   66 -
>  drivers/media/test-drivers/visl/visl-trace-h264.h  |  349 ---
>  drivers/media/test-drivers/visl/visl-trace-hevc.h  |  464 ----
>  drivers/media/test-drivers/visl/visl-trace-mpeg2.h |   99 -
>  .../media/test-drivers/visl/visl-trace-points.c    |   11 -
>  drivers/media/test-drivers/visl/visl-trace-vp8.h   |  156 --
>  drivers/media/test-drivers/visl/visl-trace-vp9.h   |  292 ---
>  drivers/media/v4l2-core/v4l2-ctrls-api.c           |   10 +
>  drivers/media/v4l2-core/v4l2-ctrls-core.c          |  114 +
>  drivers/media/v4l2-core/v4l2-fh.c                  |    1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c               |   37 +-
>  drivers/media/v4l2-core/v4l2-trace.c               |   48 +
>  include/media/v4l2-ctrls.h                         |   19 +
>  include/media/v4l2-fh.h                            |    4 +
>  include/trace/events/v4l2.h                        |   77 +
>  include/trace/events/v4l2_controls.h               | 2708 ++++++++++++++=
++++++
>  23 files changed, 3033 insertions(+), 1830 deletions(-)
> ---
> base-commit: acb7500801e98639f6d8c2d796ed9f64cba83d3a
> change-id: 20260608-v4l2-add-ftrace-aec6e7f60a6c
>=20
> Best regards,
> -- =20
> Detlev Casanova <detlev.casanova@collabora.com>
>=20

--=-+9L0I7/vQ9auKcdun9Ph
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavzQXgAKCRDZQZRRKWBy
9O3jAQDZ8BZcn7gZDDvbPjsacktSHHnvBQ6sV6/UOIhaT59xmwD/dc0B0IzmagZI
neZLwegym+RxxGBk7Fn60KARGmqsGgE=
=eJc6
-----END PGP SIGNATURE-----

--=-+9L0I7/vQ9auKcdun9Ph--

