Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFBE606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 20:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ziLPc4tW;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I0fo/k++
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z+AogC8EDUSE3HLZ3UU4rCjeQfZxM4jvNiwuUF4qq2o=; b=ziLPc4tWoiESr7
	GLSUpNt1izuoTjWSvEWYXupOyy05H/rMtYqIupVOWB7ynhftCpi+E4q8wq9ioUozHcLvg2uRMwv2Y
	6owd/+9PXBOYUEttI8C9gvv+uOMHAajnDl3we5PNjp+K4V6vAJ6RHeqa/yH5uEbOaTJQpncaubXTi
	oa+W7oKjIIRiwRq00dXdwBEew6hCMuEYsnii+QMTDysMHFn0JnmhjpuO4LN/M/7GWLFM+x7JLl3sX
	KFUowuRM3FEG/MgMgVEMU439p83tDiywRAvzMhC6GKs60EChCyLWjeyt7RmZEMwhBypLX+Yk3C04V
	k6QFXrPogXywBWL1ESsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmGO-0000000AD7L-0rSi;
	Wed, 18 Nov 2026 20:28:16 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmGL-0000000AD6m-15hw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 20:28:14 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-55c7445cf85so2631cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 12:28:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795033691; cv=none;
        d=google.com; s=arc-20260327;
        b=XotoyvIR3qEJJ53OWT400d6WN2CO3ttOYNwadFFMaQ+wYjBxvaaMmi+dkMYeUMawH1
         howTrsPRjohR7aezCqZzibti/DigzBfya7hrsyaGP5YK5UJg39o4/kNQufD7rAsZL4GF
         AKC5DWnimkSAXc7th1dU/RUG6hI1um4V55bjWICeoy9gQrqD+uo6PteP3taDshCWl4gZ
         XjWNlq0B9XPT9MQgrsyNbm5AWZkwuw8WSoM5NPjxaYpke54wFqkrmqNZIAKB79UhGeQT
         98Hy0hEBBRsQaMdLyaMdPyHwNRr07spts9A5ro6UuV2E71iDp8MtKvc6SWDgXjLCZzIC
         vlLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z+AogC8EDUSE3HLZ3UU4rCjeQfZxM4jvNiwuUF4qq2o=;
        fh=2/wZuotXfQt7ZIQXvda4FJHTq2IwqC5GRXWVK1BCF0Q=;
        b=UXQg+msxrNtof5ieGzNoxfCCKQfmYJoioEurrAHdeYTo7IP9e+M8DIkFAFPhJkM+SA
         Q53o8U2b3/2SlrLofRe48Gb1CwiwRTa/Zy9fYnBM0TvM9unGjtrBadrKc9Nb8pGSVmB+
         ww+M06vufwp6Az+x5IKWtZ/a70/omqTQhbMA0Sq6lINuw3xCjzPdZ1pJy2xd75FUG9iQ
         tM6eOyIF4tbe0/HVTMflsviOvJFcPH0WZEkElvDiEbciv1tj4RapvB34hgnGTrOdyHfa
         MVP6zCZhx4Na8ulcOjFG/xklciTq4EPfQMVL+gJMccfWtV0FvbXF5MGKuC7e9nc16bq0
         KgFg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795033691; x=1795638491; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z+AogC8EDUSE3HLZ3UU4rCjeQfZxM4jvNiwuUF4qq2o=;
        b=I0fo/k++AqvmZpClpJAotCLQbww8pGDmcOURqHZeD8WIrzzUZ2CNrjsmGCAilBl3+s
         KugR1B4j9K9wqdp0YoxjcPJKNqL+sMpaVzSPOtlPmnNZ4u9I8UeufByF7c7MO0xdgJnl
         W4+KJlHfngwCN0d2MwL4SMRzwnflFbgD0NfOZEWq2uTZVdmX+lDf1xJnPavHAlmEt4bS
         nds9pMgcQf9IUs5qwvkSCqk4pnsOnoK1giS36FyYjS+m52hQot36Js8ffBmDTzkEqjBq
         CNF7LbB7E5dGFDTB19BkBtTRUgZIBuuO2KTu0C9a7Y7W519qe5g4mSAuCTWPF/p1OSB9
         AEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795033691; x=1795638491;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+AogC8EDUSE3HLZ3UU4rCjeQfZxM4jvNiwuUF4qq2o=;
        b=O6eBxjzHzf2UfqfV790QSMCNa2bw1YL4DxVToeuWU0JV7XKgjSI8Gj1NJ3FxVjTH9x
         66zPJPhRM70dZ2vkpcNS9pLseJ1nh909aE6GWaSKBC4U5h5DGrQExixXynHTXiTkVIkc
         D3g364eyn5SEJ0VnPsDCQfyXG6lGrgyORiro89wf13icWXIVqKibOGjfLTndiozu8qbn
         qB4DBqKl9IhOUO7y4cTF6onbOysacukkT+eljCUZiM42Y5VOb3qbM/ZrhLgoLQLa+JgK
         9kN2iZTEinhiVIxKbSi4j59xpGXDw6/tpkW0BYBAkw0HFACMq+VnGKe3YsWEJU0w9vz3
         tR5g==
X-Forwarded-Encrypted: i=1; AL+hErGzhSST2Clu8RrYWhdRQmj9G0w1Z5ZM9MS9cKnebg7ELHZc3RCBkEzbENv7awBECpJE0E+sklq756TR5iNA8g3q@lists.infradead.org
X-Gm-Message-State: APuU4Z9Lw+eHl0oiiLa9FjaANf4AbrC0dpJPcPy3/kl77XtQK6sCPZGS
	Zv6VsmFr7zf/925UB3pBKZcE33zqjEPQZmt4jkQhupmbDkyRNnfSmci5Fx6Tyz2f26m/SMvXbkV
	OQMq2UDSG7y1ORgOn+2EtdatPgRdZnTPa1MV8LGrc
