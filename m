Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA72606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nHMK9MgP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=dm6Lq8ZP;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p1072oAs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=faF1vod1YCIOE6mWZF0dptvadZIAmgUkLf51bGNhat8=; b=nHMK9MgPDlDBrW
	SWv5ywQgIMatl3HSvBIHLcykouGBxGq2mORS2ypE+mlF+DKqcQhb1jjZbwTseG3B3K0DrG9foIBM4
	Ft8KEeZl22j6164oB/OMS5142pt6VHmyyQSHRTealIsM5jvvsy60suxau/cMhtZR8W+euebQsnk/O
	ZE/xSPIw5HB8FYaNqMAWLZEXdKLkeNn7bDOjHXlF1E/6O8WrTOYahitoUvEZOVVMUyY83Fefp7sbw
	jmq3jn2wP0d+HbXOP9v9sexf8MVsc5JwRAK4isPhgZAP9th34cLKWbtJzuTxW6/iwxCj0ouD9KsIl
	bywbxfnFD6SY2v7OcINg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtPW-000000077DV-1Tfp;
	Tue, 24 Nov 2026 16:30:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtPU-000000077D8-1qm4
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Nov 2026 16:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=faF1vod1YCIOE6mWZF0dptvadZIAmgUkLf51bGNhat8=; b=dm6Lq8ZPo/K1SMhZw2kjBrbLlx
	JwKyUmcILm0kzeZ0ytPPO0/oXJCoEwkQdWRQz/84Vx9v/GL43kG/x12zAh8rKihidp0YpWyPJtv+P
	yNrHxdSK1es+Mrrj46sUqUvESBrkcetlsC/ikkHOUSTPeKQ+DOMZ4wXyM6hdREkYCNqKisxCGsf1r
	lZe/JkLdsVJn/FFX0FaxtX09a6Q0Ni8xIqiyytWRBNe7KJSRfa8XshI+CPkJYvwymYx15PofjKOKF
	UyHw+CQl3iTl/DzvIQNeIY+YplfAOs++M+wMXF973KsJCmb63KS5Ggpl8g/SJP1qM0Cnu6H5/VIbo
	Pq9xNimw==;
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtPR-00000008xxy-2vGl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:30:23 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c50cc7540b7so657931166b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 08:30:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795537819; cv=none;
        d=google.com; s=arc-20260327;
        b=a1Kp65M4CtKLMhjujk2AkWhcUwlOPxPs+6VUF1Z+Z/qiJr4AcX0ukoAGTbRyJbKyIS
         EMu649ticnPlaDCGvV+HxHidx033OQX9XN1BSDctSP1S2pLRgw69w1yFXe5mYcdMRPgB
         6qh9ya+2gUWeZqfntTS0azx7wU9IeewkuFMFNe5BtTj/NH2Mhdr0CnzLwM5ElSj0kF+k
         5u5Dkk+rBBlzcRLLAW+85/tAFVJ2txgOhghURUJurSKqD3WMwIIGg9hqg+0YuSOqj+0v
         59wYCqz+wwixIb3iV1TTFrFJhlrdhulbWGwFQsKpcRRkGXgL0lO1rpIrALBCfblGng5P
         qQTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=faF1vod1YCIOE6mWZF0dptvadZIAmgUkLf51bGNhat8=;
        fh=gxQ1lKriTImz2r4SIB8H2jvYsXI4fM0vih+8Wt34Gjk=;
        b=jNqXyfI1RQj+QGDYwA3UKuN21lRvywgtyzTVuBmnthGVWfJHIFHTFdfjq0WqWGNhsK
         axFyX4hvLAVYDr+PLmjNUs+YBRfIJd87AU3Dv6CXAxxiqBFTAUINpEU4FVIUfCjqhlry
         6rDcRhXekTWkfGeMKH2Mn31TFR0Fhb4B/mpoDv4Ca6PxapnN408/o1CarEdBNKZgDvaC
         S0bUHgSQ6OnfVLaLoRAnSspqGoSOJ57X3eDNrj+ymMLV4l3AjHHmDJ+TfeHNKjAjpoJt
         FllFaHn4TtF8fgL0IFRdl1o0oHVBQH91Xs1wFfEGeEK1lAmaGyMj0GV/MLTN5VRj2wlm
         GWsA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795537819; x=1796142619; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=faF1vod1YCIOE6mWZF0dptvadZIAmgUkLf51bGNhat8=;
        b=p1072oAsq4wsOY3A9cVSilGaiY7QcwOzsUrMmvlASYS+w+C0mBJlrAcXhwgALvIPag
         VaU0kGxwemjdrrdWqKxirYMsdACV3RLCneIQ7YQGKCgUbp/A91ASDjLLNC0Jmg/3InQp
         lv4z6II8Waxsq0ZUKcb5tEG5CdOYIxlnCpJzck1vctWzmhdHkFzd5i08fjA6PpstBs5a
         /97vTqTMNsu4DXA/lAV0H5cc1bDZ4ZnBsoUCVW58SF0sf68PqVY3m75jDAvaSt0s5XQT
         bDH+W3Um4tEmc6l+L0KYZpiqxMc74Qn/ow1CSqP5JTn7LW/oOIHktNtZHUtx6jaLD/zL
         /aWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795537819; x=1796142619;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=faF1vod1YCIOE6mWZF0dptvadZIAmgUkLf51bGNhat8=;
        b=nRTqtpX6kQLLyVPfoRZ3AtqtWBi3i4j6KMPd4aZCEBaXcIdf3ommWaDHCxB36amcBw
         XMiLDTFZ6FV7F/JpI8IUSLieAce7dg0RCL41mE+tdViOlunzpM92AHDqnRrrlEqE/ep6
         5d+VwXmcSWa02467rrSiltJpGiFHQ9M9+9Z+fRWtZK/kmI556hTHrsenwkfCkhROYkV+
         T3AuEWkOzksvY7rReqRDuYCDuN65dCL0m0uLe+emTmvOD6pzXvenPi11JKXOsopsj4nN
         HLB6FtkQJMeLyKhWnAjRI2ihznbAL9mvJuCYg+7LtcHDBd04Z1Djy9UgPs/YqknPMFty
         Pqyg==
