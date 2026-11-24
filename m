Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D37606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tJRvVqjq;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Qz27+WXT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=58e55Dq73HKDPI7jbSEGjDb83KloozrgTme0p4JRxec=; b=tJRvVqjqzNXcxRLHushUlFQAFY
	Hx0f5YDcrtX3nJ/7hh6HSxB5LA1uls5ikQu4y9J3u22KlNUs8yZvBmD789yaz3O7jMIsE3gveuZJL
	UMVoEhq0i3UoM5EBy97LMm4tDcdK92b9NQDab5xXdzMDZQbZAoXphx9rJQexWa1n7HgAilHgQuaRl
	pfNeiiFL5wulnzNx+9kLdoE0WJMVaorndaC4OOM2xOjbdKxPgNQMNFPvgqji0gQ+GJRiooYn9Ya0p
	tdrm2yYv/e/6+b+3m4lpNxuTRgKb8HguavmTqdprm7kj4T2+U0sVNIQHR6+94q5MqzMeN/zlkpOc7
	goI/2fDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxou-00000007olR-26L8;
	Tue, 24 Nov 2026 21:12:56 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxoq-00000007oji-45qv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:12:55 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-93f2f2edb19so432776185a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 13:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795554772; x=1796159572; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=58e55Dq73HKDPI7jbSEGjDb83KloozrgTme0p4JRxec=;
        b=Qz27+WXTdJfFwAj7OO0YQrFHC+633OAlfxZS6inw3pPeqtJnnCzsg/p1ycGU4pgAWB
         YnswqyXsz/MhWTey1XcyRYEzs9aNnyygx2Z87jRbzQ4eB+tbPTAtkUC4Mg9tN4W0Blot
         jj69s/JgjVLxQJNJTvCeQaMguz5rNUoJO8birdgFTanXSmVSMz5NDAkKGCs3KQs2SKLx
         2fHHI0MASGUEJzWkFPfg5KWEibmeR0+Fb3wwIpxkeqklBK3dEzfmvPjCmKOMjtal56Xf
         i5VKtSj9l7rr5ETaeZd+YNVOqnYOiFcuO9X5Y8Abq5YGa3YeUHYgZ3186viCMfoS22Qx
         zNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554772; x=1796159572;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58e55Dq73HKDPI7jbSEGjDb83KloozrgTme0p4JRxec=;
        b=QAfQulwjS6rQzYCYNkRuh7hqwRKFE31VAsNe3REy4DQpnUCsMF5SV9gH0uACWfFlTt
         gj1+6e6P+MpYrouw5S1E5tYpKXf+QT+gEpkpuZibI1JexwyJQ9mq3qdHHZGBpG2kNRAK
         R5llyno2Fa1SiY/ohO0gfJHeJF/Lx36soI4YbKqFDYNCWlCRcS0OfBYcUHrhBTJm3qLe
         Iqv0vVRe5xVX4ZXF4Xblr0sp5N6teHkM3evWsLlOOnW3tjpFF7/m7ktWa3yUfQqYesSf
         7yNvT84cr0j5gXFsKULWpOJRNKUzyJNWG6lWa3dVJ5F64a6Muk+WydKYY643G7z4AwKY
         bQJA==
X-Forwarded-Encrypted: i=1; AL+hErHW3l3ySHTQKoAv8fzyyBMg13aGyPNuy6LX4vIlpOUQ7Ta/GjENRrdK6cb37PPHKpeMGPAB3CKgcIRjqDdIrmCX@lists.infradead.org
X-Gm-Message-State: APuU4Z/R25Z6ayOahFJ89zPPX5EwavqGBGAUPdAnhy5hZPs4sEPdLSlJ
	GtGXMNFOQKxq3VMoiMWHfrScgmMOXIZA2jEgh2XLDnlOLx4hZ2SVRcCsXlFJLUW/HBI=
