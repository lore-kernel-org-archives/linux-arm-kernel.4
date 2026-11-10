Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5FD606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 21:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GG5p8Xyi;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nCMbyqr4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=D3u20IW39Ayj138ZJ7povoBycZBaxSeSoBrzGBgSB34=; b=GG5p8Xyin3IAiT
	tj8qVlAuxPPVtnTyfPt0/O7Miy5GIephO/s9p0Txu3YstUEB42ZLbXMUHWCCaqOXCSGTIFlUXmQVe
	PK7362u5s3Ru8J6balT8lZN1pmEF0yBQsWmLHqMwpQvBJgQoJj5JBUaUlFP2sgab9RQJM0T74ZVEW
	kCjjqylexeOYF4Ep63lps7NPkZfl7+ApDmcp9OSB43lZwr6f3RnK74FwzeERkNKjT/K58jfonvp89
	Zrz7kfQknvZFd5mbp9hZV9WDKLSt8bkxYfVzUQmb8GG1fbafBXNSmevUpPxBXh/ldvMnKnKuKk8aP
	bDPpKmBTk5ymmXIYll9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtjq-000000055OQ-1jqn;
	Tue, 10 Nov 2026 21:50:46 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtjn-000000055Nx-1KV9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 21:50:45 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso369978766b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 13:50:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794347440; cv=none;
        d=google.com; s=arc-20260327;
        b=Epl6rztarkglZGILqyib6CB5E+IaBO2z8vX1jocUyziLjXu7cz6JA+DhGTpV0hm3ft
         QF10QL8vHoMUqzpPw3lR8LV+gpz5de6y8lDH3nzPhY/LUN66/Twkp8RXC40YIJHwyv9R
         xZC/zu9FNcgsSYAZzVynypu3aJzEiBzoUpO8kOPNE3t6sjxm3yRKtzJrG4A3wcxyiiKJ
         VIM6bY1D/CxfFJc3dy0LBX6Vs7R8lgT41bv6EtGU4dHh1Qt2p2eeqB2annDbuZb+wpyr
         ZcZ5GteNbZvDR+PcOgm5N+IeODaO8YF6++gY+Znq7CNkB8LofWQU8uk9zhNUdES9mpFn
         uTXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D3u20IW39Ayj138ZJ7povoBycZBaxSeSoBrzGBgSB34=;
        fh=Un3kJv5h3FEzG8kORaVKZ9xHAT8dDHjGya8HvSZ50c8=;
        b=cQ8ijyqfnv+UoVFCWan9jvTrCcxHIN4jik8WCigYlFWun1GIP5T+bV7+l/hjrlFEv5
         izqsLGnv3n0wLXWTvU9krXCdm54EhXez9eeRZB0HtfGLaZ/wxr/Ch8jt5ssFCThE524+
         xkiO9042sN2ftilzHMSfN7V3Xm040SFXyvNe3UJWxq2oQMcUn0lzq4U3aviZB7lTLfLg
         BtdoBJPWuqzT5YRXxZNHxIwwo8UT3OAD9dsIsl3DhFd1jJpk4R4id0Fh1Xxdj9P7Dlo8
         WcxsMOmI/a+Z6vZayBnf8MsBJrFt6CK0HT4YyMnYRjMIZZWgYcyRyff9VubXrXKz0AZN
         N/sw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794347440; x=1794952240; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D3u20IW39Ayj138ZJ7povoBycZBaxSeSoBrzGBgSB34=;
        b=nCMbyqr4zCok2Gvg3AckgSNjUweCmAq0rNJlkVuiFiSAo1pntIu96+nL5V/Rtqb80h
         Xw+fE2xPYTil2x9pSSx12rtbwnxqHzrOHbgvHDMkFjMx3v4qVyziNkXgM7Hg2Vu2jTge
         WTnffzE5B4lwEkPzqS0XoNz3Eql32AgsNAPUn5mzHskXWp6Go4sMLUOVVrLQ+V71HTZG
         MMzBoMKOCr/+6Dy5rhFOqBhuwb1GIZhbPQTulYQX4V9QryYkJ8064yy1t9simqPLqXVg
         IN2nlpV+u2q810y+wmvst0qPshyLZODyp4AA9cCJbjodfCsMPrrN1GHeGuykivSipEe2
         ooVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347440; x=1794952240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3u20IW39Ayj138ZJ7povoBycZBaxSeSoBrzGBgSB34=;
        b=lM7NJxpXq6GRlJXBVKNCGOAtYKSgclknhUZ7lXG8Ox4PF+FhCuFyU7YocZvT0nf7rT
         NZE6dT4oNm04HLf7UA8h7VZTFWxsv7uLBucb/7JuRgLpRr6zoSpAuBetvpC4UHFUKKrA
         UYpcyT92yJpWH6nqLzKyORjRp9aerCLHJwYTmR187OaGzdZkjCBQ3xj4ehqRv4gTzGvL
         9i0l2uGjTHxfno/EJQOkpPqaPM7GyrvmVHlk1Bkum/qHbA/WhfZmHpywNN3mg8KnAWn+
         BV0zXtm1nePMMJD/nWWMi0Gjit1VLyASFd58fNb+wJKHm5pYadf+losYqEtRIIUWMaKA
         5z1w==
