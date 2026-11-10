Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015DF606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ita3o7Od;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bXwehEW3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O2sQ0ppPahwiNKXBETtZDPbw3npwpVnR3zhVdoKxb8A=; b=ita3o7OdY6u8YcnDPqyf8Nyduz
	ogv8gu9WmWSyI2QioLv9vAi2cNajmAZE9K8zmAfr1OLEtbAi34HlCOVolLKnxLS7tT8f2HDCC0Cxq
	tM0R5BvPErHm2p/WR6RHPoSif5OteWL0vfxnwBNP725YfHSfuIF3bIdPlPu2qX9vdPpzIfnN48Nc0
	4D5U/HZI9Kq1HHFNZ1A6yfa7fTtKyHsNZwEglppFmRbyHwGDybGIhTfvH7wc/9s04GCOekWIrgBCd
	c8yo7/6t+UQ+IRZUlJTbmh+rY8//7/zkjOil6V8wbleTpFqxLgfDEacyJqD3fYXSG9j6nTy4wvCIh
	uG48iLGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQncd-00000004LTS-3kaW;
	Tue, 10 Nov 2026 15:18:55 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQncc-00000004LT0-06g8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:18:55 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-5366463571cso25191711cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794323933; x=1794928733; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O2sQ0ppPahwiNKXBETtZDPbw3npwpVnR3zhVdoKxb8A=;
        b=bXwehEW34HLXDN3L6i47t47LmGojEmEDCJ0k9r1/U45KjOpeBuRkVXZK4lEr9su7Kp
         kiI4KafgZ4OR2xoCp0Wo5/GrCxSlQMtY6cTGCbxcnZCCWrM2UJkNKAHeysWmg13LMQVb
         5TEX5knE7VHuLNg+bto1azWRlqbA/Bu9se4uMxsJRverRYxjc3mpKxMYhDIxLAXI0Lju
         SqjKhSxVE9cC8SldIWr6B9Xq511o9kwXOoGBxCHPhRrepdoHTYPBAhOcuCIqiJhmn9f6
         ySFdiDsolOg2Sbuo2EzZ4+cQlvEZKiukAvi9OcfnqTUMcL4MN3t13OQUEd6MfebIQsvz
         NlsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323933; x=1794928733;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O2sQ0ppPahwiNKXBETtZDPbw3npwpVnR3zhVdoKxb8A=;
        b=eQW0bP2pguJkJ4jRGolmDg/ipGKZA6NBmGSJj1AzISv2nojiF0KgzO7XAEPca1qH5z
         nHsRtltf5Qg8/PRaIvSN+5Gt/d/PeUM8oHoStU1sVm15+igHetlaLDi1F9H6Mv4jUJux
         BStFNt5+idGs9zYlNKkELmsuYkr/V37tiPKxhYaqTwCoddlKCy7DaCnKYiCJU44CL4mA
         r0pTzC59uWZWImjEl38Ely2+tLI8IWHJp0oZcJ5WAiJaVeHudu4EL2Bj6iNWE+1la4Y/
         MHDjvm8wbBQGhCaAvWC6tcNCCpeRc5mzDR9VEz5ZlYNJykICrRa2qE7BnJpPeNVmoCim
         xzGA==
X-Forwarded-Encrypted: i=1; AL+hErHjPG6qfhKHyFTOjcd/Gk8sVob+M2dVS6jCE0VWWpsvCinHpnBC4aIjiqC/SrkaRhWKTsQYm39U/O46x/zgUcbv@lists.infradead.org
X-Gm-Message-State: APuU4Z/cxj3BwgI1vQSm9M3Se930dc+zRTF8v5cEO6JUWDhH5qBl3MTV
	COvvr+Br+QKo5a7HoL58AfPypbKoymrja/bijBA8yk1NkFx7naJ20HFwBWPzw0Fosnc=
