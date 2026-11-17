Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282F1606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=08//Dw6h;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Cpqo5wL4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=d+EOPxqwkWZ2cHqsa8jpQYbKGkkd/ZQjRhVzle3euG8=; b=08//Dw6hMWwszs
	Vvpu4gEmpRvzko78FnVV5NnWV/5ckpOsJ+VP451JfFP22j833EIw9Na79aKCU+EUIpr3/rGF9yZGa
	/8OqOki+W4kQrErinXoxX4mcWR7NuwlSUWNiBdVAeCyZHOmStag0FiOI06n4rYSP7gfAW0/VUgMur
	GDsjWoED0GntE7koVn4Uknj3izGLzVQrWuUYgi23QqGtdrozOmHtamtKEBWngO/9i50ulIrcLn5Ot
	lRwX9wDZ1f4aLiBUukxqouWrM/utr2NGF3qyJ1jF7etuhZHrq5Iw7hod87P6tAM+jekQnfZuhGct2
	GVk8tCCrjfGQzo0lOxBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDwW-00000004pES-3VfL;
	Tue, 17 Nov 2026 07:49:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDwT-00000004pE5-2t0N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794901764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d+EOPxqwkWZ2cHqsa8jpQYbKGkkd/ZQjRhVzle3euG8=;
	b=Cpqo5wL4Bk3NNkcm9R59zV9VakrIg1kILvzc7pvdC8Cxzi1QuU3sYiNjQYV0gxJ5kQoGIi
	sm5UgfcG5poCOLmq9BeVUgBU02MqCnIUu/kjmV25E3ajvj7pYGJB49xu6EVj5GxM0lDwnv
	Me2w1lT5LM18kvyzai5axdAtqz3Q4GE=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-MIbCQhKcNpekkHLoYrp6-w-1; Tue, 17 Nov 2026 02:49:22 -0500
X-MC-Unique: MIbCQhKcNpekkHLoYrp6-w-1
X-Mimecast-MFC-AGG-ID: MIbCQhKcNpekkHLoYrp6-w_1794901761
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3adf2609b2eso3706801fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 23:49:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794901761; x=1795506561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d+EOPxqwkWZ2cHqsa8jpQYbKGkkd/ZQjRhVzle3euG8=;
        b=iR9lYRmSIw0z7ol+Hwcdf/CZRN73F04ZCeoQHxIU1U2mDbW9BI4IwLUZk2PqDcAXv/
         JwH361lPylIvYouthZN4KovwsxTfFD2NjSpLJ7Qn0AAdZsGnyCXoE19gOjPZDXAoHBW+
         LO4kYuIxc1c4ubFM0bP7KcHHJcxAjOAJjfPhnvxfDnnhzy6JdQrQr0vexuyd645KISDF
         xptZQ7PoHVsM89kL6fl978BX40cuZ4AeoFs3QdYLg6lLkR/XeIKvTiq7cxAVnXkibFWy
         UicBRWH8yxWSH4fRPg8gWE3XRxE3C9yQzhGbwiv3zSSQIIeY+1QH1MfaCEdDpy+em1Qo
         tOjg==
X-Forwarded-Encrypted: i=1; AL+hErFoXN6XBBP1o5cF0tSpRp18g1F5Tby7nmkpi9/6oRt4RRtQo2UQynVOGgMbhgwAB2mSkdUSq3DNKe4V/yBIH8zf@lists.infradead.org
X-Gm-Message-State: APuU4Z/vDdqRwO3CcB3C5twKu2NXRtcUlYYaWacCOHguGyh0MhSs0XTA
	fQ23fXuHE0iPlXAVTpmB5qtVVgRYq4DmZLsLMYYA2Yj5KmVcKx22SNgbPU4MebP0nFUrw0tPwmv
	ChQPpKFIEvltd0I9E0yz1h5e+ESrvnuiSTQrGMHKbbOKxdPZtmnuepJ2IMlDYnQi5GnY5ld//9N
	38Ec1MTXlA9vZcYNlRG0dcc7Rn6kKfFLKVPRzFPSfYpg5EqWSRmuY=
X-Gm-Gg: AYBFou26JWQTAbjctt+5AV628mlBJWYB9266IeYDSenDZax+abeyQ++2kuXhm4MzlHp
	SnBeozyOIblPjPp4/wwwuuZU2drNDcKd3VLXSlUhl5me4jNTRdISkyGFpwm/6VlT4ZxFEQ/L7/C
	6jNzoWG3Pv3h4Wl6Sc60x0CAwEdc18+cKK9g2znLHesGosSxhwTHyA6Dxl