X-Forwarded-Encrypted: i=1; AL+hErEV2srmncZET5CsiPd/9hwOiuZA38zFEgmX5r4CdOdMnJOXPlSibKP2fP2m4/SiVmPovJNS2hhy35P1yabyEpfo@lists.infradead.org
X-Gm-Message-State: APuU4Z+Ywj40DrJ381v5U8+rQupSHBsORaEYU1/mKA8UNkWVKWzU0va8
	qZWT5ynWI8O9D1iAipe51mQJANIHOeDt6f0+HRlykuz099p+wzvUhCYJ6OzE4vdBRqSk2XyEK6j
	A3yc9Ia0p4DlVroYWU2bWtWqIOwuCyhupbLyPuIS1
X-Gm-Gg: AYBFou3MqhSWxfUr21kvN6g5pACMBpU81fk0CP8s62Sb1yRZwaxUlBJMRjp6ph9QZDM
	xFQrHWk0RRHEEr7E7qpNOeJgZtL2aF9PfqpIoiFK2QTk0IuDD1VvoCpOOk/InRRATDnCGgwe3JS
	CaP1jIyzRZPNuLI1Yk6/VIOlyq4pgPIBkA3QJYraPzYSuO0H/OGpiE0NvAcsyR77wU6P9UTHrW6
	2EKRxH8vri+t8dJtJJ7W5IuR/BcZgoZFzKKTAqwOzN++Sw/oL5WokmRe2p3Pzoekiw58W0V/QcY
	6McH15QntkPx1tlf61OSjI4bDPbkd3+1QrzjXjbh7ijaxhA6izdZgGdfNUobPtxW9klgtYVCWXh
	VzkKa2HpW+BB4Xk4AJzpCL8Bk+rRDZi2TODwMbqS+YYTMn/oYJDc9p1H/vxnKSlVNAzYGwejcPb
	OBAoxWjq/n44h4bJWbtoHcwJ6/2je1mfT+xFOp1ph4j5HvLelMYkzP9dpQKDOCPOZ4/Ky5tNfxu
	qVYEB3nd/KwcJNcfr4/17an108UAA==
X-Received: by 2002:a17:907:a805:b0:c40:36ca:9d1b with SMTP id
 a640c23a62f3a-c5066d6ae19mr29991866b.40.1794347439526; Tue, 10 Nov 2026
 13:50:39 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-8-jthoughton@google.com> <2122761A-45AD-4AEC-AE88-B51E92E2CA40@linux.dev>
In-Reply-To: <2122761A-45AD-4AEC-AE88-B51E92E2CA40@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Tue, 10 Nov 2026 13:50:00 -0800
X-Gm-Features: AclHuK_v1agZ1dKpXc45zZ0c0gP5C_c2fyQg4NGg-Zs5GxvQBSCvkFuzEUTM21I
Message-ID: <CADrL8HWOPP6PLUVvL+v0-UA6YMG-o4p7dY6UmWif1aDCDgscoA@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] hugetlb_vmemmap: Disable HVO sysctl if arch
 doesn't support HVO
To: Muchun Song <muchun.song@linux.dev>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_135043_387338_4EBD69B2 
X-CRM114-Status: GOOD (  28.98  )
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
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 6, 2026 at 11:02=E2=80=AFPM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
>
>
> > On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> wrote:
> >
> > Do not create the vm.hugetlb_optimize_vmemmap sysctl when the
> > architecture lacks support. This serves only to avoid confusion for
> > users.
> >
> > arm64 support for HVO is conditional on certain hardware features being
> > enabled for all online CPUs. By the time hugetlb_vmemmap_init() runs,
> > all secondary CPUs will have started, and the system feature set will
> > have stabilized, including HVO-through-BBM, which
> > arch_hugetlb_vmemmap_optimization_supported() checks for.
> >
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> > mm/hugetlb_vmemmap.c | 15 +++++++++++++++
> > 1 file changed, 15 insertions(+)
> >
> > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > index 8596a462fee6..817ce39d4cf3 100644
> > --- a/mm/hugetlb_vmemmap.c
> > +++ b/mm/hugetlb_vmemmap.c
> > @@ -763,6 +763,21 @@ static int __init hugetlb_vmemmap_init(void)
> >       /* HUGETLB_VMEMMAP_RESERVE_SIZE should cover all used struct page=
s */
> >       BUILD_BUG_ON(__NR_USED_SUBPAGE > HUGETLB_VMEMMAP_RESERVE_PAGES);
> >
> > +     /*
> > +      * Architectures that need to probe CPU support for HVO have done
> > +      * such probing now. arch_hugetlb_vmemmap_optimization_supported(=
)
> > +      * will return the correct value.
> > +      */
> > +     if (!arch_hugetlb_vmemmap_optimization_supported()) {
>
> I'm wondering if we could put this architectural check into hugetlb_vmemm=
ap_optimizable(),
>
>
> > +             if (vmemmap_optimize_enabled)
> > +                     pr_info("vmemmap optimization not supported by ha=
rdware\n");
>
> then, we do not need those code. If the current kernel does not support H=
VO,
> then the sysctl does not exist. It's already a common case when the size =
of
> struct page is not power of two. If users really want to know whether HVO
> is enabled, they can check via this sysctl file. Therefore, we don't need=
 to
> print a log line.

Yeah, I can put arch_hugetlb_vmemmap_optimization_supported() into
hugetlb_vmemmap_optimizable(), that will make the diffs slightly
smaller. And yeah I can remove the print. I put it there mostly
because it can be confusing. A command line that gets you HVO on one
arm64 host might not give you HVO on another arm64 host, and the print
would give a user a clue as to why.

