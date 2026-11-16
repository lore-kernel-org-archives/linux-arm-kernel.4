Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB2C606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vCRRoE0Z;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Is/ew7sD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S/rwSMYRmKycQT+Q+WaK4Jt3aNV8OhLQHxBDEKKQbT4=; b=vCRRoE0ZtFshJCFBX8s6Nt0yDh
	VJDtHZX0B5Bjyn/jXybPk6Xwkj9uyUEGaVFynv3/PYLE2DMRZousZZl65YDZQbYg4ArWujqldF9bI
	aAFLiPY9hoTIUYtQeO8CbRni1mz75eAbZIQrPupK/0TyV9SCLuBs8H6HKSFWxRO2JcPTx7wLBwYz7
	AEea0Va7ykPdiPh/SK7xfvU35B/WtNyw87G/UOIBcOGdOoIpU5S2tmquW77YK+x9H4k9jsDAdgC6V
	9Z1c7rWCrJjeC1owZT6wENWSu1fFXSVCAv2aYsiT4dOKCM9ejfwCrSFN0WS0Yfs3UEsBflTAThgCP
	e8AL4KSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxKB-00000002kfB-22Zc;
	Mon, 16 Nov 2026 14:04:47 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxK8-00000002kei-3NPQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:04:46 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-3adf87fc0c6so28749301fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 06:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794837882; x=1795442682; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S/rwSMYRmKycQT+Q+WaK4Jt3aNV8OhLQHxBDEKKQbT4=;
        b=Is/ew7sDNjKf+JbS5/XujWh0wHexc1hBJPN9HQ6e+JEYWH131u5p/u4xfFexUgLNFY
         NDV191GAzjUeIwnVevhhs8KTVmx0IH2RWkDSvaFnZaAtzCsA13VgyjVhXBlduHe+7Apl
         SNW7y1MZ/eWzwrBuEBBsnELI782UpyYNeSQ+lPFfcEJZ6iSzQnGHrwKlhB/g53DN01RW
         CLxcBxArUEdvZsbjW1s//fqWDo4HdJSX8E/HbK4EB++MNnsV8gsK1ZlU8oWLZRFZlGSa
         mntdze20jlFgJvU/EouOCQU2snxO/0b8vJJHCu87Q9pY7Lw673HjQyg25HmiT48s3FVL
         Oqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794837882; x=1795442682;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/rwSMYRmKycQT+Q+WaK4Jt3aNV8OhLQHxBDEKKQbT4=;
        b=SzCqYwPa2jCvvNIt3DxE6anClGd4v48/sLXEukYUHGVz6zHMTICR/eQSHEaKgZtw3n
         dRBwA7rmfkDrfkmmNbi5pUqnzmcpunNY1qWuqfRy7HkU/1+llmBSEL2nu7ipMMhyok9z
         GB2RlZ4NSTGJg9tAsHJmLAcXFmG2uJoS4uCFzQF98Xpeh5NQXRQQC18/afy9lsnYxpsb
         0nW4qw3IzaQdwsyeElM/PjuYujx/ut8Ym7PP3zB/t3kEmlGmt8tEeTT4Yi3lzo6c1n/s
         JS78K4V5Yw3T65UoQgSgUCRNSCk+IpU+WmAN0hzhOIo92oPmKb8uGPlgIih8ll+ZpX/q
         A1QQ==
X-Forwarded-Encrypted: i=1; AL+hErFSbaWwZWNmoqsL3sLzwURtt2w9xxs5EcjsByWAlDphCOwddQ1i7itQemV3GPNDasThPJZGbItyHE9vFhXJ+fPQ@lists.infradead.org
X-Gm-Message-State: APuU4Z/BE/7WTYcGvDRVa/mogTn/ZAf/O5tf+PtQ+dzwdORuF6UT8ny8
	1lrBQ0UGrpxE8szxscswVO8yi/dRA6qcS9woamfz9KKYUr3geh9gVrr5UbtJ2b4Dmw==
