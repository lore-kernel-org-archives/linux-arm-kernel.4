Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06966606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2PE4k8ec;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=PQ2Uriou
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lFuWskwWRql2Fhx97LXOZZIB1aolGuDk0+v/5Jmc32Q=; b=2PE4k8ecuz6g8n/7kwdpuXjvAp
	/LJQEo0E6nL3KvvS0OWfl4oHZrXHFyYOqR7uxyKmDIF5NQR+2uHKwor6A52LYWCw5Zy3rAyA4z+XU
	XUi/OYS8bVr5jxv+MxwL6JYmsz2JQllDgGt+M5fCeUL1affNGEHpUXaQXvo85Py2vkRKfgtP7Rjvs
	/5OoOE3WywGMlsfnGgMsSbrrSy1vsH4P8B6hGxJ6q+IiqSaTZoICUwfw8QMy7T1CK1rlRKHk0YyDg
	ImT/Vatyv6zRYI6H+QAMpeR1JOljD1YcAwQPV9l2Xntht3xQ1Ts2JLgtTYs7aurrcYigQctlkbXBw
	t8sAYNRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0wD-0000000HTBv-45A1;
	Fri, 27 Nov 2026 18:44:49 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0w6-0000000HT9X-34ih;
	Fri, 27 Nov 2026 18:44:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795805070; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UtGoH5zyybqW5YigDWrywq5xysoqrasgDxXL9JEz0ellMRdYBFUsZGwp+pYRVgp/u4zxpa10sl9s839bFJ7aMZn5NVlT3SwltpCh26iMkcYSKRoUmhf98aTgqTlLVY+e06VV6IcJyP4+ImtCbBPlajG/KqPag4cAlSh3fXbw6qM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795805070; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lFuWskwWRql2Fhx97LXOZZIB1aolGuDk0+v/5Jmc32Q=; 
	b=mWgaGrSi92+Dnd9S5b6TWvbFQiXEoZkCt63aPbS/vXiGbJmXPPwpi/J+aqJL5n3dX2blKGhVfDAOZeTTYd56HyLW+y1IwS+9Pz2NiyS49GRSKVXEQKjWZhuSr4MFQsE+3tgePe/aMGRXJaxo/LpLHA5Tbjhnl7KP5IlsI3M/Eq4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: a=rsa-sha256; b=PQ2Uriou7khkZGh8nS+1xv5VhQfZJN47Cg9sVWnJe/fmoprMEJpzQk7ivHLNLktg0TauVtssr7qVoTm/LG5Q+Bb9zEWj4gIdc/a28GoijhgFw5NP55dfprxhwJ8kk1QpLXAijYWVC0jt6O1w1h5UlO5pVWpmqLhKVgOYmeI0g8M=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=lFuWskwWRql2Fhx97LXOZZIB1aolGuDk0+v/5Jmc32Q=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795805068935159.32844594948233;
	Fri, 27 Nov 2026 10:44:28 -0800 (PST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Sven =?UTF-8?B?UMO8c2NoZWw=?= <s.pueschel@pengutronix.de>,
 kernel@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/5] v4l2: export v4l2_m2m_set_max_parallel_jobs
Date: Fri, 27 Nov 2026 13:44:26 -0500
Message-ID: <g30LShJ-QraPMSjey2r1Hg@collabora.com>
In-Reply-To: <d3eccd8c04656a46287a221b3b4f22427b21a74c.camel@collabora.com>
References: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
 <20260810-rkvdec-multicore-v2-3-986f89d22cdc@collabora.com>
 <d3eccd8c04656a46287a221b3b4f22427b21a74c.camel@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_104442_829331_D843D729 
X-CRM114-Status: GOOD (  13.34  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thursday, 19 November 2026 12:36:36 EST Nicolas Dufresne wrote:
> Le lundi 10 ao=C3=BBt 2026 =C3=A0 11:22 -0400, Detlev Casanova a =C3=A9cr=
it :
>=20
> I know, its straightforward, but its not even signed off.

I voluntarily left it out because this is fixed in the latest RGA patch set=
, so=20
this is just to make sure the rest builds.
This patch should not be applied.

> Nicolas
>=20
> > ---
> >=20
> >  drivers/media/v4l2-core/v4l2-mem2mem.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c
> > b/drivers/media/v4l2-core/v4l2-mem2mem.c index 14ac9c85803d..f6f8864f23=
d2
> > 100644
> > --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> > +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> > @@ -128,6 +128,7 @@ void v4l2_m2m_set_max_parallel_jobs(struct
> > v4l2_m2m_dev *m2m_dev,>=20
> >  {
> > =20
> >  	m2m_dev->max_parallel_jobs =3D max_parallel_jobs;
> > =20
> >  }
> >=20
> > +EXPORT_SYMBOL(v4l2_m2m_set_max_parallel_jobs);
> >=20
> >  struct vb2_queue *v4l2_m2m_get_vq(struct v4l2_m2m_ctx *m2m_ctx,
> > =20
> >  				       enum v4l2_buf_type type)





