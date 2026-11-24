Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76AC606A69F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2132UDeE;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HkLqXH/e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OT57QIIbgw1mNoCmc4Nd4ViyD4coW8RXoU/BWL17AVc=; b=2132UDeEuhexfkwiQeLYS7rPa5
	pI+dnrBJQqidBlZ2D2otgmrUm+LarD2NLxoYKnRdHifHKwYsjEJhSsbadiskwcZ3STFCzBPnZBKa3
	IT68ct+k3xt0SzfHd5ERz5L42s2XSKr17u318bfKRrwIMKQYiApns4Sgvb/bNKv7hKP7yo9bbrI/Z
	wr/w0Byc+xUltVtTad6pm8g/6VsYf2rqT8bzOFhM6nFBqEZYylK5RFfxzI3rjMNzhZOlRQ8hzjHAw
	WjKfnsC70FLUvrjj6WMfypim/wpSc9+squU+FxfEGGji60kcRzT5JPaQ22Tts5myYigmhH5ijqwN6
	x7+9EiOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxXk-00000007nRF-0GsP;
	Tue, 24 Nov 2026 20:55:12 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxXg-00000007nQF-4BE7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 20:55:10 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-93f269e335eso590766685a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 12:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795553707; x=1796158507; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OT57QIIbgw1mNoCmc4Nd4ViyD4coW8RXoU/BWL17AVc=;
        b=HkLqXH/ehrCHR9Atl6qVMsxHso148+POAwCjzQV+K2ADCbD9qHcS0K0wUMXHnXqs37
         6slsHekOixQi0p0vaqUdxhKq/UYuTXpLGaeSdUGbxXrdkUSOf3gNQHWHM6tyr2LwnguI
         Go1sVPl0OvsmDaMLM34NooXE1sFNShjmAXcfmyhzsaw+0ziCsDtTUQMRanDbw2am4Nby
         L7TGXmEw/VCEPeQ3940b2rBvMfy/vtabGEUYhnQGkqWeum+5pf6Ci3soARN1yo0Re0EH
         1G1eSqZ+hpyEHWiyQUEvBLId/69D4LfvXlHP34roiYzvRcPnYNWqQiTIyAMGf9Jqr6Tx
         nyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553707; x=1796158507;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OT57QIIbgw1mNoCmc4Nd4ViyD4coW8RXoU/BWL17AVc=;
        b=ynziK8y7YDh8Mu92huf8b8dAt1XqGu5Yyjo5WMXNC5pSpwi1vUqpd01Ha1xt3F95iX
         5z5NRTNjVzAUsYp2YefA1Wrtkc7LhSyBr3y7GfG8LOxFCglUw2ytRMXREoglK8f7S+Hd
         H2QqWR67354ZCWzxP0nt9m9+q1vYaycMneAF7ADYoNtVm+Pgomi2DZb7fq7vKk7sA1Io
         5+DKNi4fJ/GtSTASWTvS1HXh/OeIQ8z+lonSLWPYD2TolpLJAvroj/hFw+lrDfwzD6io
         aqzue0YLqMnU01hi46Ua/Et28V6knl2aRmM13gJNyXW5gcGfpSS4j0ErSPKo+0JFz3YS
         vr7Q==
X-Forwarded-Encrypted: i=1; AL+hErFSrz6hBGIB4yrTskbst0fW79uAgm4mJ8zZhWz29b5+ZUp21dQbxypYfmvDXt3/EbUxpc3KynJnUYibcjgZACKc@lists.infradead.org
X-Gm-Message-State: APuU4Z99NTXRkc6lVImMB1KUDTST/5H/tqCdGgWkFcQM8/D6WrU6lDSB
	CoVkP+Z8T4uhLQ7nifWC34PJktmkDPSLwXN+ZJ4SiT7qYmj7xIJS+ProNFoD32//ndk=
X-Gm-Gg: AZFdTZcasn8Knjqr/jhc255z/hjipxNDbWeKG/ITQqC59mSJp6R+me4LiLx4u85SSwm
	D5DQWvaVCDCLi7um9uJ36DsVV3zJmpCfe62wfO/MDYyX4pRq8EJ3HhQ7KnboYUGKZtOCTyxEg7b
	Fjkxfm4eU6aJdvO4q7cAA9ajF8YoE0A1r8paUPs8a+4MxPM+Olq+Fg7MR5ZkdI4Zg5oz/0Oands
	gnEZ8uFcd+l8bdZzS9OYCqanNECflRW/l7EHXKR9L/Gfe5TVwcVOvKqv759gdYJDHerFn+C7qmw
	N+MyRMvBLmZOTjM7+SGSQUmVOebO/v17A4fvYgjK+7lqrR8poHnHdE7bYJ09i/z7TKHaL9fUJ/T
	ddCyEefku2dM94glrZs337B0cNDAm3+FHH9pOVekiYt4ceTtGZijOCdEq/9u+MKC+sYxWHxHyO+
	FhHTbz+8Edgcz6aCTTmEp+GX1Jz5V47JnOTXJowwHXguJlW6JQYsfeAeTYAwFZ2UYAftY/J7Dpf
	A4NpttW9QjI3Apv4yxrjPwatmvNGgoDyTIAANy+8R1cFTQToLmrhuFco/IIpG3JZEum2ro4Hhaz
	AE33Vmt1sCid/Bgr3bxGDptAVQXeZNTpGvboYtTL39aRYxZR6VQSCVY=