X-Gm-Gg: AYBFou1Cwqgs24+9aEWxHrsU9DOpgZddA8ILz/Dk3CRGcAgvefjEiX8W2D5b0CIymxx
	gaBSWAWsICzgTe16lfHm4BeqGmVbnMyDUdOz36ytCChSp2ibjsFiQz6KrKWNUYkuNJGeFxEMAhA
	M9GmIGCBY9JnDWhwgfNBcZ0UBuBxHhXz0pfmg264TzfOnCYjuIo2BfSQtWI7ObqgQUUrIcl9VDx
	JlKH/ZBl4NAc/OVWrz5TSCG8ZRCjZk0y5QIT9ybg7pN2X5l7nqmQu7lNr9ntA7r8hMTofAm1ekB
	timo6l3Eji01ppIr6ZGQ06fxiM+MG7Fh0OV9ZuKuNenM5qmPFtQSQkU+5vmu7weD/9X8kqvu98R
	viLV570zZcYZ5puCFRi9oUn+zOIDFc1MkGse7TOoE1YgmNUvzYZ0kUAup0biqCQ50YXSWKSTgBr
	K1bmMW4P+d6pPadC8K+glsW+8s5UpUB3jSAjHeFYGmnPf/relOuwPbcH/lOTwDsqSBFrUzFVTbr
	xe+bibnKPoKYTwGNPKCbXAOi/fFDjTYMofK0YJgKl6Tm5EKfnFYmVJdYe/9wgZRacwzwrj1ORTc
	4OUo1+3pv21H/VWr93izdZlJ63tQVc4n9GplD2az4hpwuYpo7HI/N/gcgrP2bqoKyQ==
X-Received: by 2002:a05:6512:2208:b0:5c1:5970:ae1f with SMTP id 2adb3069b0e04-5c170a25d42mr3870536e87.63.1794837881958;
        Mon, 16 Nov 2026 06:04:41 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm20599601f8f.57.2026.11.16.06.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:04:40 -0800 (PST)
Date: Mon, 16 Nov 2026 14:04:36 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] drivers/virt: pkvm: Zero and clean memory before sharing
 it with the host
Message-ID: <avsNdPissIDAb1hA@google.com>
References: <20261116110549.1863653-1-fuad.tabba@linux.dev>
 <avro44jUWOARFzul@google.com>
 <CA+EHjTxWuiyjmUc3vH_KxRtS_3oX5w=CE76LdsLcrqC+RzLGfg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTxWuiyjmUc3vH_KxRtS_3oX5w=CE76LdsLcrqC+RzLGfg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_060444_886387_9D9D4F24 
X-CRM114-Status: GOOD (  27.25  )
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 12:25:43PM +0000, Fuad Tabba wrote:
> Hi Vincent,
> 
> On Mon, 16 Nov 2026 at 11:28, Vincent Donnefort <vdonnefort@google.com> wrote:
> [...]
> > > +     /*
> > > +      * The host can read the pages as soon as they are shared, possibly
> > > +      * through a Non-cacheable mapping. No caller relies on their contents.
> > > +      */
> > > +     memset((void *)addr, 0, size);
> >
> > Are we sure we want that? The guest may want to setup memory and then share it.
> > I am not sure about modifying this API.
> 
> Right! I wanted to fix the bug for the ITS property table, which is
> shared before it's initialized, and totally forgot that this is the
> path all sharing goes through... I'll drop this, and put that fix back
> in the ITS series.
> 
> > > +     dcache_clean_poc(addr, addr + size);
> >
> > I believe the hypervisor is already doing the cache maintainance when the page
> > is mapped back into the host. (see stage2_map_walker_try_leaf())
> 
> I don't think it does on this path. host_mmu.mm_ops doesn't have a
> dcache_clean_inval_poc() callback, so stage2_map_walker_try_leaf()
> doesn't do the CMO for a host mapping. On the guest's side,
> __pkvm_guest_share_host() only changes the software bits of the
> existing mapping, and the walker returns before the CMO in that case.
> 
> Cheers,
> /fuad

Ha yes of course, that's the host s2 we are mapping into. And on the guest side,
we are only changing the software bits, so no CMO. Actually I should have read
the comment in stage2_map_walker_try_leaf() more carefully.

That said, I wonder if that shouldn't be handled by the hypervisor, just like
hyp_poison_page() do the cache clean.

That would be slightly slower than letting the guest (who has a mapping already)
do it, but pKVM is enforcing isolation between host and guest, and it feels like
it should do it by default no matter the memory transition.

-- 
Vincent