X-Gm-Gg: AZFdTZczP/d+EVwYGCzppn6xKy/4vH7NBdyaMhkTpn0VughFU+oSw33gJKZ8le4/rET
	CoSWuAthC6oTuLFfMaqEHiqQs6AbncSROdWTEFqV6aey1wWVwFGq0sq61Uf5GJOb7YCiaiybc++
	jrygXnqfH9PzLtCFH99IxjjxD9tUK8EiV4rzw+D0kQmNgJqnPYCkkXvySxWbUYqyQdf9FTZDmcB
	b9E4k4RORgGCju6av3d59Pxx4oJtEjbxB9oBJaJO1fPCfFbHctTTZViuqdCZ2GHvp1VQXtNRpyZ
	JGpFjJRV8U7TY4p++FhocsRWLlg3wBqf8gB8eMDMqll7f5/uomjW09HUgK4nDZHsRiFdaI2e6U3
	NxADb4a38BpR+VTR4h+mFLe9/jsbTatxl2ooFtJstGRl7HJ8J+Pnkt+Y5duURw2TMqlzs2ac3Ee
	h0Si498/CMfbXkGIxYsG+ZoupfNWs+iKYnhDLaZP4JaJ+9/ln5+Ioe6D6i/RlkyRKLFEz7pJbwI
	uJs1MW+WjkCxjVMs0QXG5T85OH0L4v7sqxBxlv3u3fL+bn/6Lr8uqqgiCIWpVKBUdS5sTFtz5Hm
	/6MI7MOaygumHxFGp4Ws554z5wuhDWnrJY0t+sKQumXl4IXXaAQxFBc=
X-Received: by 2002:a05:620a:f11:b0:93e:5016:e3a6 with SMTP id af79cd13be357-949ba9c6e0bmr3182280585a.26.1795554771717;
        Tue, 24 Nov 2026 13:12:51 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0315f4sm1131851185a.3.2026.11.24.13.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:12:51 -0800 (PST)
Message-ID: <332bab94048c257f816b616cede22dbde20a0d9e.camel@ndufresne.ca>
Subject: Re: [PATCH v2 07/17] media: v4l2-mem2mem: support running multiple
 jobs in parallel
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
Date: Tue, 24 Nov 2026 16:12:49 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-7-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-7-23aa2cb74e61@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-BgQ9A5uHRmZ+BgHmEpOW"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_131253_042655_2698C968 
X-CRM114-Status: GOOD (  37.34  )
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