X-Received: by 2002:a05:620a:6f02:b0:93b:bc51:b40 with SMTP id af79cd13be357-949ba84ac50mr2649854985a.2.1795553707568;
        Tue, 24 Nov 2026 12:55:07 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb40ea12sm1141447585a.35.2026.11.24.12.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:55:06 -0800 (PST)
Message-ID: <82a6933335048ca8f9969481cde8340dac19ccb1.camel@ndufresne.ca>
Subject: Re: [PATCH v2 06/17] media: v4l2-mem2mem: drop curr_ctx member from
 v4l2_m2m_dev struct
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Philipp Zabel
	 <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, Guangshuo Li
 <lgs201920130244@gmail.com>
Date: Tue, 24 Nov 2026 15:55:05 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-6-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-6-23aa2cb74e61@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-qDFQbRP8sfMUezyW9fo/"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_125509_055535_E766393F 
X-CRM114-Status: GOOD (  27.59  )
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

--=-qDFQbRP8sfMUezyW9fo/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Drop the curr_ctx member from the v4l2_m2m_dev struct in preparation of
> adding support for running multiple jobs in parallel.
>=20
> The curr_ctx member of a v4l2_m2m_dev was used to track the
> currently running context. But the currently running context will always
> be at the top of the job_queue. As the TRANS_RUNNING flag can be used to
> check if the queue head is already running, the curr_ctx member can be
> completely dropped.
>=20
> By eliminating the struct member the code is mostly agnostic whenever
> only one job is running at a time or multiple run at the same time. The
> main exception is the v4l2_m2m_get_curr_priv function, which is by it's
> design incompatible with running multiple jobs in parallel.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
>=20
> ---
> v2:
> - split curr_ctx removal into a separate commit
> - add WARN_ON to _v4l2_m2m_job_finish to prevent mismatching context to
>   device (and an unused m2m_dev argument)
> - rewrite v4l2_m2m_get_curr_priv to get private data inside the spinlock
>   (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15=
675f7%40pengutronix.de?part=3D5)
> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 61 ++++++++++++++++++----------=
------
>  1 file changed, 33 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-=
core/v4l2-mem2mem.c
> index a65cbb124cfe0..60cca94195166 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -84,7 +84,6 @@ static const char * const m2m_entity_name[] =3D {
>   *=09=09=09v4l2_m2m_unregister_media_controller().
>   * @intf_devnode:=09&struct media_intf devnode pointer with the interfac=
e
>   *=09=09=09with controls the M2M device.
> - * @curr_ctx:=09=09currently running instance
>   * @job_queue:=09=09instances queued to run
>   * @job_spinlock:=09protects job_queue
>   * @job_work:=09=09worker to run queued jobs.
> @@ -93,7 +92,6 @@ static const char * const m2m_entity_name[] =3D {
>   * @kref:=09=09device reference count
>   */
>  struct v4l2_m2m_dev {
> -=09struct v4l2_m2m_ctx=09*curr_ctx;
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  =09struct media_entity=09*source;
>  =09struct media_pad=09source_pad;
> @@ -232,8 +230,14 @@ void *v4l2_m2m_get_curr_priv(struct v4l2_m2m_dev *m2=
m_dev)
>  =09void *ret =3D NULL;
> =20
>  =09spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> -=09if (m2m_dev->curr_ctx)
> -=09=09ret =3D m2m_dev->curr_ctx->priv;
> +=09if (!list_empty(&m2m_dev->job_queue)) {
> +=09=09struct v4l2_m2m_ctx *first_ctx =3D
> +=09=09=09list_first_entry(&m2m_dev->job_queue,
> +=09=09=09=09=09 struct v4l2_m2m_ctx, queue);
> +
> +=09=09if (first_ctx->job_flags & TRANS_RUNNING)
> +=09=09=09ret =3D first_ctx->priv;
> +=09}
>  =09spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> =20
>  =09return ret;
> @@ -252,14 +256,9 @@ EXPORT_SYMBOL(v4l2_m2m_get_curr_priv);
>  static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
>  {
>  =09unsigned long flags;
> +=09struct v4l2_m2m_ctx *chosen_ctx;
> =20
>  =09spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> -=09if (NULL !=3D m2m_dev->curr_ctx) {
> -=09=09spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> -=09=09dprintk("Another instance is running, won't run now\n");
> -=09=09return;
> -=09}
> -
>  =09if (list_empty(&m2m_dev->job_queue)) {
>  =09=09spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>  =09=09dprintk("No job pending\n");
> @@ -272,13 +271,18 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m=
2m_dev)
>  =09=09return;
>  =09}
> =20
> -=09m2m_dev->curr_ctx =3D list_first_entry(&m2m_dev->job_queue,
> -=09=09=09=09   struct v4l2_m2m_ctx, queue);
> -=09m2m_dev->curr_ctx->job_flags |=3D TRANS_RUNNING;
> +=09chosen_ctx =3D list_first_entry(&m2m_dev->job_queue, struct v4l2_m2m_=
ctx, queue);
> +=09if (chosen_ctx->job_flags & TRANS_RUNNING) {
> +=09=09spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> +=09=09dprintk("Another instance is running, won't run now\n");
> +=09=09return;
> +=09}
> +
> +=09chosen_ctx->job_flags |=3D TRANS_RUNNING;
>  =09spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> =20
> -=09dprintk("Running job on m2m_ctx: %p\n", m2m_dev->curr_ctx);
> -=09m2m_dev->m2m_ops->device_run(m2m_dev->curr_ctx->priv);
> +=09dprintk("Running job on m2m_ctx: %p\n", chosen_ctx);
> +=09m2m_dev->m2m_ops->device_run(chosen_ctx->priv);
>  }
> =20
>  /*
> @@ -469,15 +473,16 @@ static void v4l2_m2m_schedule_next_job(struct v4l2_=
m2m_dev *m2m_dev,
>  static bool _v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
>  =09=09=09=09 struct v4l2_m2m_ctx *m2m_ctx)
>  {
> -=09if (!m2m_dev->curr_ctx || m2m_dev->curr_ctx !=3D m2m_ctx) {
> +=09if (!m2m_ctx || !(m2m_ctx->job_flags & TRANS_RUNNING)) {
>  =09=09dprintk("Called by an instance not currently running\n");
>  =09=09return false;
>  =09}
> =20
> -=09list_del(&m2m_dev->curr_ctx->queue);
> -=09m2m_dev->curr_ctx->job_flags &=3D ~(TRANS_QUEUED | TRANS_RUNNING);
> -=09wake_up(&m2m_dev->curr_ctx->finished);
> -=09m2m_dev->curr_ctx =3D NULL;
> +=09WARN_ON(m2m_dev !=3D m2m_ctx->m2m_dev);
> +
> +=09list_del(&m2m_ctx->queue);
> +=09m2m_ctx->job_flags &=3D ~(TRANS_QUEUED | TRANS_RUNNING);
> +=09wake_up(&m2m_ctx->finished);
>  =09return true;
>  }
> =20
> @@ -548,12 +553,15 @@ void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
> =20
>  =09spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
>  =09m2m_dev->job_queue_flags |=3D QUEUE_PAUSED;
> -=09curr_ctx =3D m2m_dev->curr_ctx;
> +=09if (list_empty(&m2m_dev->job_queue)) {
> +=09=09spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> +=09=09return;
> +=09}
> +
> +=09curr_ctx =3D list_first_entry(&m2m_dev->job_queue, struct v4l2_m2m_ct=
x, queue);
>  =09spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> =20
> -=09if (curr_ctx)
> -=09=09wait_event(curr_ctx->finished,
> -=09=09=09   !(curr_ctx->job_flags & TRANS_RUNNING));
> +=09wait_event(curr_ctx->finished, !(curr_ctx->job_flags & TRANS_RUNNING)=
);
>  }
>  EXPORT_SYMBOL(v4l2_m2m_suspend);
> =20
> @@ -896,10 +904,8 @@ int v4l2_m2m_streamoff(struct file *file, struct v4l=
2_m2m_ctx *m2m_ctx,
>  =09q_ctx->num_rdy =3D 0;
>  =09spin_unlock_irqrestore(&q_ctx->rdy_spinlock, flags);
> =20
> -=09if (m2m_dev->curr_ctx =3D=3D m2m_ctx) {
> -=09=09m2m_dev->curr_ctx =3D NULL;
> +=09if (m2m_ctx->job_flags & TRANS_RUNNING)
>  =09=09wake_up(&m2m_ctx->finished);

Sashiko report that wake_up() is unreachable, that job_flags have been clea=
r
previously.

If that is correct, its not a big issue:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> -=09}
>  =09spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags_job);
> =20
>  =09return 0;
> @@ -1194,7 +1200,6 @@ struct v4l2_m2m_dev *v4l2_m2m_init(const struct v4l=
2_m2m_ops *m2m_ops)
>  =09if (!m2m_dev)
>  =09=09return ERR_PTR(-ENOMEM);
> =20
> -=09m2m_dev->curr_ctx =3D NULL;
>  =09m2m_dev->m2m_ops =3D m2m_ops;
>  =09INIT_LIST_HEAD(&m2m_dev->job_queue);
>  =09spin_lock_init(&m2m_dev->job_spinlock);

--=-qDFQbRP8sfMUezyW9fo/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawX5qQAKCRDZQZRRKWBy
9AHWAQCmqcFAQMkugv7AJiaX/VEcrfFOq0yeQoHoehSg1I0udQEAkDiuFPHBWI6B
ZlpYRZjVAmYDkdC/FdAGAE99MAig2ww=
=f+mj
-----END PGP SIGNATURE-----

--=-qDFQbRP8sfMUezyW9fo/--

