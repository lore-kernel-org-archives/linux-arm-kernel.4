Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF56D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 02:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wn6mqJNM;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=I4UkGECd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:In-Reply-To:References:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/z1KVAHLgv0AOzLrNBK2aI9URthpRD6ryQLaugu2dXM=; b=wn6mqJNMRKVOoX
	4CW/ol9T56Lp/PisxQ/Fhg1ogNxYEdGcQ8OjKQsikf3nNa+0s/ptSmmdSASCiVKXuT8Ryx8Yp+sun
	EaGrmJ6flKcAkftSFcCuZvh03ka7LHkm+QWrQVfUMAnmuJtFRG+mDbDqga03TgVcPruO8mJVRNJYZ
	YvjanM4ZkG7Bi9ZAthc2acrYZPwkZw6LQKlsNhOpSfQouFwGXRJD4oFGaZNztPRnpTSDJF8A+QMmf
	p04GDA1vqY7zfFWoJxGcaWclBT+WQ4nbti57Jj1vWu5z9WHJZyhyawFxmR1JN5KbGwQAXsMmG5ILM
	f529ZHhgsLGDg7RReb2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW2yz-00000008FVG-2ZS3;
	Wed, 25 Nov 2026 02:43:41 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW2yv-00000008FUh-3LYF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 02:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795574612; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=/z1KVAHLgv0AOzLrNBK2aI9URthpRD6ryQLaugu2dXM=;
	b=I4UkGECdGVolSzd47GpV6fTGiXcndi73PZMks7RGVQCvXAcyKBL4jcrlbcrzFKuy2lsLuuNE+4pQT6yV3vMtw4z07AuCsG1uq/M4wZoyjzpIFpSYEYDcwXZZKZSvkm5u6ytSWkElreMs3nmnjtB4Pfc2J+P37YdE3j5m988UkoY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R301e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=yadong.qi@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0XFPzcfO_1795574611;
Received: from LG41624401116(mailfrom:yadong.qi@linux.alibaba.com fp:SMTPD_---0XFPzcfO_1795574611 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 25 Nov 2026 10:43:31 +0800
From: <yadong.qi@linux.alibaba.com>
To: "'Catalin Marinas'" <catalin.marinas@arm.com>
Cc: <will@kernel.org>,
	<mark.rutland@arm.com>,
	<ying.huang@linux.alibaba.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<ryan.roberts@arm.com>,
	<robh@kernel.org>,
	<gregkh@linuxfoundation.org>,
	<ptg-linux-kernel@linux.alibaba.com>,
	<stable@vger.kernel.org>
References: <20261123093505.974-1-yadong.qi@linux.alibaba.com> <awW3Dw743-rw_-cf@arm.com>
In-Reply-To: <awW3Dw743-rw_-cf@arm.com>
Subject: RE: [PATCH] arm64: fixmap: fix missing break-before-make in __set_fixmap()
Date: Wed, 25 Nov 2026 10:43:30 +0800
Message-ID: <000c01dd7c86$c20cbee0$46263ca0$@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH7ElggY0dR4+WfGztAU9vFXs2ztgHFVm0LtvSuwoA=
Content-Language: zh-cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_184338_489548_89208649 
X-CRM114-Status: GOOD (  19.98  )
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> -----Original Message-----
> From: Catalin Marinas <catalin.marinas@arm.com>
> Sent: 2026=C4=EA11=D4=C225=C8=D5 0:11
> To: Yadong Qi <yadong.qi@linux.alibaba.com>
> Cc: will@kernel.org; mark.rutland@arm.com; =
ying.huang@linux.alibaba.com;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> ryan.roberts@arm.com; robh@kernel.org; gregkh@linuxfoundation.org;
> ptg-linux-kernel@linux.alibaba.com; stable@vger.kernel.org
> Subject: Re: [PATCH] arm64: fixmap: fix missing break-before-make in
> __set_fixmap()
>=20
> On Mon, Nov 23, 2026 at 05:35:05PM +0800, Yadong Qi wrote:
> > diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
> > index f66a0016dd02..5593d7e0d523 100644
> > --- a/arch/arm64/mm/fixmap.c
> > +++ b/arch/arm64/mm/fixmap.c
> > @@ -126,12 +126,19 @@ void __set_fixmap(enum fixed_addresses idx,
> >
> >  	ptep =3D fixmap_pte(addr);
> >
> > -	if (pgprot_val(flags)) {
> > -		__set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
> > -	} else {
> > +	/*
> > +	 * Break-before-make: when the slot still holds a valid mapping
> > +	 * (e.g. earlycon re-mapping FIX_EARLYCON_MEM_BASE), invalidate =
the
> > +	 * old entry and flush the TLB entries caching it before a new
> > +	 * mapping is installed, so old and new translations never =
coexist.
> > +	 */
> > +	if (pte_valid(__ptep_get(ptep))) {
> >  		__pte_clear(&init_mm, addr, ptep);
> > -		flush_tlb_kernel_range(addr, addr+PAGE_SIZE);
> > +		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> >  	}
> > +
> > +	if (pgprot_val(flags))
> > +		__set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
> >  }
>=20
> I guess that's easier than getting the driver or earlycon code to do
> clear_fixmap(). Note that I queued Fuad's patches for missing barriers
> onto arm64 for-next/fixes, so please rebase on top.
Sure, will rebase on that.

>=20
> Sashiko also has a valid point about keeping the TLB flush =
unconditional
> for the clear_fixmap() case:
>=20
> =
https://sashiko.dev/#/patchset/20261123093505.974-1-yadong.qi@linux.aliba=
ba.c
> om
Got it.

>=20
> --
> Catalin


Best Regards
Yadong