--=-BgQ9A5uHRmZ+BgHmEpOW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Add support for running multiple jobs in parallel for SoCs containing
> multiple identical devices. An example is the Rockchip RK3588 SoC,
> which contains two identical RGA3 devices. Therefore it is desirable to
> have the kernel schedule the work across all available devices and only
> expose one video device to the userspace.
>=20
> To avoid queueing too many parallel jobs, the
> v4l2_m2m_set_max_parallel_jobs method is added. It allows a driver
> to set the number of parallel jobs and avoids calling device_run when
> the given number of jobs is already running. This is set to 1 by default
> to prevent parallel job runs. Drivers with the need and support for
> scheduling jobs can adjust this value accordingly.
>=20
> Note that this change doesn't allow a context to be used multiple times
> in parallel. So a single stream won't be able to utilize multiple devices
> at once, but N streams can utilize up to N devices. This is caused by the
> fact that a context is not added multiple times to the job_list and also
> holds the job_flags to distinguish if it's currently running.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
>=20
> ---
> v2
> - split out the removal of the curr_ctx member
> - add EXPORT_SYMBOL to v4l2_m2m_set_max_parallel_jobs
>   (indirectly pointed out by Detlev)
> - document v4l2_m2m_get_curr_priv being incompatible with parallel jobs
> - add documentation comment for the added function
> - rework v4l2_m2m_suspend to avoid potential errors due to looping
>   outside of a spinlock over the list
>   (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15=
675f7%40pengutronix.de?part=3D5)
> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 51 ++++++++++++++++++++++++++--=
------
>  include/media/v4l2-mem2mem.h           | 18 ++++++++++++
>  2 files changed, 58 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-=
core/v4l2-mem2mem.c
> index 60cca94195166..f1b6255984087 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -88,6 +88,7 @@ static const char * const m2m_entity_name[] =3D {
>   * @job_spinlock:=09protects job_queue
>   * @job_work:=09=09worker to run queued jobs.
>   * @job_queue_flags:=09flags of the queue status, %QUEUE_PAUSED.
> + * @max_parallel_jobs:=09max job_queue instances number marked as runnin=
g
>   * @m2m_ops:=09=09driver callbacks
>   * @kref:=09=09device reference count
>   */
> @@ -106,6 +107,7 @@ struct v4l2_m2m_dev {
>  =09spinlock_t=09=09job_spinlock;
>  =09struct work_struct=09job_work;
>  =09unsigned long=09=09job_queue_flags;
> +=09u32=09=09=09max_parallel_jobs;
> =20
>  =09const struct v4l2_m2m_ops *m2m_ops;
> =20
> @@ -121,6 +123,13 @@ static struct v4l2_m2m_queue_ctx *get_queue_ctx(stru=
ct v4l2_m2m_ctx *m2m_ctx,
>  =09=09return &m2m_ctx->cap_q_ctx;
>  }
> =20
> +void v4l2_m2m_set_max_parallel_jobs(struct v4l2_m2m_dev *m2m_dev,
> +=09=09=09=09    u32 max_parallel_jobs)
> +{
> +=09m2m_dev->max_parallel_jobs =3D max_parallel_jobs;
> +}
> +EXPORT_SYMBOL(v4l2_m2m_set_max_parallel_jobs);
> +
>  struct vb2_queue *v4l2_m2m_get_vq(struct v4l2_m2m_ctx *m2m_ctx,
>  =09=09=09=09       enum v4l2_buf_type type)
>  {
> @@ -256,7 +265,9 @@ EXPORT_SYMBOL(v4l2_m2m_get_curr_priv);
>  static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
>  {
>  =09unsigned long flags;
> -=09struct v4l2_m2m_ctx *chosen_ctx;
> +=09struct v4l2_m2m_ctx *chosen_ctx =3D NULL;
> +=09struct v4l2_m2m_ctx *ctx;
> +=09u32 running_jobs =3D 0;
> =20
>  =09spin_lock_irqsave(&m2m_dev->job_spinlock, flags);

Here sashiko seems right, you want o loop back over this locking block unti=
l you
reached the maximum of jobs, or there is no more pending context. Right now=
, we
risk starvation.

Nicolas

>  =09if (list_empty(&m2m_dev->job_queue)) {
> @@ -271,10 +282,22 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m=
2m_dev)
>  =09=09return;
>  =09}
> =20
> -=09chosen_ctx =3D list_first_entry(&m2m_dev->job_queue, struct v4l2_m2m_=
ctx, queue);
> -=09if (chosen_ctx->job_flags & TRANS_RUNNING) {
> +=09list_for_each_entry(ctx, &m2m_dev->job_queue, queue) {
> +=09=09if (!(ctx->job_flags & TRANS_RUNNING)) {
> +=09=09=09chosen_ctx =3D ctx;
> +=09=09=09break;
> +=09=09}
> +
> +=09=09running_jobs++;
> +=09}
> +=09if (running_jobs >=3D m2m_dev->max_parallel_jobs) {
>  =09=09spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> -=09=09dprintk("Another instance is running, won't run now\n");
> +=09=09dprintk("Maximum number of parallel jobs reached\n");
> +=09=09return;
> +=09}
> +=09if (!chosen_ctx) {
> +=09=09spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> +=09=09dprintk("All jobs already running\n");
>  =09=09return;
>  =09}
> =20
> @@ -549,19 +572,24 @@ EXPORT_SYMBOL(v4l2_m2m_buf_done_and_job_finish);
>  void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
>  {
>  =09unsigned long flags;
> -=09struct v4l2_m2m_ctx *curr_ctx;
> =20
>  =09spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
>  =09m2m_dev->job_queue_flags |=3D QUEUE_PAUSED;
> -=09if (list_empty(&m2m_dev->job_queue)) {
> +
> +=09while (!list_empty(&m2m_dev->job_queue)) {
> +=09=09/* Running jobs are always at the start of the queue */
> +=09=09struct v4l2_m2m_ctx *first_ctx =3D
> +=09=09=09list_first_entry(&m2m_dev->job_queue,
> +=09=09=09=09=09 struct v4l2_m2m_ctx, queue);
> +
> +=09=09if (!(first_ctx->job_flags & TRANS_RUNNING))
> +=09=09=09break;
> +
>  =09=09spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> -=09=09return;
> +=09=09wait_event(first_ctx->finished, !(first_ctx->job_flags & TRANS_RUN=
NING));
> +=09=09spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
>  =09}
> -
> -=09curr_ctx =3D list_first_entry(&m2m_dev->job_queue, struct v4l2_m2m_ct=
x, queue);
>  =09spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> -
> -=09wait_event(curr_ctx->finished, !(curr_ctx->job_flags & TRANS_RUNNING)=
);
>  }
>  EXPORT_SYMBOL(v4l2_m2m_suspend);
> =20
> @@ -1205,6 +1233,7 @@ struct v4l2_m2m_dev *v4l2_m2m_init(const struct v4l=
2_m2m_ops *m2m_ops)
>  =09spin_lock_init(&m2m_dev->job_spinlock);
>  =09INIT_WORK(&m2m_dev->job_work, v4l2_m2m_device_run_work);
>  =09kref_init(&m2m_dev->kref);
> +=09m2m_dev->max_parallel_jobs =3D 1;
> =20
>  =09return m2m_dev;
>  }
> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> index 31de25d792b98..37ffd33b653f2 100644
> --- a/include/media/v4l2-mem2mem.h
> +++ b/include/media/v4l2-mem2mem.h
> @@ -144,6 +144,10 @@ struct v4l2_m2m_buffer {
>   * v4l2_m2m_get_curr_priv() - return driver private data for the current=
ly
>   * running instance or NULL if no instance is running
>   *
> + * It is incompatible with using parallel instances enabled by calling
> + * v4l2_m2m_set_max_parallel_jobs(), as it is undefined which private da=
ta of
> + * the parallel running instances is returned.
> + *
>   * @m2m_dev: opaque pointer to the internal data to handle M2M context
>   */
>  void *v4l2_m2m_get_curr_priv(struct v4l2_m2m_dev *m2m_dev);
> @@ -594,6 +598,20 @@ static inline void v4l2_m2m_set_dst_buffered(struct =
v4l2_m2m_ctx *m2m_ctx,
>  =09m2m_ctx->cap_q_ctx.buffered =3D buffered;
>  }
> =20
> +/**
> + * v4l2_m2m_set_max_parallel_jobs() - adjust the limit of the maximum nu=
mber of
> + * jobs being run in parallel.
> + *
> + * By default only one job is allowed to be run at any time. A driver wi=
th
> + * multiple cores can call this function to (dynamically) adjust this li=
mit
> + * based on the underlying hardware capabilities.
> + *
> + * @m2m_dev: opaque pointer to the internal data to handle M2M context
> + * @max_parallel_jobs: maximum number of jobs to queue in parallel
> + */
> +void v4l2_m2m_set_max_parallel_jobs(struct v4l2_m2m_dev *m2m_dev,
> +=09=09=09=09    u32 max_parallel_jobs);
> +
>  /**
>   * v4l2_m2m_ctx_release() - release m2m context
>   *

--=-BgQ9A5uHRmZ+BgHmEpOW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawX90QAKCRDZQZRRKWBy
9IPZAP43AmMPiX21oO0Gu+MatDhXA80g92HvFv70p0QcgSsjTwEA96BLtiIAzKie
Pw4t5V8CQ31Qy/RwTTLccjd4pKQIowc=
=RgJF
-----END PGP SIGNATURE-----

--=-BgQ9A5uHRmZ+BgHmEpOW--