X-Forwarded-Encrypted: i=1; AL+hErFMFYU/JyDqiqMDFkfPq4fhpjGc+DUwF/i71MVAWsCoCA7jLwkaXBd+HjqD0MPWaapyglqpIWZRb7T+gzJ/qKLd@lists.infradead.org
X-Gm-Message-State: APuU4Z+TdPa/4gslOxUSTufXLaXP3L40xiykgEAF1cbNEpr1RkU8eLMd
	1wA/mm8BLa/ghWyxKdLfe4K/boXRhSOER2ZsTwlQojy81yi54jlvnsQ6gi/NfffqBHZrWics3gp
	3MpTeO4DBd9Em27YfVkMfHb6Qs5RKRlQS3X4w1g8N
X-Gm-Gg: AZFdTZfYLbO/Vt3y/hdeiqp0VJAcfy7pZpn6CdWXOyadaD+vLd+6IpsOLlnziu1smll
	ib4MOUjO0w2+XH1ZlzxVl5eth9FLSZdCOdDdndWhi8cBxIkI0E81j4qSgrb7Ovhn+l2HkspHoQf
	PqLTBNzGXyR/AlGnUqoTadhP/JBgWKLFSVO8Wo4v1Q6tABzE+Of64HM6LpR9cHwl6GKKiGZNEVa
	xcGwDS+UPN8xItEwtoXtDxCCygL1+iJK+MUnNrBGDya832lFC21f0crMgDIucIm9crtcEnkcVr4
	Dq+mO2eEXQy5JgCt+uNAeTwoznd9TDpB/iRqgwWoE1gpDjH8oymz+j+c8u1WxoEIervck0E3pjl
	B2pd2kI2YdNc8bCq9D36YnWvJhlMdu62O6F4BDAKTqXZWmKvU1QfcIAFp41WEX4148b3mv6PqVI
	kxSqIB5EiDt+f4r0LnGpUvLKJ0dlugjXMvT7orNp2JKas1sI3Cr6Wj
X-Received: by 2002:a17:906:2a17:b0:c50:f28a:8407 with SMTP id
 a640c23a62f3a-c513aac6733mr1140653866b.42.1795537818175; Tue, 24 Nov 2026
 08:30:18 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-5-jthoughton@google.com> <4508589C-2E30-4DAB-9465-73121835D0D8@linux.dev>
 <CADrL8HUstWR2pajfYYzRqL7HziVfzZAXJas6MqJkK6pVxSzXEg@mail.gmail.com> <4A195604-B83B-4608-B32E-5F6CC85AE96F@linux.dev>
In-Reply-To: <4A195604-B83B-4608-B32E-5F6CC85AE96F@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Tue, 24 Nov 2026 11:29:40 -0500
X-Gm-Features: Aa3M54oagh8xEkhaXUUOR7MGGzOxphU25lezKmhke56V0En8IXvrXq6W7VgHea4
Message-ID: <CADrL8HXQShKvEu_6KVq0wZXbPjWMcR73yZ38iuePxPRZMDjXmg@mail.gmail.com>
Subject: Re: [PATCH v3 04/19] hugetlb_vmemmap: Use try_update_vmemmap_pte to
 update in-use PTEs
To: Muchun Song <muchun.song@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_163021_747416_D2635F56 
X-CRM114-Status: GOOD (  16.82  )
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
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 9:29=E2=80=AFPM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
> >>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> >>> index bc1353f03b08..ab33df268955 100644
> >>> --- a/include/linux/pgtable.h
> >>> +++ b/include/linux/pgtable.h
> >>> @@ -458,6 +458,28 @@ static inline void set_ptes(struct mm_struct *mm=
, unsigned long addr,
> >>> #endif
> >>> #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte,=
 1)
> >>>
> >>> +#ifdef ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
> >>
> >> Why not ARCH_WANTS_VMEMMAP_UPDATE_PTE? Then x86, loogarch and RISC-V d=
o not need define
> >> this macro in their ptable.h.
> >
> > You're basically asking to make this opt-out instead of opt-in, right?
>
> Yes, exactly.
>
> >
> > I like making the different architectures explicitly opt in to the
> > generic implementation; it forces any new architecture to decide if
> > the generic implementation is correct for them. But I don't feel
> > strongly.
>
> We already have an opt-in config: ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP.
> It already forces new architectures to pay attention to it.

Right, but that opt-in is different. Requiring architectures to
manually specify ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE forces them
to think about whether or not they need their own population routine.
But yeah, I guess we can just assume that any new architecture
implementing HVO should have already checked that. Okay.

> > I'll switch it to opt-out in v4 unless you or someone else tells me oth=
erwise.

So I'll stick with this; I'll switch it to opt-out.

Thanks, Muchun!