X-Gm-Gg: AYBFou3X+LH1IJ6SJifeAqs/B0aFJvSzjRWg1rlluYYLSfbbQjhlBAlxM1cIqG9Jocr
	PJ+yR2SjidNQa5kW0YV7p6T7iRUFz/rQK8KiK4fjpwaXa6vSTGuZGlvF9T52ELh12YVi7oz50R2
	WZ/gLoDr8j7HNfNA60fkALjVJ3XsIsqpX/J20Ci91W5HAqgVvjiPWlGhOi9FTcFQKacrYf3u2Yv
	0RFh05PtAby4TCd59sfldUGodNCwc+w3VDtOhTpQY4ZJrvtdYBP6YqyAnL+Rn8ftg7ikygG8RQj
	0gNCdBfMzDF6eccfNrXysHe96CcsImH4A2jzAZNe3wgUzS58CKnE9lziHTh9HSMGuopdgCR3k9f
	XyxXc4m9GaN6O2dONZstA/oESO/jO6ofBgpoeUZB5gx82ZAuHJwUiFos=
X-Received: by 2002:a05:622a:4110:b0:55d:3243:574a with SMTP id
 d75a77b69052e-55d6962de96mr3088621cf.3.1795033689803; Wed, 18 Nov 2026
 12:28:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com> <20260929034510.2023173-12-praan@google.com>
 <asZSQRSYBjbUaaH0@willie-the-truck> <atXTtaxz0z-U-XSJ@google.com>
In-Reply-To: <atXTtaxz0z-U-XSJ@google.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Wed, 18 Nov 2026 12:27:58 -0800
X-Gm-Features: AclHuK_palFTYhnGqFKwt0cs6iRNA8xAzy9LxCS_GSW4lMdE4jAyePa6AgRLHZY
Message-ID: <CAE2F3rDd23TcWELEu0hNZiw+At==HZjZ=4KWGc-KPoZ4YiFxSg@mail.gmail.com>
Subject: Re: [PATCH v11 11/16] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
To: Pranjal Shrivastava <praan@google.com>, Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Ashish Mhetre <amhetre@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@kernel.org>, 
	Radu Rendec <radu@rendec.net>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	rafael@kernel.org, Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_122813_331570_66A4849B 
X-CRM114-Status: GOOD (  29.42  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 1:24=E2=80=AFAM Pranjal Shrivastava <praan@google.c=
om> wrote:
>
> On Wed, Oct 07, 2026 at 03:08:01PM +0100, Will Deacon wrote:
> > On Tue, Sep 29, 2026 at 03:45:05AM +0000, Pranjal Shrivastava wrote:
> > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/io=
mmu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > index deefb17e31eb..794b258550dd 100644
> > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > @@ -394,6 +394,11 @@ static inline unsigned int arm_smmu_cdtab_l2_idx=
(unsigned int ssid)
> > >  #define CMDQ_ERR_CERROR_ATC_INV_IDX        3
> > >
> > >  #define CMDQ_PROD_OWNED_FLAG               Q_OVERFLOW_FLAG
> > > +#define CMDQ_PROD_STOP_FLAG                (1U << 30)
> >
> > I'm unsure about this. Bit 30 of the cmdq prod register is RES0, so it'=
s
> > plausible that the architecture allocates that bit for something in fut=
ure.
> > For example, if the index field was extended, then I think that would
> > cause problems for the driver.

Let's cross that bridge when we come to it. I think that for the
driver's internal llq.prod, we can deviate from the layout that the
architecture defines for SMMU_CMDQ_PROD, and as Pranjal pointed out,
we are already doing that. If the architecture eventually consumes the
current RES0 bits, we could save them in a separate variable and only
overlay them when writing to SMMU_CMDQ_PROD. If the index field is
extended, we could artificially limit the index width in this driver
or transition to a 64-bit type for llq.prod. Also, it appears unlikely
for the index field to be extended beyond 24 bits, because
SMMU_CMDQ_CONS allocates bits [30:24] for SMMU_CMDQ_CONS.ERR

> >
> > Do we have to put the stop flag in the producer value, or can it just b=
e
> > a flag elsewhere in memory?
> >
>
> Fair point, but the flag is SW-only, i.e. it's always stripped via
> CMDQ_PROD_IDX_MASK before anything reaches the HW and only ever tested
> via Q_STOP(). It's the same deal as CMDQ_PROD_OWNED_FLAG, which already
> uses bit 31 (also RES0 in SMMU_CMDQ_PROD, IHI0070 section 6.3.27) as a
> SW-only marker in llq.prod.
>
> Keeping it in prod is what makes the check + slot reservation atomic in
> the cmpxchg.. with a separate flag, a CPU could check it, then suspend
> sets it and samples the target, and the CPU would still reserve slots
> beyond that target.

I think that the suspend thread needs to ensure that potential users
of the command queue either (a) observe the stop flag (or some variant
of it) or (b) are accounted for such that the suspend thread can wait
for them to conclude their command queue operations. For this type of
synchronization, I believe we do need some variable that both the
suspend thread and the command queue users access with cmpxchg or a
similar operation. I guess that in some alternative design, we could
use a combination of refcount_inc_not_zero in the command queue user
threads and refcount_dec_if_one in the suspend thread, and I believe
one of Pranjal's earlier patches used a similar method. The beauty of
the current proposal is that we re-use existing synchronization
primitives and don't introduce any new variables that we need to
access using cmpxchg.