X-Received: by 2002:a05:651c:4414:20b0:3ae:1073:570 with SMTP id 38308e7fff4ca-3ae2b38d801mr30811961fa.0.1794901761045;
        Mon, 16 Nov 2026 23:49:21 -0800 (PST)
X-Received: by 2002:a05:651c:4414:20b0:3ae:1073:570 with SMTP id
 38308e7fff4ca-3ae2b38d801mr30811681fa.0.1794901760567; Mon, 16 Nov 2026
 23:49:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116-ufs-rtc-query-retry-v1-1-4de69b175e8d@redhat.com> <780f3f4ceacd7cf078542c9a8a4c8c8dba9666b0.camel@iokpp.de>
In-Reply-To: <780f3f4ceacd7cf078542c9a8a4c8c8dba9666b0.camel@iokpp.de>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 17 Nov 2026 08:49:08 +0100
X-Gm-Features: AclHuK8oY8bBLMyg0w_iWRcoEI_SclPw8SCGmbuuZYp9-Co4zfSo7Au867IO_8Y
Message-ID: <CALE0LRs_nkDT_NQfNw31F0hdnEyUko2LzmHpmM4RFh09dkysxA@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: core: Use ufshcd_query_attr_retry() for RTC update
To: Bean Huo <beanhuo@iokpp.de>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, Mike Bi <mikebi@micron.com>, 
	Avri Altman <avri.altman@sandisk.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Luca Porzio <lporzio@micron.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>, 
	Larisa Grigore <larisa.grigore@oss.nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OQt-f_shrUW0RhOeGluO6vUsWArWqMEEG-NTmueY6Mk_1794901761
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_234925_869343_0E437ECF 
X-CRM114-Status: GOOD (  25.71  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Mon, Nov 16, 2026 at 11:28=E2=80=AFPM Bean Huo <beanhuo@iokpp.de> wrote:
>
> Thanks for the patch. A few comments:
>
> On Mon, 2026-11-16 at 14:39 +0100, Enric Balletbo i Serra wrote:
> > ufshcd_update_rtc() uses ufshcd_query_attr() directly to write the
> > bSecondsPassed attribute, making it the only query attribute caller in
> > the UFS core that does not use the retry variant. All other callers use
> > ufshcd_query_attr_retry(), which retries up to three times on transient
> > failures before escalating to dev_err.
> >
> > This causes spurious error messages during boot on some platforms when
> > the write-attribute command hits a transient OCS_INVALID_COMMAND_STATUS
> > error:
> >
> >   ufs-s32n7 4ac80000.ufs: ufshcd_query_attr: opcode 0x04 for idn 15 fai=
led,
> > index 0, err =3D 15
>
> this is printed by ufshcd_query_attr() itself at dev_err level, so it wil=
l still
> show up with this patch. Could you share the log with the patch applied?
>

I assume I got confused because after applying the patch both messages
disappeared, but what you mention, and sashiko also pointed, is right,
from code I should have still see the  ufshcd_query_attr: opcode 0x04
... message

The fact that I didn't see those messages after applying the patch
likely means it showed a case where the first attempt succeeded. I
didn't perform a lot of boots.

> and err =3D 15 is OCS_INVALID_COMMAND_STATUS, the value the driver puts i=
n the
> UTRD before sending. So the request was completed but the host controller=
 did
> not update OCS. This looks like a host side problem? not a transient devi=
ce
> failure, and a retry here would only hide it. Is this SDB or MCQ? Does it=
 only
> happen on the first RTC update after probe?
>

Answering your last question, yes, it seems to happen on the first RTC
update after probe.

Larisa mentioned there is a known errata that will be documented in
the future that could be related. We should probably wait for that
errata to better understand the problem.

>
> >   ufs-s32n7 4ac80000.ufs: ufshcd_update_rtc: Failed to update rtc 15
> > Switch to ufshcd_query_attr_retry() to handle transient failures
> > gracefully, consistent with every other attribute query in the driver.
> >
>
> ufshcd_update_rtc() is not the only caller without retry. ufs-sysfs.c, uf=
s-
> hwmon.c and ufs-txeq.c also call ufshcd_query_attr() directly, so the com=
mit
> message is wrong.
>

Right, I used the wrong wording here and made the mistake of only
looking at core/ufshcd.c, not the full core files.c not the full core
files.

>
> > Fixes: 6bf999e0eb41 ("scsi: ufs: core: Add UFS RTC support")
>
> > Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
>
>
> I would like to understand the root cause first.
>

Agree, let's wait for Larisa patches.

Thanks,
  Enric

> Kind regards,
> Bean
>
>
>
>