X-Gm-Gg: AYBFou0lW4K3vI5+KCvdSHIpRrgENswnZ+ci2np0/8N1tJVKnCgwQB4jWh+zbUPClU/
	56sVuDo7ySdxW6pvP3DILlorNNZEOHeT1yTtuCD4tDEZleFv+xYN1qG5wuIGiwdGPCR5B4Y1A35
	h1itcpDNHTTniIEF6xY5jKWIGEB7Dus01YHv8lnALMpK5XjoZke+DNnTm0bUthOYc0GbJRNo1l4
	rampe2hP0Ca8jlZ/rDCXOk5lkLrdyUpoBDRmr2Ve0xyu+6OcIyH07nDwlQq+4nDdRAQX5CE49Sq
	ljICJiwZX4S0lld0toXmiiyyfTklEv1RHqLF0wvx+KGH9w5J34gpxfIByJ/F2EKZTAQDgE/xLIC
	1jWl2nMykHrUPkw3jZpSXQbwD9Il8CPLiX+ovLqFOZur/PSQ1JyPaGiX8SlDetmjxHlJ95fVdT2
	f2ec55AVmbunvl6GX2hO5UUiiiMaHVVJLFA/Mai45cI4xmatnga5ENI8R0nU8HZnJyaRSjmZcVG
	GuRiyMZ3KjfTN6zkM4OC9oLeNfAyuOCud3qFsh80IY92ZXjlGvcVm4soByF7OpFsuDJ+LaxLgdc
	P8ecndovADJEWjZxX0d3QtVxadMtTA+m5jqg8EcPkVUm/DNy/DuaAEUJsCcTac1tbzQvcpXkuZm
	pDK2JI01x2bQ=
X-Received: by 2002:a05:620a:461f:b0:946:6:1298 with SMTP id af79cd13be357-9479f323170mr465893185a.52.1794323932611;
        Tue, 10 Nov 2026 07:18:52 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04f89c1sm22998676d6.23.2026.11.10.07.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:18:50 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQncX-000000063UD-2Q7t;
	Tue, 10 Nov 2026 11:18:49 -0400
Date: Tue, 10 Nov 2026 11:18:49 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: xuheng@cs.columbia.edu, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Invalidate a new level-1 stream table
 descriptor
Message-ID: <20261110151849.GZ663069@ziepe.ca>
References: <20261109-smmu-l1std-cfgi-v1-1-65e5203a6516@cs.columbia.edu>
 <avMxDbv6JE0dg93E@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avMxDbv6JE0dg93E@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_071854_073633_F34C7A76 
X-CRM114-Status: GOOD (  23.59  )
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

On Tue, Nov 10, 2026 at 02:58:21PM +0000, Mostafa Saleh wrote:
> On Mon, Nov 09, 2026 at 09:36:54PM +0000, Xuheng Li via B4 Relay wrote:
> > From: Xuheng Li <xuheng@cs.columbia.edu>
> > 
> > arm_smmu_init_l2_strtab() allocates a level-2 stream table when the first
> > master in its range is added, and makes the level-1 descriptor valid. It
> > issues no invalidation, and the attach that follows sends only the leaf
> > form of CMD_CFGI_STE.
> > 
> > IHI 0070 5.1.1 requires the non-leaf form of CMD_CFGI_STE when an L1STD
> > changes, including when an inactive descriptor with Span == 0 becomes
> > active. An SMMU that cached the inactive descriptor can keep terminating
> > the master's transactions as if its StreamID were invalid.
> > 
> 
> Looking at the spec it says:
> 	An STE or L1STD that is successfully fetched might be cached by the
> 	SMMU in any state, therefore any modification, commissioning or
> 	decommissioning of an STE must be followed by a CMD_CFGI_STE command.

I think the patch is pointing at this:

* Changing an inactive L1STD with Span == 0 to a non-zero active Span
  (introducing a new section of level-2 Stream table) requires an
  invalidation of the L1STD only. As no STEs were reachable for
  StreamIDs within the span, none require invalidation.

Which is really explicit what to do..

> Which checks out. However, I am curious why this was not seen for
> over 10 years with the current behaviour as I doubt any existing
> implementation will do negative caching. Is that something that was
> observed or found by inspection?

Honestly I don't think there is much value in negatively caching table
structure. Negatively caching the resulting leaf is good enough.

> > @@ -2053,6 +2054,14 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
> >  				   ARRAY_SIZE((*l2table)->stes));
> >  	arm_smmu_write_strtab_l1_desc(&cfg->l2.l1tab[arm_smmu_strtab_l1_idx(sid)],
> >  				      l2ptr_dma);
> > +
> > +	/*
> > +	 * The SMMU may have cached the old, invalid L1 descriptor. Making it
> > +	 * valid needs the non-leaf form of CMD_CFGI_STE (IHI 0070 5.1.1).
> > +	 */

All the versions are 0070, you should specify rev H.a if citing the spec

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

